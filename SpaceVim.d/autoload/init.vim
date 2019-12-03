function! init#before() abort
  let g:vimwiki_global_ext = 1
  let g:vimwiki_ext2syntax = {'.md':'markdown',
                          \ '.mkd':'markdown',
                          \ '.wiki':'media'}
  let g:vimwiki_list = [{'path':'~/documents','syntax':'markdown','ext':'.md'}]

  augroup CPT
    au BufReadPre *.cpt set bin
    au BufReadPre *.cpt set viminfo=
    au BufReadPre *.cpt set noswapfile 
    au BufReadPost *.cpt let $vimpass = inputsecret("Password: ")
    au BufReadPost *.cpt silent '[,']!ccrypt -cb -E vimpass
    au BufReadPost *.cpt set nobin
    au BufWritePre *.cpt set bin
    au BufWritePre *.cpt silent! '[,']!ccrypt -e -E vimpass
    au BufWritePost *.cpt silent! u
    au BufWritePost *.cpt set nobin
  augroup END

endfunction

