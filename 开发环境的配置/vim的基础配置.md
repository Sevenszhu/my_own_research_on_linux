# vim的基础配置

1. 基础操作设置	

```bash
    " vim 的标准设置
    syntax on                                 " 自动语法高亮
    set number                                " 显示行号
    set smartindent                           " 智能自动缩进
    set shiftwidth=4                          " 设置自动缩进时，每一级缩进4个空格的宽度
    set tabstop=4                             " 设定 tab 长度为 4
    set expandtab                             " 将tab转换为等量的空格
    set softtabstop=4                         " 按退格键时一次删掉4个空格
    set nobackup                              " 覆盖文件时不备份
    set autochdir                             " 自动切换当前目录为当前文件所在的目录
    set backupcopy=yes                        " 设置备份时的行为为覆盖
    set ignorecase smartcase                  " 搜索时忽略大小写
    set nowrapscan                            " 禁止在搜索到文件两端时重新搜索
    set incsearch                             " 输入搜索内容时就显示搜索结果
    set hlsearch                              " 搜索时高亮显示被找到的文本
    set showmatch                             " 插入括号时，短暂地跳转到匹配的对应括号
    set matchtime=2                           " 短暂跳转到匹配括号的时间
    set hidden                                " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
    set cmdheight=1                           " 设定命令行的行数为 1
    set cursorline                            " 突出显示当前行
    set cursorcolumn                          " 突出当前列
    set ruler                                 " 打开状态栏标尺
    set laststatus=2                          " 显示状态栏 (默认值为 1, 无法显示状态栏)
    colorscheme elflord                       " 设置背景主题
    set iminsert=0
    set imsearch=0

```



2. 根据自己的情况，添加了插件管理器，并且添加了markdown的预览

```bash
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " vim + markdown
    Plugin 'iamcco/markdown-preview.nvim'

    Plugin 'godlygeek/tabular'
    Plugin 'preservim/vim-markdown'

    " theme
    Plugin 'jacoborus/tender.vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    " vim 的标准设置
    syntax on                                 " 自动语法高亮
    set number                                " 显示行号
    set smartindent                           " 智能自动缩进
    set shiftwidth=4                          " 设置自动缩进时，每一级缩进4个空格的宽度
    set tabstop=4                             " 设定 tab 长度为 4
    set expandtab                             " 将tab转换为等量的空格
    set softtabstop=4                         " 按退格键时一次删掉4个空格
    set nobackup                              " 覆盖文件时不备份
    set autochdir                             " 自动切换当前目录为当前文件所在的目录
    set backupcopy=yes                        " 设置备份时的行为为覆盖
    set ignorecase smartcase                  " 搜索时忽略大小写
    set nowrapscan                            " 禁止在搜索到文件两端时重新搜索
    set incsearch                             " 输入搜索内容时就显示搜索结果
    set hlsearch                              " 搜索时高亮显示被找到的文本
    set showmatch                             " 插入括号时，短暂地跳转到匹配的对应括号
    set matchtime=2                           " 短暂跳转到匹配括号的时间
    set hidden                                " 允许在有未保存的修改时切换缓冲区，此时的
    修改由 vim 负责保存
    set cmdheight=1                           " 设定命令行的行数为 1
    set cursorline                            " 突出显示当前行
    set cursorcolumn                          " 突出当前列
    set ruler                                 " 打开状态栏标尺
    set laststatus=2                          " 显示状态栏 (默认值为 1, 无法显示状态栏)
    " colorscheme elflord                       " 设置背景主题
    if (has("termguicolors"))
     set termguicolors
    endif

    colorscheme tender                       " 设置背景主题
    set iminsert=0
    set imsearch=0

    " auto open vim previewer of md
    let g:mkdp_auto_start = 1  " 自动打开预览
    let g:mkdp_theme = 'light'  " 浅色主题

    " 编辑器自身当前行居中（上下各保留 999 行滚动空间，确保当前行居中）
    set scrolloff=999

    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false,
        \ 'disable_filename': 0,
        \ 'toc': {}
        \ }

    " 禁用折叠
    set nofoldenable
    " 高亮数学公式
    let g:vim_markdown_math = 1
```

