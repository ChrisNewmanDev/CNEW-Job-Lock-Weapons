author "ChrisNewmanDev"
description "WeaponJobLock"
fx_version 'cerulean'
games { 'gta5' }

lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
}

client_scripts {
    'utils.lua',
	'weaponblacklist.lua',
}

escrow_ignore {
    'config.lua',
    'readme.md'
}

files {
}
dependency '/assetpacks'