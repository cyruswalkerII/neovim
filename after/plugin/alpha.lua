local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
-- dashboard.section.header.val = {
--     [[                      ***********************                          ]],
--     [[                 *********************************                     ]],
--     [[             *******   *     *       *    *    *******                 ]],
--     [[          *******   ***      **     **     ***   *******               ]],
--     [[        ******   *****       *********      *****    *****             ]],
--     [[      ******  ********       *********       ******    *****           ]],
--     [[     ****   **********       *********       *********   *****         ]],
--     [[    ****  **************    ***********     ************   ****        ]],
--     [[   ****  *************************************************  ****       ]],
--     [[  ****  ***************************************************  ****      ]],
--     [[  ****  ****************************************************  ****,
--     [[  ****  ****************************************************  ****     ]],
--     [[   ****  ***************************************************  ****     ]],
--     [[    ****  *******     ****  ***********  ****     *********  ****      ]],
--     [[     ****   *****      *      *******      *      ********  ****       ]],
--     [[      *****   ****             *****             ******   *****        ]],
--     [[        *****   **              ***              **    ******          ]],
--     [[         ******   *              *              *   *******            ]],
--     [[           *******                                *******              ]],
--     [[              ********                         *******                 ]],
--     [[                 *********************************                     ]],
--     [[                      ***********************                          ]],
-- }

local function header()
  return require("cyruswalker.logos")["random"]
end

dashboard.section.header.val = header()

-- Set menu:
dashboard.section.buttons.val = {
--   dashboard.button("e", "  New Buffer",            ':tabnew<CR>'),
   dashboard.button("f", "  Find file",             ':Telescope find_files<CR>'),
   dashboard.button("h", "  Recently opened files", ':Telescope oldfiles<CR>'),
--   dashboard.button("r", "  Frecency/MRU",          ':Telescope oldfiles<CR>'),
   dashboard.button("g", "  Open Last Session",     ':source ~/.config/nvim/session.vim<CR>'),
   dashboard.button("m", "  Word Finder",           ':Telescope live_grep<CR>'),
 --  dashboard.button("l", "  Marks",                 ':Telescope marks<CR>'),
}

local buttons = {
  type = "group",
  val = {
  },
  opts = {
    spacing = 1
  }
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
local fortune = require("alpha.fortune") 
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
