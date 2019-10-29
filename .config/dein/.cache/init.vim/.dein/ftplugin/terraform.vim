""
" @section Introduction,introduction
" @order introduction configuration features mappings
" @all
" This plugin allow autocompletion for terraform, and it require "+ruby", check using |if_ruby|

""
" @section Configuration, configuration
" let g:syntastic_terraform_tffilter_plan = 0
"
" Enable tffilter linter to use validate(0) or plan(1)

""
" @section Features, features
" 1. Resource Completion
" 2. Data Completion
" 3. Block Completion
" 4. Attribute Completion
" 5. Variable Completion
" 6. Module Completion


setlocal omnifunc=terraformcomplete#Complete

if !exists('g:syntastic_terraform_checkers')
    let g:syntastic_terraform_checkers = ['tffilter', 'terraform_validate', 'tflint']
endif

if !exists('g:terraform_completion_keys')
    let g:terraform_completion_keys = 0
endif

if !exists('g:terraform_registry_module_completion')
		let g:terraform_registry_module_completion = 1
endif

if !exists('g:terraform_versions_config')
	let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
	let res = {}
	for i in readfile(s:path . "/../.tfcompleterc")
		let res[split(i, "=")[0]] = split(i, "=")[1]
	endfor

	if filereadable(".tfcompleterc")
		for i in readfile(".tfcompleterc")
			let res[split(i, "=")[0]] = split(i, "=")[1]
		endfor
	endif

	let g:terraform_versions_config = res
end


if g:terraform_completion_keys

""
" @section Mappings,mappings
" "<C-K>" (Ctrl-K) will show doc of the current attribute/argument in vim
"
" "<C-L>" (Ctrl-L) will jump to declaration of the resource/data/variable
"
" "<leader>a" will look up the current attribute data given that there is
" terraform.tfstate
"
" "<leader>o" will open the current resource/data on a browser
"
" "<leader>rr" to run terraform plan(async for neovim/vim 8, non-async for
" vim)
	augroup TerraformCompleteKeys
		noremap <buffer><silent> <C-K> :call terraformcomplete#GetDoc()<CR>
		noremap <buffer> <C-L> :call terraformcomplete#JumpRef()<CR>
		noremap <buffer><silent> <Leader>a :call terraformcomplete#LookupAttr()<CR>
		noremap <buffer><silent> <Leader>o :call terraformcomplete#OpenDoc()<CR>
	augroup END

	if has('nvim')
		silent! map <unique> <buffer> <Leader>rr :call terraformcomplete#NeovimRun()<CR>
	elseif v:version >= 800
		silent! map <unique> <buffer> <Leader>rr :call terraformcomplete#AsyncRun()<CR>
	else
		silent! map <unique> <buffer> <Leader>rr :call terraformcomplete#Run()<CR>
	end

endif
