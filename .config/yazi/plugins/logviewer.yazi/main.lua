--- @sync entry

local function selected_or_hovered()
	local tab, paths = cx.active, {}
	for _, u in pairs(tab.selected) do
		paths[#paths + 1] = tostring(u)
	end
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end

return {
	entry = function()
		local paths = selected_or_hovered()
		if #paths == 0 then
			return ya.notify {
				title = "LogViewer",
				content = "Nothing to open",
				level = "warn",
				timeout = 3,
			}
		end

		local content
		if #paths == 1 then
			content = "Opening " .. paths[1]:match("[^/]*$")
		else
			content = string.format("Opening %d files", #paths)
		end
		ya.notify { title = "LogViewer", content = content, level = "info", timeout = 3 }

		ya.emit("shell", { orphan = true, 'logviewer "$@" >/dev/null 2>&1' })
	end,
}
