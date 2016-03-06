;; aggiungi al file di inizializzazione ~/.emacs questo codice
;; 	(load-file "~/repo/sito/sito")
;; per caricare automaticamente questo file.  In questo modo puoi pubblicare il
;; sito semplicemente con `C-c C-e P' dentro un buffer dei file *.org del
;; progetto.

;; Con quel poco di elisp che conosco ho definito una funzione che dovrebbe
;; stampare correttamente il postambolo così come voglio io.  La funzione è
;; assegnata come valore di `:html-postamble', più sotto.  Per ottenere l'autore
;; e la data mi sono basato sulla funzione `org-html-format-spec'.
(defun postambolo-sito (info)
  (concat "\
<div style=\"font-size: smaller; background: #f2f2f9; border: 2px solid #3366cc;
            border-style: solid; border-width: thin; padding: 4px;\">
<p class=\"author\">Autore: " (org-export-data (plist-get info :author) info)
"</p>
<p class=\"date\">Ultima modifica: "
(let ((file (plist-get info :input-file)))
  (format-time-string org-html-metadata-timestamp-format
		      (if file (nth 5 (file-attributes file))
			(current-time)))) "</p>
<p class=\"creator\">Generato da <a href=\"http://orgmode.org/\">Org mode</a> \
versione " org-version " con <a href=\"http://www.gnu.org/software/emacs/\">GNU \
Emacs</a> versione " emacs-version ".  \
Il <a href=\"https://github.com/giordano/sito\">codice sorgente</a> del sito \
è disponibile su Github</p>
<p class=\"license\"><a rel=\"license\" \
href=\"http://creativecommons.org/licenses/by/3.0/it/\">\
<img alt=\"Licenza Creative Commons\" style=\"border-width:0\" \
src=\"http://i.creativecommons.org/l/by/3.0/it/80x15.png\" /></a> I contenuti \
originali presenti su questo sito sono rilasciati sotto <a rel=\"license\" \
href=\"http://creativecommons.org/licenses/by/3.0/it/\">licenza Creative \
Commons Attribuzione 3.0 Italia</a>, se non \
diversamente specificato</p>
<p class=\"xhtml-validation\">
<a href=\"http://validator.w3.org/check?uri=referer\">Validazione XHTML 1.0</a>
</p></div>\n"))

(setq org-publish-project-alist
      '(
	("sito-content"
	 :base-directory "~/repo/sito"
	 :base-extension "org"
	 :publishing-directory "/ssh:infn:html/"
	 :publishing-function org-html-publish-to-html
	 :author "Mosè Giordano"
	 :language "it"
	 :html-link-home "index.html"
	 :with-smart-quotes nil)
	("sito" :components ("sito-content")))
      org-html-postamble 'postambolo-sito)
