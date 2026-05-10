$packages = @{
    clangd  = "LLVM.LLVM"
    lua_ls  = "LuaLS.lua-language-server"
    fzf     = "junegunn.fzf"
    node    = "OpenJS.NodeJS"
    rg      = "BurntSushi.ripgrep.MSVC"
}

foreach ($name in $packages.Keys) {
    $id = $packages[$name]
    Write-Host "Installing $name ($id)..."
    winget install --id $id --silent --accept-package-agreements --accept-source-agreements
}

Write-Host "Installing pyright..."
npm install -g pyright

Write-Host "Done. Open nvim."
