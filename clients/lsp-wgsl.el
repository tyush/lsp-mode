;;; lsp-wgsl.el --- wgsl-analyzer client -*- lexical-binding: t; -*-

;; Copyright (C) 2023 emacs-lsp maintainers

;; Author: Yash Kumar <tyushk@gmail.com>
;; Keywords: languages lsp wgsl shader

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; LSP client for wgsl-analyzer.
;;

;;; Code:
(require 'lsp-mode)

(defgroup lsp-wgsl nil
  "LSP support for WGSL."
  :group 'lsp-mode
  :link '(url-link "https://github.com/wgsl-analyzer/wgsl-analyzer"))

(defcustom lsp-wgsl-analyzer-executable '("wgsl_analyzer")
  "Command to run the WGSL-Analyzer language server."
  :group 'lsp-wgsl
  :risky t
  :type 'list)

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection lsp-wgsl-analyzer-executable)
  :activation-fn (lsp-activate-on "wgsl")
  :priority -1
  :server-id 'wgsl-analyzer))

(provide 'lsp-wgsl)
;;; lsp-wgsl.el ends here
