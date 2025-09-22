-- its not source anymore lmao
local lplr = game.Players.LocalPlayer
local function kick(reason)
  lplr:Kick(reason)
end
local forsaken_games = {
  99661246287362; -- forsaken but infinite
  100039707794702; -- untitled forsaken engine
  18687417158; -- forsaken original
  76797953666623; -- for the saken
}
if not table.find(forsaken_games, game.PlaceId) then
  kick("supported games: \"Forsaken\", \"For the saken\"")
end

local blacklists = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/black.json"))
for name, data in pairs(blacklists) do
  if name == lplr.Name then
    --kick("blacklisted from nxp hub, reason: " .. (data.reason or "no reason listed"))
  end
end

NXP_HUB_IS_THE_FUCKING_BEST = true
local suc = pcall(function()
  local load = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/main.lua"))
  if load == nil then
    kick("parsing error in code (this shouldnt ever happen, try re-executing)")
  else
    load()
  end
end)

if suc == false then
  kick("error while running script. are you in the correct forsaken game?")
end
