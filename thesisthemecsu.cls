%
% 本模版根据中南大学研究生学位论文撰写规范创建
% 参考源：http://gra.its.csu.edu.cn/yjsy/pygl/wjtzxq54858_3_6.html
% 论文内容一般应由十一个主要部分组成，依次为：
% 1.封面、扉页；
% 2.学位论文原创性声明和版权使用授权书；
% 3.中文摘要；
% 4.英文摘要；
% 5.目录；
% 6.符号说明（必要时）；
% 7.论文正文；
% 8.参考文献；
% 9.附录（必要时）；
% 10.攻读博（硕）士学位期间主要研究成果；
% 11.致谢。
% 

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{csuphdthesis}
              [2017/05/19 v1.0 Standard LaTeX document class]
\ProcessOptions\relax
%% Loading Class
\LoadClass[a4paper,12pt]{article}
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{csuphdthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% 相关宏包 %
% ------------------------------------%
% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
% 自定义关键词
\RequirePackage{pgfkeys}
% 设置目录
\RequirePackage{titletoc}
% 设置字体
\RequirePackage{fontenc}
% 设置颜色
\RequirePackage{xcolor}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% 设置标题格式
\RequirePackage{titlesec}
% 超链接 hyperref 的设置
\RequirePackage{hyperref}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
% 首行缩进
\RequirePackage{indentfirst}
% jing: ccaption宏包不能出现在caption宏包之后
% 设置中英文标题
\RequirePackage{ccaption}
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
\RequirePackage{enumitem}

% % 下划线 
% \RequirePackage{ulem}
% % 尺寸计算
% \RequirePackage{calc}

% 页面布局 %
% -------------------------------------------------------%
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}
\renewcommand*{\baselinestretch}{1.38}

% 设置字体 %
% -------------------------------------------------------%
\setmainfont{Times New Roman}
\setmonofont{Courier New}
\setsansfont{Arial}
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
}
% 每行缩进两个汉字
\setlength\parindent{2em}

%  中文标题名称
\newcommand*{\csu@cap@contentsname}{目录}
\newcommand*{\csu@cap@listfigurename}{插图清单}
\newcommand*{\csu@cap@listtablename}{附表清单}
\newcommand*{\csu@cap@refname}{参考文献}
\newcommand*{\csu@cap@indexname}{索引}
\newcommand*{\csu@cap@figurename}{图}
\newcommand*{\csu@cap@tablename}{表}
\newcommand*{\csu@cap@appendixname}{附录}
\newcommand*{\csu@cap@abstractname}{摘要}
 %%%  中文关键字
\newcommand*{\csu@cap@keywordsname}{关键字}

% 定制titlepage
% 定义命令和定义相应的宏。

% 1. 封面、扉页%
%-----------------------------------------------------------------------------------------------------------%

% 封面 %
% -------------------------------------------------------------%
% 学位论文封面格式分为公开学位论文（学术学位）、公开学位论文（专业学位）、涉密学位论文（学术学位）、涉密学位论文（专业学位）等四种形式（具体见样例1-4）。
% 封面正面上填写论文题名、学科专业（一级学科或专业学位类别）、学科方向或专业领域、作者姓名、指导教师姓名等内容。在书脊上方印“博（或硕）士学位论文”，下方印“中南大学”。
% 涉密学位论文须在封面右上角标注密级、定密日期，由校保密办公室审批、盖章。

