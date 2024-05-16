import rospy
from sensor_msgs.msg import JointState
import math

# Inicializa las posiciones actuales de los motores
posiciones_actuales = [0, 0, 0, 0, 0, 0, 0, 0]

# Inicializa la suma de los errores para calcular la integral
suma_de_errores = [0, 0, 0, 0, 0, 0, 0, 0]

# Inicializa las ganancias del controlador PID
Kp = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.01, 0.01]  # Ganancias proporcionales
Kd = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.01, 0.01]  # Ganancias derivativas
Ki = [0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01]  # Ganancias integrales

# Inicializa los errores anteriores para calcular la derivada
error_anterior = [0, 0, 0, 0, 0, 0, 0, 0]

# Inicializa las reducciones para cada motor
motor_reduccion = [12.5, 1.8, 2.4, 6.0, 12.0, 47.0, 1.0, 1.0]

# Crea un publicador para el nuevo tópico de posiciones
pub = rospy.Publisher('joint_states_controller', JointState, queue_size=10)

# Crea un nuevo mensaje con la estructura del mensaje JointState
nuevas_posiciones = JointState()
nuevas_posiciones.name = ['joint_1', 'joint_2', 'joint_3', 'joint_4', 'joint_5', 'joint_6', 'joint_7', 'joint_8']

def PID_controller(posicion_deseada, posicion_actual, error_anterior, suma_de_errores, Kp, Ki, Kd):
    """
    Controlador PID que calcula la salida del controlador basado en el error, su derivada y su integral.
    """
    # Calcula el error
    error = posicion_deseada - posicion_actual

    # Calcula la derivada del error
    derivada_del_error = error - error_anterior

    # Calcula la integral del error
    integral_del_error = suma_de_errores + error

    # Calcula la salida del controlador PID
    salida_del_controlador = Kp * error + Ki * integral_del_error + Kd * derivada_del_error

    return salida_del_controlador, error, integral_del_error

def jointStatesCallback(data):
    """
    Callback que se ejecuta cuando se recibe un mensaje en el tópico /joint_states.
    """
    global posiciones_actuales, error_anterior, nuevas_posiciones 

    # Verifica que el mensaje recibido es válido
    if not data or len(data.position) != 8:
        return

    # Limpia las posiciones anteriores
    nuevas_posiciones.position = []

    # Procesa cada una de las posiciones recibidas
    for i in range(8):
        posicion_deseada = data.position[i]

        # Calcula la salida del controlador PID, el error y la integral del error
        salida_del_controlador, error, suma_de_errores[i] = PID_controller(posicion_deseada, posiciones_actuales[i], error_anterior[i], suma_de_errores[i], Kp[i], Ki[i], Kd[i])

        # Actualiza la posición actual y el error anterior
        posiciones_actuales[i] += salida_del_controlador
        error_anterior[i] = error

        # Convierte la posición actual (radianes) a grados
        posiciones_actuales_grados = round(math.degrees(posiciones_actuales[i]), 2)
        print(f'Posiciones actuales en grados: Joint_{i+1} [{posiciones_actuales_grados}]')

        if i < 6:
            # Calcula la cantidad de pasos para alcanzar la posición en grados basada en la posición actual en grados
            posiciones_actuales_pasos = round(posiciones_actuales_grados / ((1.8 * motor_reduccion[i]) / 200.0))
            print(f'Posiciones actuales en pasos: Joint_{i+1} [{posiciones_actuales_pasos}]')
        else:
            posiciones_actuales_pasos = posiciones_actuales_grados

        # Añade la posición actual en pasos al mensaje JointState
        nuevas_posiciones.position.append(posiciones_actuales_pasos)

# Inicializa el nodo y se suscribe al tópico /joint_states
rospy.init_node('joint_states_publisher')
rospy.Subscriber("/joint_states", JointState, jointStatesCallback)

# Establece la frecuencia de publicación en 50 Hz
rate = rospy.Rate(50)

while not rospy.is_shutdown():
    # Publica el mensaje
    pub.publish(nuevas_posiciones)

    # Espera el tiempo necesario para mantener la frecuencia
    rate.sleep()