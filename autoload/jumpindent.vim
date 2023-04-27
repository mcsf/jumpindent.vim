" Move the cursor to the closest line matching a certain indentation level.
"
" If `up` is false, the indentation level will be that of the current line; if
" true, it will be one level above. Argument `fwd` determines whether to
" search forward (1) or backward (0).
"
" This assumes that all lines in the buffer are indented consistently;
" specifically, that spaces and tabs are NOT used interchangeably.
function! jumpindent#JumpIndent(up, fwd)
	let currentLine = getline(".")
	let indentChar = currentLine[0]
	let indentLevel = match(currentLine, "\\S")

	let searchPattern = "^"
	while indentLevel > (a:up ? 1 : 0)
		let searchPattern = searchPattern . indentChar
		let indentLevel = indentLevel - 1
	endwhile
	let searchPattern = searchPattern . "\\S"

	" Normal-mode `n` and `N` are preferred over executing `:/` / `:?` because
	" they set jump points.
	let @/ = searchPattern
	if a:fwd
		normal n
	else
		normal 0N
	endif
endfunction
