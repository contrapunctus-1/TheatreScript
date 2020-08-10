(in-package :theatrescript.parser)

(defrule indent (* (or #\space #\tab))
  (:text t))
(defrule newline (or #\linefeed (and #\return #\linefeed))
  (:text t))
(defrule text (+ (graphic-char-p character))
  (:text t))

(defrule underline-level-1 (and (+ "=") (* newline))
  (:text t))
(defrule underline-level-2 (and (+ "-") (* newline))
  (:text t))

(defrule heading-level-1 (and indent text newline
                              indent underline-level-1)
  (:destructure (indent-1 heading-text newline indent-2 underline)
    (declare (ignore newline underline))
    (if (or (equal indent-1 "")
            (equal indent-2 ""))
        heading-text
        (cons heading-text t))))

(defrule heading-level-2 (and indent text newline
                              indent underline-level-2)
  (:destructure (indent-1 heading-text newline indent-2 underline)
    (declare (ignore newline underline))
    (if (or (equal indent-1 "")
            (equal indent-2 ""))
        heading-text
        (cons heading-text t))))

(defrule key (+ (and (! #\:) (graphic-char-p character)))
  (:text t))

(defrule key-value (and key ":" indent text)
  (:destructure (key colon indent value)
    (declare (ignore colon indent))
    (cons key value)))

(defrule doc (or heading-level-1 heading-level-2 key-value newline)
  (:text t))

;; "THE IMPORTANCE OF BEING EARNEST
;; ===============================

;; A Trivial Comedy for Serious People

;; Playwright: Oscar Wilde
;; Key: Value
;; Key with spaces: Value with spaces
;; "
