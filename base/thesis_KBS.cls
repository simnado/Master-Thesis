% class options:
% - select either [german] or [english]
% - select the type of thesis from:
%   [bachelor, master, generic, diss, expose]
%   (in case of generic, use \type{} to specify it)
%   (dissertation so far in German only)
% - use option "alpha" for abbreviated citation (instead of numbers)
% - option "draft" is available, too
% - use options "utf8" or "latin1" to select inputencoding
% - use option "coffee" for fun
\ProvidesClass{base/thesis_KBS}

\newcommand{\setdraft}{}
\DeclareOption{draft}{\renewcommand{\setdraft}{draft}}

\newcounter{sprache}
\setcounter{sprache}{-1}

\newif\ifexpose\exposefalse
\DeclareOption{expose}{
  \exposetrue
}


\DeclareOption{german}{
  \setcounter{sprache}{1}
  \def\@dept{Institut f\"ur Informatik\\AG Wissensbasierte Systeme}
  \def\@type{Masterarbeit}
}
\DeclareOption{english}{
  \setcounter{sprache}{2}
  \def\@dept{Institute for Computer Science\\Knowledge-Based Systems}
  \def\@type{Master's Thesis}
}

\newcounter{coffee}
\setcounter{coffee}{0}
\DeclareOption{coffee}{
  \setcounter{coffee}{1}
}

\newcounter{mytype}
\setcounter{mytype}{-1}
\DeclareOption{bachelor}{\setcounter{mytype}{1}}
\DeclareOption{master}{\setcounter{mytype}{2}}
\DeclareOption{generic}{\setcounter{mytype}{0}}
\DeclareOption{diss}{\setcounter{mytype}{3}}

%

\newcounter{encoding}
\setcounter{encoding}{0}
\DeclareOption{latin1}{
	\setcounter{encoding}{1}
}
\DeclareOption{utf8}{
	\setcounter{encoding}{2}
}

\newcounter{bstyle}
\setcounter{bstyle}{1}
\DeclareOption{alpha}{
  \setcounter{bstyle}{2}
}

\ProcessOptions

\ifexpose
\LoadClass[11pt,a4paper]{article}
\usepackage{typearea}
% Textspiegel
\areaset{16cm}{21cm}
\else
\LoadClass[11pt,a4paper,twoside,openright, listof=totoc]{scrreprt}
\usepackage{typearea}
% Textspiegel
\areaset[0.75cm]{16cm}{21cm}
\addtolength{\topmargin}{1cm}
\fi


\def\type#1{\gdef\@type{#1}}
\def\dept#1{\gdef\@dept{#1}}
\def\signline#1{\gdef\@signline{#1}}
\def\signcity#1{\gdef\@signcity{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\@title{}
\def\@author{}
\def\@signcity{Osnabr\"uck}
\def\shorttitle#1{\gdef\@shorttitle{#1}}
\def\@shorttitle{\@title}


% additional packages HERE
\RequirePackage[table,xcdraw,svgnames]{xcolor}
    \definecolor{darkblue}{rgb}{0,0,.5}
    \definecolor{lightblue}{rgb}{0,0,1.0}
    \definecolor{darkgreen}{rgb}{0,.5,0}
    \definecolor{dark-gray}{gray}{0.2}
    \definecolor{uos-red-full}{cmyk}{0.2, 1, 0.65, 0.25}
    \definecolor{uos-yellow-full}{cmyk}{0, 0.3, 1, 0}
    \definecolor{uos-grey-full}{cmyk}{0, 0, 0, 0.25}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english, ngerman]{babel}
\RequirePackage{csquotes}

\RequirePackage{acronym}
\RequirePackage{amsmath}
%\RequirePackage{caption}
%    \captionsetup{format=hang, font=small, labelfont=it}
\RequirePackage{csvsimple}
\RequirePackage[toc, acronyms]{glossaries}
\RequirePackage{listings}
    \renewcommand{\lstlistingname}{Quellcode}
    \renewcommand{\lstlistlistingname}{\lstlistingname-Liste}
\RequirePackage{subcaption}
\RequirePackage{tcolorbox}
\RequirePackage[
    backend=biber,
    style=alphabetic,
    natbib=true,
    backref=true
    ]{biblatex} % bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{ifthen}
\RequirePackage{base/coffee}
\renewcommand{\coffee}[1][]{}

% Page layout in LaTeX
% http://www.ctan.org/tex-archive/macros/latex/contrib/fancyhdr/
\RequirePackage{fancyhdr}

\RequirePackage{lmodern}

% The "extended" or "enhanced" graphics package.
% http://mirror.ctan.org/macros/latex/required/graphics/grfguide.pdf
\RequirePackage[\setdraft]{graphicx}
\graphicspath{{img/}{base/}}

%\RequirePackage{bbm}

% 'American Mathmatical Society'
% http://ftp.uni-erlangen.de/mirrors/CTAN/support/tcltexed/hlp/eng/amsmath.txt
% additional:
% 	- mathmatical symbols
% 	- mathmatical theorems
% 	- mathmatical fonts
\usepackage{amsmath, amssymb, amsthm, amsfonts}

% Hypertext marks in LaTeX
% http://www.ctan.org/tex-archive/macros/latex/contrib/hyperref/
\RequirePackage[plainpages=false,
                colorlinks=false,
                linkcolor=darkblue,
                citecolor=darkgreen,
                urlcolor=lightblue,
                unicode=true,
                pdfborder={0 0 0}
                ]{hyperref}

% natbib used to emulate the cite package,
% which does NOT work correctly with hyperref
% (though stated otherwise)
%\usepackage[sort&compress, square, comma, numbers]{natbib}

% Improved citation handling in LaTeX.
% Compatible with both hyperref and backref.
%\RequirePackage[sort]{cite}

% Option "openright" l��t jedes Kapitel auf einer ungeraden Seite starten;
% Problem: ggf. eingef�gte Leerseiten haben noch Kopf- und Fu�zeilen!!!
% => L�sung:
%
%\makeatletter % nicht notwendig in CLS-Datei
  \def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \thispagestyle{empty}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}
%\makeatother % nicht notwendig in CLS-Datei
  
% hilft gegen "nur Grafik"-Seiten:
\renewcommand{\floatpagefraction}{.9} % Default: .5
\renewcommand{\textfraction}{.15}     % Default: .2
\renewcommand{\arraystretch}{1.2}

\headwidth160mm
\lhead[\thepage]{\nouppercase{\rightmark}}
\chead{} \rhead[\nouppercase{\leftmark}]{\thepage}
\cfoot{\textsc{\@title}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\RequirePackage{caption}
    \captionsetup{format=hang, font=small, labelfont=it}

\renewcommand{\O}{{\cal O}}
\renewcommand{\leadsto}{\rightsquigarrow}
\newcommand{\V}[1]{\text{\boldmath $#1$}}    % Format for "Vector"
\newcommand{\M}[1]{\V{#1}}                   % Format for "Matrix"

%\newcommand{\R}{\mathbbm{R}}
%\newcommand{\N}{\mathbbm{N}}
%\newcommand{\C}{\mathbbm{C}}
%\newcommand{\1}{\mathbbm{1}}                 % Einheitsmatrix


% erstellt Liste, bei der alle Eintr"age um <Beispieltext>-Breite einger"uckt sind!
% Parameter: {<Beispieltext>}
\newenvironment{liste}[2][\rm]{\begin{list}{}{\settowidth{\labelwidth}{{#1#2}}
  \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}
  \addtolength{\leftmargin}{3ex}%
  \setlength{\parsep}{.5ex plus0.2ex minus 0.2ex}%
  \setlength{\itemsep}{1ex}%
  \renewcommand{\makelabel}[1]{{#1##1\hfill}}}}
  {\end{list}}%
%%%%%%%
% liste + "Doppelpunkt" (notwendig, damit Doppenpunkt au�erhalb des Stilparameters #1)
\newenvironment{listeDP}[2][\rm]{\begin{list}{}{\settowidth{\labelwidth}{{#1#2}:}
  \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}
  \addtolength{\leftmargin}{3ex}%
  \setlength{\parsep}{.5ex plus0.2ex minus 0.2ex}%
  \setlength{\itemsep}{1ex}%
  \renewcommand{\makelabel}[1]{{#1##1}:\hfill}}}
  {\end{list}}%
% erstellt BULLET-Liste, bei der alle Eintr"age um <Beispieltext>-Breite einger"uckt sind!
% Parameter: {<Beispieltext>}
\newenvironment{Liste}[2][\rm]{\begin{list}{}{\settowidth{\labelwidth}{\:$\bullet$\: #1#2}
  \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}
  \addtolength{\leftmargin}{3ex}%
  \setlength{\parsep}{.5ex plus0.2ex minus 0.2ex}%
  \setlength{\itemsep}{1ex}%
  \renewcommand{\makelabel}[1]{\:$\bullet$\, #1##1\hfill}}}
  {\end{list}}%
\newcommand{\grad}{\ensuremath{^{\circ}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\value{sprache} = 1}{
  \usepackage{parskip}
  %\setlength{\parskip}{5pt plus 2pt minus 1pt}
  %\setlength{\parindent}{0pt}
}{}



\ifthenelse{\value{sprache} = 1}{
\def\@submitdate{\ifcase\the\month\or
  Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or
  Juli\or August\or September\or Oktober\or November\or Dezember\fi
  \space \number\the\year}
}{
\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}
}

\def\@signline{\@signcity, \@submitdate}

\def\firstSupervisor#1{\gdef\@firstSupervisor{#1}}
\def\secondSupervisor#1{\gdef\@secondSupervisor{#1}}
\def\thirdSupervisor#1{\gdef\@thirdSupervisor{#1}}
\thirdSupervisor{???}
\def\email#1{\gdef\@email{#1}}

\newcommand{\generatetitle}{
    \ifthenelse{\value{coffee} = 1}{\coffee{1}}{} % @@@

\ifexpose
\begin{center}
   \includegraphics[height=1.5cm]{unilogo}\\
   \large{\textsc{\@dept}}\\[1.5cm]
   
  {\LARGE \textbf{Expos\'{e}}}\\[.5cm]
  {\Large %
\ifthenelse{\value{sprache} = 1}{zur}{for the}
 \@type}\\[1cm]

  \textbf{\@title}\\[.5cm]
  \@author\\[1cm]
  {\small \@submitdate}\\[1cm]
\end{center}

\else
  \pagenumbering{roman}
  \pagestyle{plain}
  \thispagestyle{empty}
  \begin{center}
    %
    \begin{center}
      \vspace{4mm}
      \includegraphics[height=1.5cm]{unilogo}
    \end{center}
    \vspace{-4mm}
    %
    \LARGE{\textsc{\@dept}}
    
    \ifthenelse{\value{mytype} = 3}% format a dissertation differently
               {                
                 \vspace{12mm}
                 
                 \huge{\textbf{\@title}}
                 
                 \vspace{8mm}
                 
                 
                 \LARGE{\emph{\@type}}
                 
                 \vspace{4mm}
                 
                 zur Erlangung des Doktorgrades (Dr.~rer.~nat.)\\ des Fachbereichs Mathematik/Informatik\\ der Universit�t Osnabr�ck
                 
                 \vspace{12mm}
                 vorgelegt von
                 
                 \Large{\textit{\@author}}
                 
                 \vfill
                 
                 \large{\@submitdate}
                 
                 \vfill
                 
                 \begin{tabular}{ll}
                   \large
                   \ifthenelse{\value{sprache} = 1}{Erstgutachter:}{First supervisor:}
                   & \large \@firstSupervisor\\
                   \large
                   \ifthenelse{\value{sprache} = 1}{Zweitgutachter:}{Second supervisor:}
                   & \large \@secondSupervisor\\
                   \ifthenelse{\value{sprache} = 1}{Drittgutachter:}{Third supervisor:}
                   & \large \@thirdSupervisor
                 \end{tabular}
               }% normal bachelor/master's thesis
               {
                 \vfill
                 
                 \LARGE{\emph{\@type}}
                 
                 \vspace{8mm}
                 
                 \huge{\textbf{\@title}}
                 
                 \vspace{8mm}
                 
                 \LARGE{\@author}
                 
                 \vspace{32mm}

                 \large{\@submitdate}
                 \vfill

                 \begin{tabular}{ll}
                   \large
                   \ifthenelse{\value{sprache} = 1}{Erstgutachter:}{First supervisor:}
                   & \large \@firstSupervisor\\
                   \large
                   \ifthenelse{\value{sprache} = 1}{Zweitgutachter:}{Second supervisor:}
                   & \large \@secondSupervisor
                 \end{tabular}
               }
\end{center}
\fi
}

\def\closing{ %the clause that you did not cheat
  \ifthenelse{\value{sprache} = 1}{\chapter*{Erkl\"arung}}{\chapter*{Proclamation}}
  \thispagestyle{empty}
  \ifthenelse{\value{coffee} = 1}{\coffee{3}}{}


\ifthenelse{\value{sprache} = 1}{
  Hiermit versichere ich, dass ich die vorliegende Arbeit
  selbst\"andig verfasst und keine anderen als die angegebenen
  Quellen und Hilfsmittel benutzt sowie Zitate kenntlich gemacht
  habe.
}{
  Hereby I confirm that I wrote this thesis independently and
  that I have not made use of any other resources or means than
  those indicated.
}
  
\bigskip\bigskip

\begin{flushright}
\@signline
\end{flushright}
}

\newenvironment{prefacesection}[1]
{
  \ifthenelse{\value{coffee} = 1}{\coffee{2}}{}
  \thispagestyle{empty}\centerline{\Large{\textbf{#1}}}\medskip
}{}


\newcommand{\startTextChapters}{
  \cleardoublepage
  \pagestyle{fancy}
  \pagenumbering{arabic}
}

\typeout{^^J***********************************^^J Using Thesis_KBS class 2016-05-11^^J***********************************^^J}
