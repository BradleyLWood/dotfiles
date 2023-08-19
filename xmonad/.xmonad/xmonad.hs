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
            [ ("M-S-z", spawn "xscreensaver-command -lock")
            , ("M-S-=", unGrab *> spawn "scrot -s"        )
            , ("M-p", spawn "rofi -show drun -modi")
            , ("M-S-p", spawn "rofi -show window -modi")
            , ("M-b", sendMessage ToggleStruts)
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

myLayout = avoidStruts $ noBorders Full ||| withSpaces tiled ||| tiled ||| withSpaces (Mirror tiled ) ||| Mirror tiled
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100
    withSpaces layout = spacingWithEdge 10 $ layout

