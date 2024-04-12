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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Plug 'davidhalter/jedi-vim'

" pip3 install pynvim black 
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'aklt/plantuml-syntax'

" :CocInstall coc-pyright
" :CocInstall coc-sql

call plug#end()

let g:shfmt_fmt_on_save = 1
let g:shfmt_extra_args = '-i 4 -bn -ci -sr'

let g:pymode_options_max_line_length=120
:autocmd BufWritePost *.puml silent !plantuml_browser_preview.py <afile>

" Open preview windows on open
au BufRead *.scad silent exec "!/home/averdow/bin/openscad-preview <afile> > /dev/null 2>&1 &"

" Close preview windows when quitting
au VimLeave *.scad silent exec "!/home/averdow/bin/openscad-preview --kill <afile> > /dev/null 2>&1 &"

set autoindent expandtab tabstop=4 shiftwidth=4
