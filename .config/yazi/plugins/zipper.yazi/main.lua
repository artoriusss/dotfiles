--- @sync entry

-- Two roles:
--   `plugin zipper`                        start the interactive flow
--   `plugin zipper 'notify <lvl> "<msg>"'` report from the detached zip worker

local SCRIPT = "$HOME/.config/yazi/plugins/zipper.yazi/zipper.sh"

return {
	entry = function(self, job)
		local args = job and job.args or {}

		if args[1] == "notify" then
			return ya.notify {
				title = "Zipper",
				content = args[3] or "",
				level = args[2] or "info",
				timeout = 4,
			}
		end

		local cur = cx.active.current
		local cwd = tostring(cur.cwd)

		-- Hovered dir => zip from inside it. Hovered file (or nothing) => cwd.
		local src = cwd
		local h = cur.hovered
		if h and h.cha.is_dir then
			src = tostring(h.url)
		end

		ya.emit("shell", {
			block = true,
			string.format("%s %s %s", SCRIPT, ya.quote(src), ya.quote(cwd)),
		})
	end,
}
