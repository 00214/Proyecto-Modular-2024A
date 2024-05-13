;; Auto-generated. Do not edit!


(when (boundp 'kiri_description::kiri_controller_data)
  (if (not (find-package "KIRI_DESCRIPTION"))
    (make-package "KIRI_DESCRIPTION"))
  (shadow 'kiri_controller_data (find-package "KIRI_DESCRIPTION")))
(unless (find-package "KIRI_DESCRIPTION::KIRI_CONTROLLER_DATA")
  (make-package "KIRI_DESCRIPTION::KIRI_CONTROLLER_DATA"))

(in-package "ROS")
;;//! \htmlinclude kiri_controller_data.msg.html


(defclass kiri_description::kiri_controller_data
  :super ros::object
  :slots (_desired_positions _new_positions _error ))

(defmethod kiri_description::kiri_controller_data
  (:init
   (&key
    ((:desired_positions __desired_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:new_positions __new_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:error __error) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _desired_positions __desired_positions)
   (setq _new_positions __new_positions)
   (setq _error __error)
   self)
  (:desired_positions
   (&optional __desired_positions)
   (if __desired_positions (setq _desired_positions __desired_positions)) _desired_positions)
  (:new_positions
   (&optional __new_positions)
   (if __new_positions (setq _new_positions __new_positions)) _new_positions)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; float64[] _desired_positions
    (* 8    (length _desired_positions)) 4
    ;; float64[] _new_positions
    (* 8    (length _new_positions)) 4
    ;; float64[] _error
    (* 8    (length _error)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _desired_positions
     (write-long (length _desired_positions) s)
     (dotimes (i (length _desired_positions))
       (sys::poke (elt _desired_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _new_positions
     (write-long (length _new_positions) s)
     (dotimes (i (length _new_positions))
       (sys::poke (elt _new_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _error
     (write-long (length _error) s)
     (dotimes (i (length _error))
       (sys::poke (elt _error i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _desired_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _desired_positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _desired_positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _new_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _new_positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _new_positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _error
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _error (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _error i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get kiri_description::kiri_controller_data :md5sum-) "2e0ab2c92f00a5fd025ef0b87b36cd6b")
(setf (get kiri_description::kiri_controller_data :datatype-) "kiri_description/kiri_controller_data")
(setf (get kiri_description::kiri_controller_data :definition-)
      "float64[] desired_positions
float64[] new_positions
float64[] error

")



(provide :kiri_description/kiri_controller_data "2e0ab2c92f00a5fd025ef0b87b36cd6b")