3. 新的插件

   ```bash
   " vim 的标准设置
       syntax on                                 " 自动语法高亮
       set number                                " 显示行号
       set smartindent                           " 智能自动缩进
       set shiftwidth=4                          " 设置自动缩进时，每一级缩进4个空格的宽度
       set tabstop=4                             " 设定 tab 长度为 4
       set expandtab                             " 将tab转换为等量的空格
       set softtabstop=4                         " 按退格键时一次删掉4个空格
       set nobackup                              " 覆盖文件时不备份
       set autochdir                             " 自动切换当前目录为当前文件所在的目录
       set backupcopy=yes                        " 设置备份时的行为为覆盖
       set ignorecase smartcase                  " 搜索时忽略大小写
       set nowrapscan                            " 禁止在搜索到文件两端时重新搜索
       set incsearch                             " 输入搜索内容时就显示搜索结果
       set hlsearch                              " 搜索时高亮显示被找到的文本
       set showmatch                             " 插入括号时，短暂地跳转到匹配的对应括号
       set matchtime=2                           " 短暂跳转到匹配括号的时间
       set hidden                                " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
       set cmdheight=1                           " 设定命令行的行数为 1
       set cursorline                            " 突出显示当前行
       set cursorcolumn                          " 突出当前列
       set ruler                                 " 打开状态栏标尺
       set laststatus=2                          " 显示状态栏 (默认值为 1, 无法显示状态栏)
   
   " language (没啥卵用)
   "   set iminsert=0
   "   set imsearch=0
   " 退出插入模式（进入普通模式）时，强制切换到英文输入法
   "   autocmd InsertLeave * call system("fcitx-remote -c")
   
       set nocompatible              " be iMproved, required
   filetype off                  " required
   
   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')
   
   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'
   
   " vim-markdown-preview
   Plugin 'iamcco/markdown-preview.nvim'
   
   " vim tender
   " Plugin 'jacoborus/tender.vim'
   
   " vim Jellybean
   Plugin 'nanotech/jellybeans.vim'
   
   " vim markdown
   Plugin 'plasticboy/vim-markdown'
   
   " vimtex
   " Plugin 'lervag/vimtex'
   
   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   
   let g:mkdp_auto_start = 1
   let g:mkdp_preview_options = {
       \ 'mkit': {},
       \ 'katex': {},
       \ 'uml': {},
       \ 'maid': {},
       \ 'disable_sync_scroll': 0,
       \ 'sync_scroll_type': 'middle',
       \ 'hide_yaml_meta': 1,
       \ 'sequence_diagrams': {},
       \ 'flowchart_diagrams': {},
       \ 'content_editable': v:false,
       \ 'disable_filename': 0,
       \ 'toc': {}
       \ }
   
   " vim theme
   " If you have vim >=8.0 or Neovim >= 0.1.5
   " if (has("termguicolors"))
   " set termguicolors
   " endif
   
   " Theme tender
   syntax enable
   " colorscheme tender
   
   " Theme Jellybean
   colorscheme jellybeans
   
   " ban folder
   " 禁用 vim-markdown 的折叠功能
   let g:vim_markdown_folding_disabled = 1
   
   " 启用 markdown-preview.nvim 的 Mermaid 支持
   let g:mkdp_mermaid_path = 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'
   
   " 自动补全
   inoremap ( ()<Left>
   inoremap { {}<Left>
   inoremap [ []<Left>
   " inoremap $ $$<Left>
   " inoremap * **<Left>
   inoremap < <><Left>
   inoremap \| \|\|<Left>
   
   " 只在 Markdown 文件中启用 $ 和 * 的补全
   autocmd FileType markdown inoremap <buffer> $ $$<Left>
   autocmd FileType markdown inoremap <buffer> * **<Left>
   
   " 让 vim-markdown 正确识别 LaTeX 公式块，避免语法高亮冲突
   let g:vim_markdown_math = 1  " 启用数学公式支持
   ```
