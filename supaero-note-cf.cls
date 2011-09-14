%% ISAE/SUPAERO document class for short note for CF
%% C. Garion, 2011
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-note-cf}[2011/05/07 v0.1
               LaTeX document class for SUPAERO annual report]


\def\function@internal{}
\newcommand{\function}[1]{\def\function@internal{#1}}

% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.sup" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.sup}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}
\ExecuteOptions{a4paper,12pt}
\ProcessOptions \relax
\RequirePackage{atbegshi}
\LoadClass{article}

% page layout
\RequirePackage[hscale=0.85, vscale=0.92,
                top=10pt, headheight=80pt, includeheadfoot]{geometry}

% babel for languages
\RequirePackage{babel}

% microtype for spacing
\RequirePackage[babel=true,kerning=true]{microtype}

% multirow for header
\RequirePackage{multirow}

% graphics
\RequirePackage[pdftex]{graphicx}

% header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{mypage}{%
  \fancyhf{}
  \lhead{}
  \chead{
    \noindent\begin{tabular}[h]{| p{0.8\textwidth} | c |}
      \hline
       & \\[-1.5ex]
      \Large \bf \@title &
        \multirow{5}{*}{\includegraphics[width=0.2\textwidth]{VL_SUPAERO_72_cmjn.png}}\\[5pt]
      \cline{1-1}
       & \\[-1.5ex]
      \Large Conseil de perfectionnement du \@date & \\
      \cline{1-1}
       & \\[-1.5ex]
      \large Propos\'e par: \bf \@author & \\
      \large En qualit\'e de: \bf \function@internal & \\
      \hline
    \end{tabular}    
  }
  \rhead{}

  \lfoot{\footnotesize Ce document est la propri\'et\'e de l'ISAE.\\
    Les informations qu'il contient ne peuvent \^etre utilis\'ees, reproduites
    ou communiqu\'ees sans son accord pr\'ealable \'ecrit.}
  \rfoot{\thepage/\pageref{LastPage}}

  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
}

\pagestyle{mypage}

% default font
\renewcommand\familydefault{cmss}

% no indentation
\setlength{\parindent}{0in}