" vim-plug
" https://github.com/junegunn/vim-plug
" :PlugUpdate
call plug#begin('~/.local/share/nvim/plugged')

Plug 'python-mode/python-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jvirtanen/vim-hcl'
Plug 'itspriddle/vim-shellcheck'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim'
Plug 'salkin-mada/openscad.nvim'
Plug 'junegunn/fzf.vim'
" Plug 'davidhalter/jedi-vim'

" pip3 install pynvim black 
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'aklt/plantuml-syntax'

call plug#end()

let g:pymode_options_max_line_length=120
:autocmd BufWritePost *.puml silent !plantuml_browser_preview.py <afile>
