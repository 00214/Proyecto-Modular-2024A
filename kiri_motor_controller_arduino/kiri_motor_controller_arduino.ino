#include <ros.h>
#include <sensor_msgs/JointState.h>
#include <AccelStepper.h>
#include <MultiStepper.h>
#include <Servo.h>

// Definición de pines STEP Y DIRECTION para cada articulación (motor).
// Joint_1
#define STEP_PIN_1 22
#define DIR_PIN_1 23

// Joint_2
#define STEP_PIN_2 24
#define DIR_PIN_2 25

// Joint_3
#define STEP_PIN_3 26
#define DIR_PIN_3 27

// Joint_4
#define STEP_PIN_4 28
#define DIR_PIN_4 29

// Joint_5
#define STEP_PIN_5 32
#define DIR_PIN_5 33

// Joint_6
#define STEP_PIN_6 34
#define DIR_PIN_6 35

// Joint_7
Servo joint_7;
#define SERVO_PIN_7 2

// Joint_8
Servo joint_8;
#define SERVO_PIN_8 3

// Instancias de AccelStepper para cada articulación (motor).
AccelStepper joint_1(AccelStepper::DRIVER, STEP_PIN_1, DIR_PIN_1);
AccelStepper joint_2(AccelStepper::DRIVER, STEP_PIN_2, DIR_PIN_2);
AccelStepper joint_3(AccelStepper::DRIVER, STEP_PIN_3, DIR_PIN_3);
AccelStepper joint_4(AccelStepper::DRIVER, STEP_PIN_4, DIR_PIN_4);
AccelStepper joint_5(AccelStepper::DRIVER, STEP_PIN_5, DIR_PIN_5);
AccelStepper joint_6(AccelStepper::DRIVER, STEP_PIN_6, DIR_PIN_6);

// Creamos una instancia de MultiStepper para coordinar las múltiples articulaciones (motores).
MultiStepper steppers;

ros::NodeHandle nh;

long targetPositions[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };

void jointStatesCallback(const sensor_msgs::JointState& jointState) {
  // Asignamos las posición de cada articulación a su respectiva varible.
  float joint1_pos = jointState.position[0];
  float joint2_pos = jointState.position[1];
  float joint3_pos = jointState.position[2];
  float joint4_pos = jointState.position[3];
  float joint5_pos = jointState.position[4];
  float joint6_pos = jointState.position[5];
  float joint7_pos = jointState.position[6] * 2;
  float joint8_pos = 180 - (jointState.position[7] * 2);

  // Actualiza las posiciones en pasos.
  targetPositions[0] = joint1_pos;
  targetPositions[1] = joint2_pos;
  targetPositions[2] = joint3_pos;
  targetPositions[3] = joint4_pos;
  targetPositions[4] = joint5_pos;
  targetPositions[5] = joint6_pos;
  targetPositions[6] = joint7_pos;
  targetPositions[7] = joint8_pos;

  
  Serial.print("Posiciones actuales en pasos: ");
  Serial.print(targetPositions[0]);
  Serial.print(", ");
  Serial.print(targetPositions[1]);
  Serial.print(", ");
  Serial.print(targetPositions[2]);
  Serial.print(", ");
  Serial.print(targetPositions[3]);
  Serial.print(", ");
  Serial.print(targetPositions[4]);
  Serial.print(", ");
  Serial.print(targetPositions[5]);
  Serial.print(", ");
  Serial.print(targetPositions[6]);
  Serial.print(", ");
  Serial.println(targetPositions[7]);
  
  
  // Realiza el movimiento coordinado de todos los motores.
  steppers.moveTo(targetPositions);
  // Realiza el movimiento de la pinza
  joint_7.write(joint7_pos);
  joint_8.write(joint8_pos);
}

ros::Subscriber<sensor_msgs::JointState> sub("/joint_states_controller", &jointStatesCallback);

void setup() {
  nh.initNode();
  Serial.begin(115200);
  nh.subscribe(sub);

  // Configuramos cada motor con una velocidad de 200/500 RPM.
  joint_1.setMaxSpeed(600);
  joint_2.setMaxSpeed(2500);
  joint_3.setMaxSpeed(600);
  joint_4.setMaxSpeed(600);
  joint_5.setMaxSpeed(600);
  joint_6.setMaxSpeed(600);
  joint_7.attach(SERVO_PIN_7);
  joint_8.attach(SERVO_PIN_8);

  // Agregamos las articulaciones a la instancia de steppers.
  steppers.addStepper(joint_1);
  steppers.addStepper(joint_2);
  steppers.addStepper(joint_3);
  steppers.addStepper(joint_4);
  steppers.addStepper(joint_5);
  steppers.addStepper(joint_6);
}

void loop() {
  nh.spinOnce();

  steppers.run();
  delay(2);
}