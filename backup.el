;;; backup.el --- Organize all backup files into single directory

;; Copyright (C) 1995 Jonathan R. Birge.

;; Author: Jonathan R. Birge <birge@engin.swarthmore.edu>
;; Created: Fri Jul 21 18:23:48 1995
;; Version: $Id: backup.el,v 1.1 2003/10/11 16:28:50 polster Exp $
;; Keywords: backup 

;; Backup.el is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 2, or (at your
;; option) any later version.
;;
;; Backup.el is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; By default, Emacs will store a backup file in the same directory as
;; the parent file. This package allows you to specify an alternate
;; directory into which *all* backup files will be placed. To avoid
;; naming conflicts, and to facilitate automated recovery, the parent
;; file's full path name is included in the name of each backup file.
;;
;; Make sure that the directory you want to use is already created
;; before calling the ``backup-directory'' function.
;;
;; Installation:
;;
;; Add the following lines to your .emacs file:
;; (require 'backup)
;; (backup-set-directory "~/mybackupdir")
;;
;; Reporting Bugs:
;;
;; Send all bug reports and patches to the author's address
;; above. Comments of any kind are also welcome. This is the first
;; emacs lisp I've ever written, so be gentle.

;;; Code:

(defconst backup-version "$Id: backup.el,v 1.1 2003/10/11 16:28:50 polster Exp $")

(defvar backup-directory nil
  "If non-nil, denotes the directory into which all backup files are saved.
You should never change this variable by hand; use backup-set-directory
instead.")

(defvar backup-name-suffix "~"
  "*String which is appended to the name of all backup files.
If backup-directory is non-nil, this string may be empty.")

(defun my-match-string (n string)
  (and (match-beginning n)
       (substring string (match-beginning n) (match-end n))))       

(defun backup-set-directory (pathname)
  "Specify the directory into which all backup files will be saved.
If PATHNAME is blank or invalid, then backup files will be saved into
the same directory as their parent files."
  (interactive
   (list (read-directory-name "Set backup directory to: "
			      backup-directory backup-directory t)))
  (setq pathname (expand-file-name pathname))
  ;; make sure that pathname ends with a '/'
  (cond ((not (char-equal (aref pathname (- (length pathname) 1)) ?/))
	 (setq pathname (concat pathname "/"))))
  ;; check validity of directory
  (if (and (file-exists-p pathname)
	   (eq (car (file-attributes pathname)) t))
      (setq backup-directory pathname)
    (setq backup-directory nil)))

;; These next two functions take a single file name (not a path). They
;; may be changed independently of the other functions, but must
;; remain coherent with each other.
;;
(defun make-backup-file-name (filename)
  (concat filename backup-name-suffix))

(defun backup-file-name-p (filename)
  (string-match (concat backup-name-suffix "$") filename))

(defun find-backup-file-name (filename)
  (setq filename (expand-file-name filename))
  ;; extract file name and path
  (string-match "\\(.*/\\)?\\([^/]*$\\)" filename)
  (let ((backup-path
	 (my-match-string 1 filename))
	(backup-file-name
	 (make-backup-file-name (my-match-string 2 filename))))
    (list 
     (if backup-directory
	 ;; change all '/'s in local path to '#'s and all '#'s to '_'s
	 ;; in filename before appending to backup-directory variable.
	 (progn
	   (while (string-match "\\(#\\)" backup-file-name)
	     (aset backup-file-name (match-beginning 1) ?_))
	   (while (string-match "\\(/\\)" backup-path)
	     (aset backup-path (match-beginning 1) ?#))
	   (concat backup-directory backup-path backup-file-name))
       ;; else default to old behavior of saving in local directory.
       (concat backup-path backup-file-name)))))

(defun file-newest-backup (filename)
  (if (file-exists-p (find-backup-file-name filename))
      (find-backup-file-name filename)
    nil))

(provide 'backup)

;;; backup.el ends here
