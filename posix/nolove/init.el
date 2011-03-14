;; -*- Mode: Emacs-Lisp -*-
;;
;; Name		~/.xemacs/init.el
;; Description  xemacs customizations
;; Version	$Id: init.el,v 1.2 2004/06/03 09:00:25 polster Exp $
;;

;; Local stuff is in /usr/share/xemacs/site-lisp
(setq load-path (cons "/usr/share/xemacs/site-lisp" load-path))

;; Is this XEmacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Stop down-arrow key to add newlines at the end of text
(setq next-line-add-newlines nil)

;; Load default sounds
;; (load-default-sounds)

;; Load the auto-save.el package, which lets you put all of your autosave
;; files in one place, instead of scattering them around the file system.
(require 'auto-save)
(setq auto-save-directory (expand-file-name "~/backup/")
      auto-save-directory-fallback auto-save-directory
      auto-save-hash-p nil
      ange-ftp-auto-save t
      ange-ftp-auto-save-remotely nil
      efs-auto-save t
      efs-auto-save-remotely nil
      ;; now that we have auto-save-timeout, let's crank this up
      ;; for better interactive response.
      auto-save-interval 2000
)

;; (require 'backup)
;; (backup-set-directory (expand-file-name "~/backup"))

;; This adds additional extensions which indicate files normally
;; handled by cc-mode.
;; (setq auto-mode-alist
;;       (append '(("\\.C$"  . c++-mode)
;; 		("\\.cc$" . c++-mode)
;; 		("\\.hh$" . c++-mode)
;; 		("\\.c$"  . c-mode)
;; 		("\\.h$"  . c-mode))
;; 	      auto-mode-alist))

;; Handles newlines by first indenting the current line and then inserting 
;; the newline and indent to where the new line should be.
(defun indent-then-newline-and-indent ()
  (interactive)
  (indent-according-to-mode)
  (newline-and-indent))

;; cc-mode customizations
(defun my-cc-mode-common-hook ()
  ;; 4 spaces per tab
  (setq tab-width 4)

  ;; Set basic offset to 4 spaces
  (setq c-basic-offset 4)

  ;; Tell cc-mode not to check for old-style (K&R) function declarations.
  ;; This speeds up indenting a lot.
  (setq c-recognize-knr-p nil)

  ;; Tab indents only in the indentation region
  (setq c-tab-always-indent nil)
  
  ;; Use spaces instead of tabs
  (setq indent-tabs-mode nil)

  ;; Use the CUI indentation style
  ;; (setq c-default-style "whitesmith")
  (c-set-style "whitesmith")

  ;; Enter should indent, too
  (define-key c-mode-map "\C-m" 'indent-then-newline-and-indent)
  (define-key java-mode-map "\C-m" 'indent-then-newline-and-indent)
  (define-key c++-mode-map "\C-m" 'indent-then-newline-and-indent)
)

;; Install cc-mode customizations
(add-hook 'c-mode-hook 'my-cc-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-cc-mode-common-hook)

;; func-menu is a package which scans the source file for function 
;; definitions and makes a menubar entry that lets you jump to any
;; particular function
(cond (running-xemacs
	(require 'func-menu)
	(define-key global-map 'f12 'function-menu)
 	(add-hook 'find-file-hooks 'fume-add-menubar-entry)
	(define-key global-map "\C-cl" 'fume-list-functions)
	(define-key global-map "\C-cg" 'fume-prompt-function-goto)
	(define-key global-map '(shift button3) 'mouse-function-menu)
	(setq fume-max-items 25
	      fume-fn-window-position 3
	      fume-auto-position-popup t
	      fume-display-in-modeline-p t
	      fume-menubar-menu-location "File"
	      fume-buffer-name "*Function List*"
	      fume-no-prompt-on-valid-default nil
	)
))

;; Respect Linux kernel source formatting
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8))
(setq auto-mode-alist (append '(("/usr/src/linux.*/.*\\.[ch]$" . linux-c-mode))
  auto-mode-alist))

;; Tcl mode customizations
(require 'tcl)
(autoload 'tcl-mode "tcl" "Tcl mode." t)
(autoload 'inferior-tcl "tcl" "Run inferior Tcl process." t)
(setq auto-mode-alist (append '(("\\.tcl$" . tcl-mode)) auto-mode-alist))
(setq tcl-help-directory-list '("/usr/local/frene/tclX/7.5.0/help"))
(autoload 'tcl-help-on-word "tcl" "Help on Tcl commands" t)
(setq tcl-keyword-list '("after" "alarm" "append" "array" "auto_commands"
	"auto_load" "auto_load_file" "auto_packages" "background-error" "bell"
	"bind" "bindtags" "bitmap" "break" "bsearch"
	"buildpackageindex" "button" "canvas" "case" "catch"
	"catclose" "catgets" "catopen" "ccollate" "cd"
	"cequal" "checkbutton" "chgrp" "chmod" "chown"
	"chroot" "cindex" "clength" "clipboard" "clock"
	"close" "cmdtrace" "commandloop" "concat" "continue"
	"convert_lib" "copyfile" "crange" "csubstr" "ctoken"
	"ctype" "destroy" "dirs" "dup" "echo"
	"edprocs" "entry" "eof" "error" "eval"
	"exec" "execl" "exit" "expr" "fblocked"
	"fcntl" "fconfigure" "file" "fileevent" "filename"
	"flock" "flush" "fmathcmds" "focus" "for"
	"for_array_keys" "for_file" "for_recursive_glob" "foreach" "fork"
	"format" "frame" "frename" "fstat" "ftruncate"
	"funlock" "gets" "glob" "global" "grab"
	"grid" "history" "host_info" "id" "if"
	"image" "incr" "info" "infox" "interp"
	"intersect" "intersect3" "intro" "join" "keyedlists"
	"keyldel" "keylget" "keylkeys" "keylset" "kill"
	"label" "lappend" "lassign" "lempty" "lgets"
	"library" "lindex" "link" "linsert" "list"
	"listbox" "llength" "lmatch" "load" "loadlibindex"
	"loop" "lower" "lrange" "lreplace" "lrmdups"
	"lsearch" "lsort" "lvarcat" "lvarpop" "lvarpush"
	"mainloop" "max" "menu" "menubutton" "message"
	"min" "mkdir" "nice" "open" "option"
	"options" "pack" "pack-old" "package" "packagelib"
	"photo" "pid" "pipe" "pkgMkIndex" "place"
	"popd" "proc" "profile" "profrep" "pushd"
	"puts" "pwd" "radiobutton" "raise" "random"
	"read" "read_file" "readdir" "recursive_glob" "regexp"
	"regsub" "rename" "replicate" "return" "rmdir"
	"saveprocs" "scale" "scan" "scancontext" "scanfile"
	"scanmatch" "scrollbar" "searchpath" "seek" "select"
	"selection" "send" "set" "showproc" "signal"
	"sleep" "socket" "source" "split" "stdvars"
	"string" "subst" "switch" "sync" "syntax"
	"system" "tclx_errorHandler" "tell" "text" "time"
	"times" "tk" "tk_bisque" "tk_dialog" "tk_focusNext"
	"tk_menuBar" "tk_optionMenu" "tk_popup" "tk_setPalette" "tkerror"
	"tkvars" "tkwait" "toplevel" "trace" "translit"
	"umask" "union" "unknown" "unlink" "unset"
	"update" "uplevel" "upvar" "variables" "vwait"
	"wait" "while" "winfo" "wm" "write_file"))
(tcl-set-font-lock-keywords)
(setq tcl-use-hairy-comment-detector nil)
(setq tcl-tab-always-indent nil)

;; CPerl mode customizations
(defun my-cperl-mode-hook ()
  (setq cperl-tab-always-indent nil)
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 4)
  (setq cperl-brace-offset -4)
  (setq cperl-label-offset -4)
  (setq cperl-continued-statement-offset 4)
)
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)

;; Ksh mode customizations
(setq ksh-tab-always-indent nil)

;; Start xemacs server
;; (load "gnuserv")
;; (gnuserv-start)

;; Display line numbers in the mode line
(setq line-number-mode t)

;; Load Brief emulation
(setq brief-override-meta-x nil)
(require 'brief)
(brief-mode)

;; Enable visual feedback on selections
(setq-default transient-mark-mode t)

;; Load version control support
(require 'vc)

;; Enable mousewheel support
(when window-system
  (mwheel-install))

;; Bind Delete to delete, backspace to backspace (should be the last step)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key [backspace] 'backward-delete-char-untabify)

;; (load-library "delbackspace")

;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
            (= emacs-major-version 19)
            (>= emacs-minor-version 14))
           (= emacs-major-version 20))
       (fboundp 'load-options-file))
  (load-options-file "~/.xemacs-options")))
;; ============================
;; End of Options Menu Settings

(put 'eval-expression 'disabled nil)





;;
;; End		.emacs
;;
