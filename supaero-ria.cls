%% ISAE/SUPAERO document class for annual report
%% C. Garion, 2010
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-ria}[2010/01/05 v0.1 
               LaTeX document class for SUPAERO annual report]


\def\dep@internal{DMIA}
\newcommand{\dep}[1]{\def\dep@internal{#1}}

\def\ur@internal{MARS}
\newcommand{\ur}[1]{\def\ur@internal{#1}}

\def\formation@internal{SUPAERO}
\newcommand{\formation}[1]{\def\formation@internal{#1}}

\def\uf@internal{IN}
\newcommand{\uf}[1]{\def\uf@internal{#1}}

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
                top=10pt, headheight=65pt, includeheadfoot]{geometry}

% babel for languages
\RequirePackage{babel}

% microtype for spacing
\RequirePackage[babel=true,kerning=true]{microtype}
% fancy tables
%\RequirePackage{booktabs}
%\midrule[1pt]


% multirow for header
\RequirePackage{multirow}

% title page
\RequirePackage[pdftex]{graphicx}

% header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{mypage}{%
  \fancyhf{}
  \lhead{}
  \chead{
    \noindent\begin{tabular}[h]{| l l | c |}
      \hline
       & & \\[-1.5ex]
      \multicolumn{2}{| p{0.8\textwidth}|}{\huge Rapport Individuel
        d'Activit\'e \@date} &
        \multirow{5}{*}{\includegraphics[width=0.2\textwidth]{VL_SUPAERO_72_cmjn.png}}\\[5pt]
      \large Enseignant-Chercheur & & \\
      \cline{1-2}
       & & \\[-1.5ex]
      \large Pr\'enom-Nom  & \large : \@author & \\
      \large D\'epartement/UR & \large : \dep@internal/\ur@internal & \\
      \large Formation et UF principale  & \large : \formation@internal/\uf@internal & \\
      \hline
    \end{tabular}    
  }
  \rhead{}

  \lfoot{RIA \@date~ de \@author ~(\dep@internal/\ur@internal)}
  \rfoot{\thepage/\pageref{LastPage}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
}

\pagestyle{mypage}

% default font
\renewcommand\familydefault{cmss}