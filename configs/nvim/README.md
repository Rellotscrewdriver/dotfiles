# My Neovim Configuration(or my rice)

Hello! This is my personal neovim configuration for Linux with various plugins configured. it evolves as I learn more about neovim and become more proficient in using neovim. <br />
I wouldn't recommend cloning this repo and replace your own config, especially on other platforms since it is being made in mind with linux <br />
Good configurations are personal, built over time with a lot of polish.

## Prerequisites:
install these applications from your package manager
* neovim(obviously)
* ripgrep(for fuzzy finding)

## Installation instructions
* execute install.sh to install it on linux(untested on other platforms)
this will copy the files and install the nerd font.
* restart your terminal(don't open a new tab)
* run `nvim`, it should pop up the lazy plguin installing all of the plugins
* type `TSinstall [rust] [go]` to install syntax hightlighting
* type `Mason` to find and install language servers and see [server configuration.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) on how to setup language server. the settings should go in lua/cmp/servers.lua

## Plugins
<details><summary><b>List of plugins</b></summary>

| Plugin            | Usage          |
|-------------------|--------------- |
| [Lazy](https://github.com/folke/lazy.nvim)      | Plugin Management         |
| [hrsh7th](https://github.com/hrsh7th) + [lspconfig](https://github.com/neovim/nvim-lspconfig)     | AutoCompletion         |
| [Mason](https://github.com/williamboman/mason.nvim)     | Portable Server Manager |
| [Trouble](https://github.com/folke/trouble.nvim)    | Code overview |
| [LSP Saga](https://github.com/glepnir/lspsaga.nvim)     | Code docs, outline |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | buffer management |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | for fuzzy finding files and projects|
| [Code Runner](https://github.com/CRAG666/code_runner.nvim)| for running one file code quickly |
| [Alpha](https://github.com/goolord/alpha-nvim)| for dashboard |
| [impatient](https://github.com/lewis6991/impatient.nvim) | for improving starting time |
| [Cmake-tools](https://github.com/Civitasv/cmake-tools.nvim) | for CMake integration |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | for git integration|
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | GUI notifications |
| [startuptime](https://github.com/dstein64/vim-startuptime) | checking startuptime|
| [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer | 

aand many more!(you can just look at lua/plugins.lua to see all the plugins)
</details>


## Preview
<details><summary><b>UI Demos</b></summary>

For more UI demos, check [here](https://github.com/Rellotscrewdriver/nvim/issues/1).

### Start screen with alpha-nvim

<p align="center">
<img src="https://user-images.githubusercontent.com/50903223/231488139-3ae65662-a0b5-4ae9-aab8-021dc8dcc451.png" width="800">
</p>

### Code autocompletion with nvim-cmp

<p align="center">
<img src="https://user-images.githubusercontent.com/50903223/231488112-dba3fdfb-07a3-49c6-9226-ad666c88f0db.png" width="800">
</p>

### Error Diagnostics with LSP Saga 

<p align="center">
<img src="https://user-images.githubusercontent.com/50903223/231488158-fb3ad25f-71aa-49ae-a895-5c99f582a8ac.png" width="800">
</p>

### Debugging UI by nvim-dap-ui 

<p align="center">
<img src="https://user-images.githubusercontent.com/50903223/231488098-6e6a5943-96af-450d-9b0c-404fbc6fa173.png" width="800">
</p>

### Code reference by LSP Saga

<p align="center">
<img src="https://user-images.githubusercontent.com/50903223/231488174-63a394c2-099b-4b1e-9adb-d0a39f511a00.png" width="800">
</p>

</details>

## Contributing

If you find anything that needs improvement, do not hesitate to point it out or create a PR.
If you still have an issue, [open a new issue](https://github.com/rellotscrewdriver/nvim/issues).

## Credits

* [jdhao](https://github.com/jdhao/nvim-config) for inspiration to restart my neovim configuration from scratch
* [dtr2300](https://github.com/dtr2300/nvim) 
* [alpha2phi](https://github.com/alpha2phi/neovim-for-beginner) for some noob tips and recommendations
* [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)

### Other Configs

* [Johan-Palacios](https://github.com/Johan-Palacios/nvim)
* [emxxjnm](https://github.com/emxxjnm/nvim)

## Further readings
- https://github.com/rockerBOO/awesome-neovim
- https://this-week-in-neovim.org/
- https://github.com/nanotee/nvim-lua-guide
- https://www.lua.org/pil/contents.html
- https://www.lua.org/manual/5.1/manual.html
- https://learnxinyminutes.com/docs/lua/
- https://mkaz.blog/working-with-vim/
- https://madskjeldgaard.dk/posts/neovim-as-sc-ide/
- https://vim.fandom.com/wiki/Unused_keys
- https://www.reddit.com/r/neovim/
- https://github.com/ryanoasis/nerd-fonts
- https://github.com/jesseduffield/lazygit
- https://clangd.llvm.org/
