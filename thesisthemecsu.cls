\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cumcmthesis}
              [2017/05/19 v1.0
 Standard LaTeX document class]
\ProcessOptions\relax
%% Loading Class
\LoadClass[a4paper,12pt]{article}
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
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
% % 设置标题格式
% \RequirePackage{titlesec}
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
% %% 调整间隔, 让表格更好看些
% \RequirePackage{bigstrut}
% %% 在跨行表格中输入定界符
% \RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% % 设置代码环境
% \RequirePackage{listings}
% % 首行缩进
% \RequirePackage{indentfirst}
% % 设置浮动体的标题
% \RequirePackage{caption}
% % 定制列表环境
% \RequirePackage{enumitem}
% % 下划线 
% \RequirePackage{ulem}
% % 尺寸计算
% \RequirePackage{calc}

% 页面布局
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}
\renewcommand*{\baselinestretch}{1.38}
% 设置字体
\setmainfont{Times New Roman}
\setmonofont{Courier New}
\setsansfont{Arial}
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}
% 每行缩进两个汉字
\setlength\parindent{2em}
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
% \let\mcm@oldtabular\tabular
% \let\mcm@endoldtabular\endtabular
% \renewenvironment{tabular}%
% 	{\bgroup%
% 	\renewcommand{\arraystretch}{1.38}%
% 	\mcm@oldtabular}%
% 	{\mcm@endoldtabular\egroup}

% % 数学环境, 定理等设置
% \newtheorem{definition}{\mcm@cap@definition}
% \newtheorem{theorem}{\mcm@cap@theorem}
% \newtheorem{lemma}{\mcm@cap@lemma}
% \newtheorem{corollary}{\mcm@cap@corollary}
% \newtheorem{assumption}{\mcm@cap@assumption}
% \newtheorem{conjecture}{\mcm@cap@conjecture}
% \newtheorem{axiom}{\mcm@cap@axiom}
% \newtheorem{principle}{\mcm@cap@principle}
% \newtheorem{problem}{\mcm@cap@problem}
% \newtheorem{example}{\mcm@cap@example}
% \newtheorem{proof}{\mcm@cap@proof}
% \newtheorem{solution}{\mcm@cap@solution}

% % 数学定理相关的常量
% \newcommand*{\mcm@cap@definition}{定义}
% \newcommand*{\mcm@cap@theorem}{定理}
% \newcommand*{\mcm@cap@lemma}{引理}
% \newcommand*{\mcm@cap@corollary}{推论}
% \newcommand*{\mcm@cap@assumption}{假设}
% \newcommand*{\mcm@cap@conjecture}{猜想}
% \newcommand*{\mcm@cap@axiom}{公理}
% \newcommand*{\mcm@cap@principle}{定律}
% \newcommand*{\mcm@cap@problem}{问题}
% \newcommand*{\mcm@cap@example}{例}
% \newcommand*{\mcm@cap@proof}{证明}
% \newcommand*{\mcm@cap@solution}{解}
% %  中文标题名称
% \newcommand*{\mcm@cap@contentsname}{目录}
% \newcommand*{\mcm@cap@listfigurename}{插图清单}
% \newcommand*{\mcm@cap@listtablename}{附表清单}
% \newcommand*{\mcm@cap@refname}{参考文献}
% \newcommand*{\mcm@cap@indexname}{索引}
% \newcommand*{\mcm@cap@figurename}{图}
% \newcommand*{\mcm@cap@tablename}{表}
% \newcommand*{\mcm@cap@appendixname}{附录}
% \newcommand*{\mcm@cap@abstractname}{摘要}
%  %%%  中文关键字
% \newcommand*{\mcm@cap@keywordsname}{关键字}

