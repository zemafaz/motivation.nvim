local M = {}

local skip_blank_and_commented_lines = function(line)
    local first_non_blank_character = line:match("[^%s]")
    return first_non_blank_character and first_non_blank_character ~= "#"
end

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
            if skip_blank_and_commented_lines(rule) then
                table.insert(M.current_rules, rule)
            end
        end
    end

    vim.api.nvim_create_user_command("InspireMe", M.inspire_me, {})

    M.inspire_me()
end

return M
