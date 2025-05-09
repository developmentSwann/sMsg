fx_version 'adamant'

game 'gta5'

client_scripts {
    'client.lua',
}
server_scripts {
    'server.lua',
    '@mysql-async/lib/MySQL.lua',
}

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",

    "src/components/*.lua",

    "src/menu/elements/*.lua",

    "src/menu/items/*.lua",

    "src/menu/panels/*.lua",

    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

}
--
--
client_script '@es_extended/04796.lua'