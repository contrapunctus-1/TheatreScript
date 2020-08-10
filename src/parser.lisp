(in-package :theatrescript.parser)

(defrule whitespace (* (or #\space #\tab))
  (:text t))
(defrule newline (or #\linefeed (and #\return #\linefeed))
  (:text t))
(defrule text (+ (graphic-char-p character))
  (:text t))
(defrule underline (or (+ "=") (+ "-"))
  (:text t))
(defrule heading-level-1 (and whitespace text
                              newline
                              whitespace underline)
  ;; (:destructure (heading-text newline underline)
  ;;   ())
  )
