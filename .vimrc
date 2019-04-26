" General
set number			" Show line numbers
set linebreak			" Break lines at word (requires Wrap lines)
" set showbreak=+++		" Wrap-broken line prefix
set showmatch			" Highlight matching brace
set guifont=Monaco\ 12      	" 设定字体
 
set hlsearch			" Highlight all search results
set smartcase			" Enable smart-case search
set ignorecase			" Always case-insensitive
set incsearch			" Searches for strings incrementally
set nocp			" 关闭vi模式 
set nocompatible		" 取消VI兼容，VI键盘模式不易用 
set history=100	        	" 历史命令保存行数
 
set autoindent			" Auto-indent new lines
set cindent			" Use 'C' style program indenting
set expandtab			" Use spaces instead of tabs
set shiftwidth=4		" Number of auto-indent spaces
set smartindent			" Enable smart-indent
set smarttab			" Enable smart-tabs
set softtabstop=4		" Number of spaces per Tab
set autoread			" 当文件被外部改变时自动读取

" Advanced
set ruler			" Show row and column ruler information
set mouse=a  			"允许使用鼠标点击定位
set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

syntax on			" 打开语法高亮
" colorscheme desert		" 使用配色方案
 
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn      " 设置忽略文件
set lbr				" 不在单词中间折行 
set wrap			" 指定不折行
set formatoptions+=m		" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B		" 合并两行中文时，不在中间加空格
"set cursorline			" 高亮光标所在行  
"set laststatus=2		" 总是显示状态行  
set showcmd			" 在状态栏显示正在输入的命令
set showmode			" 左下角显示当前Vim模式
set showcmd			" 状态栏显示当前执行的命令  
"set cmdheight=2		" 设置命令行高度为2 
set fillchars=vert:\ ,stl:\ ,stlnc:\      " 在被分割的窗口间显示空白，便于阅读
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P       " 命令行（在状态行下）的高度，默认为1，这里是2

" 允许区域选择  
set selection=exclusive  
set selectmode=mouse,key 

  
" 取消自动备份及产生swp文件  
set nobackup  
set nowb  
set noswapfile  
