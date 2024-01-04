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

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq! display-line-numbers-type 'relative)

(setq! company-idle-delay 0.1)

(setq! scroll-margin 4)

(xterm-mouse-mode 1)

(setq! redisplay-dont-pause t)

(setq! projectile-project-search-path '("~/playground/" "~/Documents/"))

(map! :leader "j m" 'harpoon-quick-menu-hydra)
(map! :leader "j a" 'harpoon-add-file)
(map! :leader "j c" 'harpoon-clear)
(map! :leader "j f" 'harpoon-toggle-file)
(map! :leader "j d" 'harpoon-delete-item)
(map! :leader "1" 'harpoon-go-to-1)
(map! :leader "2" 'harpoon-go-to-2)
(map! :leader "3" 'harpoon-go-to-3)
(map! :leader "4" 'harpoon-go-to-4)
(map! :leader "5" 'harpoon-go-to-5)
(map! :leader "6" 'harpoon-go-to-6)
(map! :leader "7" 'harpoon-go-to-7)
(map! :leader "8" 'harpoon-go-to-8)
(map! :leader "9" 'harpoon-go-to-9)

(map! :leader
      :desc "fuzzy find file" "f z" #'counsel-fzf
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
(setq! citar-bibliography '("~/Zotero/library.bib"))
(setq! bibtex-completion-bibliography '("~/Zotero/library.bib"))

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

;; babel languages NOT NECESSARY ACCORDING TO DOOM EMACS DOCUMENTAION
;;  (org-babel-do-load-languages
;;   'org-babel-load-languages
;;   '(
;;     (emacs-lisp . t)
;;     (shell . t)
;;     (ditaa . t)
;;     (ledger . t)
;;     (hledger .t)
;;     (python . t)
;;     (latex . t)
;;     (org . t)
;;     (gnuplot . t)
;;     (r . t)
;;     )
;;   )
)
