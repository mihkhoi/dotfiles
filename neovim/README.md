# Hướng dẫn cài Neovim
## 1. Cài neovim cho windows
- [Neovim](https://github.com/neovim/neovim/releases)
- [Scoop](https://scoop.sh/)
- [Chocolatey](https://chocolatey.org/install)
- [Cài đặt terminal](https://github.com/mihkhoi/dotfiles/tree/master/terminal)
  
## 2. Cài môi trường cho plugin
- [Git](https://git-scm.com/downloads)
- [Python](https://www.python.org/downloads/)
- [Nodejs](https://nodejs.org/en/download)

Kiểm tra các môi trường đã cài vào máy chưa trong terminal
git
  ```sh
  git --version
  ```
  python
  ```sh
  python --version
  ```
  nodejs
  ```sh
  node --version
  ```

Cài npm
  ```sh
  npm install neovim -g
  ```
Cài pip
  ```sh
  pip install pynvim
  ```
Cài gcc
```sh
scoop install gcc
```
## 3. Git clone file neovim
Copy file nvim vào trong thư mục local ở ổ C

Vd: C:\Users\lolme\AppData\Local\nvim

Mở terminal chạy nvim init.lua cài các plug 

Do tôi đã có code khi bật init.lua lên là plugin manage đã tự động cài vào máy

Plugin manage tôi chọn là [packer.nvim](https://github.com/wbthomason/packer.nvim)

Sau khi bật file init.lua Chạy lệnh
```sh
:PackerInstall
```
Lệnh ở trên để tải các plug tui ghi trong config/options.lua
Các câu lệnh khác của packer
```sh
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
```
Bạn muốn thêm các plug khác thì vào [packer.lua](https://github.com/mihkhoi/dotfiles/blob/master/neovim/nvim/lua/config/packer.lua) rồi chạy khỏi động lại nvim rồi chạy lại các câu lệnh trên để tải plug về

Rồi thêm file config các plug vào thư mục plugins
## 4. Cài ngôn ngữ và highlight code
- Tôi dùng [Mason.nvim](https://github.com/mason-org/mason.nvim)

Tôi cũng đã config trong file [mason.lua](https://github.com/mihkhoi/dotfiles/blob/master/neovim/nvim/lua/plugins/mason.lua)

Trong đó có mấy dòng ensure_installed có nghĩa là khi cài plug xong vào khỏi động lại nvim thì mason sẽ tự động tải các ngôn ngữ mà bạn muốn cài tự động

Có 3 loại lspconfig ngôn ngữ bạn muốn code, null-ls là format, nvim-dap là debug

Bạn không muốn cài tự động thì có cài thủ công 
```sh
:Mason
```
Khi cài xong ngôn ngữ thì bạn phải thêm vào file config [lsp.lua](https://github.com/mihkhoi/dotfiles/blob/master/neovim/nvim/lua/plugins/lsp.lua) ở dông servers

Format thì bạn vào file config [none-ls](https://github.com/mihkhoi/dotfiles/blob/master/neovim/nvim/lua/plugins/none-ls.lua) thêm vào dòng sources

Debug thì bạn mở file config [dap.lua](https://github.com/mihkhoi/dotfiles/blob/master/neovim/nvim/lua/plugins/dap.lua) Bạn có tự config các [adapter](https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

- Highlight code tôi dùng plug [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

```sh
:TSInstall <language_to_install>
```
