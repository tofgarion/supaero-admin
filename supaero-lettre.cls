%% ISAE/SUPAERO document class for official letters and faxes
%% C. Garion, 2009
%%
%% Mostly taken from lettre.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-lettre}[2009/09/29 v0.1 
               LaTeX document class for SUPAERO letter and fax]

% This class extends the lettre class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.sup" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.sup}{}{%
    \PassOptionsToClass{\CurrentOption}{lettre}}}
\ProcessOptions \relax
\LoadClass{lettre}

% default font
\DeclareOldFontCommand{\rm}{\sffamily}{\mathsf}
\renewcommand\familydefault{cmss}

% institut file
\institut{supaero}

\makeatletter
\def\letteropening#1{%
                 \if@origdate
                   \expandafter\ifx\csname origdate\the\c@lettre
                                   \endcsname\relax
                   \else
                      \l@@info{Date originale lue dans \jobname.odt}%
                      \def\pdate{\csname origdate\the\c@lettre\endcsname}%
                   \fi
                   \l@@info{`\pdate' ecrit dans \jobname.odt}%
                   \immediate\write\@dateaux{%
                        \string\expandafter\string\def%
                        \string\csname\space origdate\the\c@lettre
                        \string\endcsname{\pdate}}%
                \fi
   \hbadness=10000\relax
   \thispagestyle{empty}% 
   \setlength{\unitlength}{1mm}%
   \advance\rightskip -75pt%
   \begin{picture}(\pict@let@width,\pict@let@height)%
                  (\pict@let@hoffset,\pict@let@voffset)%
     \put(\rule@hpos,\rule@vpos){\line(1,0){\rule@length}}%
     \put(\fromaddress@let@hpos,\fromaddress@let@vpos){\makebox(0,0)[tl]{%
          \parbox[t]{\fromaddress@let@width}{%
                  \fromaddress\\[3mm]%
                  \ifx\@empty\fromlocation
                  \else \fromlocation \\%
                  \fi 
                  \ifx\@empty\telephonenum
                  \else \tellabelname \telephonenum \\
                  \fi
                  \ifx\@empty\faxnum
                  \else \faxlabelname \faxnum \\
                  \fi
                  \ifx\@empty\emailnum
                  \else \mbox{\emaillabelname\ttfamily\emailnum} \\
                  \fi}}}
     \put(\fromlieu@let@hpos,\fromlieu@let@vpos){\makebox(0,0)[bl]{%
          \parbox[t]{\fromlieu@let@width}{%
                 \ifx\@empty\fromlieu
                 \else\fromlieu, %
                 \fi 
                \ifx\@empty\pdate ~%
                \else \pdate
                \fi}}}%
     \put(\toaddress@let@hpos,\toaddress@let@vpos){\makebox(0,0)[tl]{%
          \parbox{\toaddress@let@width}{%
                 \toname\\\toaddress}}}%
   \end{picture}%
   \par\vskip\csname letter\the\c@lettre\endcsname mm
   \advance\leftskip\lettermargin
   \advance\rightskip75pt%
   \ifx\@empty\auxflag
     \vspace{2\openingspace}%
   \else 
     \vspace{2\openingspace}\auxline\vspace{\openingspace}%
   \fi
   \vskip\csname letter\the\c@lettre\endcsname mm
   \ifx\@empty\concdecl 
     \vspace{\openingspace}%
   \else 
     \concline\vspace{\openingspace}%
   \fi
   \vskip\csname letter\the\c@lettre\endcsname mm
   \hbadness=1000\relax
   {\parindent=\openingindent
   #1}\par\startbreaks\nobreak
   \let\flushleft=\letterflushleft
   \let\raggedright=\letterraggedright
   \let\center=\lettercenter
   \let\centering=\lettercentering}%
%

\def\ps@empty{%
   \headheight 0pt%
   \headsep 9pt%
   \def\@oddhead{}%
   \def\@oddfoot{%
       \ifnum\c@page=1\relax
          \ifx\@empty\emailflag
             \ifx\@empty\bdp
             \else
                \hbadness=10000\relax
                \rlap{\parbox{\textwidth}{\mbox{}\\\bdp}}
                ~\hfill~
                \hbadness=1000\relax
             \fi
          \else
             \hbadness=10000\relax
             \rlap{\parbox{\textwidth}{\mbox{}\\\rule{\textwidth}{.4pt}\\\emailine}}%
             ~\hfill~
             \hbadness=1000\relax
          \fi
       \fi}%
   \def\@evenhead{}%
   \def\@evenfoot{}}%

\def\concline{%
         \noindent\parbox[t]{\letterwidth}%
           {\@hangfrom{\concname}\ignorespaces\concdecl\strut}%
         \par}%


\makeatother
