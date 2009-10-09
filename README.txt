1. Description

These three classes have been made to permit SUPAERO professors to use
LaTeX as a text processing system for producing notes, minutes and
letters.

The classes are:

 - supaero-letter for letters and faxes
 - supaero-mins for meeting minutes
 - supaero-note for notes

2. Usage

In order to use the classes, the following files must be accessible by
LaTeX:

 - the three .cls files
 - VL_SUPAERO_72_cmjn.png
 - supaero.ins

A first test is to compile the examples (exempleCR.tex,
exempleLettre.tex, exempleNote.tex) using pdflatex from this
directory. Everything must compile.

3. Installation

You can let the cls files into a local directory DIR and define the
environment variable TEXINPUTS to include DIR.

Normally, every LaTeX file must be installed into a TDS compliant
location. You can install it into your local texmf directory using the
Makefile available in the archive. Notice that the paths are defined
for Linux/UNIX, you can change them for Windows (\ instead of / etc.)
and Mac OS X (~/Library/texmf instead of ~/texmf).

Use "make install" to install files and "make examples" to compile
examples. The PDF files will be in ~/texmf/doc/latex/supaero-admin.
