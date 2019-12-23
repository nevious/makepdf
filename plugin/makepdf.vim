" make PDF from markdown
function MakePdf()
	let mdFile = expand('%:p')
	let outFile = substitute(l:mdFile, '.md$', '.pdf', 'g')
	let outFile = substitute(l:outFile, ' ', '_', 'g')
	let fileName = fnameescape(l:mdFile)
	execute 'make -f ~/.config/make/Makefile pdf markdown_file="' . l:fileName . '"' . ' outfile="' . l:outFile . '"'
endfunction

function ViewPdf()
	let mdFile = expand('%:p')
	let outFile = substitute(l:mdFile, '.md$', '.pdf', 'g')
	let outFile = substitute(l:outFile, ' ', '_', 'g')
	call system('make -f ~/.config/make/Makefile view outfile="'. l:outFile . '"')
endfunction

command! Makepdf call MakePdf() | redraw!
command! Viewpdf call ViewPdf() | redraw!
