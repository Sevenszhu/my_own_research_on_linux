# vim的基础配置
1. You should install **vundle** ---a vim-plug-manager, even though it is very old, it is also very useful.
You can use the bash command below.
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. Secondly, you should copy the code into `~/.vimrc`:

```
" =============================================================================
" 1. VIM CORE SETTINGS (基础设置)
" =============================================================================
set nocompatible              " Required for modern Vim features
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype-specific plugins and indentation

" --- UI & Visuals ---
set number                    " Show line numbers
set cursorline                " Highlight the current line
set cursorcolumn              " Highlight the current column
set ruler                     " Enable status bar ruler
set laststatus=2              " Always show status bar
set cmdheight=1               " Command line height
set showmatch                 " Briefly jump to matching bracket
set matchtime=2               " Duration to jump to matching bracket
set display+=lastline         " Show as much as possible of the last line
set listchars=tab:»·,trail:·  " Visual whitespace

" --- Search Settings ---
set ignorecase smartcase      " Case-insensitive unless uppercase is used
set incsearch                 " Show search results as you type
set hlsearch                  " Highlight search matches
set nowrapscan                " Stop searching at the end of file

" --- Indentation & Tabs ---
set smartindent               " Enable smart auto-indentation
set shiftwidth=8              " Indent 4 spaces
set tabstop=8                 " Tab width 8 spaces
set softtabstop=8             " Backspace deletes 4 spaces
set expandtab                 " Convert tabs to spaces

" --- File Handling & Encoding ---
set nobackup                  " No backup files
set backupcopy=yes            " Overwrite original file on save
set hidden                    " Switch buffers without saving
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb18030,latin1

" --- Spell Checking (Global) ---
set spelllang=en_us           " Set spell check to US English


" =============================================================================
" 2. PLUGIN MANAGEMENT (Vundle)
" =============================================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" UI & Themes
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" File Navigation
Plugin 'preservim/nerdtree'

" Editing Tools
Plugin '907th/vim-auto-save'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dense-analysis/ale'

" Markdown & LaTeX
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on


" =============================================================================
" 3. COLOR SCHEME & APPEARANCE (配色与外观)
" =============================================================================
syntax enable
set background=dark
colorscheme jellybeans

" --- Airline Config ---
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1


" =============================================================================
" 4. PLUGIN-SPECIFIC CONFIGURATION (插件详细配置)
" =============================================================================

" --- NERDTree ---
let g:NERDTreeFileLines = 1
let g:NERDTreeWinSize = 25
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" --- Vim Auto-Save ---
let g:auto_save = 1
let g:auto_save_silent = 1

" --- Markdown Preview ---
let g:mkdp_auto_start = 0
let g:mkdp_preview_options = { 'mkit': {}, 'katex': {}, 'uml': {}, 'maid': {} }

" --- Vim Markdown ---
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" --- VimTeX (The Core for LaTeX) ---
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0  " Don't auto-open quickfix on warnings
set conceallevel=0
" let g:tex_conceal = 'abdmg'

" --- UltiSnips ---
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" --- ALE (Syntax Checker) ---
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'c': ['gcc', 'cppcheck'],
\   'cpp': ['gcc', 'cppcheck'],
\   'tex': ['chktex'],
\   'python': ['flake8'],
\}
" Flags for modern C++ (C++17)
let g:ale_cpp_cc_options = '-std=c++17 -Wall'
let g:ale_c_gcc_options = '-std=c11 -Wall'


" =============================================================================
" 5. KEY MAPPINGS & FUNCTIONS (快捷键与核心函数)
" =============================================================================
let mapleader = ','

" --- General Shortcuts ---
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" --- Basic Auto-pairs (Safe version) ---
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" --- F5: ONE-KEY COMPILE & RUN (Smart Function) ---
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -std=c11 -Wall % -o %< && ./%< && rm ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -std=c++17 -Wall -O2 % -o %< && ./%< && rm ./%<"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'tex'
        exec "VimtexCompile"
    endif
endfunc


" =============================================================================
" 6. FILETYPE SPECIFIC SETTINGS (特定文件优化)
" =============================================================================

" --- C/C++ Optimization ---
augroup CppGroup
    autocmd!
    autocmd FileType c,cpp setlocal cindent
    autocmd FileType c,cpp inoremap <buffer> #i #include <
    autocmd FileType c,cpp inoremap <buffer> #d #define
augroup END

" --- LaTeX & Markdown Smooth Writing ---
augroup WritingGroup
    autocmd!
    " Enable soft wrap and spell check
    autocmd FileType tex,markdown setlocal wrap linebreak nolist
    autocmd FileType tex,markdown setlocal spell
    " Stop smartindent, instead, using vimtex's incident
    autocmd FileType tex,markdown setlocal nosmartindent indentexpr=
    " autocmd FileType tex setlocal nosmartindent
    " Math mode shortcuts
    autocmd FileType tex,markdown inoremap <buffer> $ $$<Left>
    " LaTeX specific VimTeX mappings
    autocmd FileType tex nnoremap <buffer> <leader>ll :VimtexCompile<CR>
    autocmd FileType tex nnoremap <buffer> <leader>lv :VimtexView<CR>
    autocmd FileType tex nnoremap <buffer> <leader>lc :VimtexClean<CR>
augroup END

" --- fcitx input method reset (Optional) ---
" autocmd InsertLeave * call system("fcitx-remote -c")
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