% jing: 以下定义封面相关命令和相应的宏，以titleen为例，\titleen为实际在源码中使用的命令，一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏，而改宏能够在后续的环境中使用。
\newcommand*{\titleen}[1]{\gdef\@titleen{#1}} % 英文标题
\newcommand*{\titlecn}[1]{\gdef\@titlecn{#1}} % 中文标题
\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}} % 一级学科
\newcommand*{\minormajor}[1]{\gdef\@minormajor{#1}} % 二级学科
\newcommand*{\interestmajor}[1]{\gdef\@interestmajor{#1}} % 研究方向，关键词组
\newcommand*{\department}[1]{\gdef\@department{#1}} % 研究方向，关键词组
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}} % 导师
\newcommand*{\subsupervisor}[1]{\gdef\@subsupervisor{#1}} % 副导师

% 论文日期
% 采用key-value对的方式来制定存储信息的pgf路径
\pgfkeys{/thesisdate/pgf/.cd, % 定义pgf路径
    year/.store in = \year, % 指定关键词year的存储位置为\year
    month/.store in = \month % 指定关键词month的存储位置为\month
}
% 利用上述的pgf的key-value定制论文日期命令
\newcommand{\thesisdate}[1] {
    \pgfkeys{/thesisdate/pgf/.cd,#1} % 指定使用/thesisdate/pgf/.cd来解释参数，然后在后文能直接使用存储位置来指定解释的内容
    \gdef\@thesisdate{\year{} 年 \month{} 月} % 将构建好的日期存储到宏（\@thesisdate）中
}

% 以下为公开学位论文（学术）的封面内容
% TODO: 
% - 公开学位论文（专业）
% - 涉密学位论文（学术）
% - 涉密学位论文（专业）
% 重定义\maketitle实现封面的重新绘制
% TODO:
% - 调整不同内容的间距
\newcommand{\makecoverpage} {
    % \begin{titlepage} % 一下内容的字体和字号已经校对，但是各种段落间距有待修改
    % {
        \thispagestyle{empty}
    {
        \centering
        {\zihao{-2} \heiti 博士学位论文 \par} % 小二号黑体
        \vspace{2cm} % 两个空行
        {\zihao{2} \heiti \@titlecn \par} % 二号黑体
        {\zihao{-3} \@titleen \par} % 小二号，timesnewroman
        \vspace{2cm} % 两个空行
        {
            \zihao{3} \songti
            \begin{tabular}{p{2.5cm}p{6cm}}
                学科专业 & \@priormajor \\
                \\
                学科方向 & \@minormajor \\
                \\
                作者姓名 & \@author \\
                \\
                指导教师 & \@supervisor \\
            \end{tabular}
        }
        \vfill
        {
            \centering
            {\centering \zihao{-3} \songti 中\ 南\ 大\ 学 \par} 
            {\centering \zihao{-3} \songti \@thesisdate \par}
        }
    % }
    }
    % \end{titlepage}
}

% 扉页 %
% -------------------------------------------------------------%
% 公开、涉密学位论文扉页采用统一格式，一律不带密级栏，分为学术学位、专业学位两种格式（具体见样例5-6）。
% 扉页除包含封面正面的全部内容外，还应包括中图分类号、UDC、学校代码、学位类别（专业学位或学术学位）、副题名（必要时）、研究方向、二级培养单位、副指导教师（必要时）、以及论文答辩日期和答辩委员会主席等内容。
% 中图分类号（http://www.ztflh.com/）和UDC号（《国际十进位分类法》）可在图书馆查阅获得

\newcommand{\maketitlepage} {
    \begin{tabular}{p{2.5cm}p{3cm}p{4cm}p{2cm}p{3cm}}
        中图分类号 & \rule[-2pt]{2.0cm}{0.5pt} & & 学校代码 & \rule[-2pt]{2.0cm}{0.5pt} \\ 
        UDC & \rule[-2pt]{2.0cm}{0.5pt} & & 学术类别 & \rule[-2pt]{2.0cm}{0.5pt} \\ 
    \end{tabular}
    {
        % jing: 注意centering的使用，只在局部环境中使用。
        \centering
        \par
        \vspace{1cm} % 两个空行
        {\zihao{-2} \heiti 博士学位论文 \par} % 小二号黑体
        \vspace{1cm} % 两个空行
        {\zihao{2} \heiti \@titlecn \par} % 二号黑体
        {\zihao{-3} \@titleen \par} % 小二号，timesnewroman
        \vspace{1.5cm} % 两个空行
        {
            \zihao{3} \songti
            \begin{tabular}{p{10cm}}
                作\ 者\ 姓\ 名：\ \@author \\
                学\ 科\ 专\ 业：\ \@priormajor \\
                学\ 科\ 方\ 向：\ \@minormajor \\
                研\ 究\ 方\ 向：\ \@interestmajor \\
                二级培养单位：\ \@department \\
                指\ 导\ 教\ 师：\ \@supervisor \\
                副指导教师：\ \@subsupervisor \\
            \end{tabular}
        }
        \par
        \vspace{1cm}
        \begin{tabular}{p{3cm}p{2cm}p{1cm}p{3cm}p{2cm}}
            论文答辩日期 & \rule[-2pt]{2.0cm}{0.5pt} & & 答辩委员会主席 & \rule[-2pt]{2.0cm}{0.5pt} \\ 
        \end{tabular}
    }
    \par
    \vfill
    {
        \centering
        {\centering \zihao{-3} \songti 中\ 南\ 大\ 学 \par} 
        {\centering \zihao{-3} \songti \ \ \ \ 年\ \ \ \ 月 \par}
    }
    % 中 南 大 学 （小三号宋体）
    % 年    月 （小三号宋体，填阿拉伯数字）
}
% 2. 原创性声明和学位论文版权使用授权书 %
% -------------------------------------------------------------%
%% 单独设一页，排在扉页后
% 声明内容
% 未知字号，此处参考中文论文标题
\newcommand{\announcement}{
    {\centering \zihao{2} \heiti 学位论文原创性声明 \par} % 未知字号，参考中文论文标题
    \vspace{0.5cm}
    {\zihao{4} 本人郑重声明，所呈交的学位论文是本人在指导教师指导下进行的研究工作及取得的研究成果。尽我所知，除了论文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得中南大学或其他教育机构的学位或证书而使用过的材料。与我共同工作的同志对本研究所作的贡献均已在论文中作了明确的说明。\par
    申请学位论文与资料若有不实之处，本人承担一切相关责任。\par
    \vspace{0.5cm}
    作者签名：\rule[-2pt]{2.0cm}{0.5pt} \ 日期：\rule[-2pt]{1.0cm}{0.5pt}年\rule[-2pt]{1.0cm}{0.5pt}月   \rule[-2pt]{1.0cm}{0.5pt}日 \par
    }
    \vspace{2cm}
    {\centering \zihao{2} \heiti 学位论文版权使用授权书 \par} % 未知字号，参考中文论文标题
    \vspace{0.5cm}
    {\zihao{4} 本学位论文作者和指导教师完全了解中南大学有关保留、使用学位论文的规定：即学校有权保留并向国家有关部门或机构送交学位论文的复印件和电子版；本人允许本学位论文被查阅和借阅；学校可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用复印、缩印或其它手段保存和汇编本学位论文。\par
    保密论文待解密后适应本声明。\par
    \vspace{0.5cm}
    \begin{tabular}{ll} % 表格环境用于设置签名，如果需要将实际内容定义进来，请在此定制
      作者签名：\rule[-2pt]{2.0cm}{0.5pt} & 指导教师签名:\rule[-2pt]{2.0cm}{0.5pt} \\
      日期：\rule[-2pt]{1.0cm}{0.5pt}年\rule[-2pt]{1.0cm}{0.5pt}月\rule[-2pt]{1.0cm}{0.5pt}日 & 日期：\rule[-2pt]{1.0cm}{0.5pt}年\rule[-2pt]{1.0cm}{0.5pt}月\rule[-2pt]{1.0cm}{0.5pt}日 \\
    \end{tabular}
    }
}

% 3. 中文摘要 %
% -------------------------------------------------------------%
% 中文摘要格式具体见样例8，居中打印论文题名（三号黑体），换行顶格编排“摘要”（四号黑体）及摘要内容（四号宋体），每段开头空二格。摘要内容后下换行顶格编排“关键词”和“分类号”（四号黑体）。每篇论文应选取3-8个关键词，每一关键词之间用分号分开，最后一个关键词后不打标点符号。
%
\newcommand*{\keywordscn}[1]{\gdef\@keywordscn{#1}} % 中文关键词
\newcommand*{\categorycn}[1]{\gdef\@categorycn{#1}} % 中文分类
\newenvironment{abstractcn} { % 定义中文摘要环境
    {\zihao{3} \heiti \centering \@titlecn} % 论文标题， 三号黑体，居中
    \par
    \vspace{0.7766cm}
    % 1磅＝25.4/72≈0.353毫米
    % 22磅 = 0.766厘米
    \noindent {\zihao{4} \heiti 摘要}:\zihao{4}\songti\noindent % 摘要为四号黑体，内容为四号宋体
} {
    \par
    \vspace{1cm}
    \begin{flushleft}
        \noindent {\zihao{4} \heiti 关键词}: {\zihao{4} \songti \@keywordscn} \par % 关键词为四号黑体，内容为四号宋体
        \noindent {\zihao{4} \heiti 分类号}: {\zihao{4} \songti \@categorycn} \par % 分类号为四号黑体，内容为四号宋体
    \end{flushleft}
}

% 4. 英文摘要 %
% -------------------------------------------------------------%
% 英文摘要格式和内容与中文摘要相对应，另起一页，具体见样例9。居中打印论文英文题名（三号Times New Roman字体），换行顶格编排“Abstract”及英文摘要内容（四号Times New Roman字体），摘要内容每段开头留四个字符空格。摘要内容后下换行顶格编排“Keywords”和“Classification”。
% 定义英文摘要，字体全部为timesnewroman
\newcommand*{\keywordsen}[1]{\gdef\@keywordsen{#1}} % 英文关键词
\newcommand*{\categoryen}[1]{\gdef\@categoryen{#1}} % 中文分类
\newenvironment{abstracten} { % 新建英文摘要环境
    {\zihao{3} \centering \@titleen \par} % 三号标题
    \vspace{0.7766cm}
    \noindent {\zihao{4} \textbf{Abstract}}:\zihao{4}\noindent
} {\normalfont
    \par
    \vspace{1cm}    
    \noindent {\zihao{4} \textbf{Keywords}}: {\zihao{4} \@keywordsen} \par
    \noindent {\zihao{4} \textbf{Classification}}: {\zihao{4} \@categoryen} \par
}

% 5. 目录 %
% --------------------------------------------------------%
% 目录应列出论文的大标题、一级和二级节标题，逐项标明页码（具体见样例10）。各级标题应简明扼要、点出各部分主要内容。学位论文的页码编排为：正文和后置部分用阿拉伯数字编连续码，前置部分用罗马数字单独编连续码（封面除外）。

% “目录”两字居中（三号黑体），下空两行为章、节、小节及其开始页码（靠右顶格）。章、节、小节分别以阶梯式排列：1（第1章）、1.1、1.1.1依次标出。章、节、小节的题名与页码之间用“．．．．．．”连接。除“目录”两字外，其余字体均为小四号宋体。

% TODO %
% 此处还需要对文章标题设置 %
% 论文主体部分可根据需要划分为不同数量的章、节、小节，章、节、小节编号全部顶格排，编号与标题之间空1个字的间隙。
% 章的标题占2行，正文另起行，空2个字起排，回行时顶格排。
% 正文采用小四号宋体、标准字间距。正文及各级标题一律采用固定行间距20pt(磅)。

\setcounter{secnumdepth}{3}
\titleformat{\section}{\centering\zihao{4}\heiti}{第\,\thesection\,章}{1em}{}
\titleformat{\subsection}{\zihao{-4}\heiti}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\zihao{-4}\songti}{\thesubsubsection}{1em}{}
\titlecontents{section}
              [0.0em]
              {\zihao{-4} \songti}
              {第\,\thecontentslabel\,章\hspace{1em}}
              {}
              {\hfill\contentspage}

\titlecontents{subsection}
    [3.6em]
    {\zihao{-4} \songti} % note that 3.8 = 1.5 + 2.3
    {\contentslabel{2.2em}}
    {\hspace*{-3.2em}}
    {\titlerule*[1pc]{.}\contentspage}

\titlecontents{subsubsection}
    [5.8em]
    {\zihao{-4} \songti} % note that 3.8 = 1.5 + 2.3
    {\contentslabel{3.0em}}
    {\hspace*{-3.2em}}
    {\titlerule*[1pc]{.}\contentspage}

% 6. 符号说明（必要时）%
% ---------------------------------------------------------%
% TODO: 
%
% 如果论文中使用了大量的物理量符号、标志、缩略词、专门计量单位、自定义名词和术语等，应编写成注释说明汇集表，说明论文中所用符号所表示的意义及单位（或量纲）。若上述符号和缩略词使用数量不多，可以不设专门的注释说明汇集表，仅在论文中出现时加以说明。
% “符号说明”四字居中（三号黑体）。


% 7. 论文正文 %
% -------------------------------------------------------%
% 论文正文是主体，主体部分应从另页右页开始，每一章应另起页。一般由序号标题、文字叙述、图、表格和公式等五个部分构成。
% 写作形式可因研究内容的性质不同而变化，一般可包括绪论（或综述）、理论分析、计算方法、实验装置和测试方法、实验结果分析和讨论、研究成果、结论及意义等。
% 该部分由用户编写

% 图表等浮动环境设置 %
% ----------------------------------------------------------%
% TODO %
% 图、表、公式：文中的图、表、附注、公式一律采用阿拉伯数字分章（或连续）编号，如：图2-5，表3-2，公式（5-1）等。
% 图序及图名居中置于图的下方，如果图中含有几个不同部分，应将分图号标注在分图的左上角，并在图解下列出各部分内容。图中的术语、符号、单位等应与正文表述所用一致。
% 表序及表名置于表的上方，表中参数应标明量和单位的符号。表的编排应采用国际通用的三线表。续表均应重复表头，如表需转页接排，随后各页应重复表的编号，其后跟表题（可省略）和“续”置于表上方。
% 图序及图名、表序及表名采用五号楷体字。若图或表中有附注，采用英文小写字母顺序编号，附注写在图或表的下方。公式的编号用括号括起写在右边行末，其间不加虚线。
% 图、表、公式等与正文之间要有一定的行间距。 
% \RequirePackage{caption}
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.tif}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}
% 插图格式
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour,bf}, % 图的字体, 宋体小四
	position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 表格格式
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour,bf}, % 表的字体, 宋体小四
	position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}

% 列表环境设置 %
% ------------------------------------------------------------------%
% \RequirePackage{listings}
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 表格 %
% ------------------------------------------------------%
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\csu@oldtabular\tabular
\let\csu@endoldtabular\endtabular
\renewenvironment{tabular} {
    \bgroup
	\renewcommand{\arraystretch}{1.38}
    \csu@oldtabular
} {
    \csu@endoldtabular\egroup
}

% 数学环境, 定理等设置 %
% -------------------------------------------------------%
\newtheorem{definition}{\csu@cap@definition}
\newtheorem{theorem}{\csu@cap@theorem}
\newtheorem{lemma}{\csu@cap@lemma}
\newtheorem{corollary}{\csu@cap@corollary}
\newtheorem{assumption}{\csu@cap@assumption}
\newtheorem{conjecture}{\csu@cap@conjecture}
\newtheorem{axiom}{\csu@cap@axiom}
\newtheorem{principle}{\csu@cap@principle}
\newtheorem{problem}{\csu@cap@problem}
\newtheorem{example}{\csu@cap@example}
\newtheorem{proof}{\csu@cap@proof}
\newtheorem{solution}{\csu@cap@solution}

% 数学定理相关的常量
\newcommand*{\csu@cap@definition}{定义}
\newcommand*{\csu@cap@theorem}{定理}
\newcommand*{\csu@cap@lemma}{引理}
\newcommand*{\csu@cap@corollary}{推论}
\newcommand*{\csu@cap@assumption}{假设}
\newcommand*{\csu@cap@conjecture}{猜想}
\newcommand*{\csu@cap@axiom}{公理}
\newcommand*{\csu@cap@principle}{定律}
\newcommand*{\csu@cap@problem}{问题}
\newcommand*{\csu@cap@example}{例}
\newcommand*{\csu@cap@proof}{证明}
\newcommand*{\csu@cap@solution}{解}

% 8. 参考文献 %
% ------------------------------------------------------%
% TODO %
% 文后参考文献只列出作者直接阅读过、在正文中被引用过的文献资料，务必实事求是。参考文献一律列在正文的末尾，不得放在各章之后。人文社科类学位论文中不宜用文后参考文献列出的注释可采用页下注，包括对学位论文中某些关键词句、论点的详细说明。在引用别人的科研成果时，应在引用处加以说明，遵循学术道德规范，严禁论文抄袭、剽窃等学术不端行为。
% 参考文献可以采用顺序编码制组织，也可以按“著者-出版年”制组织。建议按顺序编码制，即按中文引用的顺序将参考文献附于文末。作者姓名写到第三位，余者写“，等”或“，et al.”。“参考文献”四字居中(三号黑体)，空一行左起按顺序依次列出参考文献，将序号置于方括号内(如[1])，用小四号宋体字，所有符号均用半角编排。
% 目前采用bgt7714-2005标准进行文献索引，详见gbt7714-2005.bst.

% 9. 附录（必要时）%
% -------------------------------------------------------%
% TODO %
% 附录中主要列入正文内不便列出的过分冗长的公式推导，供查读方便所需的辅助性数学工具或表格、重复性数据图表、计算程序及说明等。附录依次为附录1，附录2……等，“附录X”三字居中（三号黑体）。附录中的图表公式另编排序号，与正文分开。

% 10. 攻读学位期间主要研究成果 %
% --------------------------------------------------------%
% 分类按时间顺序列出作者在攻读学位期间取得的与学位论文相关的研究成果，含参加的研究项目、获奖情况、专利、专著、发表学术论文（含正式录用论文）等,书写格式参照参考文献格式。“攻读学位期间主要研究成果”字体居中（三号黑体）

% 11. 致谢 %
% 作者对给予指导、各类资助和协助完成研究工作以及提供各种对论文工作有利条件的单位及个人表示感谢。“致谢”二字居中（三号黑体）。

% 篇眉和页码要求 %
% ---------------------------------------------------------%
% 篇眉从正文开始至全文结束，采用宋体五号字左起书写“博（或硕）士学位论文”，靠右写章标题。
% 页码从正文开始至全文结束按阿拉伯数字连续编排，前置部分（如学位论文原创性声明和版权使用授权书、中文摘要、英文摘要、目录、符号说明等）用罗马数字分别单独编排。页码位于页面底端，居中书写。
\pagestyle{fancy}
\fancyhf{} % 清空原有格式
\fancyhf[ROH,REH]{\small\leftmark} % 设置所有（奇数和偶数）右侧页眉
\fancyhf[LEH,LOH]{中南大学博士学位论文} % 设置所有（奇数和偶数）左侧页眉
\fancyhf[CEF,COF]{\thepage} % 所有（奇数和偶数）中间页脚

\endinput