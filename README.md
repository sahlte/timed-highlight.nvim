# Timed Highlight Plugin for Neovim

## Overview

Timed Highlight is a Neovim plugin that provides a convenient way to highlight search results for a specified duration. This automates the removal of highlighting after a search.

## ⚡️In action

![Temporary Highlighting when you need it](https://raw.githubusercontent.com/sahlte/timed-highlight.nvim/main/doc/demo.gif)

- Highlight duration can be customized

## 📦 Installation

Install the plugin using your preferred package manager. Here's an example using [lazy.nvim](https://github.com/folke/lazy.nvim):

```
local function timed_highlight_config()
    require("timed-highlight").setup({
        highlight_timeout_ms = 2000
    })
end

return {
    "sahlte/timed-highlight.nvim", config = timed_highlight_config
}
```
