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

% \makeatletter
% \renewcommand*{\NoRule}{\renewcommand*{\rule@length}{0}}
% \makeatother

\makeatletter
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
\makeatother
