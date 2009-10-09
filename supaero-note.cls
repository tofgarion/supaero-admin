%% ISAE/SUPAERO document class for official notes
%% C. Garion, 2009
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-note}[2009/09/29 v0.1 
               LaTeX document class for SUPAERO note]

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
  DFS~: M. Samuelides
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

\def\textrhead@other@internal{\@title , \@author}
\newcommand{\textrheadother}[1]{\renewcommand{\textrhead@other@internal}{#1}}

% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.sup" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.sup}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}
\ExecuteOptions{a4paper,11pt}
\ProcessOptions \relax
\LoadClass{article}

% page layout
\RequirePackage[hscale=0.85, vscale=0.92,
                top=20pt, includeheadfoot]{geometry}

% title page
\RequirePackage[pdftex]{graphicx}

\renewenvironment{titlepage}
{%
  \@restonecolfalse\newpage
  \setcounter{page}\@ne
}%

\renewcommand\maketitle{
  \begin{titlepage}

  \null
  \vskip 10\p@

  \begin{center}%
    {\huge \@title \par}%
  \end{center}

  \vskip 30\p@

  \hbox{\rlap{\parbox{\textwidth}{\raggedright\includegraphics[width=0.2\textwidth]
                                                              {VL_SUPAERO_72_cmjn.png}}}
        \hskip 15\p@ \parbox{\textwidth}{\centering \LARGE Direction de la Formation SUPAERO (DFS)}}

  \vskip 40\p@

  \begin{minipage}[t]{0.4\linewidth}
    \large
    {\textbf{\underline{Sommaire~:}}}

    \@starttoc{toc}
  \end{minipage}\hfill\vrule\hfill
  \begin{minipage}[t]{0.5\linewidth}
    \large
    {\textbf{\underline{Num\'ero~:}}} \numero@internal

    \vskip 20\p@

    {\textbf{\underline{Objet~:}}}
    
    \vskip 5\p@

    \objet@internal

    \vskip 20\p@

    {\textbf{\underline{Destinataires~:}}}
    
    \vskip 5\p@

    \destinataires@internal

    \vskip 20\p@

    {\textbf{\underline{Mots-cl\'es~:}}}
    
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
  {\Large \textbf{R\'edacteur~:} \@author}

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