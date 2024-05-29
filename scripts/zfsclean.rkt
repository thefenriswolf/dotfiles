#lang racket/base
(require racket/system)

(string-split (with-output-to-string (lambda() (system "zfs list -t snapshot -H -o name | grep 'hourly' | wc -l"))))
(define ans (read-line))
(system "zfs list -t snapshot -H -o name | grep 'hourly' | xargs -n1 sudo zfs destroy")
