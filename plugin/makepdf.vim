" make PDF from markdown
function MakePdf()
	let mdFile = expand('%:p')
	let outFile = substitute(l:mdFile, '.md$', '.pdf', 'g')
	let outFile = substitute(l:outFile, ' ', '_', 'g')
	let fileName = fnameescape(l:mdFile)
	let sys_call = printf('make -f %s pdf markdown_file="%s" outfile="%s"', s:makepdf_makefilepath, l:fileName, l:outFile)
	call system(l:sys_call)
endfunction

function ViewPdf()
	let mdFile = expand('%:p')
	let outFile = substitute(l:mdFile, '.md$', '.pdf', 'g')
	let outFile = substitute(l:outFile, ' ', '_', 'g')
	let sys_call = printf('make -f %s view outfile="%s"', s:makepdf_makefilepath, l:outFile)
	call system(l:sys_call)
endfunction

let s:makepdf_makefilepath='~/.config/nvim/plugins/makepdf/plugin/Makefile'
command! MakepdfNoRedraw call MakePdf()
command! ViewpdfNoRedraw call ViewPdf()
command! Makepdf call MakePdf() | redraw!
command! Viewpdf call ViewPdf() | redraw!
