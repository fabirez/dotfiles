return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "general",
				path = "~/notes/mynotes/obsidian-vault",
			},
		},
		legacy_commands = false,

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "0Journal",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil
		},

		--   -- Optional, for templates (see below).
		--   templates = {
		--     folder = "templates",
		--     date_format = "%Y-%m-%d",
		--     time_format = "%H:%M",
		--     -- A map for custom variables, the key should be the variable and the value a function
		--     substitutions = {},
		--   },

		-- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
		-- levels defined by "vim.log.levels.*".
		log_level = vim.log.levels.INFO,

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			note_mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
			tag_mappings = {
				-- Add tag(s) to current note.
				tag_note = "<C-x>",
				-- Insert a tag at the current location.
				insert_tag = "<C-l>",
			},
		},
	},

  -- Specify how to handle attachments.
  attachments = {
    -- The default folder to place images in via `:ObsidianPasteImg`.
    -- If this is a relative path it will be interpreted as relative to the vault root.
    -- You can always override this per image by passing a full path to the command instead of just a filename.
    img_folder = "assets/imgs",  -- This is the default

    -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
    ---@return string
    img_name_func = function()
      -- Prefix image names with timestamp.
      return string.format("%s-", os.time())
    end,

    -- A function that determines the text to insert in the note when pasting an image.
    -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
    -- This is the default implementation.
    ---@param client obsidian.Client
    ---@param path obsidian.Path the absolute path to the image file
    ---@return string
    img_text_func = function(client, path)
      path = client:vault_relative_path(path) or path
      return string.format("![%s](%s)", path.name, path)
    end,
  },

  -- -- Optional, define your own callbacks to further customize behavior.
  -- callbacks = {
  --   -- Runs at the end of `require("obsidian").setup()`.
  --   ---@param client obsidian.Client
  --   post_setup = function(client) end,
  --
  --   -- Runs anytime you enter the buffer for a note.
  --   ---@param client obsidian.Client
  --   ---@param note obsidian.Note
  --   enter_note = function(client, note) end,
  --
  --   -- Runs anytime you leave the buffer for a note.
  --   ---@param client obsidian.Client
  --   ---@param note obsidian.Note
  --   leave_note = function(client, note) end,
  --
  --   -- Runs right before writing the buffer for a note.
  --   ---@param client obsidian.Client
  --   ---@param note obsidian.Note
  --   pre_write_note = function(client, note) end,
  --
  --   -- Runs anytime the workspace is set/changed.
  --   ---@param client obsidian.Client
  --   ---@param workspace obsidian.Workspace
  --   post_set_workspace = function(client, workspace) end,
  -- },

}
