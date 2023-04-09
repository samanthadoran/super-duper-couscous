(defpackage super-duper-couscous
  (:use :cl)
  (:export :rom :rom-id :rom-filename))
(in-package :super-duper-couscous)

(defparameter *db* nil)

(clsql:file-enable-sql-reader-syntax)

(unless *db*
  (setf *db* (clsql:connect '("openvgdb.sqlite") :database-type :sqlite3)))



(clsql:def-view-class rom ()
                      ((rom-id
                        :column "romID"
                        :db-kind :key
                        :db-constraints :not-null
                        :type integer
                        :initarg :rom-id)
                       (system-id
                        :column "systemID"
                        :type integer
                        :initarg :system-id)
                       (region-id
                        :column "regionID"
                        :type integer
                        :initarg :region-id)
                       (crc-hash
                        :column "romHashCRC"
                        :type (string 8)
                        :initarg :md5-hash)
                       (md5-hash
                        :column "romHashMD5"
                        :type (string 32)
                        :initarg :md5-hash)
                       (sha1-hash
                        :column "romHashSHA1"
                        :type (string 40)
                        :initarg :md5-hash)
                       (size
                        :accessor rom-size
                        :column "romSize"
                        :type integer
                        :initarg :size)
                       (filename
                        :accessor rom-filename
                        :column "romFileName"
                        :type (string 100)
                        :initarg :filename)
                       (rom-extensionless-filename
                        :accessor rom-extensionless-filename
                        :column "romExtensionlessFileName"
                        :type (string 100)
                        :initarg :rom-extensionless-filename))
                      (:base-table "ROMS"))
