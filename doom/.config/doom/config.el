(setq user-full-name "Stefan Rohrbacher"
      user-mail-address "stefan.rohrbacher97@gmail.com")
(setq! package-install-upgrade-built-in t)

;;(setq! doom-font (font-spec :family "terminal-font" :size 12)
;;      doom-variable-pitch-font (font-spec :family "terminal-font" :size 13)
;;      doom-big-font (font-spec :family "terminal-font" :size 24))

(setq! doom-font (font-spec :family "JetBrainsMono" :size 12)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono" :size 13))

;;(setq! doom-theme 'doom-challenger-deep)
;;(setq! doom-theme 'doom-ephemeral)
;;(setq! doom-theme 'doom-one)
;;(setq! doom-theme 'doom-nord)
;;(setq! doom-theme 'moe-theme)
(setq doom-theme 'catppuccin)

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

(setq! scroll-margin 4)

(xterm-mouse-mode 1)

(setq! redisplay-dont-pause t)

(setq! projectile-project-search-path '("~/playground/" "~/Documents/"))

(map! :leader
      :desc "fuzzy find file" "f z" #'counsel-fzf
)

(dirvish-override-dired-mode)
(after! (dirvish)
(setq! dirvish-peek-mode t)
)
(map! :leader
      :prefix ("d" . "divish")
      :desc "open divish" "w" #'dirvish
      :desc "open dirvish full screen" "d" #'dirvish-dwim
      :desc "dirvish main menu" "m" #'dirvish-dispatch
      :desc "dirvish find file" "s" #'dirvish-fd
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

(map! :leader
      :prefix ("v" . "media")
      ;;:desc "kill mpv" "q" #'empv-exit
      ;;:desc "search file" "p" #'empv-play-file
      ;;:desc "start/stop mpv playback" "r" #'empv-toggle
      ;;:desc "toggle video display" "v" #'empv-toggle-video
      ;;:desc "skip to next" "s" #'empv-playlist-next
      ;;:desc "go to previous" "b" #'empv-playlist-prev
      :desc "play URL" "y" #'emms-play-url
      :desc "Go to emms playlist"      "a" #'emms-playlist-mode-go
      :desc "Emms pause track"         "x" #'emms-pause
      :desc "Emms stop track"          "s" #'emms-stop
      :desc "Emms play previous track" "p" #'emms-previous
      :desc "Emms play next track"     "n" #'emms-next
)

(emms-all)
(setq! emms-player-list '(emms-player-mpv)
       emms-info-functions '(emms-info-native)
       emms-mode-line t
       emms-playing-time t
       emms-info-asynchronously t
)

;;(setq! org-directory "~/playground/org/")
(setq! org-cite-csl-styles-dir "~/Zotero/styles/")
(setq! citar-bibliography '("~/Zotero/references/library.bib"))
(setq! bibtex-completion-bibliography '("~/Zotero/references/library.bib"))

(setq! org-roam-directory "~/playground/notes")

(map! :after org
      :leader
      :prefix ("e" . "export")
      :desc "export to PDF" "p" #'org-latex-export-to-pdf
      :desc "export to LaTeX" "l" #'org-latex-export-to-latex
)
(map! :after org
      :leader
      :desc "insert citation" "i c" #'citar-insert-citation
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
     (ledger . t)
     (hledger .t)
     (python . t)
     (latex . t)
     (org . t)
     (gnuplot . t)
     (r . t)
     )
   )
)
