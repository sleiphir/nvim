return {
	on_attach = function(client, _)
		-- Just want ts_ls in path, I don't want it to do anything
		client.stop()
	end
}
