# vim的基础配置
1. You should install **vundle** ---a vim-plug-manager, even though it is very old, it is also very useful.
You can use the bash command below.
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. Secondly, you should copy the code into `~/.vimrc`:

```
" Vim Standard Settings

" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Enable smart auto-indentation
set smartindent

" Set auto-indentation width to 4 spaces per level
set shiftwidth=4

" Set tab length to 4 spaces
set tabstop=4

" Convert tabs to equivalent spaces
set expandtab

" Delete 4 spaces at a time when pressing backspace
set softtabstop=4

" Do not create backup files when overwriting
set nobackup

" Automatically switch current directory to the directory of the current file
set autochdir

" Set backup behavior to overwrite
set backupcopy=yes

" Ignore case in searches, but respect case when search term has uppercase
set ignorecase smartcase

" Disable re-searching from the start/end when reaching file boundaries
set nowrapscan

" Show search results as you type
set incsearch

" Highlight search matches
set hlsearch

" Briefly jump to matching bracket when inserting brackets
set showmatch

" Duration (in tenths of a second) to jump to matching bracket
set matchtime=2

" Allow switching buffers with unsaved changes (Vim manages the changes)
set hidden

" Set command line height to 1 line
set cmdheight=1

" Highlight the current line
set cursorline

" Highlight the current column
set cursorcolumn

" Enable status bar ruler
set ruler

" Show status bar (default is 1, which doesn't show it)
set laststatus=2

" the setting that is commented out below is because the aspell does not adapt
" to Chinese very well, so sadly, we can only use it in the command line in
" vim :set spell, the opposite command is :set nospell
" set spell

" Enable spell checking, language is American English
set spelllang=en_us

set fileencodings=utf-8,ucs-bom,gbk,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8


" Language settings (not very useful)
" the goal is to make the
" set iminsert=0
" set imsearch=0

" Force switch to English input method when leaving insert mode (entering normal mode)
" autocmd InsertLeave * call system("fcitx-remote -c")


" Be improved, required for modern Vim features
set nocompatible

" Required for Vundle setup
filetype off


" Set the run time path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Markdown preview plugin
Plugin 'iamcco/markdown-preview.nvim'

" Tender color scheme (disabled)
" Plugin 'jacoborus/tender.vim'

" Jellybeans color scheme
Plugin 'nanotech/jellybeans.vim'

" Vim Markdown plugin
Plugin 'plasticboy/vim-markdown'

" VimTeX plugin (disabled)
Plugin 'lervag/vimtex'

" NERDTree
Plugin 'preservim/nerdtree'

" vim auto save
Plugin '907th/vim-auto-save'

" vim airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Required to finish Vundle setup
call vundle#end()
" Required to enable filetype-specific plugins and indentation
filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on


" Configure markdown-preview.nvim auto-start and options
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


" Vim Color Scheme
" If you have Vim >=8.0 or Neovim >= 0.1.5
" if (has("termguicolors"))
" set termguicolors
" endif

" Tender Color Scheme (disabled)
syntax enable
" colorscheme tender

" Jellybeans Color Scheme
colorscheme jellybeans


" Disable Folding in vim-markdown
let g:vim_markdown_folding_disabled = 1


" Enable Mermaid support in markdown-preview.nvim
let g:mkdp_mermaid_path = 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'


" Auto-completion for brackets and symbols
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
" inoremap $ $$<Left>
" inoremap * **<Left>
inoremap < <><Left>
inoremap \| \|\|<Left>

" Enable $ and * auto-completion only in Markdown files
autocmd FileType markdown inoremap <buffer> $ $$<Left>
autocmd FileType markdown inoremap <buffer> * **<Left>
autocmd FileType c inoremap <buffer> " ""<Left>
autocmd FileType cpp inoremap <buffer> " ""<Left>

" Enable LaTeX math block recognition in vim-markdown to avoid syntax highlighting conflicts
let g:vim_markdown_math = 1

filetype plugin indent on
syntax enable

" set leader to be commas
let mapleader = ','

" NERDTrees settings
" mapping
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" show lines of file
let g:NERDTreeFileLines = 1

" setting of vim-auto-save
" enable auto save
let g:auto_save = 1
" no notation
let g:auto_save_silent = 1

" 启用Powerline字体支持
let g:airline_powerline_fonts = 1
" 确保编码兼容
set encoding=utf-8
" 启用Powerline字体支持
let g:airline_powerline_fonts = 1

" 如果仍然有问题，可以尝试使用ASCII符号
" let g:airline_symbols_ascii = 1

" 确保使用UTF-8编码
set encoding=utf-8

let g:airline_theme='tomorrow'
```

3. Last you should use the vimscript below:

```vimscript
# to save the file
:w
# to update your setting
:source %
# to install the plugs
:PluginInstall
```


> some tips: I use the `,` as the leader key, so if we want open the file tree, we can use the key map `,t`
