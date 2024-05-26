# motivation.nvim

This is a small neovim plugin that prints random phrases at the start of the program.
You can use it for:
- Motivational quotes 😇;
- Vim motions hard to remember 🤔;
- Reminders 📅;
- Whatever you want. Be original 🙃

## Getting start

This section describes how how can setup this plugin.

### Installation

Using vim-plug:
```vim
Plug "zemafaz/motivation.nvim"
```

Using dein:
```vim
call dein#add("zemafaz/motivation.nvim")
```

Using packer.nvim:
```lua
use {
    "zemafaz/motivation.nvim"
}
```

Using lazy.nvim:
```lua
-- inside lazy's setup plugins table
"zemafaz/motivation.nvim",
```

### Usage

To use the application, add the following to your configuration:
```lua
require("motivation").setup({
    lines = {
        "Neovim is awesome",
        "You must be the change you wish to see in the world. -Mahatma Gandhi",
    },
    -- or
    file = "~/quotes.txt",
})
```

## Configuration

```lua
require("motivation").setup({
    lines = {},     -- Lines that you wish to be randomized
    file = nil,     -- File with lines you wish to be randomized
    -- Both "lines" and "file" are imported.
})
```

## Commands

```vim
:InspireMe  # Show random quote
```

## API

| Function | Description | Example |
|----|----|----|
|``inspire_me()``| Shows random quote | ``require("motivation").inspire_me()``|
