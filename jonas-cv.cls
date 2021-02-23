% Intro Options
% largely based on https://github.com/deedy/Deedy-Resume
\ProvidesClass{jonas-cv}
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[hidelinks]{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode,fontawesome5}
\usepackage{enumitem}

% Small textbullets
\newcommand{\smalltextbullet}[1]{{\footnotesize\textbullet{#1}}}

% Nice underlines
\usepackage{soul}
\setuldepth{Normal} % Depth of underline (in mm)
\setulcolor{black} % Use to set color for underlines
% Use to underline all hrefs
\newcommand{\hrefU}[2]{\href{#1}{\ul{#2}}}
\newcommand{\hrefUI}[2]{\href{#1}{\ul{#2}\color{headings}\extLinkSymbol}}

% Cite publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Main color definitions
\definecolor{headings}{HTML}{5A5A5A}
\definecolor{subheadings}{HTML}{333333}
\definecolor{primary}{HTML}{2b2b2b} 
% Further colors
\colorlet{firstname}{primary}
\colorlet{lastname}{primary}
\definecolor{date}{HTML}{666666} 
\definecolor{ref}{HTML}{0000ff}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary]{Helvetica Light}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue UltraLight}

% Configure list symbols
\setlist[itemize,1]{label=\faicon{angle-right}, leftmargin=2em} 
\setlist[itemize,2]{label=\faicon{angle-double-right}, leftmargin=1.5em} 

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth
\newcommand{\lastupdated}{\begin{textblock}{60}(155,0)
\color{date}\fontspec{Helvetica Neue Light}\fontsize{8pt}{10pt}\selectfont 
Last Updated on
\today
\end{textblock}}

\newcommand{\leftdetails}[1]{\begin{textblock}{60}(170,5)
\color{date}\fontspec{Helvetica Neue Light}\fontsize{8pt}{10pt}\selectfont 
#1
\end{textblock}}


% Name command
\newcommand{\namesection}[3]{
	\centering{
		\sffamily
		\fontspec{Helvetica Neue UltraLight}\fontsize{40pt}{10cm}\selectfont \color{firstname}#1 
		\fontspec{Helvetica Neue Light}\selectfont \color{lastname}#2
	} \\
	\vspace{5pt}
	\centering{\fontspec{Heiti TC Medium}\fontsize{11pt}{14pt}\selectfont \color{primary}#3}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-10pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}



% FONT AWESOME ICONS

% Utility icon things
\newcommand{\angleRightSymbol}{\faicon{angle-right}}
\newcommand{\angleDoubleRightSymbol}{\faicon{angle-double-right}}
\newcommand{\chevronCircleRightSymbol}{\faicon{chevron-circle-right}}
\newcommand{\arrowRightSymbol}{\faicon{arrow-right}}
\newcommand{\linkSymbol}{\faicon{link}}
\newcommand{\extLinkSymbol}{\faicon{external-link-alt}}

% Specific use case icons
\newcommand{\mailSymbol}{\faicon{paper-plane}}
\newcommand{\locationSymbol}{\faicon{map-marker-alt}}
\newcommand{\infoSymbol}{\faicon{info}}
\newcommand{\linkedinSymbol}{\faicon{linkedin}}
\newcommand{\homepageSymbol}{\faicon{user-circle}}
\newcommand{\mobileSymbol}{\faicon{mobile-alt}}

% CS technologies
\newcommand{\githubSymbol}{\faicon{github}}
\newcommand{\kaggleSymbol}{\faicon{kaggle}}
\newcommand{\gitSymbol}{\faicon{git}}
\newcommand{\angularSymbol}{\faicon{angular}}
\newcommand{\pythonSymbol}{\faicon{python}}
\newcommand{\javaSymbol}{\faicon{java}}

% Icon colors
\definecolor{linkedin}{HTML}{0a66c2}
\definecolor{github}{HTML}{000000}
\definecolor{map-marker-alt}{HTML}{fe7e00}



% Command to create a nice looking link
\newcommand\link[2]{\color{primary}\href{#1}{#2}\color{Black}}

\newcommand{\socialtext}[2]{\mbox{\textcolor{headings}{#1}\hspace{0.5em}#2\hspace{1em}}}
\newcommand{\sociallink}[3]{\mbox{\textcolor{headings}{#1}\hspace{0.5em}\link{#2}{#3}\hspace{1em}}}

\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1}{#1}}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{#1}}     
\newcommand*{\kaggle}[1]{\sociallink{\kaggleSymbol}{https://www.kaggle.com/#1}{#1}}        % Github icon + URL
\newcommand*{\homepage}[1]{\sociallink{\homepageSymbol}{https://#1}{#1}}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}
\newcommand*{\smartphone}[1]{\sociallink{\mobileSymbol}{tel:#1}{#1}}

% Headings command
\titleformat{\section}{\color{headings}
\fontspec{Helvetica Light}\fontsize{16pt}{24pt}\selectfont \raggedright}{} {0em}{}

% Subheadings command 
\titleformat{\subsection}{\color{subheadings}
\fontspec{Helvetica}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{
	\color{subheadings}
	\fontspec{Helvetica}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont
}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\fontspec{Heiti SC Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% subdescription command
\newcommand{\subdescript}[1]{\color{headings}\raggedright\fontspec{Heiti TC Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Section seperators command
\newcommand{\tinysectionsep}[0]{\vspace{4pt}}
\newcommand{\sectionsep}[0]{\vspace{10pt}}
\newcommand{\largesectionsep}[0]{\vspace{14pt}}

% Title definition with fontawesome symbol
\newcommand\sectionTitle[2]{\section*{\texorpdfstring{\faicon{#2}\enspace \uppercase{\textbf{#1}}}{\uppercase{#1}}}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}

% manual tightitemize
\newenvironment{tightitemize}[1]{\vspace{-#1}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}