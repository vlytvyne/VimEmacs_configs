(global-font-lock-mode 't)
(require 'ansi-color)
(defun colorize-compilation-buffer ()
       (toggle-read-only)
       (ansi-color-apply-on-region (point-min) (point-max))
       (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(show-paren-mode 1)
(defun my-c-mode-hook ()
(c-set-offset 'substatement-open '0)
(c-set-offset 'inline-open '+)
(c-set-offset 'block-open '+)
(c-set-offset 'brace-list-open '+)
(c-set-offset 'case-label '+))
(setq-default	tab-width 4
				c-backspace-function 'backward-delete-char
				indent-tabs-mode t
				;font-lock-global-modes nil
				c-default-style "linux"
				c-basic-offset 4
				show-trailing-whitespace t
				tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
								64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
(setq	c-basic-offset 4
		show-trailing-whitespace t
		column-number-mode t
		line-number-mode t)
(electric-pair-mode 1)
(defun ffr-insert-parentheses ()
       (interactive)
       (insert "()")
       (backward-char 1))

(defun ffr-insert-braces ()
(interactive)
(insert "{}")
(backward-char 1))

(add-hook 'c-mode-common-hook (lambda () (local-set-key "(" 'ffr-insert-parentheses)))
(add-hook 'c-mode-common-hook (lambda () (local-set-key "{" 'ffr-insert-braces)))
(global-set-key (kbd "DEL") 'backward-delete-char)
(set-language-environment "UTF-8")
(add-hook 'c-mode-hook '(lambda () (highlight-regexp "  \+" 'hi-blue)))



(setq user_login (if (getenv "USER")
				(getenv "USER")
				"student"))

(setq user_mail (if (getenv "MAIL")
			   (getenv "MAIL")
			 (concat (getenv "USER") "@student.unit.ua" )))

(setq user_mail (concat "<" user_mail ">"))

(while (< (length user_login) 9) (setq user_login (concat user_login " ")))
(while (< (length user_mail) 26) (setq user_mail (concat user_mail " ")))

(setq user_filename (if (buffer-name)
						(buffer-name)
					  nil))

(while (< (length user_filename) 41) (setq user_filename (concat user_filename " ")))

(setq user_header
	  (concat
	   "/* ************************************************************************** */\n"
	   "/*                                                                            */\n"
	   "/*                                                        :::      ::::::::   */\n"
	   "/*   " user_filename                         "          :+:      :+:    :+:   */\n"
	   "/*                                                    +:+ +:+         +:+     */\n"
	   "/*   By: " user_login " " user_mail         "       +#+  +:+       +#+        */\n"
	   "/*                                                +#+#+#+#+#+   +#+           */\n"
	   "/*   Created: " (format-time-string "%Y/%m/%d %T") " by "user_login"         #+#    #+#             */\n"
	   "/*   Updated: " (format-time-string "%Y/%m/%d %T") " by "user_login"        ###   ########.fr       */\n"
	   "/*                                                                            */\n"
	   "/* ************************************************************************** */\n"))

(defun user_header_aff ()
  (interactive)
  (insert user_header))

(global-set-key (kbd "C-c h") 'user_header_aff)
