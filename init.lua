
packets = {
    VERSION = "1.0-dev",
    settings = {
        max_items = 12,
    },
}

-- Identify gamemode
if minetest.get_modpath("default") then
    packets.game_mode = "MTG"
elseif minetest.get_modpath("mcl_core") then
    packets.game_mode = "MCL"
else
    packets.game_mode = "???"
end

-- Use Mod storage for packets that need to be sent to mailboxes
packets.Store = minetest.get_mod_storage()

-- Resources used in crafting (currently the only planned thing will be the mailbox which collects offline mail)
packets.resources = {
    plank = "group:wood",
    log = "group:tree",
    stick = "default:stick",
    iron_ingot = "default:steel_ingot",
    gold_ingot = "default:gold_ingot"
}

if packets.game_mode == "MCL" then
    packets.resources.stick = "mcl_core:stick"
    packets.resources.iron_ingot = "mcl_core:iron_ingot"
    packets.resources.gold_ingot = "mcl_core:gold_ingot"
end

-- Basic util functions
packets.log = function (msg)
    if type(msg) == "table" then
        msg = minetest.serialize(msg)
    end
    minetest.log("action", "[mail_packets] "..msg)
end

packets.dofile = function (dir, file)
    local path = minetest.get_modpath("mail_packets")
    if file == nil then
        dofile(path .. DIR_DELIM .. dir .. ".lua")
    else
        dofile(path .. DIR_DELIM .. dir .. DIR_DELIM .. file .. ".lua")
    end
end

packets.image_png = function (file)
    return "mail_packets_"..file..".png"
end

-- Execute making the stuff real
packets.dofile("pack_empty")

-- Notify version, game and ready
packets.log("Version:  "..packets.VERSION)
packets.log("Gamemode: "..packets.game_mode)
packets.log("Ready to go!")
