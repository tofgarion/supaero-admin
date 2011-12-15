%% ISAE/SUPAERO document class for event org.
%% C. Garion, 2011
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-note}[2011/12/14 v0.1 
               LaTeX document class for ISAE event organization]

\global\let\lieu@internal\@empty
\newcommand{\lieu}[1]{\def\lieu@internal{#1}}
\global\let\pbscientifique@internal\@empty
\newcommand{\pbscientifique}[1]{\def\pbscientifique@internal{#1}}
\global\let\nbpart@internal\@empty
\newcommand{\nbpart}[1]{\def\nbpart@internal{#1}}
\global\let\moyens@internal\@empty
\newcommand{\moyens}[1]{\def\moyens@internal{#1}}

\def\textlhead@other@internal{ISAE}
\newcommand{\textlheadother}[1]{\renewcommand{\textlhead@other@internal}{#1}}

\def\textrhead@other@internal{\shorttitle , \@author}
\newcommand{\textrheadother}[1]{\renewcommand{\textrhead@other@internal}{#1}}

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

% babel for languages
\RequirePackage{babel}

% microtype for spacing
\RequirePackage[babel=true,kerning=true]{microtype} 

% insert logos
\RequirePackage[pdftex]{graphicx}

% TikZ
\RequirePackage{tikz}

% title page
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
  \vskip 20\p@

  \begin{center}%
    {\bf \huge \mytitle \par}%
  \end{center}

  \vskip 10\p@

  \hbox{\parbox{\textwidth}{\centering\huge \@author}}

  \vskip 50\p@


  \noindent\rule{\linewidth}{2pt}
  
  \vskip 10\p@

  {
  \large
  \begin{minipage}[t]{0.35\linewidth}
    {\textbf{Date:}}
  \end{minipage}
  \begin{minipage}[t]{0.6\linewidth}
    \@date
  \end{minipage}
  
  \vskip 10\p@
  
  \begin{minipage}[t]{0.35\linewidth}
    {\textbf{Lieu:}}
  \end{minipage}
  \begin{minipage}[t]{0.6\linewidth}
    \lieu@internal
  \end{minipage}

  \vskip 10\p@

  \begin{minipage}[t]{0.35\linewidth}
    {\textbf{Probl\'ematique scientifique:}}
  \end{minipage}
  \begin{minipage}[t]{0.6\linewidth}
    \pbscientifique@internal
  \end{minipage}

  \vskip 10\p@

  \begin{minipage}[t]{0.35\linewidth}
    {\textbf{Nombre de participants:}}
  \end{minipage}
  \begin{minipage}[t]{0.6\linewidth}
    \nbpart@internal
  \end{minipage}

  \vskip 10\p@

  \begin{minipage}[t]{0.35\linewidth}
    {\textbf{Moyens demand\'es:}}
  \end{minipage}
  \begin{minipage}[t]{0.6\linewidth}
    \moyens@internal
  \end{minipage}
  }

  \vskip 5\p@

  \noindent\rule{\linewidth}{2\p@}

  \vskip 20\p@

  {
    \large
    {\noindent\textbf{Sommaire:}}

    \@starttoc{toc}
  }

  \newpage
  \end{titlepage}
}

% header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{firstpage}{%
  \fancyhf{}
  \lhead{\raggedright\parbox[b]{0.1\headwidth}{\raggedright\includegraphics[width=0.1\headwidth]{isae.png}}}
  \chead{\parbox[b]{0.5\headwidth}{\centering\large Demande d'organisation
      d'\'ev\'enements}}
  \rhead{}

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