local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https//github.com/wbthomason/packer.nvim'..install_path)
    execute 'packadd packer.nvim'
end

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/'})
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use 'kyazdani42/nvim-tree.lua'
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
