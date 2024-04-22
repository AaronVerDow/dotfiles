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
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'cuducos/yaml.nvim'

" Plug 'davidhalter/jedi-vim'

" pip3 install pynvim black 
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'aklt/plantuml-syntax'

" :CocInstall coc-pyright
" :CocInstall coc-sql

let g:ale_fixers = {'json': ['fixjson'],}

let g:ale_fix_on_save = 1

call plug#end()

let g:shfmt_fmt_on_save = 1
let g:shfmt_extra_args = '-i 4 -bn -ci -sr'

let g:pymode_options_max_line_length=120
:autocmd BufWritePost *.puml silent !plantuml_browser_preview.py <afile>

autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

" Open preview windows on open
au BufRead *.scad silent exec "!/home/averdow/bin/openscad-preview <afile> > /dev/null 2>&1 &"

" Close preview windows when quitting
au VimLeave *.scad silent exec "!/home/averdow/bin/openscad-preview --kill <afile> > /dev/null 2>&1 &"

" Press enter to autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

set autoindent expandtab tabstop=4 shiftwidth=4

lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "vim", 
        "python",
        "bash",
        "arduino",
        "cmake",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "gnuplot",
        "go",
        "haskell",
        "html",
        "htmldjango",
        "http",
        "java",
        "javascript",
        "jq",
        "json",
        "markdown",
        "nix",
        "passwd",
        "perl",
        "php",
        "pem",
        "r",
        "regex",
        "ruby",
        "rust",
        "sql",
        "ssh_config",
        "typescript",
        "yaml",
    },
    higlight = {
        enable = true
    }
}
EOF