% 定制titlepage
% 定义命令和定义相应的宏。
% 以titleen为例，\titleen为实际在源码中使用的命令，一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏。
\newcommand*{\titleen}[1]{\gdef\@titleen{#1}}
\newcommand*{\titlecn}[1]{\gdef\@titlecn{#1}}
\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}}
\newcommand*{\minormajor}[1]{\gdef\@minormajor{#1}}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
% 以下为定义key-value对的定义
\pgfkeys{/thesisdate/pgf/.cd, % 定义路径
    year/.store in = \year, % 指定关键词year的存储位置为\year
    month/.store in = \month
}
% 论文日期
\newcommand{\thesisdate}[1] {
    \pgfkeys{/thesisdate/pgf/.cd,#1} % 指定使用/thesisdate/pgf/.cd来解释参数，然后在后文能直接使用存储位置来指定解释的内容
    \gdef\@thesisdate{\year{} 年 \month{} 月} % 将构建好的日期存储到宏（\@thesisdate）中
}
% 重定义\maketitle实现封面的重新绘制
\renewcommand*{\maketitle} {
\begin{titlepage} % 一下内容的字体和字号已经校对，但是各种段落间距有待修改
{ \centering
{\zihao{-2} \heiti 博士学位论文 \par} % 小二号黑体
\vspace{2cm}
{\zihao{2} \heiti \@titlecn \par} % 二号黑体
{\zihao{-3} \@titleen \par} % 小二号，timesnewroman
\vspace{2cm}
{\zihao{3} \songti 学科专业 \@priormajor \par} % 三号宋体
{\zihao{3} \songti 学科方向 \@minormajor \par} % 三号宋体
\vspace{2cm}
{\zihao{3} \songti 作者姓名 \@author \par} % 三号宋体
\vspace{0.5cm}
{\zihao{3} \songti 指导教师 \@supervisor \par} % 三号宋体
\vfill
{\zihao{3} \songti 中南大学 \par} % 三号宋体
{\zihao{-4} \songti \@thesisdate \par} % 日期，小三号宋体
}
\end{titlepage}
}

% 定义中文摘要
\newcommand*{\keywordscn}[1]{\gdef\@keywordscn{#1}} % 中文关键词
\newcommand*{\categorycn}[1]{\gdef\@categorycn{#1}} % 中文分类
\newenvironment{abstractcn} { % 定义中文摘要环境
{\zihao{3} \heiti \centering \@titlecn \par} % 论文标题， 三号黑体，居中
\vspace{2cm}
\noindent {\zihao{4} \heiti 摘要}:\zihao{4}\songti\noindent % 摘要为四号黑体，内容为四号宋体
} {
\vspace{1cm}
\noindent {\zihao{4} \heiti 关键词}: {\zihao{4} \songti \@keywordscn} \par % 关键词为四号黑体，内容为四号宋体
\noindent {\zihao{4} \heiti 分类号}: {\zihao{4} \songti \@categorycn} \par % 分类号为四号黑体，内容为四号宋体
}

% 定义英文摘要，字体全部为timesnewroman
\newcommand*{\keywordsen}[1]{\gdef\@keywordsen{#1}} % 英文关键词
\newcommand*{\categoryen}[1]{\gdef\@categoryen{#1}} % 中文分类
\newenvironment{abstracten} { % 新建英文摘要环境
    {\zihao{3} \centering \@titleen \par} % 三号标题
    \vspace{2cm}
    \noindent {\zihao{4} \textbf{Abstract}}:\zihao{4}\noindent
    }
    {\normalfont
    \par
    \vspace{1cm}
    \noindent {\zihao{4} \textbf{Keywords}}: {\zihao{4} \@keywordsen} \par
    \noindent {\zihao{4} \textbf{Classification}}: {\zihao{4} \@categoryen} \par
}

% 声明内容
% 未知字号，此处参考中文论文标题
\newcommand{\announcement}[1]{
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

% 页眉和页脚
\pagestyle{fancy}
\fancyhf{} % 清空原有格式
\fancyhf[ROH,REH]{\small\leftmark} % 设置所有（奇数和偶数）右侧页眉
\fancyhf[LEH,LOH]{中南大学博士学位论文} % 设置所有（奇数和偶数）左侧页眉
\fancyhf[CEF,COF]{\thepage} % 所有（奇数和偶数）中间页脚

\endinput