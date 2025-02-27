\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zpiday}
\LoadClass{article}


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
% for icons display
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{mwe}

% citing urls
\RequirePackage{url}

\renewcommand{\baselinestretch}{1.0}
% header
\RequirePackage{fancyhdr}

\RequirePackage{hyperref}
\RequirePackage{orcidlink}
%for ORCID formating
\newcommand{\orcid}[1]{\textsuperscript{\orcidlink{#1}}}


\setlength{\headheight}{17.84526pt}

\fancypagestyle{fancy}{
       \fancyhf{} %Clear Everything.
       %\fancyfoot[C]{\thepage} %Page Number
       \renewcommand{\headrule}{\vspace*{1mm}\hrule height 1pt}
       % \renewcommand{\footrulewidth}{1pt}
       % \fancyfoot[L]{BOTTOM LEFT}
       % \fancyfoot[R]{BOTTOM RIGHT}
       \fancyhead[C]{ZPI \zpi@edition}
}
\pagestyle{fancy}
% Definicja zmiennej title

\def\title#1{\gdef\@title{#1}}
\def\@title{\@latex@error{No \noexpand\title given}\@ehc}

\def\acronym#1{\gdef\@acronym{#1}}
\def\@acronym{\@latex@error{No \noexpand\acronym given}\@ehc}

\def\projectLogo#1{\gdef\@projectLogo{#1}}
\def\@projectLogo{\@latex@error{No \noexpand\projectLogo given}\@ehc}

\def\members#1{\gdef\@members{#1}}
\def\@members{\@latex@error{No \noexpand\members given}\@ehc}

\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}

\def\projectDescription#1{\gdef\@projectDescription{#1}}
\def\@projectDescription{\@latex@error{No \noexpand\projectDescription given}\@ehc}

\def\techStackIcons#1{\gdef\@techStackIcons{#1}}
\def\@techStackIcons{\@latex@error{No \noexpand\techStackIcons given}\@ehc}

\def\techStackDescription#1{\gdef\@techStackDescription{#1}}
\def\@techStackDescription{\@latex@error{No \noexpand\techStackDescription given}\@ehc}

\def\roadMap#1{\gdef\@roadMap{#1}}
\def\@roadMap{\@latex@error{No \noexpand\roadMap given}\@ehc}

\def\and{~\textbullet~}%
\renewcommand{\headruleskip}{2pt}
%\RequirePackage{showframe}

\RequirePackage{titlesec}
\RequirePackage{multicol}

\titleformat{\section}{\normalfont\Large\bfseries\MakeUppercase}{\thesection\hspace*{1em}}{0pt}{}[\hrule]

\newcommand\OnRight[1]{%
  \unskip           % (1)
  \hfill            % (2)
  \penalty100\relax % (3)
  \hspace*{0.5em}%    (4)
  \hspace*{\fill}%    (5)
  \mbox{#1}%          (6)
}

\makeatletter
\renewcommand{\maketitle}{
    \begin{center}
        \noindent\begin{tabular}{p{2cm}p{11.2cm}p{2cm}}
      \parbox{2cm}{ \includegraphics[width=2cm]{\@projectLogo} } 
    & \parbox{11.2cm}{\centering \textbf{\Huge\@acronym \\\vspace*{2mm} \LARGE{\@title} } } & \parbox{2cm}{\includegraphics[width=2cm]{images/ZPI-Day-cmyk.pdf}}
        \end{tabular}       
    \end{center} 
    \hrule 
    \vspace*{0.05em}
    {\begin{flushleft}\large 
    \textbf{\TheMembers}:  
        {\@members} \\\vspace*{0.5em} \textbf{\TheSupervisor:} \@supervisor 
    \end{flushleft}}\hrule\vspace*{0.2em}
}

% Headers

\newcommand{\TheSupervisor}{%
    \iflanguage{polish}{Opiekun}{Supervisor}%
}

\newcommand{\TheMembers}{%
    \iflanguage{polish}{Autorzy}{Autors}%
}

\newcommand{\TheDescription}{%
    \iflanguage{polish}{Opis projektu}{Project description}%
}

\newcommand{\TheTechStackHeader}{%
    \iflanguage{polish}{Technologie}{Tech Stack}%
}

\newcommand{\TheRoadMap}{%
    \iflanguage{polish}{Mapa drogowa}{The Roadmap}%
}

% New headers

\newcommand{\TheIntroductionHeader}{
    \iflanguage{polish}{Wstęp}{Introduction}
}

\newcommand{\TheProblemCharacteristicsHeader}{
    \iflanguage{polish}{Characterystyka problemu}{Problem characteristics}
}

\newcommand{\TheGoalHeader}{
    \iflanguage{polish}{Cel}{Goal}
}

\newcommand{\TheBenefitsHeader}{
    \iflanguage{polish}{Korzyści biznesowe i techniczne}{Business and technical benefits}
}

\newcommand{\TheRelatedWorksHeader}{
    \iflanguage{polish}{Powiązane prace}{Related works}
}

\newcommand{\TheRelatedWorksDescriptionHeader}{
    \iflanguage{polish}{Opis}{Description}
}

\newcommand{\TheProjectAssumptionsHeader}{
    \iflanguage{polish}{Założenia projektu}{Project assumptions}
}

\newcommand{\TheResultsHeader}{
    \iflanguage{polish}{Wyniki}{Results}
}

\newcommand{\TheSummaryHeader}{
    \iflanguage{polish}{Podsumowanie}{Summary}
}

\newcommand{\TheFunctionalitiesHeader}{
    \iflanguage{polish}{Funkcjonalności}{Functionalities}
}

\newcommand{\TheSolutionHeader}{
    \iflanguage{polish}{Rozwiązanie}{The Solution}
}

\newcommand{\TheBusinessGoalsHeader}{
    \iflanguage{polish}{Cele biznesowe}{Business goals}
}

\newcommand{\TheTechnicalGoalsHeader}{
    \iflanguage{polish}{Cele techniczne}{Technical goals}
}

\newcommand{\TheAdditionalHighlightsHeader}{
    \iflanguage{polish}{Pozostałe uwagi}{Additional highlights}
}

\newcommand{\TheConclusionsHeader}{
    \iflanguage{polish}{Podsumowanie}{Conclusions}
}

\newcommand{\TheFurtherResearchHeader}{
    \iflanguage{polish}{Przyszłe kierunki rozwoju}{Further research}
}

\newcommand{\TheAcknowledgmentsHeader}{
    \iflanguage{polish}{Podziękowania}{Acknowledgments}
}

\newcommand{\PrintTechStackIcons}{
    \begin{center}
        \foreach \x in \@techStackIcons{
            \includegraphics[width=1.2cm]{icons/\x.pdf}
        }
    \end{center}
}

\makeatother

\RequirePackage{abstract}

\setlength{\absleftindent}{0.2cm} 
\setlength{\absrightindent}{0.2cm}
\RequirePackage{cite}