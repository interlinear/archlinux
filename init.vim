"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/user/config/dein.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/user/config/dein.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" original repos on github
call dein#add('tpope/vim-fugitive')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})
call dein#add('tpope/vim-rails.git')
" vim-scripts repos
call dein#add('L9')
call dein#add('FuzzyFinder')
call dein#add('Python-2.x-Standard-Library-Reference')
call dein#add('Python-3.x-Standard-Library-Reference')
call dein#add('scrooloose/nerdtree')
call dein#add('ack.vim')
"call dein#add('nerdtree-ack')
call dein#add('FindInNERDTree')
call dein#add('Color-Sampler-Pack')
call dein#add('CCTree')
call dein#add('vim-flake8')
call dein#add( 'Tagbar')
call dein#add('The-NERD-Commenter')
call dein#add('jQuery')
" non github repos
call dein#add('command-t')
call dein#add('OpenGLSL')
call dein#add('glsl.vim')
call dein#add('hints_opengl.vim')
call dein#add('Syntastic')
call dein#add('taglist-plus')
call dein#add('Rykka/riv.vim')
call dein#add('rking/ag.vim')
call dein#add('bling/vim-airline')
"call dein#add('davidhalter/jedi-vim')
call dein#add('ervandew/supertab')
call dein#add('avakhov/vim-yaml')
" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax on
colorscheme desert
set number
