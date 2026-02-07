# vim的基础配置
1. You should install **vundle** ---a vim-plug-manager, even though it is very old, it is also very useful.
You can use the bash command below.
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. Secondly, you should copy the code into `~/.vimrc`:

```
" =============================================================================
" 1. VIM CORE SETTINGS
" =============================================================================
set nocompatible              " Enable modern Vim features
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype-specific plugins

" --- UI & Visuals ---
set number                    " Show line numbers
set cursorline                " Highlight the current line
set cursorcolumn              " Highlight the current column
set ruler                     " Show cursor position in status bar
set laststatus=2              " Always show status bar
set cmdheight=1               " Command line height
set showmatch                 " Jump to matching bracket
set matchtime=2               " Duration (tenths of a sec) to blink matching bracket
set display+=lastline         " Display as much as possible of the last line
set listchars=tab:»·,trail:·  " Visual markers for tabs and trailing spaces
set wrap                      " Enable line wrapping

" --- Search Settings ---
set ignorecase smartcase      " Case-insensitive search unless uppercase is used
set incsearch                 " Show search results while typing
set hlsearch                  " Highlight all search matches
set nowrapscan                " Do not wrap around the end of file during search

" --- Indentation & Tabs (8-Space Standard) ---
set tabstop=8                 " Number of spaces a Tab counts for
set softtabstop=8             " Number of spaces a Backspace deletes
set expandtab                 " Convert tabs to spaces

" --- File Handling & Encoding ---
set nobackup                  " Disable backup files
set noswapfile                " Disable swap files
set backupcopy=yes            " Overwrite file when saving
set hidden                    " Allow buffer switching without saving
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb18030,latin1

" --- Spell Checking ---
set spelllang=en_us           " Default spell check language


" =============================================================================
" 2. PLUGIN MANAGEMENT (vim-plug)
" =============================================================================
" Auto-install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" --- Core Manager ---
Plug 'junegunn/vim-plug'

" --- UI & Themes ---
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- File Navigation ---
Plug 'preservim/nerdtree'

" --- Editing Tools ---
Plug '907th/vim-auto-save'     " Auto-save on change
Plug 'sirver/ultisnips'        " Snippet engine
Plug 'honza/vim-snippets'      " Snippet collection
Plug 'dense-analysis/ale'      " Asynchronous Linting Engine

" --- Markdown & LaTeX ---
" Post-install hook for Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'

call plug#end()


" =============================================================================
" 3. COLOR SCHEME & APPEARANCE
" =============================================================================
set background=dark
silent! colorscheme jellybeans

" --- Airline Config ---
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1


" =============================================================================
" 4. PLUGIN-SPECIFIC CONFIGURATION
" =============================================================================

" --- NERDTree ---
let g:NERDTreeWinSize = 25
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" --- Vim Auto-Save ---
let g:auto_save = 1
let g:auto_save_silent = 1

" --- VimTeX Configuration ---
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk_engines = {'_': '-xelatex'}
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0  " Do not auto-open quickfix for warnings
set conceallevel=0              " Prevent LaTeX symbols from being hidden

" --- UltiSnips ---
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" --- ALE (Linting) ---
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'c': ['gcc', 'cppcheck'],
\   'cpp': ['gcc', 'cppcheck'],
\   'tex': ['chktex'],
\   'python': ['flake8'],
\}
let g:ale_cpp_cc_options = '-std=c++17 -Wall'


" =============================================================================
" 5. KEY MAPPINGS & FUNCTIONS
" =============================================================================
let mapleader = '\'

" --- General Shortcuts ---
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" --- Basic Auto-pairs ---
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" --- F5: Compile & Run ---
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
" 6. FILETYPE SPECIFIC SETTINGS
" =============================================================================

augroup WritingGroup
    autocmd!
    " Enable wrapping and spell check for prose
    autocmd FileType tex,markdown setlocal wrap linebreak nolist
    autocmd FileType tex,markdown setlocal spell
    " Auto-pair for LaTeX inline math
    autocmd FileType tex,markdown inoremap <buffer> $ $$<Left>
    " VimTeX specific shortcuts
    autocmd FileType tex nnoremap <buffer> <leader>ll :VimtexCompile<CR>
    autocmd FileType tex nnoremap <buffer> <leader>lv :VimtexView<CR>
augroup END

augroup CppGroup
    autocmd!
    autocmd FileType c,cpp setlocal cindent
    autocmd FileType c,cpp inoremap <buffer> #i #include <
augroup END

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
