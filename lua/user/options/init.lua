vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = ""
vim.opt.laststatus = 3
vim.cmd [[set fillchars+=diff:╱]]
-- vim.cmd [[
-- imap _cll console.log();<Esc>==F(a
-- imap _gll console.log();<Esc>==F(a'*****: <Esc>pa', <Esc>a
-- nmap <Leader>ol yiwo_gll<Esc>pviw<Esc>
-- vmap <Leader>ol y<Esc>o_gll<Esc>pviw<Esc>F,vt)
-- function! PrintLog()
--   let l:fType = expand("%:e")
--   if l:fType == 'js'
--     execute "normal yiwo_gll"
--     normal pviw
--   elseif l:fType== 'py'
--     execute "normal yiwoprint()"
--     normal ==F(
--     normal a"
--     normal pa",
--     normal pviw
--   elseif l:fType == 'rs'
--     execute "normal yiwoprintln!();"
--     normal ==F(
--     normal a"
--     normal pa {}",
--     normal pviw
--   elseif l:fType == 'java'
--     execute "normal yiwoSystem.out.println();"
--     normal ==F(
--     normal a"
--     normal pa",
--     normal pviw
--   elseif l:fType == 'php'
--     execute "normal yiwodump();"
--     normal ==F(
--     normal a["
--     normal pa: " =>
--     normal pa]
--     normal bviw
--   endif
-- endfunction

-- map <leader>op :call PrintLog()<CR>
-- ]]
-- vim.opt.timeoutlen = 200

vim.cmd [[
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + g<C-a>
xnoremap - g<C-x>

nmap vv vaw
nnoremap {  {zz
nnoremap }  }zz
nnoremap n  nzz
nnoremap N  Nzz
" nnoremap [c [czz
" nnoremap ]c ]czz
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz
nnoremap [s [szz
nnoremap ]s ]szz
nnoremap cP yap<S-}>p
nnoremap cy "+y
nnoremap cp "+p

"redirect change operations to the black hole register.
" nnoremap c "_c
" nnoremap C "_C

nnoremap Y yg_
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" in insert mode delteting with ctrl-u or ctrl-w can be recovered.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
nnoremap <Leader>xr :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>hH :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls!<CR>
nmap <leader>gd :DiffviewFileHistory %<cr>
nmap <leader>gx :DiffviewClose<cr>
]]
