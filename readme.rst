A theme for the thesis of Central South University
--------------------------------------------------

1. 支持格式
===========

- 封面
- 声明
- 中文/英文摘要
- 目录
- 页眉和页脚
- 标题字体和字号
- 参考文献引用格式

1.1 封面
------------------

重定义了\maketitle, 在使用时请给出全部的相关信息。可进行二次定制，基本套路是先用命令定义新的宏，然后再titlepage里面插入即可。(详细说明请看源代码注释, 见thesisthemecsu.sty).

::
  \\titleen      英文论文标题
  \\titlecn      中文论文标题
  \\priormajor   一级学科
  \\minormajor   二级学科
  \\supervisor   指导老师
  \\thesisdate   年月（请用关键词指定）

::
\documentclass{ctexart}
\usepackage{ctex}
\usepackage{thesiscsu}

\titleen{This is the english title}
\titlecn{中文论文标题}

\priormajor{一级学科}
\minormajor{二级学科或三级学科名称}

\author{天花板}
\supervisor{一个教授}

\thesisdate{year=2017,month=5}

\begin{document}
\maketitle
\setcounter{page}{0}

\end{document}

1.2 中文/英文摘要
----------------
请先定义关键词和分类号，在插入中文摘要环境

::
\keywordscn{关键词1,关键词2,关键词3}
\categorycn{分类号}
\begin{abstractcn}
\lipsum % 产生随机文本，请自行定义
\end{abstractcn}

::
\keywordsen{keyword1,keyword2,keyword3}
\categoryen{Classification}
\begin{abstracten}
\lipsum % 产生随机文本，请自行定义
\end{abstracten}

1.3 标题样式

- 一级标题
- 二级标题
- 三级标题
- 四级标题（未定制，不建议采用过多分级）

2. TODO

- 定制各种封面
