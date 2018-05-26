--Provides quick keybinding for macros and spells

--Slash handler
SLASH_KBB1 = "/kbb"

function SlashCmdList.KBB(msg, editbox)

	local command, rest = msg:match("^(%S*)%s*(.-)$")
	-- Any leading non-whitespace is captured into command;
	-- the rest (minus leading whitespace) is captured into rest.
	local key, bindable = rest:match("^(%S*)%s*(.-)$")

	if command == "macro" and key ~= "" and bindable ~= "" then
		SetBindingMacro(key, bindable)
		SaveBindings(2)
		print("Macro \"" .. bindable .. "\" bound to \"" .. key .. "\".")
	elseif command == "spell" and key ~= "" and bindable ~= "" then
		SetBindingSpell(key, bindable)
		SaveBindings(2)
		print("Spell \"" .. bindable .. "\" bound to \"" .. key .. "\".")
	elseif command == "query" and key ~= "" then
		print("Key \"" .. key .. "\" is bound to \"" .. GetBindingAction(key) .. "\".")
	elseif command == "unbind" and key ~= "" then
		SetBinding(key)
		SaveBindings(2)
		print("Key \"" .. key .. "\" is unbound.")
		
	else
		-- If not handled above, display some sort of help message
		print("Syntax: |cffffff78/kbb macro <key> <macro name>|r")
		print("             |cffffff78/kbb spell   <key> <spell name>|r")
		print("             |cffffff78/kbb query <key>|r")
		print("             |cffffff78/kbb unbind <key>|r")
		print("Key designations should be all in caps with hyphens connecting key combos. Spell and macro names should be spelled and capitalized exactly.")
	end
end

