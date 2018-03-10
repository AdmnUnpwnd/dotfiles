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

   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     neotree
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control

     ;; AdmnUnpwnd Packages
     ;; Multimedia
     emms
     ;; Themes
     ;; themes-megapack
     (unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
	 (typography :variables typography-enable-typographic-editing t)
     ;; Utilities
     ;; webkit
     ;; el-get
     req-package
     custom-quelpa
     ;; elpakit
     ;; tabbar
     ;; flycheck
     ;; auto-complete
     ;; company
     (colors :variables
             colors-enable-rainbow-identifiers t
             colors-enable-nyan-cat-progress-bar t)
     ;; floobits
     ;; Source Control
     github
     ;; Iterative
     haxe
     ;; (load-file "~/.emacs.d/private/+lang/haxe/haxe-complete/haxe-complete.el")
     ;; (load-file "~/.emacs.d/private/+lang/haxe/hx-emacs/hxc-complete.el")
     ;; (load-file "~/.emacs.d/private/+lang/haxe/haxe-eldoc/haxe-eldoc.el")
     ;; For C/C++
     c-c++
     custom-c-c++
     semantic
     ycmd
     ;; Web
     html
     javascript
     ;; Functional
     haskell
     ;; racket
     common-lisp
     ;; Logic
     ;; prolog
     ;; Scripting
     python
     ;; custom-python
	 ;; Mobile
	 ;; react
     ;; Esoteric
     ;; bf
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
									  ;; (haxe-complete :location (recipe :fetcher github :repo "aharisson/haxe-complete"))
									  ;; (hx-emacs :location (recipe :fetcher github :repo "cloudshift/hx-emacs"))
									  ;; (haxe-eldoc :location (recipe :fetcher github :repo "amitp/haxe-eldoc"))
									  )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory nil

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(material
                         material-light
                         moe-dark
                         moe-light
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Iosevka CC"
                               ;; "Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
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

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; For Iosevka Ligatures
  (setq prettify-symbols-unprettify-at-point 'right-edge)

  (defun setup-iosevka-ligatures ()
    (setq prettify-symbols-alist
          (append prettify-symbols-alist '(

                                           ;; Double-ended hyphen arrows ----------------
                                           ("<->" . #Xe100)
                                           ("<-->" . #Xe101)
                                           ("<--->" . #Xe102)
                                           ("<---->" . #Xe103)
                                           ("<----->" . #Xe104)

                                           ;; Double-ended equals arrows ----------------
                                           ("<=>" . #Xe105)
                                           ("<==>" . #Xe106)
                                           ("<===>" . #Xe107)
                                           ("<====>" . #Xe108)
                                           ("<=====>" . #Xe109)

                                           ;; Double-ended asterisk operators ----------------
                                           ("<**>" . #Xe10a)
                                           ("<***>" . #Xe10b)
                                           ("<****>" . #Xe10c)
                                           ("<*****>" . #Xe10d)

                                           ;; HTML comments ----------------
                                           ("<!--" . #Xe10e)
                                           ("<!---" . #Xe10f)

                                           ;; Three-char ops with discards ----------------
                                           ("<$" . #Xe110)
                                           ("<$>" . #Xe111)
                                           ("$>" . #Xe112)
                                           ("<." . #Xe113)
                                           ("<.>" . #Xe114)
                                           (".>" . #Xe115)
                                           ("<*" . #Xe116)
                                           ("<*>" . #Xe117)
                                           ("*>" . #Xe118)
                                           ("<\\" . #Xe119)
                                           ("<\\>" . #Xe11a)
                                           ("\\>" . #Xe11b)
                                           ("</" . #Xe11c)
                                           ("</>" . #Xe11d)
                                           ("/>" . #Xe11e)
                                           ("<\"" . #Xe11f)
                                           ("<\">" . #Xe120)
                                           ("\">" . #Xe121)
                                           ("<'" . #Xe122)
                                           ("<'>" . #Xe123)
                                           ("'>" . #Xe124)
                                           ("<^" . #Xe125)
                                           ("<^>" . #Xe126)
                                           ("^>" . #Xe127)
                                           ("<&" . #Xe128)
                                           ("<&>" . #Xe129)
                                           ("&>" . #Xe12a)
                                           ("<%" . #Xe12b)
                                           ("<%>" . #Xe12c)
                                           ("%>" . #Xe12d)
                                           ("<@" . #Xe12e)
                                           ("<@>" . #Xe12f)
                                           ("@>" . #Xe130)
                                           ("<#" . #Xe131)
                                           ("<#>" . #Xe132)
                                           ("#>" . #Xe133)
                                           ("<+" . #Xe134)
                                           ("<+>" . #Xe135)
                                           ("+>" . #Xe136)
                                           ("<-" . #Xe137)
                                           ("<->" . #Xe138)
                                           ("->" . #Xe139)
                                           ("<!" . #Xe13a)
                                           ("<!>" . #Xe13b)
                                           ("!>" . #Xe13c)
                                           ("<?" . #Xe13d)
                                           ("<?>" . #Xe13e)
                                           ("?>" . #Xe13f)
                                           ("<|" . #Xe140)
                                           ("<|>" . #Xe141)
                                           ("|>" . #Xe142)
                                           ("<:" . #Xe143)
                                           ("<:>" . #Xe144)
                                           (":>" . #Xe145)

                                           ;; Colons ----------------
                                           ("::" . #Xe146)
                                           (":::" . #Xe147)
                                           ("::::" . #Xe148)

                                           ;; Arrow-like operators ----------------
                                           ("->" . #Xe149)
                                           ("->-" . #Xe14a)
                                           ("->--" . #Xe14b)
                                           ("->>" . #Xe14c)
                                           ("->>-" . #Xe14d)
                                           ("->>--" . #Xe14e)
                                           ("->>>" . #Xe14f)
                                           ("->>>-" . #Xe150)
                                           ("->>>--" . #Xe151)
                                           ("-->" . #Xe152)
                                           ("-->-" . #Xe153)
                                           ("-->--" . #Xe154)
                                           ("-->>" . #Xe155)
                                           ("-->>-" . #Xe156)
                                           ("-->>--" . #Xe157)
                                           ("-->>>" . #Xe158)
                                           ("-->>>-" . #Xe159)
                                           ("-->>>--" . #Xe15a)
                                           (">-" . #Xe15b)
                                           (">--" . #Xe15c)
                                           (">>-" . #Xe15d)
                                           (">>--" . #Xe15e)
                                           (">>>-" . #Xe15f)
                                           (">>>--" . #Xe160)
                                           ("=>" . #Xe161)
                                           ("=>=" . #Xe162)
                                           ("=>==" . #Xe163)
                                           ("=>>" . #Xe164)
                                           ("=>>=" . #Xe165)
                                           ("=>>==" . #Xe166)
                                           ("=>>>" . #Xe167)
                                           ("=>>>=" . #Xe168)
                                           ("=>>>==" . #Xe169)
                                           ("==>" . #Xe16a)
                                           ("==>=" . #Xe16b)
                                           ("==>==" . #Xe16c)
                                           ("==>>" . #Xe16d)
                                           ("==>>=" . #Xe16e)
                                           ("==>>==" . #Xe16f)
                                           ("==>>>" . #Xe170)
                                           ("==>>>=" . #Xe171)
                                           ("==>>>==" . #Xe172)
                                           (">=" . #Xe173)
                                           (">==" . #Xe174)
                                           (">>=" . #Xe175)
                                           (">>==" . #Xe176)
                                           (">>>=" . #Xe177)
                                           (">>>==" . #Xe178)
                                           ("<-" . #Xe179)
                                           ("-<-" . #Xe17a)
                                           ("--<-" . #Xe17b)
                                           ("<<-" . #Xe17c)
                                           ("-<<-" . #Xe17d)
                                           ("--<<-" . #Xe17e)
                                           ("<<<-" . #Xe17f)
                                           ("-<<<-" . #Xe180)
                                           ("--<<<-" . #Xe181)
                                           ("<--" . #Xe182)
                                           ("-<--" . #Xe183)
                                           ("--<--" . #Xe184)
                                           ("<<--" . #Xe185)
                                           ("-<<--" . #Xe186)
                                           ("--<<--" . #Xe187)
                                           ("<<<--" . #Xe188)
                                           ("-<<<--" . #Xe189)
                                           ("--<<<--" . #Xe18a)
                                           ("-<" . #Xe18b)
                                           ("--<" . #Xe18c)
                                           ("-<<" . #Xe18d)
                                           ("--<<" . #Xe18e)
                                           ("-<<<" . #Xe18f)
                                           ("--<<<" . #Xe190)
                                           ("<=" . #Xe191)
                                           ("=<=" . #Xe192)
                                           ("==<=" . #Xe193)
                                           ("<<=" . #Xe194)
                                           ("=<<=" . #Xe195)
                                           ("==<<=" . #Xe196)
                                           ("<<<=" . #Xe197)
                                           ("=<<<=" . #Xe198)
                                           ("==<<<=" . #Xe199)
                                           ("<==" . #Xe19a)
                                           ("=<==" . #Xe19b)
                                           ("==<==" . #Xe19c)
                                           ("<<==" . #Xe19d)
                                           ("=<<==" . #Xe19e)
                                           ("==<<==" . #Xe19f)
                                           ("<<<==" . #Xe1a0)
                                           ("=<<<==" . #Xe1a1)
                                           ("==<<<==" . #Xe1a2)
                                           ("=<" . #Xe1a3)
                                           ("==<" . #Xe1a4)
                                           ("=<<" . #Xe1a5)
                                           ("==<<" . #Xe1a6)
                                           ("=<<<" . #Xe1a7)
                                           ("==<<<" . #Xe1a8)

                                           ;; Monadic operators ----------------
                                           (">=>" . #Xe1a9)
                                           (">->" . #Xe1aa)
                                           (">-->" . #Xe1ab)
                                           (">==>" . #Xe1ac)
                                           ("<=<" . #Xe1ad)
                                           ("<-<" . #Xe1ae)
                                           ("<--<" . #Xe1af)
                                           ("<==<" . #Xe1b0)

                                           ;; Composition operators ----------------
                                           (">>" . #Xe1b1)
                                           (">>>" . #Xe1b2)
                                           ("<<" . #Xe1b3)
                                           ("<<<" . #Xe1b4)

                                           ;; Lens operators ----------------
                                           (":+" . #Xe1b5)
                                           (":-" . #Xe1b6)
                                           (":=" . #Xe1b7)
                                           ("+:" . #Xe1b8)
                                           ("-:" . #Xe1b9)
                                           ("=:" . #Xe1ba)
                                           ("=^" . #Xe1bb)
                                           ("=+" . #Xe1bc)
                                           ("=-" . #Xe1bd)
                                           ("=*" . #Xe1be)
                                           ("=/" . #Xe1bf)
                                           ("=%" . #Xe1c0)
                                           ("^=" . #Xe1c1)
                                           ("+=" . #Xe1c2)
                                           ("-=" . #Xe1c3)
                                           ("*=" . #Xe1c4)
                                           ("/=" . #Xe1c5)
                                           ("%=" . #Xe1c6)

                                           ;; Logical ----------------
                                           ("/\\" . #Xe1c7)
                                           ("\\/" . #Xe1c8)

                                           ;; Semigroup/monoid operators ----------------
                                           ("<>" . #Xe1c9)
                                           ("<+" . #Xe1ca)
                                           ("<+>" . #Xe1cb)
                                           ("+>" . #Xe1cc)


                                           ))))

  (defun refresh-pretty ()
    (prettify-symbols-mode -1)
    (prettify-symbols-mode +1))

  ;; Hooks for modes in which to install the Iosevka ligatures
  (mapc (lambda (hook)
          (add-hook hook (lambda () (setup-iosevka-ligatures) (refresh-pretty))))
        '(text-mode-hook
          prog-mode-hook))
  (global-prettify-symbols-mode +1)



  ;; For EMMS
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (emms-standard)
  (emms-default-players)
  (define-emms-simple-player mplayer '(file url)
	(regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
				  ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
				  ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
	"mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")


  ;; El-Get Installation
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

  (unless (require 'el-get nil 'noerror)
	(with-current-buffer
		(url-retrieve-synchronously
		 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
	  (goto-char (point-max))
	  (eval-print-last-sexp)))

  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
  (el-get 'sync)


  ;; Global Mode Settings
  (eldoc-mode t)
  (anaconda-mode t)
  (global-company-mode t)
  (global-flycheck-mode t)
  (global-auto-complete-mode t)
  (global-centered-cursor-mode t)
  (global-aggressive-indent-mode t)


  ;; Font Settings
  ;; (set-default-font "PragmataPro")
  (set-frame-font "PragmataPro")


  ;; Make indentation commands use tab only (never space character)
  (setq-default indent-tabs-mode t)
  (setq-default tab-width 4)
  (setq-default default-tab-width 4)
  ;; Make tab key do indent first then completion
  (setq-default tab-always-indent 'complete)

  ;; For Navigating Split Windows
  (global-set-key [s-up] 'windmove-up)
  (global-set-key [s-down] 'windmove-down)
  (global-set-key [s-left] 'windmove-left)
  (global-set-key [s-right] 'windmove-right)

  ;; For tabbar-ruler
  (setq-default tabbar-ruler-global-tabbar t) ; If you want tabbar
  (setq-default tabbar-ruler-global-ruler t) ; if you want a global ruler
  (setq-default tabbar-ruler-group-by-projectile-project t)
  (global-set-key (kbd "C-c t") 'tabbar-ruler-move)


  ;; http://stackoverflow.com/questions/916797/emacs-global-set-key-to-c-tab
  ;; (global-set-key [C-tab] 'semantic-analyze-possible-completions)
  ;; (global-set-key [C-tab] 'semantic-complete-analyze-inline)
  (global-set-key [C-tab] 'semantic-complete-analyze-inline-idle)
  ;; (setq-default semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-traditional)
  ;; (setq-default semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-ghost)
  (setq-default semantic-complete-inline-analyzer-displayor-class 'semantic-displayor-tooltip)
  ;; (setq-default semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-traditional)
  ;; (setq-default semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-ghost)
  (setq-default semantic-complete-inline-analyzer-idle-displayor-class 'semantic-displayor-tooltip)
  ;; (global-set-key (kbd "<C-tab>") 'semantic-complete-analyze-inline)

  ;; CEDET
  (semantic-mode t)
  (global-ede-mode t)							; Enable the Project management system
  ;; (semantic-load-enable-code-helpers)		; Enable prototype help and smart completion
  (global-semantic-stickyfunc-mode t)
  (global-semantic-idle-completions-mode t)
  (global-semantic-show-unmatched-syntax-mode t)

  ;; (global-set-key (kbd "<C-tab>") 'auto-complete)
  ;; (global-set-key (kbd "<C-tab>") 'hippie-expand)


  (ac-config-default)
  ;; (define-key ac-mode-map (kbd "<C-tab>") 'auto-complete)
  ;; (ac-set-trigger-key (kbd "<C-tab>"))


  ;; https://calltopower.wordpress.com/2010/12/29/lisp-emacs-autocomplete/
  ;; Globally enable autocomplete by pasting the following snippet into your .emacs-file:
  (define-globalized-minor-mode real-global-auto-complete-mode
    auto-complete-mode (lambda ()
                         (if (not (minibufferp (current-buffer)))
                             (auto-complete-mode 1))))
  (real-global-auto-complete-mode t)

  ;; https://math.berkeley.edu/~lowdanie/emacs_ac.html
  (ac-ropemacs-initialize)
  (define-key ac-complete-mode-map "\t" 'ac-expand)
  (define-key ac-complete-mode-map "\r" 'ac-complete)
  (define-key ac-complete-mode-map "\M-n" 'ac-next)
  (define-key ac-complete-mode-map "\M-p" 'ac-previous)
  (setq ac-auto-start 3)
  (setq ac-dwim t)
  (set-default 'ac-sources '(ac-source-abbrev ac-source-words-in-buffer))
  (setq ac-modes
        (append ac-modes
                '(eshell-mode
                  )))


  ;; (setq-default 'gnutls-available-p nil)

  ;; https://glyph.twistedmatrix.com/2015/11/editor-malware.html
  (let ((trustfile
		 (replace-regexp-in-string
		  "\\\\" "/"
		  (replace-regexp-in-string
		   "\n" ""
		   (shell-command-to-string "python -m certifi")))))
	(setq tls-program
		  (list
		   (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
				   (if (eq window-system 'w32) ".exe" "") trustfile)))
	(setq gnutls-verify-error t)
	(setq gnutls-trustfiles (list trustfile)))

  ;; https://github.com/novoid/dot-emacs/blob/master/main.el
  (if (fboundp 'gnutls-available-p)
	  (fmakunbound 'gnutls-available-p))
  (setq tls-program '("gnutls-cli --tofu -p %p %h")
		imap-ssl-program '("gnutls-cli --tofu -p %p %s")
		smtpmail-stream-type 'starttls
		starttls-extra-arguments '("--tofu"))

  ;; https://ogbe.net/emacsconfig.html
  (setq tls-checktrust t)
  (setq gnutls-verify-error t)
  (let ((trustfile "/etc/ssl/cert.pem"))
    (setq tls-program
          `(,(format  "gnutls-cli --x509cafile %s -p %%p %%h" trustfile)
            ,(format "openssl s_client -connect %%h:%%p -CAfile %s -no_ssl2 -ign_eof" trustfile)))
    (setq gnutls-trustfiles (list trustfile)))


  ;; Haxe
  ;;   (def-const my-haxe-style
  ;; 	'("c++" (c-offsets-alist . ((case-label . +)
  ;; 								(arglist-intro . +)
  ;; 								(arglist-cont-nonempty . 0)
  ;; 								(arglist-close . 0)
  ;; 								(cpp-macro . 0))))
  ;; 	"My Haxe Programming Style")
  ;;   (add-hook 'haxe-mode-hook
  ;; 			(function (lambda () (c-add-style "haxe" my-haxe-style t))))
  ;;   (add-hook 'haxe-mode-hook
  ;; 			(function
  ;; 			 (lambda ()
  ;; 			   (setq tab-width 4)
  ;; 			   (setq indent-tabs-mode t)
  ;; 			   (setq fill-column 80)
  ;; 			   (auto-complete-mode 1)
  ;; 			   (local-set-key [(return)] 'newline-and-indent))))


  ;; For React Native
  ;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
  ;; Use web-mode for .jsx files
  ;; (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

  ;; Disable JSHint since we prefer ESLint checking
  ;; (setq-default flycheck-disabled-checkers
  ;;			(append flycheck-disabled-checkers
  ;;					'(javascript-jshint)))

  ;; Use ESLint with web-mode for JSX files
  ;; (flycheck-add-mode 'javascript-eslint 'web-mode)

  ;; Customize Flycheck temp file prefix
  ;; (setq-default flycheck-temp-prefix ".flycheck")

  ;; Disable json-jsonlist checking for JSON files
  ;; (setq-default flycheck-disabled-checkers
  ;;			(append flycheck-disabled-checkers
  ;;				'(json-jsonlist)))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(fancy-battery-mode t)
 '(indicate-empty-lines t)
 '(package-selected-packages
   (quote
    (evil-unimpaired org auto-complete highlight git-gutter gh slime-company slime common-lisp-snippets use-package dash hide-comnt helm-purpose window-purpose imenu-list anaconda-mode anzu flyspell-correct ht magit-popup async package-build yasnippet pug-mode f web-mode rtags racket-mode py-isort pip-requirements persp-mode org-plus-contrib neotree macrostep js2-refactor irony intero help-fns+ helm-themes helm-pydoc helm-projectile helm-descbinds helm-ag haskell-snippets evil-mc eshell-prompt-extras dumb-jump company-ycmd cmake-mode auto-yasnippet ace-window ace-link ace-jump-helm-line emms-player-simple-mpv iedit smartparens undo-tree ycmd flycheck haskell-mode helm helm-core markdown-mode projectile magit git-commit with-editor js2-mode s yapfify xterm-color ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen toc-org tagedit stickyfunc-enhance srefactor spacemacs-theme spaceline soundklaus smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs request-deferred req-package rainbow-mode rainbow-identifiers rainbow-delimiters quelpa-use-package pyvenv pytest pyenv-mode popwin pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file mwim multiple-cursors multi-term move-text mmm-mode material-theme markdown-toc magit-gitflow magit-gh-pulls lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js-doc jinja2-mode jedi jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-swoop helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-emms helm-css-scss helm-company helm-c-yasnippet haxe-mode google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flyspell-correct-helm flycheck-ycmd flycheck-pos-tip flycheck-haskell flx-ido floobits fill-column-indicator fancy-battery faceup eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z esh-help emms-state emms-soundcloud emms-player-mpv-jp-radios emms-player-mpv emms-mode-line-cycle emms-mark-ext emms-info-mediainfo emmet-mode elisp-slime-nav disaster diff-hl define-word cython-mode company-web company-tern company-statistics company-ghci company-ghc company-cabal company-c-headers company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmm-mode clean-aindent-mode clang-format bfbuilder auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ac-ispell)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail))))
 '(size-indication-mode t)
 '(tls-checktrust t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(fancy-battery-mode t)
 '(indicate-empty-lines t)
 '(package-selected-packages
   (quote
    (zenburn-theme typo realgud overseer org-brain nameless monokai-theme impatient-mode google-c-style evil-org editorconfig dante lcr browse-at-remote ghc company marshal ghub alert pythonic simple-httpd emms all-the-icons powerline epl hydra font-lock+ evil evil-unimpaired org auto-complete highlight git-gutter gh slime-company slime common-lisp-snippets use-package dash hide-comnt helm-purpose window-purpose imenu-list anaconda-mode anzu flyspell-correct ht magit-popup async package-build yasnippet pug-mode f web-mode rtags racket-mode py-isort pip-requirements persp-mode org-plus-contrib neotree macrostep js2-refactor irony intero help-fns+ helm-themes helm-pydoc helm-projectile helm-descbinds helm-ag haskell-snippets evil-mc eshell-prompt-extras dumb-jump company-ycmd cmake-mode auto-yasnippet ace-window ace-link ace-jump-helm-line emms-player-simple-mpv iedit smartparens undo-tree ycmd flycheck haskell-mode helm helm-core markdown-mode projectile magit git-commit with-editor js2-mode s yapfify xterm-color ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen toc-org tagedit stickyfunc-enhance srefactor spacemacs-theme spaceline soundklaus smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs request-deferred req-package rainbow-mode rainbow-identifiers rainbow-delimiters quelpa-use-package pyvenv pytest pyenv-mode popwin pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file mwim multiple-cursors multi-term move-text mmm-mode material-theme markdown-toc magit-gitflow magit-gh-pulls lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js-doc jinja2-mode jedi jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-swoop helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-emms helm-css-scss helm-company helm-c-yasnippet haxe-mode google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flyspell-correct-helm flycheck-ycmd flycheck-pos-tip flycheck-haskell flx-ido floobits fill-column-indicator fancy-battery faceup eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z esh-help emms-state emms-soundcloud emms-player-mpv-jp-radios emms-player-mpv emms-mode-line-cycle emms-mark-ext emms-info-mediainfo emmet-mode elisp-slime-nav disaster diff-hl define-word cython-mode company-web company-tern company-statistics company-ghci company-ghc company-cabal company-c-headers company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmm-mode clean-aindent-mode clang-format bfbuilder auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ac-ispell)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail))))
 '(size-indication-mode t)
 '(tls-checktrust t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
