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



2. 新建文件自动插入文件头

```bash
" 定义函数 SetTitle，自动插入文件头
func! SetTitle()
    " 插入文件头
    call setline(1, "/*************************************************************************")
    call append(1, " * @File Name: ".expand("%"))
    call append(2, " * @Description: ")
    call append(3, " * @Author: SevensZhu")
    call append(4, " * @Created Time: ".strftime("%c"))
    call append(5, " ************************************************************************/")
 
    " 根据文件类型插入不同的代码
    let filetype = expand("%:e")
    if filetype == 'c'
        call append(6, "#include <stdio.h>")
        call append(7, "#include <stdlib.h>")
        call append(8, "")
        call append(9, "int main(void)")
        call append(10, "{")
        call append(11, "    return 0;")
        call append(12, "}")
        call append(13, "")
    elseif filetype == 'cpp' || filetype == 'cc'
        call append(6, "#include <iostream>")
        call append(7, "#include <string>")
        call append(8, "#include <algorithm>")
        call append(9, "#include <list>")
        call append(10, "#include <vector>")
        call append(11, "#include <set>")
        call append(12, "#include <map>")
        call append(13, "#include <memory>")
        call append(14, "#include <functional>")
        call append(15, "")
        call append(16, "using namespace std;")
        call append(17, "")
        call append(18, "int main()")
        call append(19, "{")
        call append(20, "    return 0;")
        call append(21, "}")
        call append(22, "")
    endif
 
    normal G " 新建文件后，自动定位到文件末尾
    w        " 自动保存插入的文件头，w为小写。
endfunc
 
" 当创建新的文件时自动调用 SetTitle 函数
autocmd BufNewFile * call SetTitle()
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

   
