(require 'tramp)
(add-to-list 'backup-directory-alist
	     (cons tramp-file-name-regexp nil))
(setq password-cache-expiry nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq scroll-step 1 scroll-conservatively  10000)
(set-face-bold-p 'font-lock-keyword-face t)
;;===== PyFlakes
;; code checking via pyflakes+flymake

(when (load "flymake" t)
   (defun flymake-pyflakes-init ()
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
			  'flymake-create-temp-inplace))
	      (local-file (file-relative-name
			    temp-file
			     (file-name-directory buffer-file-name))))
	 (list "pyflakes" (list local-file))))

    (add-to-list 'flymake-allowed-file-name-masks
		  '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

 ;; enhancements for displaying flymake errors
(add-to-list 'load-path "~/.emacs.d")
(require 'flymake-cursor)
(delete '("\\.xml?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

;;buffer renaming
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
	 (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
						     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
		     (expand-file-name (file-name-nondirectory
					(buffer-file-name))
				       new-name)
		   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
	(save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
    (message "Renamed to %s." new-name)))







;;pdb setup, note the python version
(setq pdb-path '/usr/lib64/python2.7/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
			    (file-name-nondirectory buffer-file-name)))))









;;django modifications
(add-to-list 'load-path "~/.emacs.d/pony-mode/src")
(require 'pony-mode)

;tags highlighting
(add-to-list 'load-path "~/.emacs.d/hl-tags")
(require 'hl-tags-mode)
(add-hook 'sgml-mode-hook (lambda () (hl-tags-mode 1)))
(add-hook 'nxml-mode-hook (lambda () (hl-tags-mode 1)))


;;javascript mode stuff---------------------------------
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/emacs.d/auto-complete-1.3.1/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

(add-to-list 'load-path	     "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets/text-mode")
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)

;;syntax checking
;;(add-to-list 'load-path "~/.emacs.d/lintnode")
;;(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
;;(setq lintnode-location "~/.emacs.d/lintnode")
;; JSLint can be... opinionated
;;(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we first open a js file and start checking
;;(add-hook 'js-mode-hook
;;	            (lambda ()
;;		                  (lintnode-hook)))
;;javascript stuff --------------------------
;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
(add-to-list 'load-path "/home/kwadwo/.rvm/rubies/ruby-1.9.3-p286/share/emacs/site-lisp")
(require 'el4r)
(el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.
