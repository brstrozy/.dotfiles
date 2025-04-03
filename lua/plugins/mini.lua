return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function ()
            require('mini.comment').setup()
            require('mini.pairs').setup()
            require('mini.splitjoin').setup()
            require('mini.surround').setup()
            require('mini.move').setup({
                    -- Module mappings. Use `''` (empty string) to disable one.
                    mappings = {
                        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                        left = 'H',
                        right = 'L',
                        down = 'J',
                        up = 'K',

                        -- Move current line in Normal mode -- Disabled
                        line_left = '',
                        line_right = '',
                        line_down = '',
                        line_up = '',
                    }
            })
        end
    }
}
