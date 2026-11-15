------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
    cm       = "auto",
    vrr      = 1,
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal       = "kitty"
local fileManager    = "thunar"
local fileManagerAlt = "dolphin"
local menu           = "rofi -show drun"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/configuring/core/autostart/
hl.on("hyprland.start", function()
    for _, cmd in ipairs({
        "systemctl --user start hyprpolkitagent",
        "swaync",
        "hypridle",
        "hyprpaper",
        "waybar",
        "nm-applet --indicator",
        "gnome-keyring",
        "wl-paste --type text --watch cliphist store",
        "wl-paste --type image --watch cliphist store",
        "wl-clip-persist --clipboard regular --write-timeout 1000",
        "cliphist wipe",
        "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'",
        "hyprctl setcursor Bibata-Modern-Classic 20",
        "blueman-applet",
        "wayvnc -r",
    }) do
        hl.exec_cmd(cmd)
    end
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSOR_THEME",                "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE",                 "20")
hl.env("HYPRCURSOR_THEME",             "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE",              "20")
hl.env("QT_QPA_PLATFORMTHEME",         "qt6ct")
hl.env("QT_QPA_PLATFORM",              "wayland;xcb")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",  "1")
hl.env("GDK_BACKEND",                  "wayland,x11,*")
hl.env("SDL_VIDEODRIVER",              "wayland")
hl.env("CLUTTER_BACKEND",              "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XDG_CURRENT_DESKTOP",          "Hyprland")
hl.env("XDG_SESSION_TYPE",             "wayland")
hl.env("XDG_SESSION_DESKTOP",          "Hyprland")


---------------------
---- PERMISSIONS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Permission changes require a Hyprland restart and are not applied on-the-fly.

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
    general = {
        gaps_in     = 2,
        gaps_out    = 5,
        border_size = 1,

        col = {
            active_border   = "rgba(7a7a7a66)",
            inactive_border = "rgba(24242418)",
        },

        resize_on_border = true,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",

        snap = {
            enabled = true,
        },
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled           = true,
            variant           = "heat_shimmer",
            size              = 4,
            passes            = 2,
            vibrancy          = 0.1696,
            new_optimizations = true,
            noise             = 0,
            ignore_opacity    = true,
            popups            = true,
            xray              = true,
        },
    },

    group = {
        groupbar = {
            font_size         = 14,
            height            = 24,
            indicator_height  = 4,
            scrolling         = true,
            rounding          = 6,
            rounding_power    = 1.0,
            round_only_edges  = true,
            disable_when_only = true,
        },
    },

    animations = {
        enabled = true,
    },

    -- Layouts, see https://wiki.hypr.land/configuring/layouts/
    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- Animations, see https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

hl.animation({ leaf = "global",           enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",           enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",          enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.1,  bezier = "quick",          style = "popin 60%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 4.1,  bezier = "almostLinear",   style = "slide" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 4,    bezier = "easeOutQuint",   style = "popin 80%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.5,  bezier = "linear",         style = "popin 80%" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5,    bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3,    bezier = "easeInOutCubic", style = "fade" })
hl.animation({ leaf = "zoomFactor",       enabled = true, speed = 7,    bezier = "quick" })


--------------
---- MISC ----
--------------

hl.config({
    misc = {
        force_default_wallpaper    = -1,   -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo      = true, -- If true disables the random hyprland logo / anime girl background. :(
        allow_session_lock_restore = true,
        enable_swallow             = true,
        swallow_regex              = "^(Alacritty|kitty|footclient)$",
        middle_click_paste         = true,
    },

    render = {
        direct_scanout        = 1, -- Disable if application shows graphical glitches
        cm_enabled            = true,
        new_render_scheduling = true,
    },

    layers = {
        -- Set to false to make newly mapped top layers render below existing covering fullscreen window
        allow_new_top_layers_over_existing_fullscreen = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse       = 1,
        sensitivity        = 0.25, -- -1.0 - 1.0, 0 means no modification.
        accel_profile      = "adaptive",
        numlock_by_default = true,

        touchpad = {
            natural_scroll          = true,
            disable_while_typing    = true,
            middle_button_emulation = true,
        },
    },
})

-- See https://wiki.hypr.land/configuring/core/devices/ for per-device config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


-------------------
---- FUNCTIONS ----
-------------------

-- Delayed so the key release doesn't wake the monitor right back up
local function toggleDpms()
    hl.timer(function()
        hl.dispatch(hl.dsp.dpms({ action = "toggle" }))
    end, { timeout = 500, type = "oneshot" })
end

-- Replaces gamemode.sh: disables animations, blur, gaps and rounding.
-- Calling it again reloads the config.
local function toggleGamemode()
    if hl.get_config("animations.enabled") == false then
        hl.exec_cmd("hyprctl reload")
        return
    end

    hl.config({
        general = {
            gaps_in     = 0,
            gaps_out    = 0,
            border_size = 1,
        },

        animations = {
            enabled = false,
        },

        decoration = {
            rounding = 0,
            shadow   = { enabled = false },
            blur     = { enabled = false },
        },
    })
end


------------------
---- GESTURES ----
------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "resize" })
hl.gesture({ fingers = 4, direction = "down",       action = toggleDpms })
hl.gesture({ fingers = 4, direction = "left",       action = function() hl.exec_cmd("playerctl next") end })
hl.gesture({ fingers = 4, direction = "right",      action = function() hl.exec_cmd("playerctl previous") end })


