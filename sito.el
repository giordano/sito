;; aggiungi al file di inizializzazione ~/.emacs questo codice
;; 	(load-file "~/Documenti/sito/sito.el")
;; per caricare automaticamente questo file.  In questo modo puoi pubblicare il
;; sito semplicemente con `C-c C-e P' dentro un buffer dei file *.org del
;; progetto.

(require 'org-publish)

;; Con quel poco di elisp che conosco ho definito una funzione che dovrebbe
;; stampare correttamente il postambolo così come voglio io.  La funzione è
;; assegnata come valore di `:html-postamble', più sotto
(defun postambolo () (concat "<hr/>
<p class=\"date\">Data: " date "</p>
<p class=\"author\">Autore: " author "</p>
<p class=\"creator\">Generato da <a href=\"http://orgmode.org/\">Org mode</a> \
versione " org-version " con <a href=\"http://www.gnu.org/software/emacs/\">GNU \
Emacs</a> versione " emacs-version ".  \
Il <a href=\"https://github.com/giordano/sito\">codice sorgente</a> del sito \
è disponibile su Github</p>
<p class=\"xhtml-validation\">" html-validation-link "</p>\n"))

(setq org-publish-project-alist
      '(
	("sito-content"
	 :base-directory "~/Documenti/sito"
	 :base-extension "org"
	 :publishing-directory "/ssh:infn:html/"
	 :publishing-function org-publish-org-to-html
	 :author "Mosè Giordano"
	 :language "it"
	 :link-home "index.html"
	 :html-postamble postambolo
	 )
	("sito" :components ("sito-content"))))
