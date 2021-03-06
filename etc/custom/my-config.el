;;
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages
  '(
    evil-numbers
    windsize
    pager
    session
    command-frequency
    color-theme
    highlight-parentheses
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p))
  )

(color-theme-initialize)
(color-theme-solarized-dark)

(load-library "evil-numbers")
(load-library "windsize")
(load-library "pager")
(load-library "session")
(load-library "command-frequency")
(load-library "highlight-parentheses")
(transparency-set-value 100)


(defun markdown-open ()
  (interactive)
  (shell-command (concat "open -a Marked.app " (buffer-file-name)))
  )

(defun timestamp ()
  (interactive)
  (goto-char (point-max))

  (insert "\n## ")
  (insert-date)
  (insert " ##\n")
  )

(defun start-highlight-parentheses-mode ()
  (highlight-parentheses-mode 1))
(add-hook 'clojure-mode-hook 'start-highlight-parentheses-mode)

(global-unset-key (kbd "\M-3"))
(fset 'insertPound "#")
(define-key global-map "\M-3" 'insertPound)
(local-unset-key (kbd "\M-3"))

;; See [[http://stackoverflow.com/questions/3977069/emacs-question-hash-key]]
(fset                                 'insertPound "#")
(define-key global-map "\M-3"         'insertPound)
(global-set-key (kbd "\M-3") '(lambda () (interactive) (insert "#")))


(define-key global-map "§"            'recentf-open-files)
(global-set-key [f4]                  'shell)
(global-set-key [?\s-!]               'calendar)
(global-set-key "\C-l"                'goto-line)
(global-set-key "\C-x\C-m"            'execute-extended-command)
(global-set-key "\C-\\"               'comment-region)
(global-set-key [(control /)]         'comment-region)
(global-set-key [?\s-.]               'deft)

(global-set-key [?\s--]               'evil-numbers/dec-at-pt)
(global-set-key [?\s-+]               'evil-numbers/inc-at-pt)
(global-set-key [?\s-O]               'recentf-open-files)
(global-set-key [(control §)]               'ibuffer)

(global-set-key [?\s-?]               'display-time-world)
(global-set-key [f12]                 'linum-mode)
(global-set-key [?\s-y]               'browse-kill-ring)

(global-set-key (kbd "s-<left>")      'windsize-left)
(global-set-key (kbd "s-<right>")     'windsize-right)
(global-set-key (kbd "M-s-<down>")    'windsize-down)
(global-set-key (kbd "M-s-<up>")      'windsize-up)

(global-set-key (kbd "s-<down>")      'pager-page-down)
(global-set-key (kbd "s-<up>")        'pager-page-up)

(global-set-key (kbd "s-=")           'split-window-vertically)
(global-unset-key (kbd "C-z"))
