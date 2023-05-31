(setq user-full-name "Stefan Rohrbacher"
      user-mail-address "stefan.rohrbacher97@gmail.com")

(setq! doom-font (font-spec :family "Fira Code Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code Sans" :size 13)
      doom-big-font (font-spec :family "Fira Code Mono" :size 24))

;;(setq! doom-theme 'doom-challenger-deep)
(setq! doom-theme 'doom-ephemeral)
;;(setq! doom-theme 'doom-one-light)
;;(setq! doom-theme 'doom-nord)
;;(setq! doom-theme 'moe-theme)

(map! :leader
      :desc "format whole buffer" "l l" #'+format/buffer
      :desc "open eshell terminal" "ö ö" #'eshell)

(setq! doom-modeline-persp-name t
      doom-modeline-persp-icon t
      doom-modeline-time t
      doom-modeline-modal t
      doom-modeline-modal-icon t)
(setq! display-time t)

(beacon-mode t)
(after! (beacon)
  (setq! beacon-size 50)
  (setq! beacon-blink-when-point-moves-vertically t)
  (setq! beacon-blink-when-focused t)
  (setq! beacon-blink-when-buffer-changes t)
  (setq! beacon-blink-when-window-changes t)
  (setq! beacon-blink-when-window-scrolls t)
)

(setq! eshell-prefer-lisp-functions t)

(when (version< "29.0.50" emacs-version)
  (pixel-scroll-precision-mode t)
  (set-frame-parameter (selected-frame) 'alpha-background 90)
  (add-to-list 'default-frame-alist '(alpha-background . 90))
)

;;(map! :leader
;;      (:prefix ("c h" . "Info from Clippy")
;;       :desc "Clippy describe function under point" "f" #'clippy-describe-function
;;       :desc "Clippy describe variable under point" "v" #'clippy-describe-variable))

(solaire-global-mode +1)

(setq! display-line-numbers-type 'relative)

(add-hook! 'window-setup-hook #'toggle-frame-maximized)

(setq scroll-margin 4)

(xterm-mouse-mode 1)

;;(setq initial-buffer-choice t)

;;(setq initial-buffer-choice "~/.doom.d/splash.org")

(defun my-custom-ascii-doom-banner ()
  (let* ((banner '(" ▓█████▄  ▒█████   ▒█████   ███▄ ▄███▓"
                   " ▒██▀ ██▌▒██▒  ██▒▒██▒  ██▒▓██▒▀█▀ ██▒"
                   " ░██   █▌▒██░  ██▒▒██░  ██▒▓██    ▓██░"
                   "▒░▓█▄   ▌▒██   ██░▒██   ██░▒██    ▒██ "
                   "░░▒████▓ ░ ████▓▒░░ ████▓▒░▒██▒   ░██▒"
                   "░ ▒▒▓  ▒ ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░   ░  ░"
                   "  ░ ▒  ▒   ░ ▒ ▒░   ░ ▒ ▒░ ░  ░      ░"
                   "  ░ ░  ░ ░ ░ ░ ▒  ░ ░ ░ ▒  ░      ░   "
                   "    ░        ░ ░      ░ ░         ░   "
                   "                                      "
                   "        ▒██▀░█▄▒▄█▒▄▀▄░▄▀▀░▄▀▀        "
                   "        ░█▄▄░█▒▀▒█░█▀█░▀▄▄▒▄██        "
                   "                                      "
                   "                                      "
                   "                                      "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn 'my-custom-ascii-doom-banner)

(setq! projectile-project-search-path '("~/playground/" "~/Documents/"))

(map! :leader
      :prefix ("d" . "dired")
      :desc "open dired" "d" #'dired
      :desc "open current directory" "c" #'dired-jump
      :desc "toggle peep-dired" "p" #'peep-dired
      :desc "peep next file" "j"  #'peep-dired-next-file
      :desc "peep previous file" "k" #'peep-dired-prev-file
)

(setq! peep-dired-cleanup-on-disable t)
(setq peep-dired-cleanup-eagerly t)
(setq peep-dired-enable-on-directories t)
(setq peep-dired-ignored-extensions '("mkv" "iso" "mp4" "docx" "pdf"))

(setq! auto-save-default t)

(setq! make-backup-files nil)

(setq confirm-kill-emacs nil)

(add-hook! TeX-mode
  (setq TeX-engine 'luatex)
  (setq TeX-parse-self t) ; Enable parse on load.
  (setq TeX-auto-save t) ; Enable parse on save
  (setq LaTeX-biblatex-use-Biber t)
)

(setq! org-directory "~/playground/org/")

(map! :after org
      :leader
      :desc "export to PDF" "e p" #'org-latex-export-to-pdf
      :desc "export to LaTeX" "e l" #'org-latex-export-to-latex)

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq! org-auto-tangle-default t)
)

;; org mode hooks
(after! (org ob-ditaa ob-plantuml)
  ;; where to find ditaa
  (setq! org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")
  ;; where to find pantuml
  (setq! org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
  ;; enable word count only in org-mode
  (setq! doom-modeline-enable-word-count t)
   ;; babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (ledger . t)
     (emacs-lisp . t)
     (shell . t)
     (ditaa . t)
     (python . t)
     (latex . t)
     (org . t)
     (gnuplot . t)
     (plantuml . t)
     (r . t)
     )
   )
)
