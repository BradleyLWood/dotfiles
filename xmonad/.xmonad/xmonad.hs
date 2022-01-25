import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Util.Run(spawnPipe, hPutStrLn)
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders ( noBorders )

import XMonad.Hooks.EwmhDesktops

--------------------------------------------------------------------------------

main :: IO ()
main = do
     xmproc <- spawnPipe "xmobar /home/bradley/.xmonad/xmobarrc"
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
            , logHook            = dynamicLogWithPP $ myXmobarPP xmproc
            }
          `additionalKeysP`
            [ ("M-S-z", spawn "xscreensaver-command -lock")
            , ("M-S-=", unGrab *> spawn "scrot -s"        )
            , ("M-p", spawn "rofi -show drun -modi")
            , ("M-S-p", spawn "rofi -show window -modi")
            , ("M-b", sendMessage ToggleStruts)
            ]

--------------------------------------------------------------------------------

myTerminal = "alacritty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth = 2
myNormalBorderColor = "#434C5E"
myFocusedBorderColor = "#B48EAD"

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , isDialog                      --> doFloat
    ]

--------------------------------------------------------------------------------

myLayout = avoidStruts $ noBorders Full ||| withSpaces tiled ||| tiled ||| withSpaces (Mirror tiled ) ||| Mirror tiled
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100
    withSpaces layout = spacingWithEdge 10 $ layout

--------------------------------------------------------------------------------

myXmobarPP xmproc = def
    { ppSep             = white " | "
    , ppTitle           = green . shorten 40
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap "<" ">"
    , ppVisible         = white
    , ppHidden          = lowWhite
    , ppUrgent          = red . wrap "!" "!"
    , ppOutput          = hPutStrLn xmproc
    }
  where
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
    --red, blue, green, white, lowWhite, yellow, magenta :: String -> String
    red      = xmobarColor "#BF616A" ""
    green    = xmobarColor "#A3BE8C" ""
    blue     = xmobarColor "#81A1C1" ""
    white    = xmobarColor "#E5E9F0" ""
    lowWhite = xmobarColor "#586266" ""
    yellow   = xmobarColor "#EBCB8B" ""
    magenta  = xmobarColor "#B48EAD" ""

