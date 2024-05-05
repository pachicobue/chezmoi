return {
    "monaqa/dial.nvim",
    keys = {
        {
            "<C-a>",
            mode = "n",
            function()
                require("dial.map").manipulate("increment", "normal")
            end,
            desc = "Increment Number",
        },
        {
            "<C-x>",
            mode = "n",
            function()
                require("dial.map").manipulate("decrement", "normal")
            end,
            desc = "Decrement Number",
        },
        {
            "g<C-a>",
            mode = "n",
            function()
                require("dial.map").manipulate("increment", "gnormal")
            end,
            desc = "Increment Number",
        },
        {
            "g<C-x>",
            mode = "n",
            function()
                require("dial.map").manipulate("decrement", "gnormal")
            end,
            desc = "Increment Number",
        },
        {
            "<C-a>",
            mode = "v",
            function()
                require("dial.map").manipulate("increment", "visual")
            end,
            desc = "Increment Number",
        },
        {
            "<C-x>",
            mode = "v",
            function()
                require("dial.map").manipulate("decrement", "visual")
            end,
            desc = "Decrement Number",
        },
        {
            "g<C-a>",
            mode = "v",
            function()
                require("dial.map").manipulate("increment", "gvisual")
            end,
            desc = "Increment Number",
        },
        {
            "g<C-x>",
            mode = "v",
            function()
                require("dial.map").manipulate("decrement", "gvisual")
            end,
            desc = "Increment Number",
        },
    },
}
