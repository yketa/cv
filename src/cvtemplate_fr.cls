\ProvidesClass{cvtemplate_fr}[2018/07/01 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
%\RequirePackage[scaled]{helvet}
%\renewcommand\familydefault{\sfdefault}

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\usepackage{pstricks}
\usepackage{fontawesome}
\usepackage{fontspec}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%----------------------------------------------------------------------------------------
%	 INLINE IMAGE
%----------------------------------------------------------------------------------------

\usepackage{graphicx,calc}
\newlength\myheight
\newlength\mydepth
\settototalheight\myheight{Xygp}
\settodepth\mydepth{Xygp}
\setlength\fboxsep{0pt}
\newcommand*\inlinegraphics[1]{%
  \settototalheight\myheight{Xygp}%
  \settodepth\mydepth{Xygp}%
  \raisebox{-\mydepth}{\includegraphics[height=\myheight]{#1}}%
}

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{ppurple}{HTML}{5E33FF}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{darkgray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\newfontfamily\bodyfont[]{Helvetica}
\newfontfamily\thinfont[]{Helvetica}
\newfontfamily\headingfont[]{Helvetica}
\setmainfont[]{Helvetica}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvbirthday}[1]{\renewcommand{\cvbirthday}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\programming[1]{
	\renewcommand{\programming}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,ppurple](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.35) {\x};
			}
		\end{tikzpicture}
		\vspace{3mm}
		\begin{tikzpicture}
			\node [above right] at (0, 4) {0 ann\'ee \arrow{0.7} ~ 5 ann\'ees d'\'experience};
		\end{tikzpicture}
		\vspace{-8mm}
	}
}
\newcommand\education[1]{
	\renewcommand{\education}{
		{#1}
	}
}
\newcommand\interests[1]{
	\renewcommand{\interests}{
		{#1}
	}
}
\newcommand\operatingsystems[1]{
	\renewcommand{\operatingsystems}{
		{#1}
	}
}
\newcommand\languages[1]{
	\renewcommand{\languages}{
		{#1}
	}
}

%---------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=8.5cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

    %-----------------------------------------------

    \vspace{4mm}

    {\bf\LARGE\color{darkgray}\cvname}

    \vspace{0.5mm}

    %------------------------------------------------

    {\large\color{black!80}\cvjobtitle}

    %------------------------------------------------

    \vspace{3mm}
    \renewcommand{\arraystretch}{2}
    \begin{tabular}{p{1cm} @{\hskip 0.25cm}p{5cm}}

     \ifthenelse{\equal{\cvbirthday}{}}{}{
            {$
              \begin{array}{l}
              \hspace{0mm} \huge \textnormal{\textcolor{black}{\faBirthdayCake}}
              \end{array}
              $}
            & \cvbirthday \\
            }

      \ifthenelse{\equal{\cvmail}{}}{}{
            {$
              \begin{array}{l}
              \hspace{0mm} \huge \href{mailto:\cvmail}{\textnormal{\textcolor{black}{\faEnvelopeO}}}
              \end{array}
              $}
            & \href{mailto:\cvmail}{\cvmail} \\
            }

      \ifthenelse{\equal{\cvgithub}{}}{}{
          {$
            \begin{array}{l}
            % \hspace{0mm} \huge
            \hspace{0mm} \huge \href{https://github.com/\cvgithub}{\textnormal{\faGithub}}
            \end{array}
            % $} & \href{https://www.github.com/\cvgithub}{\cvgithub} \\
            $} & \href{https://github.com/\cvgithub}{github.com/\cvgithub} \\
          }

    \end{tabular}

    %------------------------------------------------

    \profilesection{Formation}{2.6cm}

    \vspace{3mm}

        \education

        %------------------------------------------------

        \vspace{3mm}

    \profilesection{Comp\'etences}{1.4cm}

        \vspace{3mm}

	 {\large \textbf{Programmation}}

		 \programming

        \vspace{3mm}

         {\large \textbf{Syst\`emes d'exploitation}}

		 \operatingsystems

        \vspace{3mm}

         {\large \textbf{Langues}}

		 \languages

       %------------------------------------------------

        \vspace{3mm}

        \profilesection{Int\'er\^ets}{3.5cm}

        \vspace{3mm}

        \interests

  \end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
	{%
		\bf\Large\headingfont\color{headercolor}%
		%\@sectioncolor
		#1%
	}
  \par\vspace{1mm}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{cvbody}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\cvitem}[7]{%
	\parbox[t]{0.14\textwidth}{\hfill#1\\\mbox{}\hfill- #2}
  \parbox[t]{0.03\textwidth}{}
	\ifblank{#5}{
		&\parbox[t]{0.83\textwidth}{\textbf{#3}\\{\small#4}}%
	}{
		&\parbox[t]{0.68\textwidth}{\textbf{#3}\\{\small#4}}%
		\parbox[t]{0.15\textwidth}{
			{\hfill\raisebox{-16.5\mydepth}{\includegraphics[height=5.2\myheight]{#5}}}}%
	}\\

    &\parbox[t]{0.83\textwidth}{%
    		\vspace{0.2mm}
		\ifblank{#6}{}{\IfSubStr{#6}{,}{\textbf{Superviseurs :}}{\textbf{Superviseur :}} #6\\}
		#7%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.1cm,nohead,nofoot]{geometry}


\usepackage{smartdiagram}
\smartdiagramset{
    bubble center node font = \footnotesize,
    bubble node font = \footnotesize,
    % specifies the minimum size of the bubble center node
    bubble center node size = 0.5cm,
    %  specifies the minimum size of the bubbles
    bubble node size = 0.5cm,
    % specifies which is the distance among the bubble center node and the other bubbles
    distance center/other bubbles = 0.3cm,
    % sets the distance from the text to the border of the bubble center node
    distance text center bubble = 0.5cm,
    % set center bubble color
    bubble center node color = pblue,
    % define the list of colors usable in the diagram
    set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
    % sets the opacity at which the bubbles are shown
    bubble fill opacity = 0.6,
    % sets the opacity at which the bubble text is shown
    bubble text opacity = 1,
}