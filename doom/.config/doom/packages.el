;;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! odin-mode
  :recipe (:host github :repo "mattt-b/odin-mode"
           :files ("odin-mode.el")))

(package! org-auto-tangle)

(package! harpoon)

(package! catppuccin-theme)

(package! beacon)

(package! yeetube)
