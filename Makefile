TEXHASH = texhash
PDFLATEX = pdflatex
BIBTEX = bibtex
LOCAL_TEXMF := $(shell kpsewhich -var-value=TEXMFHOME)

install:	init
	@echo "call texhash."
	@echo "*** WARNING ***"
	@echo "It is normal not to have write permission to some directories"
	$(TEXHASH)

init: 	$(LOCAL_TEXMF)/tex/latex/supaero-admin $(LOCAL_TEXMF)/doc/latex/supaero-admin
	@echo "copying files"
	cp supaero-note.cls supaero-mins.cls supaero-lettre.cls supaero-ria.cls  \
	   supaero-note-cf.cls supaero-orga.cls \
	   supaero.ins \
	   VL_SUPAERO_72_cmjn.png isae.png footletter.jpg false-sig-tof.png \
	   $(LOCAL_TEXMF)/tex/latex/supaero-admin
	cp exempleCR.tex cr.sup exempleLettre.tex exempleNote.tex supaero.bib \
	   exempleRIA.tex exempleRIA-biblatex.tex exempleNoteCF.tex exempleOrganisationCongres.tex \
	   $(LOCAL_TEXMF)/doc/latex/supaero-admin

$(LOCAL_TEXMF)/tex/latex/supaero-admin:	
	@echo "creating $(LOCAL_TEXMF)/tex/latex/supaero-admin"
	mkdir -p $(LOCAL_TEXMF)/tex/latex/supaero-admin

$(LOCAL_TEXMF)/doc/latex/supaero-admin:	
	@echo "creating $(LOCAL_TEXMF)/doc/latex/supaero-admin"
	mkdir -p $(LOCAL_TEXMF)/doc/latex/supaero-admin

examples:	install exempleCR.pdf exempleNote.pdf \
		exempleLettre.pdf exempleRIA.pdf exempleRIA-biblatex.pdf\
		exempleNoteCF.pdf exempleOrganisationCongres.pdf

exempleRIA.pdf:	exempleRIA.tex
		@echo "compiling example for RIA..."
		cd $(LOCAL_TEXMF)/doc/latex/supaero-admin/ ; \
		$(PDFLATEX) $< ; \
		$(BIBTEX) $(basename $<)1 ; \
		$(BIBTEX) $(basename $<)2 ; \
		$(PDFLATEX) $< ; \
		$(PDFLATEX) $<

%.pdf:	%.tex
	@echo "compiling examples..."
	cd $(LOCAL_TEXMF)/doc/latex/supaero-admin/ ; \
	$(PDFLATEX) $< ; \
	$(BIBTEX) $(basename $<) ; \
	$(PDFLATEX) $< ; \
	$(PDFLATEX) $<

clean:
	@echo "cleaning all the files"
	rm -Rf $(LOCAL_TEXMF)/doc/latex/supaero-admin/*.pdf
