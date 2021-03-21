local keybinds = {}

function RegisterKeybind(name, desc, key, func)
    keybinds[name] = {
        disabled = false
    }
    RegisterCommand(name, function(source, args, raw)
        if not keybinds[name].disabled then
            func(source, args, raw)
        end
    end, false)
    RegisterKeyMapping(name, desc, "keyboard", key)
    TriggerEvent("chat:removeSuggestion", "/" .. name)
end

function RegisterHoldKeybind(name, desc, key, func, delay)
    keybinds[name] = {
        disabled = false,
        loop = true
    }
    RegisterCommand("+" .. name, function(source, args, raw)
        if not keybinds[name].disabled then
            keybinds[name].loop = true
            Citizen.CreateThread(function()
                while keybinds[name].loop do
                    func(source, args, raw)
                    Citizen.Wait(delay)
                end
            end)
        end
    end, false)
    RegisterCommand("-" .. name, function(source, args, raw)
        keybinds[name].loop = false
    end, false)
    RegisterKeyMapping("+" .. name, desc, "keyboard", key)
    TriggerEvent("chat:removeSuggestion", "/+" .. name)
    TriggerEvent("chat:removeSuggestion", "/-" .. name)
end

function RegisterTwoWayKeybind(name, desc, key, func1, func2)
    keybinds[name] = {
        disabled = false
    }
    RegisterCommand("+" .. name, function(source, args, raw)
        if not keybinds[name].disabled then
            func1(source, args, raw)
        end
    end, false)
    RegisterCommand("-" .. name, function(source, args, raw)
            func2(source, args, raw)
    end, false)
    RegisterKeyMapping("+" .. name, desc, "keyboard", key)
    TriggerEvent("chat:removeSuggestion", "/+" .. name)
    TriggerEvent("chat:removeSuggestion", "/-" .. name)
end

function ToggleKeybind(name, state)
    keybinds[name].disabled = state
end