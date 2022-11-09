# Mail Packets

Send player's messages along with items in a fairly new way.

## How you'll write

You'll use `/mail new` to get a new/empty packet.

You'll then use that packet which will open a GUI. (Using a packet can be left or right click, facing a node or not)

Fill out who you want to write or send stuff too. (note, you can change a packet via using the packet again, only works for packets you've written)

Then click to begin writing your message or drag and drop your items you wish to send to whomever. (You can send up to at most 12 items, but this is planned to be customizable in future versions)

Then you click `Save`, this seals your packet for only them to open. (again, want to add more items or change your message use `/mail edit`)

From there you can issue `/mail send` with the packet in your hand to have it delivered to the player (if they are online) or delivered to their virtual mailbox. The virtual mailbox is a special node which accesses your mail from anywhere. (This means any virtual mailbox node can be used to access your mailbox) Only packets delivered while your offline or your inventory is full get placed in the virtual mailbox.

> Admin can access anyone's mailbox at anytime via `/mail peek <playername>`. (regardless if the player is online or not)

## Todo

- [x] `Mail Packet (Empty)` This packet is ready to be composed
- [ ] `Mail Packet (Composed)` This packet is ready to be `/mail send` (delivered), or used again to composed some more \*
- [ ] `Virtual Mailbox` This node will be used to access offline packets
- [ ] Wrote code for `Mail Packet (Empty)` to be composed in which it changes to a `Mail Packet (Composed)` \*
- [ ] Wrote code for `Mail Packet (Empty)` to show a gui formspec of the packet's content (for composing and editing)
- [ ] Wrote code for `Mail Packet (Composed)` to show a gui formspec of the packet's content (viewing only) \*\*
- [ ] Tested all features
    - [ ] `/mail new` Gives a `Mail Packet (Empty)` item per call (I'm thinking of perhaps an optional parameter for requesting multiple packets per call)
    - [ ] `Mail Packet (Empty)` Composes
    - [ ] `Mail Packet (Composed)` Can be composed again (by the same person who wrote the Packet first)
    - [ ] `/mail erase` Resets the `Mail Packet (Composed)` back into a `Mail Packet (Empty)`
    - [ ] `Mail Packet (Composed)` Doesn't allow a different person other than the same person who wrote it or the person it's for to be opened
    - [ ] `Mail Packet (Composed)` Allows `/mail admin peek` to compose it without modifying who the packet was from
    - [ ] `Mail Packet (Composed)` Allows the person it's for to open it (Allowing only items to be taken, unlike the compose option)
    - [ ] Test delivering `Mail Packet (Composed)` to a player online (should go to their inventory)
    - [ ] Test delivering `Mail Packet (Composed)` to a player offline (should go to their virtual mailbox)
    - [ ] Test delivering `Mail Packet (Composed)` to a player online but their inventory is full (should go to their virtual mailbox)
    - [ ] Test `Virtual Mailbox` only shows that player's mailbox (not others, include patch for hacked clients)
- [ ] Release V1.0

\* At any time you can issue `/mail erase` to return a packet back into an empty packet, or `/mail delete` to simply delete the packet

\*\* Admin can open packets by `/mail open` while holding the packet in their hand (This actually is just the code for editing the packet, so if an Admin finds items that a regular player should not have and they are sending it thru Mail Packets the Admin can choose to simply remove the item)

## Tributes

- textures by [envelop](https://github.com/archfan7411/minetest-envelopes) mod. (MIT, `mail_packets_envelope_*`)
- idea by [envelop](https://github.com/archfan7411/minetest-envelopes) mod and [mailboxes](https://github.com/everamzah/mailbox) mod.
