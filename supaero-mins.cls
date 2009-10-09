%% ISAE/SUPAERO document class for official minutes
%% C. Garion, 2009
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn and
%% "Minutes in Less than Hours: Using LaTeX Resources" by Jim
%% Hefferon
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-mins}[2009/09/29 v0.1 
               LaTeX document class for SUPAERO minutes]

% definitions need to be here to be processed by the .sup file
% who is meeting? 
\global\let\@members\@empty
\newcommand{\setmembers}[1]{\def\@members{#1}}
\let\members\setmembers %
\newcommand{\show@members}{\@members}

% who is absent? 
\global\let\@absent\@empty
\newcommand{\setabsent}[1]{\def\@absent{#1}}
\let\absent\setabsent %
\newcommand{\show@absent}{\@absent}

% who is present?
\def\@present{Personne}
\newcommand{\setpresent}[1]{\def\@present{#1}}
\let\present\setpresent %
\newcommand{\show@present}{\@present}

% who is also present?
\global\let\@alsopresent\@empty
\newcommand{\setalsopresent}[1]{\def\@alsopresent{#1}}
\let\alsopresent\setalsopresent %
\newcommand{\show@alsopresent}{\@alsopresent}

\def\textlhead@internal{ISAE/DFS}
\newcommand{\textlhead}[1]{\renewcommand{\textlhead@internal}{#1}}

\def\textrhead@internal{\@title , \@date}
\newcommand{\textrhead}[1]{\renewcommand{\textrhead@internal}{#1}}

% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.sup" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.sup}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}
\ExecuteOptions{a4paper,11pt}
\ProcessOptions \relax
\LoadClass{article}

% page layout
\RequirePackage[hscale=0.85, vscale=0.9,
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
    \hbox{\rlap{\parbox{\textwidth}{\raggedright\hskip 40\p@\includegraphics[width=0.1\textwidth]
                                                                {VL_SUPAERO_72_cmjn.png}}}
      \hskip 15\p@ 
      \parbox{\textwidth}{\centering \parbox{0.6\textwidth}{\centering
          \Large \@title \\ \@date}}}
  \end{center}

  \vskip 20\p@

  \begin{description}
  \item[R\'edacteur~:] \@author
  \ifx\@members\@empty
    \relax
  \else
    \item[Membres~:] \show@members
  \fi %
  \item[Pr\'esents~:] \show@present
  \ifx\@absent\@empty
    \relax
  \else
    \item[Absents~:] \show@absent
  \fi %
  \ifx\@alsopresent\@empty
    \relax
  \else
    \item[\'Egalement pr\'esents~:] \show@alsopresent
  \fi %
  \end{description}

  \vskip 20\p@

  \end{titlepage}
}

% header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{firstpage}{%
  \fancyhf{}
  \lfoot{\footnotesize Ce document est la propri\'et\'e de l'ISAE.\\
    Les informations qu'il contient ne peuvent \^etre utilis\'ees, reproduites
    ou communiqu\'ees sans son accord pr\'ealable \'ecrit.}
  \rfoot{\thepage/\pageref{LastPage}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
}
\fancypagestyle{followingpage}{%
  \fancyhf{}
  \lhead{\raggedright\parbox[b]{0.2\headwidth}{\raggedright\textlhead@internal}}
  \rhead{\parbox[b]{0.7\headwidth}{\raggedleft\textrhead@internal}}
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

% commands and environments
\newcommand{\mintitle}[1]{\vspace{2ex}\par\noindent\textbf{#1}\par}

\newenvironment{crenum}[1]{%
%\renewcommand\theenumi{\alph{\enumi}}
\vspace{2ex}\par\noindent\textbf{#1}\par
\begin{enumerate}
}{%
\end{enumerate}
}

\newenvironment{objectifs}{%
\begin{crenum}{Objectifs}
}{%
\end{crenum}
}

\newenvironment{actions}{%
\begin{crenum}{Actions}
}{%
\end{crenum}
}

\newenvironment{crlist}[1]{%
\vspace{2ex}\par\noindent\textbf{#1}\par
\begin{itemize}
}{%
\end{itemize}
}
