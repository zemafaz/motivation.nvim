local M = {}

M.current_rules = {}

M.inspire_me = function()
    local number_rules = #M.current_rules
    math.randomseed(os.time())
    local i = math.random(number_rules)
    print(M.current_rules[i] .. "\n")
end

M.setup = function(config)
    if config.rules then
        for _, rule in ipairs(config.rules) do
            table.insert(M.current_rules, rule)
        end
    end
    if config.file then
        for rule in io.lines(config.file) do
            table.insert(M.current_rules, rule)
        end
    end

    vim.api.nvim_create_user_command("InspireMe", M.inspire_me, {})

    M.inspire_me()
end

return M
