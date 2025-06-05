local waywall = require("waywall")
local helpers = require("waywall.helpers")

local RAZER_CLI = "~/.local/bin/razer-cli"
-- Replace with your ninjabrain path
local NINJA_BRAIN = "java -jar ~/programs/Ninjabrain-Bot-1.5.1.jar &"

local eye_mirror_handle = nil

function get_current_dpi()
  local handle = io.popen(RAZER_CLI.." --dpi print")
  local dpi = tonumber(handle:read("*a"))
  handle:close()
  return dpi
end

function set_dpi(dpi)
  if not dpi or dpi == 0 then
    if original_dpi and original_dpi > 0 then
      dpi = original_dpi
    else
      dpi = 1600
    end
  end
  os.execute(RAZER_CLI.." --dpi "..dpi)
end

local original_dpi = get_current_dpi()

local is_ninb_running = function()
  return os.execute("pgrep -f 'NinjaBrain'")
end

local exec_ninb = function()
  helpers.toggle_floating()
  if not is_ninb_running() then
    waywall.exec(NINJA_BRAIN)
  end
end

local toggle_eye_measure = function()
  if eye_mirror_handle ~= nil then
    set_dpi(0)
    waywall.set_resolution(0, 0)
    eye_mirror_handle:close()
    eye_mirror_handle = nil
  else
    set_dpi(200)
    waywall.set_resolution(320, 16384)
    eye_mirror_handle = waywall.mirror({
		src = { x = 130, y = 7902, w = 60, h = 580 },
		dst = { x = 0, y = 315, w = 800, h = 450 },
	})
  end
end

local config = {
  input = {
    layout = "de",
    repeat_rate = 40,
    repeat_delay = 300,
    sensitivity = 1.0,
    confine_pointer = false,
    remaps = {
      ["M5"] = "LEFTCTRL",
      ["M4"] = "F",
      ["C"] = "F5",
      ["F10"] = "F4",
      ["F4"] = "F10",
      ["F9"] = "N",
      ["N"] = "F9",
      ["V"] = "F3",
      ["Z"] = "C",
      ["A"] = "F12",
    }
  },
  actions = {
    ["Z"] = helpers.toggle_res(1920, 400),
    ["H"] = helpers.toggle_res(400, 1080),
    ["J"] = toggle_eye_measure,
    ["F7"] = exec_ninb,
  },
  theme = {
    background = "#303030ff",
  }
}

return config
