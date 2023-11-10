(setq user-full-name "Stefan Rohrbacher"
      user-mail-address "stefan.rohrbacher97@gmail.com")

(setq! doom-font (font-spec :family "terminal-font" :size 12)
      doom-variable-pitch-font (font-spec :family "terminal-font" :size 13)
      doom-big-font (font-spec :family "terminal-font" :size 24))

;;(setq! doom-font (font-spec :family "JetBrainsMono" :size 12)
;;      doom-variable-pitch-font (font-spec :family "JetBrainsMono" :size 13))

;;(setq! doom-theme 'doom-challenger-deep)
;;(setq! doom-theme 'doom-ephemeral)
(setq! doom-theme 'doom-one)
;;(setq! doom-theme 'doom-nord)
;;(setq! doom-theme 'moe-theme)

(beacon-mode t)
;;(after! (beacon)
  ;;(setq! beacon-size 50)
  ;;(setq! beacon-blink-when-point-moves-vertically t)
  ;;(setq! beacon-blink-when-focused t)
  ;;(setq! beacon-blink-when-buffer-changes t)
  ;;(setq! beacon-blink-when-window-changes t)
  ;;(setq! beacon-blink-when-window-scrolls t)
;;)

(setq! display-line-numbers-type 'relative)

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

;;(setq +doom-dashboard-ascii-banner-fn 'my-custom-ascii-doom-banner)

(setq! projectile-project-search-path '("~/playground/" "~/Documents/"))

(map! :leader
      :prefix ("d" . "dired")
      :desc "open dired" "d" #'dired
      :desc "open current directory" "c" #'dired-jump
      :desc "toggle peep-dired" "p" #'peep-dired
      :desc "peep next file" "j"  #'peep-dired-next-file
      :desc "peep previous file" "k" #'peep-dired-prev-file
)

(setq! auto-save-default t)

(setq! make-backup-files nil)

(setq confirm-kill-emacs nil)

(add-hook! TeX-mode
  (setq! TeX-parse-self t) ; Enable parse on load.
  (setq! TeX-auto-save t) ; Enable parse on save
  (setq! LaTeX-biblatex-use-Biber t)
  (setq! +latex-viewers '(zathura))
)

(setq! langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-commandline.jar")

(setq! empv-audio-dir "~")
(setq! empv-video-dir "~")
(setq! empv-max-directory-search-depth 10)
(map! :leader
      :desc "kill mpv" "v q" #'empv-exit
      :desc "search file" "v p" #'empv-play-file
      :desc "start/stop mpv playback" "v r" #'empv-toggle
      :desc "toggle video display" "v v" #'empv-toggle-video
      :desc "skip to next" "v s" #'empv-playlist-next
      :desc "go to previous" "v b" #'empv-playlist-prev
)

(setq! org-directory "~/playground/org/")
(setq! org-cite-csl-styles-dir "~/Zotero/styles/")
(setq! citar-bibliography '("~/Zotero/references/library.bib"))
(setq! bibtex-completion-bibliography '("~/Zotero/references/library.bib"))

(map! :after org
      :leader
      :desc "export to PDF" "e p" #'org-latex-export-to-pdf
      :desc "export to LaTeX" "e l" #'org-latex-export-to-latex
      :desc "insert citation" "e c" #'citar-insert-citation
)

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq! org-auto-tangle-default t)
)

;; org mode hooks
(after! (org ob-ditaa toc-org)
  ;; where to find ditaa
  (setq! org-ditaa-jar-path "/home/ro/.nix-profile/bin/ditaa")
  ;; enable word count only in org-mode
  (setq! doom-modeline-enable-word-count t)
   ;; babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (shell . t)
     (ditaa . t)
     (python . t)
     (latex . t)
     (org . t)
     (gnuplot . t)
     (r . t)
     )
   )
)
