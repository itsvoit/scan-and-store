\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zpidoc}
\LoadClass{article}

\RequirePackage{abstract}

\RequirePackage{kvoptions}  % Pakiet do obsługi opcji klucz-wartość
\SetupKeyvalOptions{family=zpi, prefix=zpi@}

% Definicje opcji klucz-wartość
\DeclareStringOption[2000]{edition}
\ProcessKeyvalOptions*


\RequirePackage[a4paper,top=1.85cm,left=2.5cm,right=2.5cm,bottom=2cm,headsep = 5mm]{geometry}
%\RequirePackage{pgffor}
\RequirePackage{setspace} 
\onehalfspacing 
\RequirePackage[T1]{fontenc}
%\RequirePackage[lining]{InriaSans}
%\renewcommand*\oldstylenums[1]{{\fontfamily{InriaSans-OsF}\selectfont #1}}

\RequirePackage[sfdefault,light]{FiraSans} %% option 'sfdefault' activates Fira Sans as the default text font
\renewcommand*\oldstylenums[1]{{\firaoldstyle #1}}

%% The font package uses mweights.sty which has som issues with the
%% \normalfont command. The following two lines fixes this issue.
\let\oldnormalfont\normalfont
\def\normalfont{\oldnormalfont\mdseries}
\RequirePackage{etoolbox}
\RequirePackage{ragged2e}
\RequirePackage{babel}
\RequirePackage{pgffor}
\RequirePackage{graphicx}
\RequirePackage{subcaption}

% for icons display
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{mwe}

% citing and urls
\RequirePackage{cite}
\RequirePackage{url}

\renewcommand{\baselinestretch}{1.0}

% header
\RequirePackage{fancyhdr}

%for ORCID formating
% \RequirePackage{hyperref}
% \RequirePackage{orcidlink}
% \newcommand{\orcid}[1]{\textsuperscript{\orcidlink{#1}}}

% Table of Contents
% \RequirePackage{tocloft}

\setlength{\headheight}{17.84526pt}

% Definicja zmiennej title

\def\title#1{\gdef\@title{#1}}
\def\@title{\@latex@error{No \noexpand\title given}\@ehc}

\def\acronym#1{\gdef\@acronym{#1}}
\def\@acronym{\@latex@error{No \noexpand\acronym given}\@ehc}

\def\projectLogo#1{\gdef\@projectLogo{#1}}
\def\@projectLogo{\@latex@error{No \noexpand\projectLogo given}\@ehc}

\def\members#1{\gdef\@members{#1}}
\def\@members{\@latex@error{No \noexpand\members given}\@ehc}

\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}

\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}

\def\techStackIcons#1{\gdef\@techStackIcons{#1}}
\def\@techStackIcons{\@latex@error{No \noexpand\techStackIcons given}\@ehc}

\renewcommand{\headruleskip}{2pt}

\RequirePackage{titlesec}
\RequirePackage{multicol}

\RequirePackage{setspace}

% header for sections
\titleformat{\section}{\normalfont\Large\bfseries\MakeUppercase}{\thesection\hspace*{1em}}{0pt}{}[\hrule]

\newcommand\OnRight[1]{%
  \unskip           % (1)
  \hfill            % (2)
  \penalty100\relax % (3)
  \hspace*{0.5em}%    (4)
  \hspace*{\fill}%    (5)
  \mbox{#1}%          (6)
}

\fancypagestyle{fancy}{
       \fancyhf{} %Clear Everything.
       \fancyfoot[C]{\thepage} %Page Number
       \renewcommand{\headrule}{\vspace*{1mm}\hrule height 1pt}
       % \renewcommand{\footrulewidth}{1pt}
       % \fancyfoot[L]{BOTTOM LEFT}
       % \fancyfoot[R]{BOTTOM RIGHT}
       \fancyhead[C]{ZPI \zpi@edition}
}

\fancypagestyle{title}{
    \fancyhf{} %Clear Everything.
    \fancyhead[C]{
        \Huge 
        Politechnika Wrocławska

        \LARGE
        Wydział Informatyki i Telekomunikacji
    }
    \renewcommand{\headrule}{\vspace*{3mm}\hrule\vspace*{3mm}}
    \fancyfoot[C]{
        \@keywords
        \vspace*{1mm}\hrule
        \begin{center}
            WROCŁAW \zpi@edition
        \end{center}
    }
}

\makeatletter
\renewcommand{\maketitle}{
    \pagestyle{title}
    \newgeometry{bottom=3cm,left=2.5cm,right=2.5cm,top=5cm,headheight=67pt}

    \begin{center}
        \begin{flushleft}
            \Large
            Kierunek: IST
        \end{flushleft}

        \vspace*{5em}

        \Huge
        \textbf{ZESPOŁOWE PRZEDSIĘWZIĘCIE INFORMATYCZNE}

        \vspace*{3em}

        \huge
        \textbf{\@title}

        \vspace*{3em}

        {\setstretch{0.2}\Large
        \foreach \member in \@members{
            \begin{center}
                \member
            \end{center}
        }}

        \vspace*{10mm}

        \Large
        Opiekun pracy: \@supervisor
    \end{center} 

    \pagebreak % end the page
    \restoregeometry
    \pagestyle{fancy} % bring back the fancy style
}

% Dots for sections
% \renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}

% add page break before each new section
\let\oldsection\section
\renewcommand\section{\clearpage\oldsection}

% Numbering of sections depth -> sections below set depth will not have numbering
\setcounter{secnumdepth}{3}
% Table of Contents Depth (ToC)
\setcounter{tocdepth}{2}

\newcommand{\PrintTechStackIcons}{
    \begin{center}
        \foreach \x in \@techStackIcons{
            \includegraphics[width=1.2cm]{icons/\x.pdf}
        }
    \end{center}
}

\makeatother

\setlength{\absleftindent}{0.2cm} 
\setlength{\absrightindent}{0.2cm}
\pagestyle{fancy}