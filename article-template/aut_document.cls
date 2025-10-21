% aut_document.cls - AUT Document Class
% Version 1.0 - 2025
% 
% Usage:
% \documentclass[options]{aut_document}
% Options: 12pt (default), 11pt, 10pt

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aut_document}[2025/10/21 AUT Document Class]

% Base class
\LoadClass[a4paper,12pt]{article}

% Required packages
\RequirePackage{ifxetex}
\ifxetex
  % XeLaTeX, do nothing
\else
  \RequirePackage[utf8]{inputenc}
\fi
\RequirePackage[british]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{caption}
\RequirePackage{csquotes}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{eso-pic}
\RequirePackage[colorlinks=true,linkcolor=autorange,citecolor=autorange,urlcolor=autorange]{hyperref}
\RequirePackage[style=apa,backend=biber]{biblatex}

% AUT Orange color
\definecolor{autorange}{RGB}{255,102,0}
\definecolor{autdark}{RGB}{51,51,51}

% Page geometry
\geometry{
    top=0cm,
    bottom=2cm,
    left=2cm,
    right=2cm,
    headheight=3cm,
    headsep=0cm,
    includeheadfoot
}

% --------------------------------------------------
% Font setup - MDPI style
% --------------------------------------------------
\RequirePackage{newtxtext,newtxmath} % Times-like text & math fonts
\renewcommand{\familydefault}{\rmdefault} % Use serif as main family

% Slightly tighter line spacing (MDPI style)
\setstretch{1.15}

% Paragraph formatting
\setlength{\parindent}{0pt}    % No indentation
\setlength{\parskip}{6pt plus 2pt minus 1pt} % Small space between paragraphs

% Line spacing
\setstretch{1.15}
\setlength{\parindent}{15pt}
\setlength{\parskip}{0pt}

% Document metadata commands
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

