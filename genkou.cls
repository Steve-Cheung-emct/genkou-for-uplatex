\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{genkou}[1999/01/17 v1.0 FTEX class]
\newcommand{\縦横}{}%
\hour\time \divide\hour by 60\relax
 \@tempcnta\hour \multiply\@tempcnta 60\relax
 \minute\time \advance\minute-\@tempcnta
\newif\if@genkouid \@genkouidfalse
\newif\if@横 \newif\if@ribon \newif\if@kinsoku\@kinsokufalse
\newif\ifaiv \newif\ifbv \newif\ifbiv
\newtoks\@signature \@signature{}%
\DeclareOption{名前}{%
 \@genkouidtrue \input{genkouid.tex}}%
\def\名前#1{\@signature{#1}}%
\DeclareOption{masume}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{0\p@}%
  \maketombowbox}%
\DeclareOption{縦}{\renewcommand{\縦横}{tgenkou}\@横false}%
\DeclareOption{横}{\renewcommand{\縦横}{ygenkou}\@横true}%
\DeclareOption{リボン}{\renewcommand{\縦横}{ribon}\@ribontrue}%
\DeclareOption{便箋}{\renewcommand{\縦横}{binsen}}%
\DeclareOption{禁則}{\@kinsokutrue}%
\DeclareOption{draft}{\setlength\overfullrule{5pt}}%
\DeclareOption{final}{\setlength\overfullrule{0pt}}%
\DeclareOption{空}{\def\@masuiro{SkyBlue}}%
\DeclareOption{海}{\def\@masuiro{Aquamarine}}%
\DeclareOption{苺}{\def\@masuiro{WildStrawberry}}%
\DeclareOption{春}{\def\@masuiro{SpringGreen}}%
\DeclareOption{墨}{\def\@masuiro{Black}}%
\DeclareOption{秋}{\def\@masuiro{Sepia}}%
\DeclareOption{森}{\def\@masuiro{JungleGreen}}%
\DeclareOption{夜}{\def\@masuiro{MidnightBlue}}%
\DeclareOption{鮭}{\def\@masuiro{Salmon}}%
\DeclareOption{鼠}{\def\@masuiro{Gray}}%
\DeclareOption{松}{\def\@masuiro{PineGreen}}%
\DeclareOption{菫}{\def\@masuiro{Violet}}%
\DeclareOption{無}{\def\@masuiro{White}}%
\DeclareOption{A4}{\aivtrue}%
\DeclareOption{a4}{\aivtrue}%
\DeclareOption{B5}{\bvtrue}%
\DeclareOption{b5}{\bvtrue}%
\DeclareOption{B4}{\bivtrue}%
\DeclareOption{b4}{\bivtrue}%
\ExecuteOptions{masume,oneside,final,縦,松,A4}
\ProcessOptions\relax
\input{\縦横.clo}
\RequirePackage[usenames]{color}
\RequirePackage{plext}
\setbox\@TL=\hbox{{\color{\@masuiro}\masu}}%
\setbox\@Tl=\hbox{}\setbox\@TC=\hbox{}\setbox\@TR=\hbox{}
\setbox\@Tr=\hbox{}\setbox\@BL=\hbox{}\setbox\@Bl=\hbox{}
\setbox\@BC=\hbox{}\setbox\@BR=\hbox{}\setbox\@Br=\hbox{}
\setbox\@CL=\hbox{}\setbox\@CR=\hbox{}
\def\@outputtombow{%
 \iftombow
  \vbox to \z@{\vskip\@thosei\hbox to \z@{%
  \hskip\@yhosei\copy\@TL\hss}\vss}%
  \fi}
\setlength\headheight{12\p@}
\setlength\topskip{1\Cht}
\setlength\footskip{12mm}
\setlength\maxdepth{.2\topskip}
\setlength\lineskip{\z@}
\setlength\normallineskip{\z@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{\z@}
\setlength\parindent{\z@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\def\ps@headnombre{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\hfil\thepage}%
  \def\@oddhead{%
  \if@横\hfill\smash{\raisebox{7mm}{%
    \vbox{\hsize=25mm\hfil\textcolor{\@masuiro}{\textsl{No.}}
    ~\textsl{\thepage}\hfil\vskip2mm
    \textcolor{\@masuiro}{\hrule}}}}\else%
   \if@ribon\hspace*{14mm}%
   \else\hspace*{4.5mm}\fi
    \smash{\raisebox{5mm}{%
    \vbox{\hsize=25mm\hfil\textcolor{\@masuiro}{\textsl{No.}}
    ~\textsl{\thepage}\hfil\vskip2mm
    \textcolor{\@masuiro}{\hrule}}}}%
    \hfil\fi}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \let\@oddhead\@empty
   \def\@oddfoot{\reset@font\hfil\textcolor{\@masuiro}{---}
      ~\thepage~\textcolor{\@masuiro}{---}\hfil}%
   \let\@evenhead\@empty
   \let\@evenfoot\@oddfoot}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\newcount\heisei \heisei\year \advance\heisei-0\relax
\def\today{{%
      公元\ifnum\heisei=1 元年\else\kansuji\number\heisei 年\fi
      \kansuji\number\month 月
      \kansuji\number\day 日}}
\pagestyle{headnombre}
\pagenumbering{arabic}
\normalmarginpar
\@mparswitchfalse
\xkanjiskip=\KANJISKIP
\clubpenalty=0
\widowpenalty=0
\jcharwidowpenalty=0
%
\RequirePackage{genkomac}
\raggedbottom
\if@kinsoku
 \raggedright
\else
 \input kinsoku.tex
\fi
\endinput
%% End of file `genkou.cls'.
