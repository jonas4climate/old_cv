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

% Nice underlines
\usepackage{soul}
\setuldepth{Normal}
% Use to underline all hrefs
\newcommand{\hrefU}[2]{\href{#1}{\ul{#2}}}

% Cite publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
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
		\fontspec{Helvetica Neue UltraLight}\fontsize{40pt}{10cm}\selectfont #1 
		\fontspec{Helvetica Neue Light}\selectfont #2
	} \\
	\vspace{5pt}
	\centering{ \color{headings}\fontspec{Heiti TC Medium}\fontsize{11pt}{14pt}\selectfont #3}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-10pt}
}

\newcommand{\namesectionnorule}[3]{
    \centering{
        \sffamily
        \fontspec{Helvetica Neue UltraLight}\fontsize{40pt}{10cm}\selectfont #1 
        \fontspec{Helvetica Neue Light}\selectfont #2
    } \\
    \vspace{5pt}
    \centering{ \color{headings}\fontspec{Heiti TC Medium}\fontsize{11pt}{14pt}\selectfont #3}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Font Awesome icons aliases, many more could be added here
\newcommand{\angleDoubleRightSymbol}{\faicon{angle-double-right}}
\newcommand{\chevronCircleRightSymbol}{\faicon{chevron-circle-right}}
\newcommand{\arrowRightSymbol}{\faicon{arrow-right}}
\newcommand{\mailSymbol}{\faicon{paper-plane}}
\newcommand{\locationSymbol}{\faicon{map-marker-alt}}
\newcommand{\infoSymbol}{\faicon{info}}
\newcommand{\linkedinSymbol}{\faicon{linkedin}}
\newcommand{\homepageSymbol}{\faicon{user-circle}}
\newcommand{\mobileSymbol}{\faicon{mobile-alt}}
\newcommand{\githubSymbol}{\faicon{github}}
\newcommand{\gitSymbol}{\faicon{git}}
\newcommand{\angularSymbol}{\faicon{angular}}
\newcommand{\pythonSymbol}{\faicon{python}}
\newcommand{\javaSymbol}{\faicon{java}}

% Command to create a nice looking link
\newcommand\link[2]{\color{primary}\href{#1}{#2}\color{Black} }

% Render a text with its symbol
% Usage; \socialtext{<icon>}{<label>}
\newcommand{\socialtext}[2]{\mbox{\textcolor{headings}{#1}\hspace{0.5em}#2\hspace{1em}}}

% Render a link with its symbol
% Usage; \sociallink{<icon>}{<label>}
\newcommand{\sociallink}[3]{\mbox{\textcolor{headings}{#1}\hspace{0.5em}\link{#2}{#3}\hspace{1em}}}

% Render author's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}

% Render author's infos
% Usage: \infos{<infos>}
\newcommand*{\infos}[1]{\socialtext{\infoSymbol}{#1}}

% Render author's linked-in
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{http://www.linkedin.com/in/#1}{linkedin.com/in/#1}}

% Render author's github
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://www.github.com/#1}{github.com/#1}}           % Github icon + URL

% Render author's homepage
% Usage: \homepage{<web-URL>}
\newcommand*{\homepage}[1]{\sociallink{\homepageSymbol}{https://#1}{#1}}

% Render author's email
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\sociallink{\mailSymbol}{mailto:#1}{#1}}

% Render author's mobile phone 
% Usage: \smartphone{<mobile phone number>}
\newcommand*\smartphone[1]{\socialtext{\mobileSymbol}{#1}}    

% Headings command
\titleformat{\section}{\color{headings}
\fontspec{Helvetica Light}\fontsize{16pt}{24pt}\selectfont \raggedright}{} {0em}{}

% Subheadings command
\titleformat{\subsection}{\color{subheadings}
\fontspec{Helvetica}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{subheadings}
\fontspec{Helvetica}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\fontspec{Heiti SC Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{\color{headings}\raggedright\fontspec{Heiti TC Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Section seperators command
\newcommand{\tinysectionsep}[0]{\vspace{4pt}}
\newcommand{\sectionsep}[0]{\vspace{10pt}}
\newcommand{\largesectionsep}[0]{\vspace{14pt}}

% Title definition with fontawesome symbol
\newcommand\sectionTitle[2]{\section*{\texorpdfstring{\faicon{#2}\enspace \uppercase{#1}}{\uppercase{#1}}}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}

% manual tightitemize
\newenvironment{tightitemize}[1]{\vspace{-#1}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}