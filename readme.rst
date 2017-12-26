中南大学学位论文Tex模版
=======================================

项目起源
----------

目前很多大学都接受Latex版式的学位论文，但是中南大学却还是只提供word版本，并且要求比较提交word的文稿。word的文献引用管理比较繁琐，一般利用Endnote等软件以插件的形式往word文稿中插入文献索引。word和Endnote本身是商业软件，很多人本身用的就是盗版。而这样的一种方式往往对计算机的性能要求较高，而各种插件的增加往往会降低人们在使用word的软件进行写作的体验。

Tex是一种非常优秀的排版语言，通过编写Tex源代码，然后使用texlive等开源的编译工具就能够得到精美PDF版本。这样一种编写源代码的写作方式，一般只需要一个编辑器即可，而且源代码能够使用版本控制工具进行修改跟踪。

本项目的目的是为了创建一个能够中南大学研究生（博士）学位论文的Tex模版，开发进度和安排如下：

- Tex模版的创建和完善；
- 对当前的不同大学的Tex编写学位论文的情况进行调查和汇总，并撰写报告；
- 向相关校内相关学位论文管理单位进行反映，以实现Tex的学位论文模版的推广和使用。

1. 支持格式
------------

- 封面
- 声明
- 中文/英文摘要
- 目录
- 页眉和页脚
- 标题字体和字号
- 参考文献引用格式

1.1 封面
````````````````````

重定义了\maketitle, 在使用时请给出全部的相关信息。可进行二次定制，基本套路是先用命令定义新的宏，然后再titlepage里面插入即可。(详细说明请看源代码注释, 见thesisthemecsu.sty).

::

  \titleen      英文论文标题
  \titlecn      中文论文标题
  \priormajor   一级学科
  \minormajor   二级学科
  \supervisor   指导老师
  \thesisdate   年月（请用关键词指定）

声明以上内容，调用\\maketitle.

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
````````````````````
请先定义关键词和分类号，在插入中文摘要环境

::

    \keywordscn{关键词1,关键词2,关键词3}
    \categorycn{分类号}
    \begin{abstractcn}
    \lipsum % 产生随机文本，请自行定义
    \end{abstractcn}
    \keywordsen{keyword1,keyword2,keyword3}
    \categoryen{Classification}
    \begin{abstracten}
    \lipsum % 产生随机文本，请自行定义
    \end{abstracten}

1.3 标题样式
````````````````````
- 一级标题
- 二级标题
- 三级标题
- 四级标题（未定制，不建议采用过多分级）

2. 字体
------------
2.1 字号
````````````````````
字体大小根据pt来定制。

::

    \newcommand{\chuhao}{\fontsize{42.15749pt}{\baselineskip}\selectfont}
    \newcommand{\xiaochuhao}{\fontsize{36.135pt}{\baselineskip}\selectfont}
    \newcommand{\yihao}{\fontsize{28.09749pt}{\baselineskip}\selectfont}
    \newcommand{\xiaoyihao}{\fontsize{24.09pt}{\baselineskip}\selectfont}
    \newcommand{\erhao}{\fontsize{22.08249pt}{\baselineskip}\selectfont}
    \newcommand{\xiaoerhao}{\fontsize{18.06749pt}{\baselineskip}\selectfont}
    \newcommand{\sanhao}{\fontsize{16.06pt}{\baselineskip}\selectfont}
    \newcommand{\xiaosanhao}{\fontsize{15.05624pt}{\baselineskip}\selectfont}
    \newcommand{\sihao}{\fontsize{14.05249pt}{\baselineskip}\selectfont}
    \newcommand{\xiaosihao}{\fontsize{12.045pt}{\baselineskip}\selectfont}
    \newcommand{\wuhao}{\fontsize{10.53937pt}{\baselineskip}\selectfont}
    \newcommand{\xiaowuhao}{\fontsize{9.03374pt}{\baselineskip}\selectfont}
    \newcommand{\liuhao}{\fontsize{7.52812pt}{\baselineskip}\selectfont}
    \newcommand{\xiaoliuhao}{\fontsize{6.52437pt}{\baselineskip}\selectfont}
    \newcommand{\qihao}{\fontsize{5.52061pt}{\baselineskip}\selectfont}
    \newcommand{\bahao}{\fontsize{5.01874pt}{\baselineskip}\selectfont}

3. TODO
------------
- 定制各种封面

4. 常用的Latex技巧
------------------
4.1 在图片上添加注释
````````````````````
方法很多，这里给的是使用overpic这个库。
::


5. 常见问题
------------
5.1 刷新字体
`````````````````
如果字体显示 不正常，或许需要刷新一下。
::
    fc-cache -fv

6. 参考
-------

- [1] https://github.com/latexstudio/CUMCMThesis
- [2] http://www.chinatex.org
- [3] http://www.ctex.org/PackageCTeX/files.xml?action=download&file=ctex.pdf
- [4] http://www.ctex.org/documents/packages/layout/titlesec.pdf