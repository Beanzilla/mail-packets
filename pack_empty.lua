local stack_size = 99
if packets.game_mode == "MCL" then
    stack_size = 64
end

--
-- Packet (Empty)
-- Empty packets have only one purpose, to be composed
-- They are obtained by:
-- * `/mail new` chat command (makes a new itemstack of this item, or adds 1 to a itemstack of empty packets)
-- * `/mail erase` chat command (erases previous data on any other packet, excluding ones you don't own or composed)
--

local packet_compose = function (item, player)
    packets.log("packet_compose() > Called")
    local meta = item:get_meta()
    local state = "unknown"
    if minetest.get_item_group(item:get_name(), "empty") == 1 then
        state = "empty"
    elseif minetest.get_item_group(item:get_name(), "composed") == 1 then
        state = "composed"
    end
    packets.log("packet_compose() > state='"..state.."'")
    if player == nil then
        packets.log("packet_compose() > player=nil")
        return nil
    end
    local pname = player:get_player_name()
    packets.log("packet_compose() > player='"..pname.."'")

    packets.log("packet_compose() > TODO: Complete this func")
    -- Show the formspec
    -- stuff from into meta from
    -- stuff to into meta to
    -- stuff msg into meta msg
    -- convert items in main into meta items (probably itemstack:to_string() or itemstack:to_table())
end

minetest.register_craftitem("mail_packets:packet_empty", {
    short_description = "Mail Packet",
    description = "Mail Packet\nEmpty",
    groups = { mail = 1, packet = 1, empty = 1 },
    inventory_image = packets.image_png("envelope_blank"),
    stack_max = stack_size,
    -- Every click action will call compose
    on_place = packet_compose, -- right click
    on_use = packet_compose, -- left click with pointed
    on_secondary_use = packet_compose, -- left click with no pointed
})
