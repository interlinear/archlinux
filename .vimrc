set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

set background=dark

syntax on

" colorsheme
"colorscheme peaksea

" backup rules
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set backup
silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set backupdir=$HOME/.vim/tmp/backup
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
set directory=$HOME/.vim/tmp/swap
silent execute '!mkdir -p $HOME/.vim/tmp/views'
set viewdir=$HOME/.vim/tmp/views

" commandline history
set history=1000

" some weird stuff to make it faster
set nocursorcolumn
set nocursorline

" some interface options
set ruler           " show cursorposition
set showcmd         " display incomplete commands
set incsearch       " incremental searching
set hlsearch        " highlight searchresult
set number          " show linennumbers
set linespace=0
set hidden          " hide buffer even when changed

" filetype
filetype on
filetype plugin on
filetype indent on

" tabstop settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

if has('gui_running')
	" Make shift-insert work like in Xterm
	map <S-Insert> <MiddleMouse>
	map! <S-Insert> <MiddleMouse>
    "set guifont=Monospace\ 11
endif
map <S-Insert> <MiddleMouse>

" make sure you dont change logfiles
augroup readonly_files
	au BufNewFile,BufRead /var/log/* set readonly
	au BufNewFile,BufRead /var/log/* set nomodifiable
augroup END

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle
  "  " required!
Plugin 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Python-2.x-Standard-Library-Reference'
Plugin 'Python-3.x-Standard-Library-Reference'
Plugin 'scrooloose/nerdtree'
Plugin 'ack.vim'
Plugin 'nerdtree-ack'
Plugin 'FindInNERDTree'
Plugin 'Color-Sampler-Pack'
Plugin 'CCTree'
Plugin 'vim-flake8'
"Plugin 'PySmell'
Plugin 'Tagbar'
"Plugin 'SuperTab-continued.'
Plugin 'The-NERD-Commenter'
Plugin 'jQuery'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'OpenGLSL'
Plugin 'glsl.vim'
Plugin 'hints_opengl.vim'
Plugin 'Syntastic'
Plugin 'taglist-plus'
"Plugin 'DirDiff.vim'
Plugin 'Rykka/riv.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'zhaocai/GoldenView.Vim'
"Plugin 'session.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'avakhov/vim-yaml'
" ...

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"source /home/igore/.vimrc.local1

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set softtabstop=4
set shiftwidth=4

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("gui_running")
  set guifont=Monospace:h14::iso8859-1
  "-b&h-lucidatypewriter-medium-r-normal-*-*-140-*-*-m-*-iso8859-1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


set number

"vim config of Vidar

" -----------------------------------------------------------------------------
" | VIM Settings |
" | (see gvimrc for gui vim settings) |
" | |
" | Some highlights: |
" | jj = <esc> Very useful for keeping your hands on the home row |
" | ,n = toggle NERDTree off and on |
" | |
" | ,f = fuzzy find all files |
" | ,b = fuzzy find in all buffers |
" | |
" | hh = inserts '=>' |
" | aa = inserts '@' |
" | |
" | ,h = new horizontal window |
" | ,v = new vertical window |
" | |
" | ,i = toggle invisibles |
" | |
" | enter and shift-enter = adds a new line after/before the current line |
" | |
" | :call Tabstyle_tabs = set tab to real tabs |
" | :call Tabstyle_spaces = set tab to 2 spaces |
" | |
" | Put machine/user specific settings in ~/.vimrc.local |
" -----------------------------------------------------------------------------


set nocompatible

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
"set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
"
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
"set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase


" Colors **********************************************************************
set t_Co=256 " 256 colors
set background=dark
syntax on " syntax highlighting
colorscheme desert "neverland "desert elflord


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120

set laststatus=2        " ls:  always put a status line
set statusline=%([%-n]%y%1*%m%*\ %f%R%)\ %{CurrSubName()}\ %=\ %(%l,%c%V\ %P\ [0x%02.2B]%)
hi User1 term=inverse,bold cterm=bold ctermfg=red ctermbg=white
set maxfuncdepth=1000   " Need more depth for sub names

function! CurrSubName()
      let g:subname = ""
          let g:subrecurssion = 0

              " See if this is a Perl file
              let l:firstline = getline(1)
              if ( l:firstline =~ '#!.*perl' || l:firstline =~'^package ' )
                               call GetSubName(line("."))

                                   endif

                                       return g:subname
                                       endfunction
function! GetSubName(line)
    let l:str = getline(a:line)

      if l:str =~ '^sub'
          let l:str = substitute( l:str, " *{.*", "", "" )
          let l:str = substitute( l:str, "sub *", ": ", "" )
          let g:subname = l:str
          return 1
      elseif ( l:str =~ '^}' || l:str =~ '^} *#' ) && g:subrecurssion == 1
          return -1
      elseif a:line > 2
          let g:subrecurssion = g:subrecurssion + 1
          if g:subrecurssion < 190
              call GetSubName(a:line - 1)
          else
              let g:subname = ': <too deep>'
              return -1
          endif
      else
          return -1
      endif
endfunction



" Line Wrapping ***************************************************************
set wrap "nowrap
set linebreak " Wrap at word


" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @


" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml


" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
"set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
"set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge


" XML stuff ******************************************************************
" XML stuff " Enable indenting for xml files
map <F5> :%s/></>\r</g<enter>:0<enter>=:$<enter>
map <F6> :%s/'/'\r/g<enter>:0<enter>=:$<enter>


" open a file at the last edited location? **********************************
" Vim stores the cursor position of the last edited location for each buffer
" in the '"' register. You can use the following autocmd in your .vimrc or
" .gvimrc file to open a file at the last edited location:
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"set showmatch  " show matches on parens, bracketc, etc.
"set matchpairs+=<:>





" Omni Completion *************************************************************
"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete



" -----------------------------------------------------------------------------
" | Plug-ins |
" -----------------------------------------------------------------------------


" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1' " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2



" -----------------------------------------------------------------------------
" | OS Specific |
" | (GUI stuff goes in gvimrc) |
" -----------------------------------------------------------------------------

" Mac *************************************************************************
"if has("mac")
  ""
"endif

" Windows *********************************************************************
"if has("gui_win32")
  ""
"endif


" Xpath oppsett **************************************************************
" ****************************************************************************
"
autocmd FileType xml :call XMLMappings()

function! XMLMappings()
  :noremap ,xp :call Xpath()<cr>
endfunction

function! Xpath()
 " Needs to get the real file name for the quickfix window
let realname = bufname( "%" )

" Write the buffer to a temp file
let filename = tempname()
let lines = getline( 1 ,"$")
call writefile( lines, filename )

let xpath    = input("Enter xpath expression: ")

let tmp1=&grepprg
let tmp2=&grepformat
set grepformat=%f:%l\ %m
set grepprg=xpath
exe "grep ".escape(filename, ' \')." \"".xpath."\" ".escape(realname, ' \')
let &grepprg=tmp1
let &grepformat=tmp2
endfunction


" -----------------------------------------------------------------------------
" | Startup |
" -----------------------------------------------------------------------------
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l



" -----------------------------------------------------------------------------
" | Host specific |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif
"
" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

"" set pastetoggle=<F2>
"" set clipboard=unnamed


" Mouse and backspace
"" set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
"" let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


" Quicksave command
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"" map <c-j> <c-w>j
"" map <c-k> <c-w>k
"" map <c-l> <c-w>l
"" map <c-h> <c-w>h


" easier moving between tabs
"" map <Leader>n <esc>:tabprevious<CR>
"" map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv  " better indentation
"" vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color neverland "wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
"" filetype off
"" filetype plugin indent on
"" syntax on


" Showing line numbers and length
"" set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=80
"highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"" set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable
set foldmethod=indent
"source /home/igore/.vimrc.local2

if &compatible          " only if not set before:
  set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif

" display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html

" editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode

set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
"set expandtab           " turn a tabs into spaces

set fileformat=unix     " file mode is unix
"set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode


" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif

" paste mode toggle (needed when using autoindent/smartindent)
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" Use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" file type specific settings
if has("autocmd")
  " For debugging
  "set verbose=9

  " if bash is sh.
  let bash_is_sh=1

  " change to directory of current file automatically
  autocmd BufEnter * lcd %:p:h

  " Put these in an autocmd group, so that we can delete them easily.
  augroup mysettings
    au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set cindent shiftwidth=4 softtabstop=4 expandtab
    au FileType tex set wrap shiftwidth=4 softtabstop=4 expandtab

    " Confirm to PEP8
    au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
  augroup END

  augroup perl
    " reset (disable previous 'augroup perl' settings)
    au!

    au BufReadPre,BufNewFile
    \ *.pl,*.pm
    \ set formatoptions=croq smartindent shiftwidth=4 softtabstop=4 cindent cinkeys='0{,0},!^F,o,O,e' " tags=./tags,tags,~/devel/tags,~/devel/C
    " formatoption:
    "   t - wrap text using textwidth
    "   c - wrap comments using textwidth (and auto insert comment leader)
    "   r - auto insert comment leader when pressing <return> in insert mode
    "   o - auto insert comment leader when pressing 'o' or 'O'.
    "   q - allow formatting of comments with "gq"
    "   a - auto formatting for paragraphs
    "   n - auto wrap numbered lists
    "
  augroup END


  " Always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside
  " an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

"set expandtab
set textwidth=79
"set tabstop=4
"set shiftwidth=4
"set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set t_ut=
"match ErrorMsg '\%>79v.+'
highlight OverLength ctermfg=darkred guifg=darkred
"highlight OverLength ctermbg=darkred ctermfg=white
"autocmd FileAppendCmd *.* match OverLength /\%>79v.\+/
match OverLength /\%>79v.\+/
set sessionoptions+=globals,localoptions,resize,winpos

"let g:loaded_youcompleteme = 1
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
