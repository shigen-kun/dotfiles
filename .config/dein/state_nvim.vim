if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/lin/.config/nvim/init.vim', '/Users/lin/.config/dein/.cache/dein.toml', '/Users/lin/.config/dein/.cache/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/lin/.config/dein'
let g:dein#_runtime_path = '/Users/lin/.config/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/lin/.config/dein/.cache/init.vim'
let &runtimepath = '/Users/lin/.config/nvim,/etc/xdg/nvim,/Users/lin/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/lin/.config/dein/repos/github.com/Shougo/dein.vim,/Users/lin/.config/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime,/Users/lin/.config/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/lin/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/lin/.config/nvim/after'
filetype off
