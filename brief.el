;; -*- Mode: Emacs-Lisp -*-
;;
;; Name		brief.el
;; Author	Akos Polster <akosp@freemail.hu>
;; Description  Brief emulation for Emacs/XEmacs
;; Version	$Id: brief.el,v 1.9 2000/08/06 18:23:33 polster Exp polster $
;;
;; Comments     Based on crisp.el written by Gary D. Foster 
;;              <Gary.Foster@corp.sun.com>

;;; Commentary:

;; Keybindings and minor functions to duplicate the functionality and
;; finger-feel of the Crisp/Brief editor.  This package is designed to
;; facilitate transitioning from Brief to (XE|E)macs with a minimum
;; amount of hassles.

;; Enable this package by putting the following in your .emacs
;; (require 'brief)
;; and use M-x brief-mode to toggle it on or off.

;; This package will automatically default to loading the scroll-lock.el
;; package unless you put (setq brief-load-scroll-lock nil) in your
;; .emacs.  If this feature is enabled, it will bind meta-f1 to the
;; scroll-lock mode toggle.

;; Also, the default keybindings for brief override the meta-x key to
;; exit the editor.  If you don't like this functionality, you can
;; prevent this key from being rebound with
;; (setq brief-override-meta-x nil) in your .emacs.

;; Finally, if you want to change the string displayed in the modeline
;; when this mode is in effect, override the definition of
;; `brief-mode-modeline-string' in your .emacs.  The default value is
;; "*Brief*" which may be a bit lengthy if you have a lot of things
;; being displayed there.

;; All these overrides should go *before* the (require 'brief) statement.

;; local variables

(defvar brief-mode-map (let ((map (make-sparse-keymap)))
			 (set-keymap-parent map (current-global-map))
			 map)
  "Local keymap for Brief mode.
All the bindings are done here instead of globally to try and be
nice to the world.")

(defvar brief-mode-modeline-string " Brief"
  "String to display in the modeline when Brief mode is enabled.")

(defvar brief-mode-original-keymap (current-global-map)
  "The original keymap before Brief mode remaps anything.
This keymap is restored when Brief mode is disabled.")

(defvar brief-mode-enabled 'nil
  "Track status of Brief mode.
A value of nil means Brief mode is not enabled.  A value of t
indicates Brief mode is enabled.")

(defvar brief-override-meta-x 't
  "Controls overriding the normal Emacs M-x key binding.
The normal binding for M-x is `execute-extended-command', however
the normal Brief keybinding for M-x is to exit the editor, while
the F10 key is used to execute extended commands.  If you don't
want M-x to dump you out of emacs, set this to nil before loading
the package.")

(defvar brief-load-scroll-lock 't
  "Controls loading of the Scroll Lock minor mode package.
Default behavior is to load the scroll lock minor mode
package when Brief mode is enabled.  Set to nil prior
to loading this package to prevent it.")

(defvar brief-load-hook nil
  "Hooks to run after Brief mode is enabled.")

(defvar brief-mode-running-xemacs 
  (string-match "XEmacs\\|Lucid" emacs-version))

;; Keymap defines

(define-key brief-mode-map [(f1)]           'other-window)
(define-key brief-mode-map [(f2) (down)]    'enlarge-window)
(define-key brief-mode-map [(f2) (left)]    'shrink-window-horizontally)
(define-key brief-mode-map [(f2) (right)]   'enlarge-window-horizontally)
(define-key brief-mode-map [(f2) (up)]      'shrink-window)
(define-key brief-mode-map [(f3) (down)]    'split-window-vertically)
(define-key brief-mode-map [(f3) (right)]   'split-window-horizontally)
(define-key brief-mode-map [(f4)]           'delete-window)
(define-key brief-mode-map [(control f4)]   'delete-other-windows)
(define-key brief-mode-map [(f5)]           'isearch-forward-regexp)
(define-key brief-mode-map [(meta f5)]      'isearch-backward-regexp)
(define-key brief-mode-map [(shift f5)]     'isearch-repeat-forward)
(define-key brief-mode-map [(f6)]           'query-replace)
(define-key brief-mode-map [(f7)]           'brief-start-kbd-macro)
(define-key brief-mode-map [(f8)]           'call-last-kbd-macro)
(define-key brief-mode-map [(f9)]           'find-file)
(define-key brief-mode-map [(meta f9)]	    'load-library)
(define-key brief-mode-map [(f10)]          'execute-extended-command)
(define-key brief-mode-map [(meta f10)]     'compile)
(define-key brief-mode-map [(f14)]          'advertised-undo)

(define-key brief-mode-map [(backspace)] 'backward-delete-char-untabify)
(define-key brief-mode-map [(delete)] 'delete-char)
(define-key brief-mode-map [(kp_delete)] 'delete-char)
(define-key brief-mode-map [(kp-delete)] 'delete-char)
(define-key brief-mode-map [(kp_decimal)] 'delete-char)
(define-key brief-mode-map [(kp-decimal)] 'delete-char)
(define-key brief-mode-map [(shift delete)] 'kill-word)
(define-key brief-mode-map [(shift backspace)] 'backward-kill-word)

(define-key brief-mode-map [(control left)] 'backward-word)
(define-key brief-mode-map [(control right)] 'forward-word)

(define-key brief-mode-map [(control f)] 'forward-sentence)
(define-key brief-mode-map [(control b)] 'backward-sentence)

(define-key brief-mode-map [(meta a)] 'brief-begin-mark)
(define-key brief-mode-map [(meta b)] 'electric-buffer-list)
(define-key brief-mode-map [(meta c)] 'begin-mark-col)
(define-key brief-mode-map [(meta d)] 'brief-delete-complete-line)
(define-key brief-mode-map [(meta e)] 'find-file)
(define-key brief-mode-map [(meta g)] 'goto-line)
(define-key brief-mode-map [(meta h)] 'help)
(define-key brief-mode-map [(meta i)] 'overwrite-mode)
(define-key brief-mode-map [(meta k)] 'brief-delete-eol)
(define-key brief-mode-map [(meta n)] 'bury-buffer)
(define-key brief-mode-map [(meta r)] 'insert-file)
(define-key brief-mode-map [(meta s)] 'isearch-forward)
(define-key brief-mode-map [(meta u)] 'advertised-undo)
(define-key brief-mode-map [(meta w)] 'save-buffer)

(if
 (eq brief-override-meta-x 't)
  (define-key brief-mode-map [(meta x)] 'save-buffers-kill-emacs)
)

(define-key brief-mode-map [(kp_0)] 'yank)
(define-key brief-mode-map [(kp-0)] 'yank)
(define-key brief-mode-map [(kp_insert)] 'yank)
(define-key brief-mode-map [(kp-insert)] 'yank)
(define-key brief-mode-map [insert] 'yank)
(define-key brief-mode-map [(kp_add)] 'brief-copy)
(define-key brief-mode-map [(kp-add)] 'brief-copy)
(define-key brief-mode-map [(kp_multiply)] 'advertised-undo)
(define-key brief-mode-map [(kp-multiply)] 'advertised-undo)
(define-key brief-mode-map [(kp_subtract)] 'brief-cut)
(define-key brief-mode-map [(kp-subtract)] 'brief-cut)
(define-key brief-mode-map [end] 'brief-end)
(define-key brief-mode-map [(kp_end)] 'brief-end)
(define-key brief-mode-map [(kp-end)] 'brief-end)
(define-key brief-mode-map [home] 'brief-home)
(define-key brief-mode-map [(kp_home)] 'brief-home)
(define-key brief-mode-map [(kp-home)] 'brief-home)
(define-key brief-mode-map [hpDeleteLine] 'kill-line)
(define-key brief-mode-map [hpInsertLine] 'open-line)
(define-key brief-mode-map [hpInsertChar] 'insert-mark-register)
(define-key brief-mode-map [hpBackTab] 'tab-to-tab-stop)

;; Implementation

(defun brief-home ()
  "Home the point according to Brief conventions.
First call to this moves point to beginning of the line.  Second
consecutive call moves point to beginning of the screen.  Third
consecutive call moves the point to the beginning of the buffer."
  (interactive nil)
  (cond
    ((and (eq last-command 'brief-home) (eq last-last-command 'brief-home))
     (goto-char (point-min)))
    ((eq last-command 'brief-home)
     (move-to-window-line 0))
    (t
     (beginning-of-line)))
  (setq last-last-command last-command))

(defun brief-end ()
  "End the point according to Brief conventions.
First call to this moves point to end of the line.  Second
consecutive call moves point to the end of the screen.  Third
consecutive call moves point to the end of the buffer."
  (interactive nil)
  (cond
    ((and (eq last-command 'brief-end) (eq last-last-command 'brief-end))
     (goto-char (point-max)))
    ((eq last-command 'brief-end)
     (move-to-window-line -1)
     (end-of-line))
    (t
     (end-of-line)))
  (setq last-last-command last-command))

(defvar brief-mark-mode nil)
(defvar brief-mark-point nil)
(defvar brief-home-cnt 0)
(defvar brief-end-cnt 0)
(defvar brief-last-last-command nil)

(defun brief-begin-mark ()
  ""
  (interactive)
  (setq brief-mark-mode t)
  (setq brief-mark-point (point))
  (push-mark nil nil t)
  (define-key brief-mode-map [(meta a)] 'brief-end-mark)
)

(defun brief-end-mark ()
  ""
  (interactive)
  (if brief-mark-mode 
      (progn 
	(setq brief-mark-mode nil)
	(pop-mark)
	(define-key brief-mode-map [(meta a)] 'brief-begin-mark)
	)
    )
)

(defun brief-copy ()
  ""
  (interactive)
  (if brief-mark-mode
      (progn
	(brief-end-mark)
	(copy-region-as-kill brief-mark-point (point))
	)
    (brief-copy-current-line)
    )
)

(defun brief-cut ()
  ""
  (interactive)
  (if brief-mark-mode
      (progn
	(brief-end-mark)
	(kill-region brief-mark-point (point))
	)
    (progn
      (beginning-of-line)
      (setq old-kill-whole-line kill-whole-line)
      (setq kill-whole-line 1)
      (kill-line)
      (setq kill-whole-line old-kill-whole-line)
      )
    )
)

(defun brief-copy-current-line ()
  (save-excursion
    (push-mark nil nil nil)
    (beginning-of-line) (setq begin (point))
    (forward-line 1)
    (copy-region-as-kill begin (point))
    (pop-mark)
    )
)

(defun brief-start-kbd-macro ()
  ""
  (interactive)
  (define-key brief-mode-map [f7] 'brief-end-kbd-macro)
  (start-kbd-macro nil)
)

(defun brief-end-kbd-macro ()
  ""
  (interactive)
  (define-key brief-mode-map [f7] 'brief-start-kbd-macro)
  (end-kbd-macro nil)
)

(defun brief-mark-line ()
  ""
  (interactive)
  (setq now (point))
  (beginning-of-line)
  (brief-begin-mark)
  (end-of-line)
)

(defun brief-next-buffer ()
  ""
  (interactive)
)

(defun brief-previous-buffer ()
  ""
  (interactive)
)

(defun brief-delete-complete-line ()
  ""
  (interactive)
  (beginning-of-line)
  (setq begin-point (point))
  (forward-line 1)
  (setq end-point (point))
  (kill-region begin-point end-point)
)

(defun brief-next-buffer ()
  ""
  (interactive)
  (bury-buffer (current-buffer))
  (switch-to-buffer (nth 0 (buffer-list)))
  (if (string-match "*" (buffer-name))
      (next-buffer)
    )
)

(defun brief-delete-eol ()
  ""
  (interactive)
  (setq begin-point (point))
  (end-of-line)
  (kill-region begin-point (point))
)

(defun brief-mode ()
  "Toggle Brief emulation minor mode."
  (interactive nil)
  (setq brief-mode-enabled (not brief-mode-enabled))
  (cond
   ((eq brief-mode-enabled 't)
    (global-unset-key [Meta a])
    (global-unset-key [Meta e])
    (use-global-map brief-mode-map)
    (if brief-load-scroll-lock
	(require 'scroll-lock))
    (if (featurep 'scroll-lock)
	(define-key brief-mode-map [(meta f1)] 'scroll-lock-mode))
    (run-hooks 'brief-load-hook))
   ((eq brief-mode-enabled 'nil)
    (use-global-map brief-mode-original-keymap))))

(if brief-mode-running-xemacs
    (add-minor-mode 'brief-mode-enabled brief-mode-modeline-string)
  (or (assq 'brief-mode-enabled minor-mode-alist)
      (setq minor-mode-alist
	    (cons '(brief-mode-enabled brief-mode-modeline-string) minor-mode-alist))))

(provide 'brief)

;;
;; End		brief.el
;;