---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/binds/
local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManagerAlt))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("firefox --private-window"))
hl.bind(mainMod .. " + U",         hl.dsp.exec_cmd("rofi -show filebrowser"))
hl.bind(mainMod .. " + O",         hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("pgrep -x waybar && pkill -x waybar || waybar &"))
hl.bind("ALT + N",                 hl.dsp.exec_cmd("pkill -x hyprsunset; hyprsunset -t 4000"))

-- rofi: opens on first press of the super key, closes on second
hl.bind("Super_L", hl.dsp.exec_cmd("pkill rofi || " .. menu), { release = true })

-- Session
hl.bind(mainMod .. " + M",  hl.dsp.exit())
hl.bind(mainMod .. " + L",  hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + D",  toggleDpms)
hl.bind(mainMod .. " + F1", toggleGamemode)
hl.bind("CTRL + ALT + S",   hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })

-- Screenshots
hl.bind("Print",               hl.dsp.exec_cmd([[grim -g "$(slurp -d)" "$HOME/Pictures/grim/$(date +'%Y_%m_%d_%H_%M_%S').png"]]))
hl.bind("ALT + Print",         hl.dsp.exec_cmd([[grim -t jpeg -q 100 -g "$(slurp -d)" "$HOME/Pictures/grim/$(date +'%Y_%m_%d_%H_%M_%S').jpeg"]]))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]))

-- Windows
hl.bind(mainMod .. " + C",         hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.kill())
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + W",         hl.dsp.window.toggle_swallow())
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + CTRL + F",  hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))

-- Layout (dwindle only)
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + 1", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + 2", hl.dsp.layout("swapsplit"))

-- Groups
hl.bind("ALT + G",           hl.dsp.group.toggle())
hl.bind("ALT + SHIFT + TAB", hl.dsp.group.next())

-- Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Resize with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { locked = true, repeating = true })

-- Move/resize with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces: mainMod + [A S Z X 5-0] to switch, mainMod + SHIFT + [A S Z X 5-0] to move the window
local workspaceKeys = { A = 1, S = 2, Z = 3, X = 4, ["5"] = 5, ["6"] = 6, ["7"] = 7, ["8"] = 8, ["9"] = 9, ["0"] = 10 }
for key, id in pairs(workspaceKeys) do
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = id }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = id }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + T",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))

-- Volume and brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -d nvidia_wmi_ec_backlight set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d nvidia_wmi_ec_backlight set 5%-"), { locked = true, repeating = true })

-- Media (requires playerctl)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Looking Glass
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("looking-glass-client -F"))

-- Waydroid
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("waydroid show-full-ui"))
hl.bind("CTRL + ALT + Q", hl.dsp.exec_cmd("waydroid session stop"))

-- Passthrough keybinds to VM (mainMod + Escape to leave)
hl.bind(mainMod .. " + G", hl.dsp.submap("passthru"))
hl.define_submap("passthru", function()
    hl.bind(mainMod .. " + Escape", hl.dsp.submap("reset"))
end)


---------------
---- RULES ----
---------------

-- See https://wiki.hypr.land/configuring/core/rules/

-- Windows
hl.window_rule({
    -- Ignore maximize requests from all apps
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "qml-preview",
    match = { class = [[^(org\.qt-project\.qml)$]] },

    float            = true,
    persistent_size  = true,
    move             = "0 100",
    no_initial_focus = true,
})

hl.window_rule({
    match      = { class = [[^steam_app\d+$]] },
    fullscreen = true,
})

hl.window_rule({
    match     = { class = [[^steam_app_\d+$]] },
    monitor   = "1",
    workspace = "10",
})

-- Per-app opacity
local opacityRules = {
    { "^(nemo)",                         "0.85" },
    { "^(thunar)$",                      "0.85" },
    { "^(Thunar)$",                      "0.85" },
    { "^(code)",                         "0.90" },
    { "^(com.microsoft.VSCode)",         "0.90" },
    { "^(code-url-handler)",             "0.90" },
    { "^(Spotify)$",                     "0.90" },
    { "^(spotify)$",                     "0.90" },
    { "^(org.qbittorrent.qBittorrent)$", "0.90" },
    { "^(SWT)$",                         "0.90" },
    { "^(Eclipse)$",                     "0.90" },
    { "^(SpringToolSuite4)$",            "0.90" },
    { "^(jetbrains-idea-ce)$",           "0.90" },
}
for _, rule in ipairs(opacityRules) do
    hl.window_rule({ match = { class = rule[1] }, opacity = rule[2] })
end

-- Layers
hl.layer_rule({
    name  = "rofi-blur",
    match = { namespace = "rofi" },

    blur         = true,
    xray         = false,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "waybar",
    match = { namespace = "waybar" },

    blur         = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "no-anim-selection",
    match = { namespace = "selection" },

    no_anim = true,
})

-- Workspace 10 (games): no decorations or gaps, gamemode when created empty
hl.workspace_rule({
    workspace   = "10",
    no_border   = true,
    no_rounding = true,
    no_shadow   = true,
    decorate    = false,
    gaps_in     = 0,
    gaps_out    = 0,
})

hl.on("workspace.created", function(ws)
    if ws.id == 10 and ws.is_empty then
        toggleGamemode()
    end
end)


---------------
---- DEBUG ----
---------------

--[[
hl.config({
    debug = {
        overlay = true,
    },
})
]]