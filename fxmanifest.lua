fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Vertex Scripts"
version "1.0.0"

server_scripts {
	"src/server.lua"
}

client_scripts {
	"src/client.lua"
}

shared_scripts {
	"@vx_lib/init.lua",
	"config.shared.lua",
	"src/shared.lua"
}

escrow_ignore {
	"config.shared.lua",
}
