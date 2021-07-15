local player = nil
local HUDID = nil

minetest.register_globalstep(function(dtime)
  player = minetest.localplayer
  if not player then return end
  if not HUDID then
    HUDID = player:hud_add({
      hud_elem_type = "text",
      position      = {x = 1, y = 0},
      scale         = {x = 100, y = 100},
      text          = "Waiting for time upadate...",
      number        = 0xFFFFFF,
      offset        = {x = -10, y = 25},
      alignment     = {x = -1, y = 5}
    })
    if not HUDID then
      error("Datetime mod failed on HUD element creating!")
    end
  end
  local curtime = os.date('%m/%d/%Y %H:%M:%S %z',os.time())
  player:hud_change(HUDID, "text", curtime)
end)
