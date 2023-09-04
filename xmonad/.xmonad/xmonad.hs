import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab
import XMonad.Layout.Spacing
--import XMonad.Layout.NoBorders ( noBorders )

import XMonad.Hooks.EwmhDesktops

--------------------------------------------------------------------------------

main :: IO ()
main = do
     xmonad $ ewmh $ docks $ defaultConfig
            { modMask            = mod4Mask
            , layoutHook         = myLayout
            , manageHook         = myManageHook
            , terminal           = myTerminal
            , borderWidth        = myBorderWidth
            , normalBorderColor  = myNormalBorderColor
            , focusedBorderColor = myFocusedBorderColor
            , focusFollowsMouse  = myFocusFollowsMouse
			, clickJustFocuses   = myClickJustFocuses
            }
          `additionalKeysP`
            [ ("M-S-z"                     , spawn "xscreensaver-command -lock"               )
            , ("M-S-="                     , unGrab *> spawn "scrot -s"                       )
            , ("M-p"                       , spawn "rofi -show drun -modi"                    )
            , ("M-S-p"                     , spawn "rofi -show window -modi"                  )
            , ("M-b"                       , sendMessage ToggleStruts                         )
            , ("M-S-t"                     , spawn "xterm"                                    )
            -- FIXME: these are not working
            --, ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5"  )
            --, ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5"  )
            --, ((0, xF86XK_AudioMute)       , spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
            -- Switch w, e, r monitory switching keys
            , ((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
                | (key, sc) <- zip [xK_w, xK_e, xK_r] [2,1,3]
                , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
            ]

--------------------------------------------------------------------------------

myTerminal = "kitty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth = 2
myFocusedBorderColor = "#CA72E4"
myNormalBorderColor = "#343E4F"

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , isDialog                      --> doFloat
    ]

--------------------------------------------------------------------------------

myLayout = avoidStruts $ withSpaces Full ||| Full ||| withSpaces tiled ||| withSpaces (Mirror tiled )
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 3/5
    delta   = 3/100
    withSpaces layout = spacingWithEdge 30 $ layout

