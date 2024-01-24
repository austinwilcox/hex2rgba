# Hex 2 RGBA
I wrote this quick little plugin because I was getting design files that were using opacity with hex values, and I found it easier to switch those over to rgba and use that in my code.

## Packer
```lua
use "austinwilcox/hex2rgba"
```
## Lazy
```lua
{
  "austinwilcox/hex2rgba"
}
```

Then add the following command in a lua file or your init.vim
```lua
local map = vim.api.nvim_set_keymap
map('n', '<leader>cs', ':lua require("hex2rgba").hex2rgba()<cr>', { noremap = true })
```

Now with the keybinding of ```<leader>cs``` hex2rgba will find the first instance of a hex color value on the current line, and replace that with the correct rgba value.
If you execute the command again, it will look for another instance of a hex value. This will work with hex sizes of 3 or 6.

If you have any questions please feel free to reach out, or submit an issue.
