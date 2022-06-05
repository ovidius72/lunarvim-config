vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = ""
vim.opt.laststatus = 3
vim.cmd [[set fillchars+=diff:╱]]
vim.cmd [[
imap _cll console.log('');<Esc>==F(a
imap _gll console.log('');<Esc>==F(f'a*****: <Esc>pa (<Esc>"%pa:<C-r>=line(".")<Esc>)<Esc>f'a, <Esc>
imap _gll console.log('');<Esc>==F(f'a*****: <Esc>pa (<Esc>"%pa:<C-r>=line(".")<Esc>)<Esc>f'a, <Esc>
imap _gllFull console.log('');<Esc>==F(f'a*****: <Esc>pa (<C-r>=expand("%:p")<cr><Esc>"%pa:<C-r>=line(".")<Esc>)<Esc>f'a, <Esc>
imap _gllFull console.log('');<Esc>==F(f'a*****: <Esc>pa (<C-r>=expand("%:p")<cr><Esc>"%pa:<C-r>=line(".")<Esc>)<Esc>f'a, <Esc>
nmap <Leader>ol yiwo_gll<Esc>pviw<Esc>
nmap <Leader>oL yiwo_gllFull<Esc>pviw<Esc>
nmap <Leader>or yiwo_gll<Esc>i{<Esc>pa}<Esc>viw<Esc>
vmap <Leader>ol y<Esc>o_gll<Esc>pviw<Esc>F,vt)
function! PrintLog()
  let l:fType = expand("%:e")
  if l:fType == 'js'
    execute "normal yiwo_gll"
    normal pviw
  elseif l:fType== 'py'
    execute "normal yiwoprint()"
    normal ==F(
    normal a"
    normal pa", 
    normal pviw
  elseif l:fType == 'rs'
    execute "normal yiwoprintln!();"
    normal ==F(
    normal a"
    normal pa {}", 
    normal pviw
  elseif l:fType == 'java'
    execute "normal yiwoSystem.out.println();"
    normal ==F(
    normal a"
    normal pa", 
    normal pviw
  elseif l:fType == 'php'
    execute "normal yiwodump();"
    normal ==F(
    normal a["
    normal pa: " => 
    normal pa]
    normal bviw
  endif
endfunction

map <leader>op :call PrintLog()<CR>
]]
