%% ISAE/SUPAERO document class for official notes
%% C. Garion, 2009, 2010, 2011
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-note}[2010/09/22 v0.2 
               LaTeX document class for SUPAERO note]

% defs etc.
\def\@language{english}
\def\@requirefrench{}
\DeclareOption{fr}{\def\@language{french}\def\@requirefrench{true}}
\DeclareOption{en}{\def\@language{english}}
\DeclareOption{fr-en}{\def\@language{english,french}\def\@requirefrench{true}}
\DeclareOption{en-fr}{\def\@language{french,english}}
\def\@requirebiblatex{}
\DeclareOption{biblatex}{\def\@requirebiblatex{true}}
\def\@requirevisa{}
\DeclareOption{visa}{\def\@requirevisa{true}}

\global\let\numero@internal\@empty
\newcommand{\numero}[1]{\def\numero@internal{#1}}
\global\let\objet@internal\@empty
\newcommand{\objet}[1]{\def\objet@internal{#1}}
\global\let\destinataires@internal\@empty
\newcommand{\destinataires}[1]{\def\destinataires@internal{#1}}
\global\let\motscles@internal\@empty
\newcommand{\motscles}[1]{\def\motscles@internal{#1}}
\global\let\revisions@internal\@empty
\newcommand{\revisions}[1]{\def\revisions@internal{#1}}

\def\textrhead@internal{
  DFS: C. B\'erard
}
\newcommand{\textrhead}[1]{\def\textrhead@internal{#1}}

\def\textlhead@internal{
Direction de la Formation SUPAERO
}
\newcommand{\textlhead}[1]{\def\textlhead@internal{#1}}

\def\textchead@internal{
  Institut Sup\'erieur de l'A\'eronautique et de l'Espace
}
\newcommand{\textchead}[1]{\def\textchead@internal{#1}}

\def\textlhead@other@internal{ISAE/DFS}
\newcommand{\textlheadother}[1]{\renewcommand{\textlhead@other@internal}{#1}}

\def\textrhead@other@internal{\shorttitle , \@author}
\newcommand{\textrheadother}[1]{\renewcommand{\textrhead@other@internal}{#1}}

\global\let\@function\@empty
\newcommand{\setfunction}[1]{\def\@function{#1}}
\let\function\setfunction %
\newcommand{\show@function}{\@function}

% only for visa
\global\let\@authorsig\@empty
\newcommand{\setauthorsig}[1]{\def\@authorsig{#1}}
\let\authorsig\setauthorsig %
\newcommand{\show@authorsig}{\@authorsig}

\global\let\@visaname\@empty
\newcommand{\setvisaname}[1]{\def\@visaname{#1}}
\let\visaname\setvisaname %
\newcommand{\show@visaname}{\@visaname}

\global\let\@visafunction\@empty
\newcommand{\setvisafunction}[1]{\def\@visafunction{#1}}
\let\visafunction\setvisafunction %
\newcommand{\show@visafunction}{\@visafunction}

\global\let\@paperorig\@empty
\newcommand{\setpaperorig}[1]{\def\@paperorig{#1}}
\let\paperorig\setpaperorig %
\newcommand{\show@paperorig}{\@paperorig}

\global\let\@filesrc\@empty
\newcommand{\setfilesrc}[1]{\def\@filesrc{#1}}
\let\filesrc\setfilesrc %
\newcommand{\show@filesrc}{\@filesrc}

\global\let\@filename\@empty
\newcommand{\setfilename}[1]{\def\@filename{#1}}
\let\filename\setfilename %
\newcommand{\show@filename}{\@filename}

% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.sup" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.sup}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}
\ExecuteOptions{a4paper,11pt}
\ProcessOptions \relax
\RequirePackage{atbegshi}
\LoadClass{article}

% page layout
\RequirePackage[hscale=0.85, vscale=0.92,
                top=20pt, includeheadfoot]{geometry}

% fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}

% babel for languages. Beamer uses translator package for theorem
% etc. names.
\RequirePackage[\@language]{babel}
\ifx\@requirefrench\@empty
  \RequirePackage{xspace}
\else
  \RequirePackage{ae,aecompl,aeguill}
  \frenchbsetup{ItemLabels=\textendash}
\fi

% microtype for spacing
\RequirePackage[babel=true,kerning=true]{microtype}
\SetExtraKerning%
    [ name = ttkerning,%
      context  = french]%
    { encoding = {OT1,T1}, family={ul9,fvm,tt*} }%
    { }%

% insert logos
\RequirePackage[pdftex]{graphicx}

% bibliography with biblatex
\ifx\@requirebiblatex\@empty
  \relax
\else
\RequirePackage[babel]{csquotes}
\RequirePackage[
  style=numeric%
  ]{biblatex}
\fi

% title page
\RequirePackage{amssymb}

\renewenvironment{titlepage}
{%
  \@restonecolfalse\newpage
  \setcounter{page}\@ne
}%

\renewcommand\title{\@dblarg\mytitlecmd}
\long\def\mytitlecmd[#1]#2{%
  \def\mytitle{#2}%
  \def\shorttitle{#1}%
}

\renewcommand\maketitle{
  \begin{titlepage}

  \null
  \vskip 10\p@

  \begin{center}%
    {\huge \mytitle \par}%
  \end{center}

  \vskip 30\p@

  \hbox{\rlap{\parbox{\textwidth}{\raggedright\includegraphics[width=0.2\textwidth]
                                                              {VL_SUPAERO_72_cmjn.png}}}
        \hskip 15\p@ \parbox{\textwidth}{\centering \LARGE Direction de la Formation SUPAERO (DFS)}}

  \vskip 40\p@

  \begin{minipage}[t]{0.4\linewidth}
    \large
    {\textbf{\underline{Sommaire:}}}

    \@starttoc{toc}
  \end{minipage}\hfill\vrule\hfill
  \begin{minipage}[t]{0.5\linewidth}
    \large
    {\textbf{\underline{Num\'ero:}}} \numero@internal

    \vskip 20\p@

    {\textbf{\underline{Objet:}}}
    
    \vskip 5\p@

    \objet@internal

    \vskip 20\p@

    {\textbf{\underline{Destinataires:}}}
    
    \vskip 5\p@

    \destinataires@internal

    \vskip 20\p@

    {\textbf{\underline{Mots-cl\'es:}}}
    
    \vskip 5\p@

    \motscles@internal
  \end{minipage}
  
  \vskip 40\p@

  \begin{tabular*}{0.9\textwidth}{| p{0.1\textwidth} |
      p{0.1\textwidth} | p{0.1\textwidth} |
      p{0.515\textwidth}@{\extracolsep\fill} |}
    \hline
    \textbf{Indice} & \textbf{Date} & \textbf{Statut} &
    \textbf{\'Evolutions}\\
    \hline
    \revisions@internal
  \end{tabular*}

  \vskip 40\p@

  \ifx\@requirevisa\@empty
  {\Large \textbf{R\'edacteur:} \@author{}
    \ifx\@function\@empty\relax\else (\show@function)\fi}
  \else
  \begin{center}
    {\large
    \begin{tabular}[h]{l l l p{0.6\textwidth}}
      Original papier & Oui \ifx\@paperorig\@empty$\Box$\else$\boxtimes$\fi & Non
      \ifx\@paperorig\@empty$\boxtimes$\else$\Box$\fi\\
      Source informatique & Oui \ifx\@filesrc\@empty$\Box$\else$\boxtimes$\fi &
      Non \ifx\@filesrc\@empty$\boxtimes$\else$\Box$\fi & Nom fichier: \show@filename
    \end{tabular}

    \vskip 20\p@

    \begin{tabular}[h]{| l | p{0.4\textwidth} | p{0.4\textwidth} |}
      \cline{2-3}
      \multicolumn{1}{c}{} & \multicolumn{1}{| c |}{R\'edacteur} &
      \multicolumn{1}{ c |}{Visa Approbateur}\\
      \hline
      Nom & \@author & \show@visaname\\
      Sigle & \show@function & \show@visafunction\\
      Date & \@date & \\
      & & \\
      & & \\
      & \show@authorsig & \\
      & & \\
      & & \\
      \hline
    \end{tabular}
    }
  \end{center}
  \fi
  \newpage
  \end{titlepage}
}

% header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{firstpage}{%
  \fancyhf{}
  \lhead{\raggedright\parbox[b]{0.2\headwidth}{\centering\textlhead@internal}}
  \chead{\parbox[b]{0.3\headwidth}{\centering\textchead@internal}}
  \rhead{\parbox[b]{0.3\headwidth}{\raggedleft\textrhead@internal}}

  \lfoot{\footnotesize Ce document est la propri\'et\'e de l'ISAE.\\
    Les informations qu'il contient ne peuvent \^etre utilis\'ees, reproduites
    ou communiqu\'ees sans son accord pr\'ealable \'ecrit.}
  \rfoot{\thepage/\pageref{LastPage}}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.4pt}
}
\fancypagestyle{followingpage}{%
  \fancyhf{}
  \lhead{\raggedright\parbox[b]{0.2\headwidth}{\raggedright\textlhead@other@internal}}
  \rhead{\parbox[b]{0.7\headwidth}{\raggedleft\textrhead@other@internal}}
  \lfoot{\footnotesize Ce document est la propri\'et\'e de l'ISAE.\\
    Les informations qu'il contient ne peuvent \^etre utilis\'ees, reproduites
    ou communiqu\'ees sans son accord pr\'ealable \'ecrit.}
  \rfoot{\thepage/\pageref{LastPage}}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.4pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

% default font
\renewcommand\familydefault{cmss}
\RequirePackage[cm]{sfmath}