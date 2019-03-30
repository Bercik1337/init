syntax on
":echo
map <F7> 5<Up>
map <F8> 5<Down>
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
:echo

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set number
filetype indent on
set incsearch
set hlsearch
"set foldenable          " enable folding
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set viminfo+=n/mnt/dysk/viminfo
""""""""""""""""""""""""""""""""""""""""""
" allows cursor change in tmux mode
"if exists('$TMUX')
"	    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"	        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"	else
"		    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"		        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"		endif
