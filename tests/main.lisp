(defpackage super-duper-couscous/tests/main
  (:use :cl
        :super-duper-couscous
        :rove))
(in-package :super-duper-couscous/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :super-duper-couscous)' in your Lisp.

;; TODO(Samantha): Figure out how to make clsql syntax work here.

(deftest fetching-rom
  (let ((twisted-metal (caar (clsql:select 'rom :where (clsql:sql-= (clsql:sql-slot-value 'rom 'rom-id) 69770)))))
    (testing "Fetching a rom from DB works"
      (ok twisted-metal))))

(deftest rom-info
  (let ((twisted-metal (caar (clsql:select 'rom :where (clsql:sql-= (clsql:sql-slot-value 'rom 'rom-id) 69770)))))
    (testing "Fetched Rom filename should be Twisted Metal (USA).cue"
      (ok (string= (rom-filename twisted-metal) "Twisted Metal (USA).cue")))))
