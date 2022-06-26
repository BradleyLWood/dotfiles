set termguicolors
colorscheme nord
let g:nord_contrast = v:true
let g:nord_borders = v:true
" Fixes an issue with treesitter playground. This theme has the visual
" highlight and colorline set to the same so I couldn't see which part
" of the line was highlighted.
" This should be nord3_gui_bright but I hard coded it since I couln't 
" figure out how to set it from theme
hi Visual guibg=#616E88

