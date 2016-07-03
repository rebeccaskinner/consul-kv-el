;;; consul-kv.el --- Interact with Consul Key/Value Store

;; Copyright © 2016  Rebecca Skinner

;; Author: Rebecca Skinner <rebecca@rebeccaskinner.net>
;; URL: http://www.github.com/rebeccaskinner/consul-kv-el
;; Package-Version: 20160701.01
;; Version: 0.0.1

;; This file is not part of GNU Emacs.

;;; Commentary:

;; consul-kv.el is a library for interacting with Consul KV.  It uses grapnel to
;; make HTTP requests and provides a number of utility functions for
;; interacting;; with a consul key/value store.

;; An example:
;; (consul-kv-get-keys
;;  "consul.service.example.com")

;;; Code:

(require 'grapnel)

(defun format-endpoint(endpoint)
  (format "http://%s:8500/v1/kv")
  )

(defun keys-uri (endpoint)
  (format "%s/?keys" (format-endpoint endpoint))
  )

(defun get-keys(endpoint)
  (grapnel-retrieve-uri (keys-uri endpoint))
  )

;;; consul-kv.el ends here