\newcommand{\@version}{}
\newcommand{\version}[1]{\renewcommand{\@version}{#1}}

\newcommand{\@courseinfo}{}
\newcommand{\courseinfo}[1]{\renewcommand{\@courseinfo}{#1}}

\newcommand{\@covertext}{}
\newcommand{\covertext}[1]{\renewcommand{\@covertext}{#1}}

\newcommand{\@submissionnote}{}
\newcommand{\submissionnote}[1]{\renewcommand{\@submissionnote}{#1}}

\newcommand{\@department}{} 
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}

% Header and footer setup
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{3cm}
\setlength{\headsep}{0.5cm}

% Remove all margins around header
\fancyheadoffset[L,R]{\dimexpr\oddsidemargin+1in\relax}

% Regular page header (with aut_header.pdf) - full bleed
\fancyhead[C]{%
    \raisebox{\dimexpr\headheight-\height}[0pt][0pt]{%
        \includegraphics[width=\paperwidth,height=3.2cm,keepaspectratio=false]{headers/aut_header.pdf}%
    }%
}

% Page number in top right corner
\fancyhead[R]{%
    \raisebox{0.3cm}[0pt][0pt]{%
    }%
}

\fancyfoot[R]{%
    \raisebox{0.3cm}[0pt][0pt]{%
        \makebox[2cm][r]{%
            \textcolor{autorange}{\Large\bfseries\thepage}\hspace{1cm}%
        }%
    }%
}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Front cover page style
\fancypagestyle{frontcover}{%
    \fancyhf{}
    \setlength{\headheight}{6cm}
    \fancyheadoffset[L,R]{\dimexpr\oddsidemargin+1in\relax}
    \fancyhead[C]{%
        \raisebox{\dimexpr\headheight-\height}[0pt][0pt]{%
            \includegraphics[width=\paperwidth,height=13cm,keepaspectratio=false]{headers/aut_frontcover.pdf}%
        }%
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Back cover page style
\fancypagestyle{backcover}{%
    \fancyhf{}
    \setlength{\footskip}{2cm}
    \fancyfootoffset[L,R]{\dimexpr\oddsidemargin+1in\relax}
    \fancyfoot[C]{%
        \raisebox{-\footskip}[0pt][0pt]{%
            \includegraphics[width=\paperwidth,height=13cm,keepaspectratio=false]{headers/aut_backcover.pdf}%
        }%
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Plain style for summary and TOC
\fancypagestyle{plain}{%
    \fancyhf{}
    \setlength{\headheight}{2.5cm}
    \fancyheadoffset[L,R]{\dimexpr\oddsidemargin+1in\relax}
    \fancyhead[C]{%
        \raisebox{\dimexpr\headheight-\height}[0pt][0pt]{%
            \includegraphics[width=\paperwidth,height=2.5cm,keepaspectratio=false]{aut_header.pdf}%
        }%
    }
    \fancyhead[R]{%
        \raisebox{0.3cm}[0pt][0pt]{%
            \makebox[2cm][r]{%
                \textcolor{autorange}{\Large\bfseries\thepage}\hspace{1cm}%
            }%
        }%
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% --------------------------------------------------
% List spacing - MDPI style
% --------------------------------------------------
\setlist[itemize]{topsep=0pt, partopsep=0pt, parsep=0pt, itemsep=0pt, left=2em}
\setlist[enumerate]{topsep=0pt, partopsep=0pt, parsep=0pt, itemsep=0pt, left=2em}

% --------------------------------------------------
% Section formatting - MDPI inspired
% --------------------------------------------------
\titleformat{\section}
  {\normalfont\bfseries\Large\color{autdark}}{\thesection.}{0.5em}{}
\titlespacing*{\section}{0pt}{12pt plus 4pt minus 2pt}{6pt}

\titleformat{\subsection}
  {\normalfont\bfseries\large\color{autdark}}{\thesubsection.}{0.5em}{}
\titlespacing*{\subsection}{0pt}{10pt plus 4pt minus 2pt}{4pt}

\titleformat{\subsubsection}
  {\normalfont\bfseries\normalsize\color{autdark}}{\thesubsubsection.}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{8pt plus 2pt minus 1pt}{2pt}

% Caption formatting
\captionsetup{
    labelfont={bf,color=autdark},
    textfont=normalsize,
    justification=justified,
    singlelinecheck=false
}

% Make front cover
\newcommand{\makefrontcover}{%
    \begin{titlepage}
        \thispagestyle{frontcover}
        \vspace*{5cm}
        
        \begin{center}
            % Title
            {\fontsize{33pt}{36pt}\bfseries\color{autorange}\@title\par}
            \vspace{0.5cm}
            
            % Subtitle (if provided)
            \ifthenelse{\equal{\@subtitle}{}}{}{%
                {\Huge\color{autdark}\@subtitle\par}
                \vspace{0.5cm}
            }
            
            % Version + Date
            \ifthenelse{\equal{\@version}{}}{}{%
                {\large\color{autdark}\@version\hspace{1em}\@date\par}
                \vspace{0.5cm}
            }
            
            \vspace{2cm}
            
            % Cover text section
            {\normalsize\color{autdark}\@covertext\par
                \vspace{1cm}
            }
            
            \vfill
            
            % Author
            {\normalsize\color{autdark}\@author\par
                \vspace{2cm}
            }
        \end{center}
        
    \end{titlepage}
    \pagenumbering{roman}
    \setcounter{page}{1}
}

% Summary environment
\newenvironment{summary}{%
    \clearpage
    \section*{Executive Summary}
    \addcontentsline{toc}{section}{Executive Summary}
}{%
    \clearpage
}

% Back cover command
\newcommand{\makebackcover}{%
    \clearpage
    \thispagestyle{backcover}
    \mbox{}

    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north east,text width=0.8\paperwidth,align=right] at ([xshift=-1cm,yshift=-1cm]current page.north east) {%
        \Large\textcolor{gray}{\@author}\\[2mm]
        \Huge\textcolor{black}{\@department}\\[2mm]
        \fontsize{30pt}{33pt}\bfseries\textcolor{orange}{\bfseries Auckland University of Technology}\\[10mm]
        \normalsize\normalfont Version \@version\\
        \normalsize\ifthenelse{\equal{\@submissionnote}{}}{}{\@submissionnote\\[10mm]}
        \normalsize
        This document was prepared as part of the course requirements at AUT. Any errors are unintentional. References have been properly cited. Feedback or comments are welcome via email.
    };
    \end{tikzpicture}

    \clearpage
}

\newcommand{\startmaincontent}{
    \clearpage
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

% Customize TOC
\renewcommand{\contentsname}{Table of Contents}

% Bibliography setup for APA7
\DeclareLanguageMapping{british}{british-apa}

% Ensure proper date format (British)
\RequirePackage[british]{datetime2}

\endinput