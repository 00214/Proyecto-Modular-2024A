
(cl:in-package :asdf)

(defsystem "kiri_description-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "kiri_controller_data" :depends-on ("_package_kiri_controller_data"))
    (:file "_package_kiri_controller_data" :depends-on ("_package"))
  ))