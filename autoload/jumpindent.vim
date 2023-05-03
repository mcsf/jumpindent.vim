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
	let indentLevel = match(currentLine, "\\S") - !! a:up

	let searchPattern = "^" . repeat(indentChar, indentLevel) . "\\S"

	" e: move to the End of the match
	" s: Set the ' mark at the previous location of the cursor
	" W: don't Wrap around the end of the file
	let searchFlags = "esW"
	if ! a:fwd
		" b: search Backward instead of forward
		" z: start searching at the cursor column instead of zero
		let searchFlags = searchFlags . "bz"
	endif

	" Prefer search() over previous methods (`:/` and `normal n`) as this
	" allows us to add to preserve <C-O> / <C-I> behaviour while keeping the
	" user's search register (`let @/`) intact.
	call search(searchPattern, searchFlags)
endfunction
