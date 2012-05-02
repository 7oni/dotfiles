set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Wrap Text
set wrap!

let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ExecuteUNIXViewerInForeground = 1

"Spelling german
setlocal spell spelllang=de

"Spelling englisch
"setlocal spell spelllang=en
"http://vimdoc.sourceforge.net/htmldoc/spell.html

if has('mac')
  let g:Tex_ViewRule_pdf='Skim'
  let g:Tex_TreatMacViewerAsUNIX = 1
endif 


filetype plugin indent on
if has('autocmd')
    autocmd filetype python set expandtab
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monaco:h9
    elseif has("gui_win32")
        set guifont=Monaco:h9:cANSI
    endif
endif

if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>

" VIM LATEX
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
set sw=2

" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
set iskeyword+=:
