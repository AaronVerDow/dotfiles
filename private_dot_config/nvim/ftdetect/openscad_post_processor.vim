" Open preview windows on open
au BufRead *.scad silent exec "!openscad-preview <afile> > /dev/null 2>&1 &"

" Close preview windows when quitting
au VimLeave *.scad silent exec "!openscad-preview --kill <afile> > /dev/null 2>&1 &"

" Render output on write
" au BufWritePost *.scad silent exec "!openscad-render <afile> > /dev/null 2>&1 &"
