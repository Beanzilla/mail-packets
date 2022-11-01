local stack_size = 99
if packets.game_mode == "MCL" then
    stack_size = 64
end

--
-- Packet (Empty)
-- Empty packets have only one purpose, to be composed
-- They are obtained by:
-- * `/mail new` chat command (makes a new itemstack of this item)
-- * `/mail erase` chat command (erases previous data on any other packet)
--

local packet_compose = function (item, player)
    packets.log("packet_compose() > Called")
    if player == nil then
        packets.log("packet_compose() > player=nil")
        return nil
    end
    local pname = player:get_player_name()
    packets.log("packet_compose() > player='"..pname.."'")

    packets.log("packet_compose() > TODO: Complete this func")
end

minetest.register_craftitem("mail_packets:packet_empty", {
    short_description = "Mail Packet",
    description = "Mail Packet\nEmpty",
    groups = { mail = 1, packet = 1 },
    inventory_image = packets.image_png("envelope_blank"),
    stack_max = stack_size,
    on_place = packet_compose, -- right click
    on_use = packet_compose, -- left click with pointed
    on_secondary_use = packet_compose, -- left click with no pointed
})
