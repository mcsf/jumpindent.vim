# jumpindent.vim

Move around using indentation levels:
* move "up" by jumping back to a line of a lower indentation level
* jump "between siblings", i.e. between lines indented at the same level

Assuming a file is properly indented, this allows quick navigation throughout the structure of code in most everyday programming languages and any natural-language lists.

## Installation

Using Vim's built-in package support:

```
mkdir -p ~/.vim/pack/mcsf/start
cd ~/.vim/pack/mcsf/start
git clone https://github.com/mcsf/jumpindent.vim.git
```

Then set up your own keybindings in your `~/.vimrc`:

```
nnoremap <C-S-Left> <Plug>McsfJumpIdentUp
nnoremap <C-S-Up>   <Plug>McsfJumpIdentPrev
nnoremap <C-S-Down> <Plug>McsfJumpIdentNext
```
