\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{genkou}[1999/01/17 v1.0 FTEX class]
\newcommand{\縦横}{}%
\hour\time \divide\hour by 60\relax
 \@tempcnta\hour \multiply\@tempcnta 60\relax
 \minute\time \advance\minute-\@tempcnta
\newif\if@genkouid \@genkouidfalse
\newif\if@横 \newif\if@ribon \newif\if@kinsoku\@kinsokufalse
\newif\ifaiv \newif\ifbv \newif\ifbiv
\newif\if@openright
\newif\if@openleft
\newif\if@便箋 \@便箋false
\DeclareOption{openright}{\@openrighttrue\@openleftfalse}
\DeclareOption{openleft}{\@openlefttrue\@openrightfalse}
\DeclareOption{openany}{\@openrightfalse\@openleftfalse}
\DeclareOption{oneside}{\@twosidefalse} %190329
\DeclareOption{twoside}{\@twosidetrue} %190329
\newif\if@mainmatter \@mainmattertrue
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
\DeclareOption{紅}{\def\@masuiro{Red}}%
\DeclareOption{A4}{\aivtrue}%
\DeclareOption{a4}{\aivtrue}%
\DeclareOption{B5}{\bvtrue}%
\DeclareOption{b5}{\bvtrue}%
\DeclareOption{B4}{\bivtrue}%
\DeclareOption{b4}{\bivtrue}%
\ExecuteOptions{masume,twoside,final,縦,松,A4}    %執行選項
\ProcessOptions\relax
\input{\縦横.clo}
\RequirePackage[usenames]{color}
\RequirePackage[expert,uplatex,deluxe,jis2004]{otf} %190329
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
%
%%%%%%%  前輩 定義的頁碼頁眉、篇章目錄之類的公共信息。%%%%%%%%
%
\def\ps@headnombre{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{%
  \if@横\hfill\smash{\raisebox{7mm}{%
    \vbox{\hsize=25mm\hfil\textcolor{\@masuiro}{\textsl{No.}}%
    ~\textsl{\thepage}\hfil\vskip2mm
    \textcolor{\@masuiro}{\hrule}}}}\else%
   \if@ribon\hspace*{14mm}%
   \else\hspace*{4.5mm}\fi
    \smash{\raisebox{7mm}{%
    \vbox{\hsize=25mm\hfil\textcolor{\@masuiro}{\textsl{No.}}%
    ~\textsl{\thepage}\hfil\vskip2mm
    \textcolor{\@masuiro}{\hrule}}}}%
    \hfil\fi}%
  \def\@oddhead{%
  \if@横\hfill\smash{\raisebox{7mm}{%
    \vbox{\hsize=25mm\hfil\textcolor{\@masuiro}{\textsl{No.}}%
    ~\textsl{\thepage}\hfil\vskip2mm
    \textcolor{\@masuiro}{\hrule}}}}\else%
   \if@ribon\hspace*{14mm}%
   \else\hspace*{4.5mm}\fi
    \smash{\raisebox{7mm}{%
    \vbox{\hsize=25mm\hfil\textcolor{\@masuiro}{\textsl{No.}}%
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
%
%
%%%%%%%  定義的頁碼頁眉、篇章目錄之類的公共信息。%%%%%%%%
%
\newcounter{chapter}
\newcounter{ppage}[chapter]
\setcounter{ppage}{1}

\newcounter{thepage}
\setcounter{thepage}{1}

\def\ps@myheading{%
   \let\@mkboth\markboth
   \def\@oddfoot{%
      \llap{%
         \smash{%
            \dimen@.91\textheight \advance\dimen@\footskip
            \vbox to\dimen@{%
               \hbox{\tate \reset@font{\large\mc \@maintitle（{\@authorfn}）}}%
               \vfill
               \hbox{\tate \reset@font{\large\mc \kansuji\c@page  （第%
               \hskip.5zw{\kansuji\c@ppage}\hskip.5zw頁）%
               \vspace{25mm}}}%
               }}%
         \hskip3.3mm}%
      \hfil\stepcounter{ppage}}%
      \def\chaptermark##1{ \markright{%
   \ifnum \c@secnumdepth >\m@ne
     \if@mainmatter
       \@chapapp\thechapter\@chappos\hskip1zw
     \fi
   \fi
   ##1 } }%
   \def\@evenfoot{%
      \hfil
      \rlap{%
        \hskip5mm
        \smash{%
          \dimen@.91\textheight \advance\dimen@\footskip
          \vbox to\dimen@{%
           \hbox{\tate \reset@font{\large\mc \rightmark}} 
            % 右邊頁眉設置爲章標題
            \vfil
                     \hbox{\tate \reset@font{\large\mc \kansuji\c@page（第%
                           \hskip.5zw{\kansuji\c@ppage}\hskip.5zw頁）%
                           \vspace{25mm}}}}}}%
                           \hskip-5mm\stepcounter{ppage}}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }

\def\ps@my{%
   \let\@mkboth\markboth
   \def\@oddfoot{%
      \llap{%
         \smash{%
            \dimen@.91\textheight \advance\dimen@\footskip
            \vbox to\dimen@{%
%               \hbox{\tate \reset@font{\large\mc \@maintitle（{\@authorfn}）}}%
               \vfill
               \hbox{\tate \reset@font{\large\mc % \kansuji\c@page  %
               （第 \hskip.5zw{\kansuji\c@ppage}\hskip.5zw頁）%
               \vspace{25mm}}}%
               }}%
         \hskip3.3mm}%
      \hfil\stepcounter{ppage}}%
      \def\chaptermark##1{ \markright{%
   \ifnum \c@secnumdepth >\m@ne
     \if@mainmatter
       \@chapapp\thechapter\@chappos\hskip1zw
     \fi
   \fi
   ##1 } }%
   \def\@evenfoot{%
      \hfil
      \rlap{%
        \hskip5mm
        \smash{%
          \dimen@.91\textheight \advance\dimen@\footskip
          \vbox to\dimen@{%
%           \hbox{\tate \reset@font{\large\mc \rightmark}} 
            % 右邊頁眉設置爲章標題
            \vfil
               \hbox{\tate \reset@font{\large\mc % \kansuji\c@page  %
               （第 \hskip.5zw{\kansuji\c@ppage}\hskip.5zw頁）%
                           \vspace{25mm}}}}}}%
                           \hskip-5mm\stepcounter{ppage}}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }

\let\ps@jpl@in\ps@myheading

\def\maintitle#1{\gdef\@maintitle{#1}}
\def\@maintitle{\@latex@warning@no@line{No \noexpand\maintitle given}}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\relax}

\def\authorfn#1{\gdef\@authorfn{#1}}
\def\@authorfn{\@latex@warning@no@line{No \noexpand\authorfn given}}

%. タイトル周り
\newenvironment{titlepage}{%
  \thispagestyle{empty}%
  \setcounter{page}{1}%
}{%
  \if@twoside\else
    \setcounter{page}{1}%
  \fi
}

\newcommand{\maketitle}{%
    % jarticleとかからあまり変更していない
    \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \newpage\null\vfil
    \vskip .6\baselineskip%
    \begin{flushleft}%
      {\Huge\mcfamily\bfseries \hspace{2zw}\@maintitle \par}%
      \vskip 1.1\baselineskip%
      {\Large%
      \begin{tabular}[t]{c}%
        \hspace{25zw}\@author%
      \end{tabular}\par}%
%      \vskip\baselineskip%
%      {\large\@date\par}%
    \vskip \baselineskip%
    \end{flushleft}%
    \end{titlepage}%
  \jlreq@endofmaketitle%
}

% いろいろクリアする．
\def\jlreq@endofmaketitle{%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \setcounter{ppage}{1}%
  \clearpage%
}%


\newcommand*{\chaptermark}[1]{}

\setcounter{secnumdepth}{2}

\newcounter{part}
%\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

\renewcommand{\thepart}{\kansuji\number\@arabic\c@part}
\renewcommand{\thechapter}{\kansuji\number\@arabic\c@chapter}
\renewcommand{\thesection}{\kansuji\number\@arabic\c@section}
\renewcommand{\thesubsection}{\kansuji\number\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{\rensuji\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{\rensuji\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{\rensuji\@arabic\c@subparagraph}

%定義的冊卷章節   
%冊卷章節的目錄間距尚需精心調製……待續

%定義的冊
\newcommand{\part}{%
        \cleardoublepage 
  \thispagestyle{empty}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{%
      \mcfamily\Large \prepartname\thepart\postpartname\hspace{1em}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  { \huge\bfseries
   \interlinepenalty\@M\normalfont
   \ifnum \c@secnumdepth >-2\relax
   \rule{0pt}{30pt}
    \rule{30pt}{0pt}\prepartname\thepart\postpartname
     \par\vskip20\p@
   \fi
    \rule{48pt}{0pt}\huge\bfseries#2\par}%
   \@endpart}
\def\@spart#1{{%
  \centering
  \interlinepenalty\@M\normalfont
  \huge\bfseries#1\par}%
  \@endpart}
\def\@endpart{\vfil\newpage
  \if@twoside
   \if@openleft
    \null\thispagestyle{empty}\newpage
   \else\if@openright
    \null\thispagestyle{empty}\newpage
   \fi\fi
  \fi
   \if@tempswa\twocolumn\fi}

%%% 定義的 章、回
\newcommand{\@chapapp}{\prechaptername}
\newcommand{\@chappos}{\postchaptername}

\newcommand{\chapter}{%
        \clearpage
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter  }
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
\def\@makechapterhead#1{\hbox{}%
%    \vskip \baselineskip
  {\hskip0.25\Cwd\hbox{\LARGE\textcolor{purple}{\mc \@maintitle 巻之} }
    \vskip 1\baselineskip
     \par \noindent \LARGE\mcfamily\bfseries
   \raggedright 
   \leavevmode
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    \if@mainmatter
     \setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw} 
     \addtolength\@tempdima{-\wd\z@}%
     \unhbox\z@\nobreak
    \fi
     \vtop{\hsize\@tempdima#1}%
   \else
     #1\relax
   \fi}\nobreak \vskip 1\baselineskip%
   \pagestyle{myheading}%
   \setcounter{ppage}{1}}
\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{\hbox{}%
    \vskip \baselineskip
  {\parindent\z@
   \raggedright
   \normalfont\LARGE\bfseries
   \leavevmode
   \setlength\@tempdima{\linewidth}%
   \vtop{\hsize\@tempdima#1}} \vskip 1\baselineskip%
      \pagestyle{my}}


\newcommand{\section}{\@startsection{section}{1}{\z@}%
   {1\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\Large\bfseries}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {1\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\large\bfseries}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {1\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\normalsize\bfseries}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\normalfont\normalsize\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\normalfont\normalsize\bfseries}}


%% 設置目錄  
% 目錄條目的間隔尚需調製……待續

\setcounter{tocdepth}{2}  %目錄深度
%\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@pnumwidth}{3em}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength{\toclineskip}{0mm}
\newdimen\@lnumwidth
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}}

\def\@dottedtocline#1#2#3#4#5{% 定義的目錄格式
  \ifnum #1>\c@tocdepth \else
    \vskip\toclineskip% \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@lnumwidth #3\relax
     \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
     {#4}\nobreak
%     \leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}% 這一句將半角傍點改成全角……将只对节标题起作用
     \leaders\hbox{$\m@th\mkern \@dotsep mu$\null\inhibitglue \CID{638}\inhibitglue\null$\m@th\mkern \@dotsep mu$}%
     \hfill\nobreak
     \hb@xt@\@pnumwidth{\hss\normalfont \normalcolor #5} %
     \par}%
  \fi}

\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
        \@temptokena{\rensuji{\thepage}}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}

%插入目錄
\newcommand{\tableofcontents}{%
  \chapter*{\contentsname
    \@mkboth{\contentsname}{\contentsname}%
  } \@starttoc{toc} }
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\large\bfseries
     \setlength\@lnumwidth{4zw}%
     #1\hfil\nobreak
     \hb@xt@\@pnumwidth{\hss#2}}\par
    \nobreak
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
     \endgroup
  \fi}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
%    \addvspace{1\Cvs \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\bfseries
      \setlength\@lnumwidth{5zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hb@xt@\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

% 目錄加點、串連起來
%\newcommand*{\l@chapter}       {\@dottedtocline{1}{1zw}{4zw}}
\newcommand*{\l@section}       {\@dottedtocline{2}{2zw}{2zw}}
\newcommand*{\l@subsection}    {\@dottedtocline{3}{3zw}{3zw}}
\newcommand*{\l@subsubsection} {\@dottedtocline{4}{4zw}{4zw}}
\newcommand*{\l@paragraph}     {\@dottedtocline{5}{5zw}{5zw}}
\newcommand*{\l@subparagraph}  {\@dottedtocline{6}{5zw}{6zw}}

\newcommand{\prepartname}{第}
\newcommand{\postpartname}{冊}
\newcommand{\prechaptername}{第}
\newcommand{\postchaptername}{卷}
\newcommand{\contentsname}{目\quad 次}

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
%\pagestyle{headnombre}
\pagenumbering{arabic}
\pagestyle{myheading}
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

\def\dash{{\leavevmode\kern1mm\raise0zh\hbox{\rule{1.8zw}{0.5pt}}\kern1mm}}

% 定義的 目錄頁碼格式（非常重要！！）
\AtBeginDocument{%
\def\contentsline#1#2#3#4{\csname l@#1\endcsname{\hyper@linkstart{link}{#4}{#2}\hyper@linkend}{\@Kanji{#3}}}
}

\endinput
%% End of file `genkou.cls'.