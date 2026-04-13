-- Helper function
function map(mode, keys, action, options)
    options = options or {}
    options["noremap"] = true
    options["silent"] = true
    vim.keymap.set(mode, keys, action, options)
end

Theme = require("theme")
Theme.load()

require("config.lsp")
require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.diagnostic")
require("config.plugins")


-- [Custom user config]

local user_loaded, user = pcall(require, "user")
if user_loaded then

end
