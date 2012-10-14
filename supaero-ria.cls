%% ISAE/SUPAERO document class for annual report
%% C. Garion, 2010, 2011
%%
%% Mostly taken from article.cls and "Rolling your own Document Class:
%% Using LaTeX to keep away from the Dark Side" by Peter Flynn
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{supaero-ria}[2010/09/22 v0.2 
               LaTeX document class for SUPAERO annual report]


% defs etc.
\def\@language{english}
\def\@requirefrench{}
\DeclareOption{fr}{\def\@language{french}\def\@requirefrench{true}}
\DeclareOption{en}{\def\@language{english}}
\DeclareOption{fr-en}{\def\@language{english,french}\def\@requirefrench{true}}
\DeclareOption{en-fr}{\def\@language{french,english}}
\def\@requirebiblatex{}
\DeclareOption{biblatex}{\def\@requirebiblatex{true}}

\def\dep@internal{DMIA}
\newcommand{\dep}[1]{\def\dep@internal{#1}}

\def\ur@internal{MARS}
\newcommand{\ur}[1]{\def\ur@internal{#1}}

\def\formation@internal{SUPAERO}
\newcommand{\formation}[1]{\def\formation@internal{#1}}

\def\uf@internal{IN}
\newcommand{\uf}[1]{\def\uf@internal{#1}}

\global\let\@newens\@empty
\newcommand{\setnewens}[1]{\def\@newens{#1}}
\let\newens\setnewens %
\newcommand{\show@newens}{\@newens}

\global\let\@modules\@empty
\newcommand{\setmodules}[1]{\def\@modules{#1}}
\let\modules\setmodules %
\newcommand{\show@modules}{\@modules}

\global\let\@encadrement\@empty
\newcommand{\setencadrement}[1]{\def\@encadrement{#1}}
\let\encadrement\setencadrement %
\newcommand{\show@encadrement}{\@encadrement}

\global\let\@ingenierie\@empty
\newcommand{\setingenierie}[1]{\def\@ingenierie{#1}}
\let\ingenierie\setingenierie %
\newcommand{\show@ingenierie}{\@ingenierie}

\global\let\@wishens\@empty
\newcommand{\setwishens}[1]{\def\@wishens{#1}}
\let\wishens\setwishens %
\newcommand{\show@wishens}{\@wishens}

\global\let\@actrech\@empty
\newcommand{\setactrech}[1]{\def\@actrech{#1}}
\let\actrech\setactrech %
\newcommand{\show@actrech}{\@actrech}

\global\let\@animation\@empty
\newcommand{\setanimation}[1]{\def\@animation{#1}}
\let\animation\setanimation %
\newcommand{\show@animation}{\@animation}

\global\let\@persprech\@empty
\newcommand{\setpersprech}[1]{\def\@persprech{#1}}
\let\persprech\setpersprech %
\newcommand{\show@persprech}{\@persprech}

\global\let\@pub\@empty
\newcommand{\setpub}[1]{\def\@pub{#1}}
\let\pub\setpub %
\newcommand{\show@pub}{\@pub}

\global\let\@whatelse\@empty
\newcommand{\setwhatelse}[1]{\def\@whatelse{#1}}
\let\whatelse\setwhatelse %
\newcommand{\show@whatelse}{\@whatelse}

\global\let\@misc\@empty
\newcommand{\setmisc}[1]{\def\@misc{#1}}
\let\misc\setmisc %
\newcommand{\show@misc}{\@misc}

% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.sup" exists, then it is loaded
\PassOptionsToClass{a4paper}{article}
\DeclareOption*{\InputIfFileExists{\CurrentOption.sup}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}
\ProcessOptions \relax
\RequirePackage{atbegshi}
\LoadClass{article}

% page layout
\RequirePackage[hscale=0.85, vscale=0.92,
                top=25pt, headheight=70pt, 
                includeheadfoot]{geometry}

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
\fi

% microtype for spacing
\RequirePackage[babel=true,kerning=true]{microtype}
\SetExtraKerning%
    [ name = ttkerning,%
      context  = french]%
    { encoding = {OT1,T1}, family={ul9,fvm,tt*} }%
    { }%

% fancy tables
\RequirePackage{booktabs}

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
    \noindent\begin{tabular}[h]{| l l | c |}
      \hline
       & & \\[-1.5ex]
      \multicolumn{2}{| p{0.75\textwidth}|}{\huge \bf Rapport Individuel
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

% no indentation
\setlength{\parindent}{0in}

% bibliography with biblatex
\ifx\@requirebiblatex\@empty
  \relax
\else
  \RequirePackage{biblatex}
  \DeclareBibliographyCategory{journal}
  \defbibheading{journal}{\subsection*{Articles dans des journaux
      internationaux \`a comit\'e de lecture}}
  \DeclareBibliographyCategory{nat-journal}
  \defbibheading{nat-journal}{\subsection*{Articles dans des journaux
      nationaux \`a comit\'e de lecture}}
  \DeclareBibliographyCategory{book}
  \defbibheading{book}{\subsection*{Livres}}
  \DeclareBibliographyCategory{book-chapter}
  \defbibheading{book-chapter}{\subsection*{Chapitres de livres}}
  \DeclareBibliographyCategory{int-conf-rev}
  \defbibheading{int-conf-rev}{\subsection*{Publications dans des
      conf\'erences internationales avec comit\'e de lecture}}
  \DeclareBibliographyCategory{int-conf-worev}
  \defbibheading{int-conf-worev}{\subsection*{Publications dans des
      conf\'erences internationales sans comit\'e de lecture}}
  \DeclareBibliographyCategory{nat-conf-rev}
  \defbibheading{nat-conf-rev}{\subsection*{Publications dans des
      conf\'erences nationales avec comit\'e de lecture}}
  \DeclareBibliographyCategory{nat-conf-worev}
  \defbibheading{nat-conf-worev}{\subsection*{Publications dans des
      conf\'erences nationales sans comit\'e de lecture}}
  \DeclareBibliographyCategory{ln}
  \defbibheading{ln}{\subsection*{Polycopi\'es de cours}}
  \DeclareBibliographyCategory{misc}
  \defbibheading{misc}{\subsection*{Divers}}

  \pub{%
    \nocite{*}%
    \bibbycategory%
  }
\fi

% command to build the document
\newcommand{\body}{
\section{Enseignement}
\label{sec:enseignement}

\ifx\@newens\@empty
  \relax
\else
  \subsection{Nouveaut\'es et observations}
  \label{sec:nouveautes-observations}

  \show@newens
\fi %

\ifx\@modules\@empty
  \relax
\else
  \subsection{Modules d'enseignements}
  \label{sec:modules}

  \show@modules
\fi %

\ifx\@encadrement\@empty
  \relax
\else
  \subsection{Encadrement}
  \label{sec:encadrement}

  \show@encadrement
\fi %

\ifx\@ingenierie\@empty
  \relax
\else
  \subsection{Ing\'enierie p\'edagogique}
  \label{sec:ing-pedagogique}

  \show@ingenierie
\fi %

\ifx\@wishens\@empty
  \relax
\else
  \subsection{Souhaits d'\'evolution pour l'ann\'ee \`a venir et \`a
    moyen terme}
  \label{sec:wishens}

  \show@wishens
\fi %

\section{Recherche}
\label{sec:recherche}

\ifx\@actrech\@empty
  \relax
\else
  \subsection{Activit\'es de recherche}
  \label{sec:actrecherche}

  \show@actrech
\fi %

\ifx\@animation\@empty
  \relax
\else
  \subsection{Animation scientifique et gestion de la recherche}
  \label{sec:animation-scientifique}

  \show@animation
\fi %

\ifx\@persprech\@empty
  \relax
\else
  \subsection{Perspectives \`a un an et \`a moyen terme}
  \label{sec:pers-rech}

  \show@persprech
\fi %

\ifx\@pub\@empty
  \relax
\else
  \section{Publications de l'ann\'ee civile de r\'ef\'erence et de la pr\'ec\'edente}
  \label{sec:pub}

  \show@pub
\fi %

\ifx\@whatelse\@empty
  \relax
\else
  \section{Autres activit\'es}
  \label{sec:autres-activites}
  
  \show@whatelse
\fi %

\ifx\@misc\@empty
  \relax
\else
  \section{Points particuliers}
  \label{sec:points-particuliers}

  \show@misc
\fi %
}
