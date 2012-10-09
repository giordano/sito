;; aggiungi al file di inizializzazione ~/.emacs questo codice
;; 	(load-file "~/Documenti/sito/sito.el")
;; per caricare automaticamente questo file.  In questo modo puoi pubblicare il
;; sito semplicemente con `C-c C-e P' dentro un buffer dei file *.org del
;; progetto.

(require 'org-publish)
(setq org-publish-project-alist
      '(
	("sito-content"
	 :base-directory "~/Documenti/sito"
	 :base-extension "org"
	 :publishing-directory "/ssh:infn:html/"
	 :publishing-function org-publish-org-to-html
	 :author "Mosè Giordano"
	 :language "it"
	 )
	("sito" :components ("sito-content"))))
