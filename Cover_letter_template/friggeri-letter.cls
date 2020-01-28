\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{friggeri-letter}[2015/10/31 Cover letter for friggeri resume]


\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessOptions\relax

\LoadClass{letter}


\newcommand*{\header}[6]{
  \def\firstname{#1}
  \def\lastname{#2}
  \def\subtitle{#3}
  \def\subtitleemail{#4}
  \def\subtitlelinkedin{#5}
  \def\subtitlepersonalweb{#6}
}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\definecolor{yellow}{HTML}{FFFF00}
\definecolor{pink}{HTML}{F81894}
\definecolor{darkred}{HTML}{B22222}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[BoldFont=texgyreheros-bold.otf, ItalicFont=texgyreheros-italic.otf, BoldItalicFont=texgyreheros-bolditalic.otf]{texgyreheros-regular.otf}\newfontfamily\thinfont[]{Lato-Light.ttf}\newfontfamily\headingfont[]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, BoldFont=texgyreheros-bold.otf, ItalicFont=texgyreheros-italic.otf, BoldItalicFont=texgyreheros-bolditalic.otf]{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \positionfont%
  \color{white}%
}

\setlength\headheight{0\p@}

\renewcommand*{\opening}[1]{
\begin{tikzpicture}[remember picture,overlay]
  \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
  \node [anchor=center] (name) at (box) {%
    \fontsize{40pt}{72pt}\color{header}%
    {\thinfont \firstname}{\bodyfont \lastname}
  };
  \node [anchor=north] (subt) at (name.south) {%
    \fontsize{14pt}{24pt}\color{header}%
    \thinfont \subtitle%
  };
  \node [anchor=north] (subtt) at (subt.south) {%
    \fontsize{9.5pt}{19.5pt}\color{header}%
	{\thinfont \subtitleemail}{\thinfont \subtitlelinkedin}{\thinfont \subtitlepersonalweb}
  };  
\end{tikzpicture}

\vspace{-2\parskip}
  \ifx\@empty\fromaddress
    \thispagestyle{firstpage}%
    {\raggedleft\@date\par}%
  \else  % home address
    \thispagestyle{empty}%
    {\raggedleft\begin{tabular}{l@{}}\ignorespaces
    \fromaddress \\*[2\parskip]%
    \@date \end{tabular}\par}%
  \fi
  
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%\\
  #1\par\nobreak}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
}