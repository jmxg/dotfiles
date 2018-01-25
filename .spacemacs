;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ansible
     auto-completion
     better-defaults
     common-lisp
     emacs-lisp
     ess ; Can't download due to my crap internet connection.
     finance
     git
     javascript
     latex
     lua
     ;; markdown
     org
     python
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'multi-term)
     ruby
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     themes-megapack
     vagrant
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(dictionary yasnippet-snippets))
  ;; A list of packages that cannot be updated.
  dotspacemacs-frozen-packages '()
  ;; A list of packages that will not be installed and loaded.
  dotspacemacs-excluded-packages '(adaptive-wrap)
  ;; Defines the behaviour of Spacemacs when installing packages.
  ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
  ;; `used-only' installs only explicitly used packages and uninstall any
  ;; unused packages as well as their unused dependencies.
  ;; `used-but-keep-unused' installs only the used packages but won't uninstall
  ;; them if they become unused. `all' installs *all* packages supported by
  ;; Spacemacs and never uninstall them. (default is `used-only')
  dotspacemacs-install-packages 'used-only)

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         sanityinc-tomorrow-bright
                         zenburn
                         spacemacs-dark
                         monokai
                         subatomic256
                                        ;  sanityinc-tomorrow-blue
                         molokai
                         fogus
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   dotspacemacs-default-font '("Deja Vu Sans Mono"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key ":"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ";"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "<f30>"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; Spacemacs specific settings
  (setq powerline-default-separator 'arrow)
  (setq dotspacemacs-emacs-leader-key "<f9>")

  ;; (spacemacs/set-leader-keys "y" 'spacemacs/layouts-micro-state) ; Throws void function definition error
  ;; (spacemacs/set-leader-keys "l" 'evil-avy-goto-line)
  (spacemacs/set-leader-keys "<SPC>" 'evil-avy-goto-char)

  (spacemacs/set-leader-keys "f a" 'evil-write-all)
  ;; (spacemacs/set-leader-keys "<f9>" 'evil-write-all)
  (spacemacs/set-leader-keys dotspacemacs-emacs-leader-key 'evil-avy-goto-char)
  (spacemacs/set-leader-keys "." 'eval-expression)

  (spacemacs/set-leader-keys "h d a" 'helm-apropos)
  (spacemacs/set-leader-keys "h /" 'helm-descbinds)
  (spacemacs/set-leader-keys "h d /" 'helm-descbinds)
  (spacemacs/set-leader-keys ";" 'helm-M-x)

  (evil-global-set-key 'normal ":" 'helm-M-x)
  (evil-global-set-key 'visual ":" 'helm-M-x)
  (evil-global-set-key 'motion ":" 'helm-M-x)
  (evil-global-set-key 'lisp ":" 'helm-M-x)

  (evil-global-set-key 'normal "\C-x :" 'repeat-complex-command)

  (setq hybrid-mode-enable-hjkl-bindings t)

  (setq helm-google-suggest-url nil)

  ;; Evil settings
  (evil-global-set-key 'normal "\\" 'evil-end-of-line)
  (evil-global-set-key 'visual "\\" 'evil-end-of-line)
  (evil-global-set-key 'normal "s" 'evil-append-line)
  (evil-global-set-key 'normal "\M-v" 'mark-whole-buffer)
  (evil-global-set-key 'normal "'" 'evil-repeat-find-char)
  (evil-global-set-key 'visual "'" 'evil-repeat-find-char)
  (setq evil-move-beyond-eol t)

  ;; Evil-escape
  (setq evil-escape-unordered-key-sequence t)
  (setq evil-escape-delay 0.2)

  ;; Evil motion
  (spacemacs/set-leader-keys "[" 'evil-motion-state)
  ;; (evil-global-set-key 'motion "j" 'evil-scroll-line-up)
  ;; (evil-global-set-key 'motion "k" 'evil-scroll-line-down)

  ;; evil-visual-mark-mode
  (spacemacs/toggle-evil-visual-mark-mode-on)

  ;; Undo settings
  (define-key evil-hybrid-state-map "\C-r" 'undo-tree-redo)
  (evil-global-set-key 'normal "U" 'undo-tree-visualize)

  ;; (defun execute-undo-in-emacs-state (&optional arg)
  ;;   "Switch to normal state before undo-tree-undo. Workaround for undo-tree inconsistency between emacs state and normal state."
  ;;   (evil-normal-state)
  ;;   (call-interactively '(lambda () 'undo-tree-undo)))

  ;; (define-key evil-hybrid-state-map (kbd "C-/") 'execute-undo-in-emacs-state)

  ;; Paste settings
  ;; Keymap undefined. Paste in with-eval-after-load is not the correct feature, and there doesnt seem to be a paste-transient-state feature
  (with-eval-after-load 'paste
    (global-set-key (kbd "C-y") 'spacemacs/paste-transient-state/evil-paste-after)
    (define-key org-mode-map (kbd "C-y") 'spacemacs/paste-transient-state/evil-paste-after)
    ;; (define-key spacemacs/paste-transient-state/keymap "p" 'spacemacs/paste-transient-state/evil-paste-pop)
    ;; (define-key spacemacs/paste-transient-state/keymap "P" 'spacemacs/paste-transient-state/evil-paste-pop-next)
    ;; (define-key spacemacs/paste-transient-state/keymap (kbd "C-p") 'spacemacs/paste-transient-state/evil-paste-after)
    )

  ;; Frame settings
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  ;; (global-unset-key (kbd "<f11>")) ; Not sure why I unset this. Maybe I was going to use it for something.
  (global-set-key (kbd "<S-f11>") 'toggle-frame-fullscreen)
  (spacemacs/toggle-mode-line-battery-on)
  (spacemacs/set-leader-keys "qw" 'spacemacs/frame-killer)

  ;; Window settings
  ;; (spacemacs/set-leader-keys "w" 'spacemacs/toggle-maximize-buffer)
  (spacemacs/set-leader-keys "wq" 'spacemacs/toggle-maximize-buffer)
  (spacemacs/set-leader-keys "" 'spacemacs/toggle-maximize-buffer)
  (eval-after-load "window-numbering-mode"
    '(define-key window-numbering-keymap (kbd "M-1") digit-argument))
  (spacemacs/set-leader-keys "<up>" 'evil-window-up)
  (spacemacs/set-leader-keys "<down>" 'evil-window-down)
  (spacemacs/set-leader-keys "<left>" 'evil-window-left)
  (spacemacs/set-leader-keys "<right>" 'evil-window-right)

  ;; Visual settings
  (global-visual-line-mode t)

  ;; Clock settings
  (setq display-time-24hr-format t)
  (setq display-time-default-load-average t)
  (display-time-mode t)

  ;; Helm settings
  (spacemacs/set-leader-keys "h d a" 'helm-apropos)
  (spacemacs/set-leader-keys "h a" 'helm-apropos)
  (setq helm-ff-newfile-prompt-p nil)
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "\\") 'spacemacs/helm-navigation-transient-state/body))

  ;; Git settings
  (setq vc-follow-symlinks t)

  ;; File settings
  (spacemacs/set-leader-keys "tt" 'neotree-toggle)

  ;; Yasnippet
  (add-to-load-path "~/.emacs.d/private/yasnippet")

  ;; Auto-completion
  (setq auto-completion-complete-with-key-sequence "ds")
  (setq auto-completion-complete-with-key-sequence-delay 0.4)
  (setq auto-completion-tab-key-behavior nil)
  ;; (evil-define-key 'insert (kbd "<TAB>") 'company-active-map 'company-search-candidates)
  ;; (define-key company-active-map (kbd "[?\t]") 'company-search-candidates)

  ;; Emacs Lisp settings
  ;;; This does not work with smartparens, but otherwise inserts just fine.
  ;; (evil-global-set-key 'insert (kbd "<f11>") '(lambda () (interactive) (insert "(")))
  (defun find-lisp-scratch-buffer ()
    (interactive)
    (let ((buffer-name "emacs-lisp-scratch"))
      (get-buffer-create buffer-name)
      (with-current-buffer buffer-name
        (lisp-interaction-mode))
      (switch-to-buffer buffer-name)))

  (spacemacs/set-leader-keys "k f" 'find-lisp-scratch-buffer)

  ;; Common Lisp settings
  (spacemacs/set-leader-keys-for-major-mode 'lisp-mode (kbd "ee")
    (lambda () (interactive) (slime-eval-last-expression)))

  ;; Evil Lisp state settings
  (evil-global-set-key 'lisp (kbd "df") 'evil-lisp-state/quit)

  ;; Python settings
  (with-eval-after-load 'python
    ;; (remove-hook 'python-mode-hook 'eldoc-mode)
    ;;   (add-hook 'anaconda-mode-hook (lambda () (eldoc-mode -1))
    )

  ;; C settings
  (setq-default c-default-style "bsd")
  (setq-default c-basic-offset 4)

  ;; Abbrev settings
  (setq abbrev-file-name "~/.emacs.d/private/abbrev_defs")
  (load-file abbrev-file-name)

  ;; Help settings
  (evil-define-key 'motion help-mode-map
    "b" 'evil-scroll-page-down
    "f" 'evil-scroll-page-up
    "u" 'evil-scroll-up
    "d" 'evil-scroll-down
    )

  ;; Info settings
  (spacemacs/set-leader-keys "hdi" 'helm-info-at-point)
  (spacemacs/set-leader-keys "hi" 'helm-info)
  (evil-define-key 'normal Info-mode-map
    "b" 'Info-scroll-down
    "f" 'Info-scroll-up
    "u" 'evil-scroll-up
    "d" 'evil-scroll-down
    )
  (evil-define-key 'motion Info-mode-map
    "b" 'Info-scroll-down
    "f" 'Info-scroll-up
    "u" 'evil-scroll-up
    "d" 'evil-scroll-down
    )

  ;; Man settings
  (spacemacs/set-leader-keys "h m" 'man)
  (evil-define-key 'normal Man-mode-map
    "b" 'Info-scroll-down
    "f" 'Info-scroll-up
    "u" 'evil-scroll-up
    "d" 'evil-scroll-down
    )
  (evil-define-key 'motion Man-mode-map
    "b" 'evil-scroll-page-up
    "f" 'evil-scroll-page-down
    "u" 'evil-scroll-up
    "d" 'evil-scroll-down
    )

  ;; Dictionary/ispell settings
  ;; (lambda () (ispell-start-process))
  ;; (defun my-dictionary-search ()
  ;;   (interactive)
  ;;   (require 'dictionary)
  ;;   (let ((word (current-word))
  ;;         (enable-recursive-minibuffers t)
  ;;         (val))
  ;;     (setq val (read-from-minibuffer
  ;;                (concat "Word"
  ;;                        (when word
  ;;                          (concat " (" word ")"))
  ;;                        ": ")))
  ;;     (dictionary-new-search
  ;;      (cons (cond
  ;;             ((and (equal val "") word)
  ;;              word)
  ;;             ((> (length val) 0)
  ;;              val)
  ;;             (t
  ;;              (error "No word to lookup")))
  ;;            dictionary-default-dictionary))))
  ;; ;; (global-set-key (kbd "C-c d") 'my-dictionary-search)
  ;; (spacemacs/set-leader-keys "h d d" 'my-dictionary-search)

  ;; Shell settings
  (global-set-key (kbd "<f12>") 'spacemacs/default-pop-shell)
  (evil-define-key 'normal term-mode-map (kbd "RET") 'term-send-return)
  (evil-define-key 'hybrid term-raw-map (kbd "C-c C-d") 'term-send-eof)

  ;; Conf mode settings
  (evil-define-key 'normal conf-mode-map (kbd "*") 'spacemacs/enter-ahs-forward)

  ;; TeX settings
  (setq TeX-view-program-selection '((output-pdf "xpdf")))
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; Calc settings
  (global-set-key (kbd "<f5>") 'calc)
  (global-set-key (kbd "S-<f5>") 'quick-calc)
  (with-eval-after-load 'calc
    (define-key calc-mode-map (kbd "M-c") 'calc-reset)
    (define-key calc-mode-map (kbd "M-r") 'calc-reset)
    )

  ;; auto-capitaliziation settings
  (load "~/.emacs.d/private/auto-capitalize.el" t)
  (load "~/prog/emacs/evil-enter.el" t)

  ;; Ledger settings
  (spacemacs/set-leader-keys-for-major-mode 'ledger-mode "," 'ledger-mode-clean-buffer)

  ;;  Org settings
  (setq org-directory "~/org")
  (setq org-agenda-files
        '("~/org/journal.org" "~/org/gtd.org" "~/Dropbox/orgzly/mobile.org"))
  (setq org-startup-indented t)
  (setq org-agenda-repeating-timestamp-show-all nil)
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (visual-line-mode -1)
              (toggle-truncate-lines 1)))

  ;; User-added org modules
  (with-eval-after-load 'org
    (add-to-list 'org-modules 'org-checklist 'org-habit))

  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (evil-define-key 'normal org-mode-map "j" 'evil-next-visual-line)
  (evil-define-key 'normal org-mode-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (evil-define-key 'visual org-mode-map "j" 'evil-next-visual-line)
  (evil-define-key 'visual org-mode-map "k" 'evil-previous-visual-line)

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (spacemacs/set-leader-keys (kbd "aa") 'org-agenda)
  (global-set-key (kbd "C-c b") 'org-ido-switchb)
  (global-set-key (kbd "C-c C-x ;") 'org-timer-set-timer)

  (spacemacs/set-leader-keys-for-major-mode 'org-mode "r" 'org-priority)

  ;; Disable org cache to suppress minibuffer flooding with error messages
  (setq org-element-use-cache nil)

  ;; Refile targets
  (setq org-refile-targets '(("~/Dropbox/orgzly/mobile.org" :maxlevel . 1)))

  ;; Add appointment via appointments
  (global-set-key (kbd "C-c C-x '") 'appt-add)
  (global-set-key (kbd "C-c C-x \"") 'appt-delete)
  (defun org-insert-subtree-promote ()
    "Insert a subtree and promote it by one level."
    (interactive)
    (org-insert-heading-respect-content)
    (org-metaright))
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "hh" 'org-insert-heading-after-current)
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-M-<return>") 'org-insert-subtree-promote)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-S-<return>") 'org-insert-heading-respect-content)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "M-<return>") 'org-insert-item)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-c t") 'org-todo)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-q t") 'org-todo)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-q C-t") 'org-todo)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-q r") 'org-todo)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-q C-r") 'org-todo)))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-c ,") '(lambda () (interactive) (org-time-stamp-inactive 1)))))
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "C-c p") 'org-priority)))
  (global-set-key (kbd "C-c C-x d") 'org-clock-display)
  (global-set-key (kbd "C-c C-x C-j") 'org-clock-goto)
  (global-set-key (kbd "C-c C-x C-o") 'org-clock-out)
  (global-set-key (kbd "C-c C-x q") 'org-clock-cancel)
  (global-set-key (kbd "C-c C-x x") 'org-clock-in-last)

  ;; Org Agenda
  (spacemacs/set-leader-keys "oa" 'org-agenda)
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "p") 'org-agenda-priority)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "M-g") 'org-agenda-tree-to-indirect-buffer)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "s") 'org-agenda-schedule)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "S") 'org-save-all-org-buffers)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "p") 'org-agenda-previous-item)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "n") 'org-agenda-next-item)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "P") '(lambda () (interactive) (org-agenda-previous-item 3)))))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map (kbd "N") '(lambda () (interactive) (org-agenda-next-item 3)))))

  (setq org-agenda-block-separator "================================================================================")
  (setq org-motd-file '("~/org/gtd.org"))
  (setq org-agenda-sticky t)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-span 'day)
  (setq org-agenda-start-on-weekday nil)

  (setq org-agenda-custom-commands
        '(
          ("d" "Agenda and NEXT items" ; Reference material
           (
            (todo "NEXT")
            (agenda "" nil)))
          ))
  (setq org-todo-keyword-faces
        '(
          ("TODO" (:foreground "red" :weight bold :box (:line-width 2 :color "red" :style released-button)))
          ("DONE" (:foreground "green" :weight bold :box (:line-width 2 :color "green" :style released-button)))
          ("NEXT" (:foreground "orange" :weight bold :box (:line-width 2 :color "orange" :style released-button)))
          ("PROJECT" (:foreground "blue" :weight bold :box (:line-width 2 :color "blue" :style released-button)))
          ("STARTED" (:foreground "lightblue" :weight bold :box (:line-width 2 :color "lightblue" :style released-button)))
          ("SOMEDAY/MAYBE" (:foreground "purple" :weight bold :box (:line-width 2 :color "purple" :style released-button)))
          ))

  ;; Org Capture
  ;; Functions to return today and tomorrow's dates
  (require 'org-expiry)
  (setq
   org-expiry-created-property-name "CREATED" ; Name of property when an item is created
   org-expiry-inactive-timestamps   t         ; Don't have everything in the agenda view
   )
  (org-expiry-insinuate)
  (defun date-today ()
    (interactive)
    (format-time-string "%Y-%m-%d %A" (current-time)))
  (defun date-tomorrow ()
    (interactive)
    (format-time-string "%Y-%m-%d %A" (list (1+ (car (current-time))) (cadr (current-time)))))

  ;; Capture templates
  (setq org-capture-templates
        '(("c" "Journal" entry (file+olp+datetree "~/org/journal.org")
           "* %?\n%U\n")
          ("e" "Task" entry (file+olp+datetree "~/Dropbox/orgzly/mobile.org")
           "* %?\n%U\n")
          ("s" "Study" entry (file+olp+datetree "~/org/study.org")
           "* %?\n%U\n")
          ;; ("i" "Ideas" entry (file+headline "~/org/gtd.org" "Ideas")
          ;;  "* %?%U\n\n")
          )
        )

  ;; (defun org-goto-capture (arg)
  ;;   "Switch buffer to CAPTURE-journal.org, switch to CAPTURE-n-journal.org with prefix argument, or create a journal buffer if one is not already present."
  ;;   (interactive "p")
  ;;   (cond ((eq arg 1)
  ;;          (if (get-buffer "CAPTURE-journal.org")
  ;;              (switch-to-buffer "CAPTURE-journal.org")
  ;;            (org-capture nil "c")))
  ;;         ((not (eq arg 1))
  ;;          (if (get-buffer (concat "CAPTURE-" (number-to-string arg) "-journal.org"))
  ;;              (switch-to-buffer (concat "CAPTURE-" (number-to-string arg) "-journal.org"))
  ;;            (org-capture nil "c")))))
  (defun org-goto-capture (arg &optional char)
    "Switch buffer to CAPTURE-journal.org, switch to CAPTURE-n-journal.org with prefix argument, or create a journal buffer if one is not already present."
    (interactive "p")
    (cond ((eq arg 1)
           (let ((buf-name "CAPTURE-journal.org"))
             (if (get-buffer buf-name)
                 (switch-to-buffer buf-name)
               (org-capture nil char))
             (if (> (frame-height) 32)
                 (delete-other-windows))))
          ((not (eq arg 1))
           (let ((buf-name (concat "CAPTURE-" (number-to-string arg) "-journal.org")))
             (if (get-buffer buf-name)
                 (switch-to-buffer buf-name)
               (org-capture nil char))
             (if (> (frame-height) 32)
                 (delete-other-windows))))))

  (defun org-goto-capture-small (arg)
    (interactive "p")
    (if (eq (length (window-list)) 1)
        (progn (split-window-below)
               (other-window 1)
               (org-goto-capture arg)
               (shrink-window 12))))

                                        ; Must change all 'org-goto-capture to include char argument
  ;; (global-set-key (kbd "C-c j") 'org-goto-capture)
  (global-set-key (kbd "C-c j") (lambda () (interactive) (org-goto-capture 1 "c")))
  ;; (spacemacs/set-leader-keys "da" 'org-goto-capture)
  (spacemacs/set-leader-keys "ow" (lambda () (interactive) (org-goto-capture 1 "c")))
  (spacemacs/set-leader-keys "oe" (lambda () (interactive) (org-capture nil "e")))
  (global-set-key (kbd "C-c J") 'org-goto-capture-small)

  ;; Org speed commands
  ;; Has been changed such that it won't function
  (defun org-goto-entry-today ()
    "Place point at the end of the first line containing today's date"
    (let ((date (format-time-string "%Y-%m-%d %A")))
      (org-occur date nil 'org-remove-occur-highlights
                 (or (search-forward-regexp (concat "^.*" (format-time-string "%Y-%m-%d %A")) nil t)
                     (search-backward-regexp (concat "^.*" (format-time-string "%Y-%m-%d %A")) nil))
                 (end-of-visual-line))))

  (add-hook 'org-mode-hook '(lambda () (add-to-list 'org-speed-commands-user '("." . org-goto-entry-today))))

  (defun org-time-stamp-inactive-no-prompt ()
    (interactive)
    (org-insert-heading-respect-content)
    (save-excursion
      (newline 2)
      (insert (format-time-string "[%Y-%m-%d %a %H:%M]"))))

  ;; Capture bindings
  (add-hook 'org-capture-mode-hook
            (lambda () (define-key org-capture-mode-map (kbd "<C-S-return>") 'org-time-stamp-inactive-no-prompt)))
  (add-hook 'org-capture-mode-hook
            (lambda () (define-key org-capture-mode-map (kbd "<C-S-return>") 'org-time-stamp-inactive-no-prompt)))
  (spacemacs/set-leader-keys "ma" 'org-capture-kill)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "a" org-capture-kill)

  ;; Org tables

  ;; Babel
  ;; Causes issues loading capture buffers and possibly org-mode itself
  ;; Eval this sexp again if those issues show up.
  (with-eval-after-load 'org
    (setq org-babel-load-languages '((emacs-lisp . t)
                                     (python . t)
                                     (sh . t)))
    )

  ;; MobileOrg
  ;; (setq org-mobile-files "~/org/gtd.org")

  ;; Spacemacs bugfixes
  (require 'helm-bookmark)
  (require 'ansible)
  (require 'ansible-doc)

  ;; Calendar settings
  ;; Consider adding to own layer
  (require 'calendar)
  (global-set-key (kbd "C-c e") 'calendar)
  (spacemacs/set-leader-keys "a e" 'calendar)
  (add-to-list 'evil-normal-state-modes 'calendar-mode)

  (add-hook 'calendar-mode-hook
            (lambda ()
              (progn
                (define-key calendar-mode-map (kbd "g") 'calendar-goto-date)
                (define-key calendar-mode-map (kbd "P") 'calendar-print-day-of-year)
                (define-key calendar-mode-map (kbd "b") 'calendar-backward-day)
                (define-key calendar-mode-map (kbd "f") 'calendar-forward-day)
                (define-key calendar-mode-map (kbd "p") 'calendar-backward-week)
                (define-key calendar-mode-map (kbd "n") 'calendar-forward-week)
                (define-key calendar-mode-map (kbd "a") 'calendar-beginning-of-week)
                (define-key calendar-mode-map (kbd "e") 'calendar-end-of-week)
                (define-key calendar-mode-map (kbd "[") 'calendar-backward-month)
                (define-key calendar-mode-map (kbd "]") 'calendar-forward-month)
                (define-key calendar-mode-map (kbd "{") 'calendar-backward-year)
                (define-key calendar-mode-map (kbd "}") 'calendar-forward-year)
                (define-key calendar-mode-map (kbd "=") 'calendar-count-days-region)
                (define-key calendar-mode-map (kbd "SPC") 'calendar-set-mark)

                (evil-define-key 'normal calendar-mode-map (kbd "q") 'calendar-exit)
                (evil-define-key 'normal calendar-mode-map (kbd "h") 'calendar-backward-day)
                (evil-define-key 'normal calendar-mode-map (kbd "l") 'calendar-forward-day)
                (evil-define-key 'normal calendar-mode-map (kbd "k") 'calendar-backward-week)
                (evil-define-key 'normal calendar-mode-map (kbd "j") 'calendar-forward-week)
                (evil-define-key 'normal calendar-mode-map (kbd "C-h") 'calendar-beginning-of-week)
                (evil-define-key 'normal calendar-mode-map (kbd "C-l") 'calendar-end-of-week)
                (evil-define-key 'normal calendar-mode-map (kbd "H") 'calendar-backward-month)
                (evil-define-key 'normal calendar-mode-map (kbd "L") 'calendar-forward-month)
                (evil-define-key 'normal calendar-mode-map (kbd "C-S-l") 'calendar-backward-year)
                (evil-define-key 'normal calendar-mode-map (kbd "C-S-f") 'calendar-forward-year)
                (evil-define-key 'normal calendar-mode-map (kbd "=") 'calendar-count-days-region)
                )))

  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "g") 'calendar-goto-date)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "P") 'calendar-print-day-of-year)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "b") 'calendar-backward-day)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "f") 'calendar-forward-day)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "p") 'calendar-backward-week)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "n") 'calendar-forward-week)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "a") 'calendar-beginning-of-week)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "e") 'calendar-end-of-week)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "[") 'calendar-backward-month)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "]") 'calendar-forward-month)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "{") 'calendar-backward-year)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "}") 'calendar-forward-year)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "=") 'calendar-count-days-region)))
  ;; (add-hook 'calendar-mode-hook
  ;;           (lambda ()
  ;;             (define-key calendar-mode-map (kbd "SPC") 'calendar-set-mark)))

  (add-hook 'org-mode-hook '(lambda () (turn-on-auto-capitalize-mode)))
  ;; (add-hook 'org-mode-hook '(lambda () (abbrev-mode)))
  ;; (add-hook 'org-capture-mode-hook (lambda () (abbrev-mode)))
  ;; (find-file-noselect "~/org/journal.org")
  ;; (find-file-noselect "~/org/gtd.org")
  ;; (find-file-noselect "~/org/newgtd.org")
  ;; (with-current-buffer "journal.org"
  ;;   (progn (auto-capitalize-mode 1)
  ;;          (abbrev-mode t)))
  ;; (with-current-buffer "gtd.org"
  ;;   (progn (auto-capitalize-mode 1)
  ;;          (abbrev-mode t)))
  ;; (with-current-buffer "newgtd.org"
  ;;   (progn (auto-capitalize-mode 1)
  ;;          (abbrev-mode t)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method (quote pushy))
 '(custom-safe-themes
   (quote
    ("868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" default)))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby vagrant-tramp vagrant jinja2-mode company-ansible ansible-doc ansible ledger-mode yaml-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor company-auctex company-anaconda 0blayout powerline spinner projectile macrostep hydra parent-mode pkg-info epl flx iedit anzu evil goto-chg undo-tree highlight diminish bind-map bind-key pythonic f dash s avy async popup ess-R-data-view org-category-capture dash-functional link connection autothemer company auctex yasnippet-snippets eclim winum unfill solarized-theme madhat2r-theme fuzzy lua-mode flycheck packed auto-complete yasnippet smartparens helm helm-core ess-smart-equals ess-R-object-popup ctable ess julia-mode org alert log4e gntp slime-company hide-comnt zonokai-theme zenburn-theme zen-and-art-theme yapfify xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slime shell-pop seti-theme reverse-theme restart-emacs request rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gandalf-theme flyspell-correct-helm flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump dracula-theme django-theme dictionary define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-statistics common-lisp-snippets column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme anaconda-mode ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values (quote ((auto-capitalize-mode . 1) (visual-line-mode . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(Man-overstrike ((t (:inherit bold :foreground "#bc6ec5")))))
