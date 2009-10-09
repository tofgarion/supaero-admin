TEXHASH = texhash
PDFLATEX = pdflatex
BIBTEX = bibtex
LOCAL_TEXMF = texmf

install:	init
	@echo "call texhash."
	@echo "*** WARNING ***"
	@echo "It is normal not to have write permission to some directories"
	$(TEXHASH)

init: 	$(HOME)/$(LOCAL_TEXMF)/tex/latex/supaero-admin $(HOME)/$(LOCAL_TEXMF)/doc/latex/supaero-admin
	@echo "copying files"
	cp supaero-note.cls supaero-mins.cls supaero-lettre.cls \
	   supaero.ins VL_SUPAERO_72_cmjn.png $(HOME)/$(LOCAL_TEXMF)/tex/latex/supaero-admin
	cp exempleCR.tex cr.sup exempleLettre.tex exempleNote.tex supaero.bib \
	   $(HOME)/$(LOCAL_TEXMF)/doc/latex/supaero-admin

$(HOME)/$(LOCAL_TEXMF)/tex/latex/supaero-admin:	
	@echo "creating ~/$(LOCAL_TEXMF)/tex/latex/supaero-admin"
	mkdir -p $(HOME)/$(LOCAL_TEXMF)/tex/latex/supaero-admin

$(HOME)/$(LOCAL_TEXMF)/doc/latex/supaero-admin:	
	@echo "creating ~/$(LOCAL_TEXMF)/doc/latex/supaero-admin"
	mkdir -p $(HOME)/$(LOCAL_TEXMF)/doc/latex/supaero-admin

examples:	install exempleCR.pdf exempleNote.pdf exempleLettre.pdf

%.pdf:	%.tex
	@echo "compiling example..."
	cd $(HOME)/$(LOCAL_TEXMF)/doc/latex/supaero-admin/ ; \
	$(PDFLATEX) $< ; \
	$(BIBTEX) $(basename $<) ; \
	$(PDFLATEX) $< ; \
	$(PDFLATEX) $<

clean:
	@echo "cleaning all the files"
	rm -Rf $(HOME)/$(LOCAL_TEXMF)/doc/latex/supaero-admin/*.pdf