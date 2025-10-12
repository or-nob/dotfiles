return {
    setup = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup UI
        dapui.setup(
            {
                icons = { expanded = "", collapsed = "", current_frame = "" },
                controls = {
                    icons = {
                        pause = "⏸",
                        play = "▶",
                        step_into = "⏎",
                        step_over = "⏭",
                        step_out = "⏮",
                        terminate = "⏹",
                    },
                },
            }
        )

        -- Automatically open UI when debugging starts
        dap.listeners.after.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.after.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.disconnect.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Configure GDB for C++
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "/usr/bin/OpenDebugAD7"
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                setupCommands = {
                    { text = "-enable-pretty-printing", description = "Enable GDB pretty printing", ignoreFailures = false },
                },
            }
        }

        local dap_cpp_configs = {
            ["defaults"] = dap.configurations.cpp,
            ["for_pipeline"] = {
                {
                    name = "Launch",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return "/root/.nil/nordicmediva/bin/Pipeline"
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    setupCommands = {
                        { text = "-enable-pretty-printing", description = "Enable GDB pretty printing", ignoreFailures = false },
                    },
                    args = { "-u", "http://rest:8080/system/rest" },
                }
            },
            ["for_ss"] = {
                {
                    name = "Launch",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return "/root/.nil/nordicmediva/bin/StreamingServer"
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    setupCommands = {
                        { text = "-enable-pretty-printing", description = "Enable GDB pretty printing", ignoreFailures = false },
                    },
                    args = { "-t", "11119", "-a", "/root/.nil/nordicmediva/plugins_str_serv/", "-u", "http://rest:8080/system/rest", "-r", "/home/nil/.nordicmediva/results" },
                }
            },
        }

        dap.configurations.c = dap.configurations.cpp -- Also apply for C

        require("nvim-dap-virtual-text").setup()

        -- Keybindings for debugging
        vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Start Debugging" })
        vim.keymap.set("n", "<F6>", function() dap.step_over() end, { desc = "Step Over" })
        vim.keymap.set("n", "<F7>", function() dap.step_into() end, { desc = "Step Into" })
        vim.keymap.set("n", "<F8>", function() dap.step_out() end, { desc = "Step Out" })
        vim.keymap.set("n", "<F9>", function() dap.terminate() end, { desc = "Terminate" })
        vim.keymap.set("n", "<Leader>t", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
            { desc = "Set Conditional Breakpoint" })
        vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open Debug REPL" })
        vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "Run Last Debugging Session" })
        vim.keymap.set("n", "<Leader>pp",
            function()
                dap.configurations.cpp = dap_cpp_configs.for_pipeline
                dap.continue()
                dap.configurations.cpp = dap_cpp_configs.defaults
            end, { desc = "Start Debugging Pipeline" })
        vim.keymap.set("n", "<Leader>ss",
            function()
                dap.configurations.cpp = dap_cpp_configs.for_ss
                dap.continue()
                dap.configurations.cpp = dap_cpp_configs.defaults
            end, { desc = "Start Debugging StreamingServer" })
    end
}
