local M = {}

local skip_blank_and_commented_lines = function(line)
    local first_non_blank_character = line:match("[^%s]")
    return first_non_blank_character and first_non_blank_character ~= "#"
end

M.config = {
    rules = {},
    oneline = true,
    execute_on_startup = true,
}

local print_rule = function(rule)
    if M.config.oneline then
        print(rule)
    else
        print(rule .. "\n\n")
    end
end

M.inspire_me = function()
    local number_rules = #M.config.rules
    math.randomseed(os.time())
    local i = math.random(number_rules)
    local chosen_rule = M.config.rules[i]
    print_rule(chosen_rule)
end

local load_lines = function(config)
    if config.lines then
        for _, rule in ipairs(config.lines) do
            table.insert(M.config.rules, rule)
        end
    end
    if config.file then
        for rule in io.lines(config.file) do
            if skip_blank_and_commented_lines(rule) then
                table.insert(M.config.rules, rule)
            end
        end
    end
end

local apply_config = function(config)
    load_lines(config)

    if config.oneline then
        M.config.oneline = config.oneline
    end
    if config.execute_on_startup then
        M.config.execute_on_startup = config.execute_on_startup
    end
end

local register_commands = function()
    vim.api.nvim_create_user_command("InspireMe", M.inspire_me, {})
end

local execute_on_startup = function()
    if M.config.execute_on_startup then
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            command = "InspireMe"
        })
    end
end

M.setup = function(config)
    apply_config(config)
    register_commands()
    execute_on_startup()
end

return M
