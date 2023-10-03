\ProvidesClass{cvtemplate_en}[2018/07/01 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
%\RequirePackage[scaled]{helvet}
%\renewcommand\familydefault{\sfdefault}

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\RequirePackage[export]{adjustbox}
\RequirePackage{pstricks}
\RequirePackage{fontawesome5}
\RequirePackage{fontspec}
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
\RequirePackage{xstring}

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
%	 BIBLIOGRAPHY
%----------------------------------------------------------------------------------------

\RequirePackage[backend=biber, sorting=nymdt, style=phys, doi=true]{biblatex}
\defbibheading{empty}{}

% sorting of publications (https://tex.stackexchange.com/questions/46868/biblatex-sorting-by-date)
\DeclareSortingTemplate{nymdt}{
  \sort{
    \field{presort}
  }
  \sort[final]{
    \field{sortkey}
  }
  \sort[direction=discending]{
    \field{sortyear}
    \field{year}
  }
  \sort[direction=discending]{
    \field[padside=left,padwidth=2,padchar=0]{month}
    \literal{00}
  }
  \sort[direction=discending]{
    \field[padside=left,padwidth=2,padchar=0]{day}
    \literal{00}
  }
}

% underline name
% \renewcommand*{\mkbibnamegiven}[1]{%
% \ifitemannotation{highlight}
% {\underline{#1}}
% {#1}}
\renewcommand*{\mkbibnamefamily}[1]{%
\ifitemannotation{highlight}
{\underline{#1}}
{#1}}

% journal name in italics
\DeclareFieldFormat{journaltitle}{\mkbibitalic{#1}}

% remove numbers
\DeclareFieldFormat{labelnumberwidth}{}
\setlength{\biblabelsep}{0pt}

% DOI
\DeclareFieldFormat{doi}{\href{https://doi.org/#1}{[DOI:#1]}}

% arXiv
\DeclareSourcemap{
    \maps[datatype=bibtex]{
      \map{
        \step[fieldsource=arxiv]
        \step[fieldset=usera,origfieldval]
    }
  }
}
\DeclareFieldFormat{usera}{\href{https://arxiv.org/abs/#1}{\faUnlock~ arXiv:#1}}
\AtEveryBibitem{%
    \csappto{blx@bbx@\thefield{entrytype}}{% put at end of entry
        \iffieldundef{usera}{}{%
          \space\printfield{usera}
        }
    }
}

% skip line

\AtEveryBibitem{%
    \csappto{blx@bbx@\thefield{entrytype}}{% put at end of entry
        \mbox{}\\\vspace{-2pt}
    }
}

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

\definecolor{pink}{HTML}{E85E8A}

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
\newfontfamily\bodyfont[]{OpenSans}
\newfontfamily\thinfont[]{OpenSans}
\newfontfamily\headingfont[]{OpenSans}
\setmainfont[]{OpenSans}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{0.20cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{
  \vspace{0pt}
  {\color{black!80}
    \huge #1
    \rule[0.15\baselineskip]{#2}{1pt}
  }
  \vspace{-10pt}
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvbirthday}[1]{\renewcommand{\cvbirthday}{#1}}
\newcommand{\cvnationality}[1]{\renewcommand{\cvnationality}{#1}}
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
% \newcommand\programming[2]{
% 	\renewcommand{\programming}{
% 		\begin{tikzpicture}
% 			\foreach [count=\i] \x/\y in {#1}{
% 				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
% 				\draw[fill=white,pink](0,\i) rectangle (\y,\i+0.4);
% 				\node [above right] at (0,\i+0.35) {\x};
% 			}
% 		\end{tikzpicture}
% %		\vspace{3mm}
% %		\begin{tikzpicture}
% %			\node [above right] at (0, 4) {0 years \arrow{1.4} ~ #2 years experience};
% %		\end{tikzpicture}
% %		\vspace{-8mm}
% 	}
% }
\newcommand\programming[1]{
	\renewcommand{\programming}{
		{#1}
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

\newcommand\educationItem[5]{
\ifblank{#1}{}{{\small #1}}\\
\textbf{#2} \hfill \ifblank{#3}{}{\textit{#3}}\\
#4\\
\ifblank{#5}{}{#5\\}
}

%---------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeblankprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9.5cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}
}

\let\oldnewpage\newpage
\renewcommand{\newpage}{\oldnewpage\makeblankprofile}

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9.5cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.3, 0.2)

    %-----------------------------------------------

    \vspace{0mm}

    {\bf\LARGE\color{darkgray}\cvname}

    \vspace{0.5mm}

    %------------------------------------------------

    {\large\color{black!80}\cvjobtitle}

    %------------------------------------------------

    \vspace{1mm}
    \renewcommand{\arraystretch}{2}
    \begin{tabular}{p{1cm} @{\hskip 0.25cm}p{5cm}}

     \ifthenelse{\equal{\cvbirthday}{}}{}{
            {$
              \begin{array}{l}
              \hspace{0mm} \huge \textnormal{\textcolor{black}{\faCalendar[regular]}}
              \end{array}
              $}
            & \cvbirthday \\
            }

     \ifthenelse{\equal{\cvnationality}{}}{}{
            {$
              \begin{array}{l}
              \hspace{0mm} \huge \textnormal{\textcolor{black}{\faPassport}}
              \end{array}
              $}
            & \cvnationality \\
            }

      \ifthenelse{\equal{\cvmail}{}}{}{
            {$
              \begin{array}{l}
              \hspace{-0.375mm} \huge \raisebox{-1pt}{\href{mailto:\cvmail}{\textnormal{\textcolor{black}{\faEnvelope[regular]}}}}
              \end{array}
              $}
              & \href{mailto:\cvmail}{\cvmail}\\
%             & \href{mailto:\cvmail}{\begingroup \setlength{\tabcolsep}{-5pt} \renewcommand{\arraystretch}{1} \begin{tabular}{c} \StrBefore*{\cvmail}{@}\\@\StrBehind*{\cvmail}{@} \end{tabular} \endgroup} \\
            }

      \ifthenelse{\equal{\cvsite}{}}{}{
            {$
              \begin{array}{l}
              \hspace{0mm} \huge \href{https://\cvsite}{\textnormal{\textcolor{black}{\faGlobe}}}
              \end{array}
              $}
            & \href{https://\cvsite}{\cvsite} \\
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

    \profilesection{Education}{2.5cm}

    \vspace{1mm}

        \parbox[t]{\textwidth}{\education}

        %------------------------------------------------

        \vspace{1mm}

    \profilesection{Skills}{4.2cm}

        \vspace{1mm}

	 {\large \textbf{Programming}}

		 \programming

%        \vspace{1mm}
%
%         {\large \textbf{Operating systems}}
%
%		 \operatingsystems

        \vspace{1mm}

         {\large \textbf{Languages}}

		 \languages

       %------------------------------------------------

        \vspace{1mm}

        \profilesection{Interests}{2.9cm}

        \vspace{1mm}

        \interests

  \end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

\renewcommand{\section}[1]{
  \vspace{-7.5mm}
  \par\vspace{\parskip}
	{%
		\bf\Large\headingfont\color{headercolor}%
		%\@sectioncolor
		#1%
	}
  \par%\vspace{1mm}
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

\ExplSyntaxOn
\newcommand{\multiplegraphics}[2]{
  \clist_map_inline:nn { #2 } { \mbox{}\\\vspace{5pt}\includegraphics[#1]{##1} }
}
\ExplSyntaxOff

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{cvbody}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}\hfill
}{%
	\end{tabular*}
}

\newcommand{\cvitem}[9]{%
  \vspace{-2pt}
	\parbox[t]{0.14\textwidth}{\hfill#1\ifblank{#2}{}{\\\mbox{}\hfill- #2}}
  \parbox[t]{0.01\textwidth}{}
	\ifblank{#5}{
		&\parbox[t]{0.85\textwidth}{
      \textbf{#3}\\{\small#4}\\

      \ifblank{#8}{}{
        \vspace{-5pt}
        \parbox[t]{0.17\textwidth}{
          \IfSubStr{#8}{,}{\textbf{Supervisors:}}{\textbf{Supervisor:}}
        }
        \parbox[t]{0.68\textwidth}{#8}
      }}%
	}{
		&\parbox[t]{0.70\textwidth}{
      \textbf{#3}\\{\small#4}\\

      \ifblank{#8}{}{
        \vspace{-5pt}
        \parbox[t]{0.17\textwidth}{
          \IfSubStr{#8}{,}{\textbf{Supervisors:}}{\textbf{Supervisor:}}
        }
        \parbox[t]{0.68\textwidth}{#8}
      }}%
		\parbox[t]{0.17\textwidth}{\centering
			{\vspace{\ifblank{#7}{-7}{#7}\mydepth}
        \ifblank{#6}{
          \multiplegraphics{height=5.2\myheight, max width=0.12\textwidth}{#5}
        }{
          \multiplegraphics{height=#6\myheight, max width=0.12\textwidth}{#5}}}}%
	}\\
    \ifblank{#9}{}{&\parbox[t]{0.85\textwidth}{\mbox{}#9}\\}
  \vspace{-6pt}
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

\RequirePackage[left=6.85cm,top=-0.05cm,right=0.35cm,bottom=0.1cm,nohead,nofoot]{geometry}

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
