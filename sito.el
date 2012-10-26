;; aggiungi al file di inizializzazione ~/.emacs questo codice
;; 	(load-file "~/Documenti/sito/sito")
;; per caricare automaticamente questo file.  In questo modo puoi pubblicare il
;; sito semplicemente con `C-c C-e P' dentro un buffer dei file *.org del
;; progetto.

;; Con quel poco di elisp che conosco ho definito una funzione che dovrebbe
;; stampare correttamente il postambolo così come voglio io.  La funzione è
;; assegnata come valore di `:html-postamble', più sotto
(defun postambolo-sito () (concat "<hr/>
<p class=\"author\">Autore: " author "</p>
<p class=\"date\">Ultima modifica: " date "</p>
<p class=\"creator\">Generato da <a href=\"http://orgmode.org/\">Org mode</a> \
versione " org-version " con <a href=\"http://www.gnu.org/software/emacs/\">GNU \
Emacs</a> versione " emacs-version ".  \
Il <a href=\"https://github.com/giordano/sito\">codice sorgente</a> del sito \
è disponibile su Github</p>
<p class=\"xhtml-validation\">" html-validation-link "</p>
<p class=\"license\"><a rel=\"license\" \
href=\"http://creativecommons.org/licenses/by/3.0/it/\">\
<img alt=\"Licenza Creative Commons\" style=\"border-width:0\" \
src=\"http://i.creativecommons.org/l/by/3.0/it/80x15.png\" /></a> I contenuti \
originali presenti su questo sito sono rilasciati sotto <a rel=\"license\" \
href=\"http://creativecommons.org/licenses/by/3.0/it/\">licenza Creative \
Commons Attribuzione 3.0 Italia</a>, se non \
diversamente specificato</p>\n"))

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
	 :html-postamble postambolo-sito)
	("sito" :components ("sito-content"))))
