local function split_string(str)
	if str:len() > 65 then
		for i = 60, #str do
			local c = str:sub(i, i)
			if c == " " then
				return string.sub(str, 1, i - 1) .. "\n" .. string.sub(str, i + 1)
			end
		end
	else
		return str
	end
end

function get_nts_data()
	local cmd =
		"curl -s https://www.nts.live/api/v2/live | jq -r '.results[%.1f].now | .embeds.details.name, .embeds.details.description, .embeds.details.location_long'"
	cmd = string.format(cmd, (CHANNEL - 1))
	local res_handle = io.popen(cmd, "r")
	local res = {}

	for line in res_handle:lines() do
		table.insert(res, line)
	end

	res_handle:close()

	return {
		playing = res[1],
		desc = split_string(res[2]),
		loc = res[3],
	}
end

function show_metadata()
	local metadata = get_nts_data()
	vim.notify("Now playing: " .. metadata.playing .. "\n" .. metadata.desc .. "\n" .. "Live from: " .. metadata.loc)
end

STREAM_URLS = { "https://stream-relay-geo.ntslive.net/stream", "https://stream-relay-geo.ntslive.net/stream2" }

vim.api.nvim_create_user_command("Mplayer", function(opts)
	if opts.args == "nts_1" then
		CHANNEL = 1
	elseif opts.args == "nts_2" then
		CHANNEL = 2
	end

	local stream_url = STREAM_URLS[CHANNEL]

	MPLAYER = vim.system({ "mplayer", stream_url }, { stdin = true })

	if not MPLAYER.pid then
		vim.notify("Could not open Mplayer!", "error")
	else
		vim.notify("Tuning in to NTS Radio...")
		show_metadata()
	end
end, { nargs = 1 })

vim.api.nvim_create_user_command("InfosNts", function()
	show_metadata()
end, {})

vim.api.nvim_create_user_command("PauseMplayer", function()
	if MPLAYER then
		vim.notify("Pausing/Resuming Mplayer")
		show_metadata()
		MPLAYER:write("p")
	end
end, {})

vim.api.nvim_create_user_command("KillMplayer", function()
	if MPLAYER then
		vim.notify("Shutting MPlayer down.")
		MPLAYER:kill()
	end
end, {})
