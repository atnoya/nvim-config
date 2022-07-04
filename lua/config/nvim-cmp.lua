local lspkind = require('lspkind')
local cmp = require("cmp")

cmp.setup({
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "vsnip" },
    },
    {
      { name = "spell", keyword_length = 5 },
      { name = "path"},
      { name = "buffer", keyword_length = 5 },
      { name = "cmdline"}
    }
  ),
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ 
        mode = "symbol_text", 
        maxwidth = 50,
        menu = {
          buffer = "BUF",
          rg = "RG",
          nvim_lsp = "LSP",
          path = "PATH",
          vsnip = "SNIP",
          spell = "SPELL",
        },
      })(entry, vim_item)

      if kind.kind == '' then
        return kind.kind
      else
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. strings[1] .. " "
        kind.menu = "    (" .. strings[2] .. ")"

        return kind
      end
    end
  },
})
