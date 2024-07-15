% Nord CV Class File
%
% This class is modified from the Awesome-CV class by Claud D. Park <posquit0.bj@gmail.com>
% https://github.com/posquit0/Awesome-CV
% 
% Author: Gray Reid 
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{nord-cv}[2024/04/20 Nord Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome5}
\usepackage{academicons}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
% Required for foreachloop
\RequirePackage{pgffor}
% Required for inverting fontawesome icons
\RequirePackage{tikz}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

%-------------------------------------------------------------------------------
%                Rating command
%-------------------------------------------------------------------------------
% Creates a rating bar
% emptysymbol: symbol for empty
% fullsymbol: symbol for full
% ratingvale: rating
% numvalues: maximum rating
\newcommand{\rating}[4]{%
  \def\emptysymbol{#1}%
  \def\fullsymbol{#2}%
  \def\ratingvalue{#3}%
  \def\numvalues{#4}
  \foreach \n in {1,...,\numvalues}{
      \ifnum\n>\ratingvalue\relax
        \emptysymbol\ %
      \else
        \fullsymbol\ %
      \fi
    }
}

\newcommand{\ratingdefault}[1]{
  \rating{\faCircle[regular]}{\faCircle}{#1}{5}
}

%-------------------------------------------------------------------------------
%                External link
%-------------------------------------------------------------------------------
\newcommand{\externallink}[1]{%
  \href{#1}{\color{primary-2}\faExternalLink*}%
}

%-------------------------------------------------------------------------------
%                Mail to
%-------------------------------------------------------------------------------

\newcommand{\mailto}[1]{%
  \href{mailto:#1}{\color{text} {#1} \acvHeaderIconSep \color{primary-2} \faEnvelope}
}

%-------------------------------------------------------------------------------
%                Invert Icon
%-------------------------------------------------------------------------------

% Define a command to invert icon colors within a TikZ drawing
% \invertedicon{icon}{foreground color}{background color}
% - icon: The text or mathematical symbol used as the icon
% - foreground color: The color to be used for the icon
% - background color: The color to be used for the background
\newcommand{\invertedicon}[3]{
  \def\iconcontent{#1}
  \def\foregroundcolor{#2}
  \def\backgroundcolor{#3}
  \tikz[baseline=(icon.base)]{
    \node[inner sep=0pt] (icon) {\iconcontent}; % Draw the icon
    \begin{scope}
      % Setting the clip to ensure it matches the icon's exact area
      \clip (icon.south west) rectangle (icon.north east);
      % Fill the background with the specified background color
      \fill[\backgroundcolor] (icon.south west) rectangle (icon.north east);
      % Redraw the icon with the specified foreground color
      \node[inner sep=0pt, text=\foregroundcolor] at (icon) {\iconcontent};
    \end{scope}
  }
}
%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm, includehead}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
% Nord Theme Color Palette
\definecolor{nord-0}{HTML}{2E3440} % Polar Night
\definecolor{nord-1}{HTML}{3B4252}
\definecolor{nord-2}{HTML}{434C5E}
\definecolor{nord-3}{HTML}{4C566A}
\definecolor{nord-4}{HTML}{D8DEE9} % Snow Storm
\definecolor{nord-5}{HTML}{E5E9F0}
\definecolor{nord-6}{HTML}{ECEFF4}
\definecolor{nord-7}{HTML}{8FBCBB} % Frost
\definecolor{nord-8}{HTML}{88C0D0}
\definecolor{nord-9}{HTML}{81A1C1}
\definecolor{nord-10}{HTML}{5E81AC}
\definecolor{nord-11}{HTML}{BF616A} % Aurora
\definecolor{nord-12}{HTML}{D08770}
\definecolor{nord-13}{HTML}{EBCB8B}
\definecolor{nord-14}{HTML}{A3BE8C}
\definecolor{nord-15}{HTML}{B48EAD}
% dark colors (polar-night)
\colorlet{polar-night-1}{nord-0}
\colorlet{polar-night-2}{nord-1}
\colorlet{polar-night-3}{nord-2}
\colorlet{polar-night-4}{nord-3}
% light colors (snow-storm)
\colorlet{snow-storm-1}{nord-4}
\colorlet{snow-storm-2}{nord-5}
\colorlet{snow-storm-3}{nord-6}
% frost
\colorlet{frost-1}{nord-7}
\colorlet{frost-2}{nord-8}
\colorlet{frost-3}{nord-9}
\colorlet{frost-4}{nord-10}
% Colors (Aurora)
\colorlet{aurora-1}{nord-11}
\colorlet{aurora-2}{nord-12}
\colorlet{aurora-3}{nord-13}
\colorlet{aurora-4}{nord-14}
\colorlet{aurora-5}{nord-15}
% Basic Colors Remap
\colorlet{blue}{frost-2}
\colorlet{red}{aurora-1}
\colorlet{orange}{aurora-2}
\colorlet{yellow}{aurora-3}
\colorlet{green}{aurora-4}
\colorlet{purple}{aurora-5}
% Text colors
\colorlet{darktext}{polar-night-2}
\colorlet{text}{polar-night-3}
\colorlet{graytext}{polar-night-4}
\colorlet{lighttext}{snow-storm-1}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Nord section color
\newcommand*{\sectioncolor}[1]{%
  \ifbool{acvSectionColorHighlight}{{\color{primary-2}#1}}{#1}
}

%for alignment of entries
\def\entryfracL{0.6}
\def\entryfracR{0.4}

% Create a command to update these values:
\newcommand{\updateEntryFractions}[2]{%
  \def\entryfracL{#1}%
  \def\entryfracR{#2}%
}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{32pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1em}\bodyfont\bfseries\color{text}\color{primary-1}{#1}}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{primary-1} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{9pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{9pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headericonstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{text}\color{primary-1}{#1}}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{9pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\sectioncolor{#1}}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entryboldstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{primary-1} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{darktext} #1}}
\newcommand*{\entrypositionstyleL}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{primary-1} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{primary-1} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}


% For determining whether to use a vertical separator for two colum mode
\newtoggle{separatorline}
\togglefalse{separatorline}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
    {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
    {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
    {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's researchgate (optional)
% Usage: \researchgate{<researchgate account>}
%   e.g. https://www.researchgate.net/profile/someone
%        would be \researchgate{someone}
\newcommand*{\researchgate}[1]{\def\@researchgate{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's twitter (optional)
% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\newcommand{\vhrulefill}[1]{%
  \leavevmode\leaders\hrule\@height#1\hfill \kern\z@
}

% Use to draw vertical line with specific thickness
\newcommand{\vvrulefill}[1]{%
  \vrule width #1
}


% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
      {\setlength{\photodim}{1.3cm}}%
      {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
      {\def\@photoborder{polar-night-2}}%
      {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@linkedin}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.linkedin.com/in/\@linkedin}{\color{primary-1} \headericonstyle{\faLinkedin}  \acvHeaderIconSep\color{text}\@linkedin}%
      }%
      %
      \ifthenelse{\isundefined{\@researchgate}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.researchgate.net/profile/\@researchgate}{\color{primary-1}\headericonstyle{\aiResearchGate}  \acvHeaderIconSep\color{text}\@researchgate}%
      }%
      %
      \ifthenelse{\isundefined{\@email}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{mailto:\@email}{\color{primary-1} \headericonstyle{\faEnvelope} \acvHeaderIconSep\color{text}\@email}%
      }%
      %
      \ifthenelse{\isundefined{\@mobile}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \color{primary-1}\headericonstyle{\faPhone}\ \acvHeaderIconSep\color{text}\@mobile%
      }%
      %
      \ifthenelse{\isundefined{\@homepage}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{http://\@homepage}{\color{primary-1}\headericonstyle{\faHome} \acvHeaderIconSep\color{text}\@homepage}%
      }%
      %
      \ifthenelse{\isundefined{\@github}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://github.com/\@github}{\color{primary-1}\headericonstyle{\faGithub} \acvHeaderIconSep\color{text}\@github}%
      }%
      %
      \ifthenelse{\isundefined{\@gitlab}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://gitlab.com/\@gitlab}{\color{primary-1}\headericonstyle{\faGitlab} \acvHeaderIconSep\color{text}\@gitlab}%
      }%
      %
      \ifthenelse{\isundefined{\@stackoverflowid}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://stackoverflow.com/users/\@stackoverflowid}{\color{primary-1} \headericonstyle{\faStackOverflow} \acvHeaderIconSep\@stackoverflowname}%
      }%
      %
      \ifthenelse{\isundefined{\@twitter}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://twitter.com/\@twitter}{\color{primary-1} \headericonstyle{\faTwitter} \acvHeaderIconSep\color{text}\@twitter}%
      }%
      %
      \ifthenelse{\isundefined{\@skype}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \color{primary-1} \headericonstyle{\faSkype}\ \acvHeaderIconSep\color{text}\@skype%
      }%
      %
      \ifthenelse{\isundefined{\@reddit}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.reddit.com/user/\@reddit}{\color{primary-1} \headericonstyle{\faReddit} \acvHeaderIconSep\color{text}\@reddit}%
      }%
      %
      \ifthenelse{\isundefined{\@xing}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.xing.com/profile/\@xing}{\color{primary-1} \headericonstyle{\faXingSquare} \acvHeaderIconSep\color{text}\@xing}
      }%
      %
      \ifthenelse{\isundefined{\@extrainfo}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \@extrainfo%
      }%
    } 
    \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
    {}%
    {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \color{polar-night-3}\vhrulefill{0.9pt}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
    }{%
  \end{center}
}

% Define an entry of cv information
% Usage: \cventryone{<title>}{<location>}{<description>}
\newcommand*{\cventryone}[3]{%
  %\vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\entryfracL\textwidth} R{\entryfracR\textwidth}}
    \entrytitlestyle{#1} & \entrylocationstyle{#2}
    \ifempty{#3}{\\}{
      \\
      \multicolumn{2}{L{\textwidth}}{\justifying\descriptionstyle{#3}} \\
    }
  \end{tabular*}%
}

% Define an entry of cv information
% Usage: \cventryone{<position>}{<date>}{<description>}
\newcommand*{\cventrytwo}[3]{%
  %\vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\entryfracL\textwidth} R{\entryfracR\textwidth}}
    \entrypositionstyle{#1} & \entrydatestyle{#2}
    \ifempty{#3}{\\}{
      \\
      \multicolumn{2}{L{\textwidth}}{\justifying\descriptionstyle{#3}} \\
    }
  \end{tabular*}%
}

% Define an entry of cv information
% Usage: \cventryone{<title>}{<location>}{<position>}{<date>}{<description>}
\newcommand*{\cventrythree}[5]{%
  %\vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\entryfracL\textwidth} R{\entryfracR\textwidth}}
    \entrytitlestyle{#1} & \entrylocationstyle{#2} \\
    \entrypositionstyle{#3} & \entrydatestyle{#4}
    \ifempty{#5}{\\}{
      \\
      \multicolumn{2}{L{\textwidth}}{\justifying\descriptionstyle{#5}} \\
    }
  \end{tabular*}%
}

% Define an entry of cv information
% Usage: \cventryone{<description>}
\newcommand*{\cventryfour}[1]{%
  %\vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\entryfracL\textwidth} R{\entryfracR\textwidth}}
      \multicolumn{2}{L{\textwidth}}{\justifying\descriptionstyle{#1}} \\
  \end{tabular*}%
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} l L{\textwidth * \real{0.9}}}
      }{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  \skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
    \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
      \setlength{\parskip}{0pt}
      \renewcommand{\labelitemi}{\bullet}
      }{%
    \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}

% Main CVTwoColumn environment
\newenvironment{cvmulticolumn}[1]{%
  \begin{minipage}[t]{#1\textwidth}
}{%
  \end{minipage}%
}

\newcommand{\cvnewcolumn}[1]{%
  \end{minipage}%
  \hspace{1em}%
  \iftoggle{separatorline}
  {\color{polar-night-3}\vvrulefill{0.9pt}}
  {}%
  \hspace{1em}%
  \begin{minipage}[t]{#1\textwidth}%
}