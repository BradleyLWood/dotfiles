import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Loggers
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageHelpers

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

myConfig = def
    { modMask = mod4Mask
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
    [ ("M-<Return>" , spawn "kitty")
    , ("M-C-s"      , unGrab *> spawn "scrot -s")
    , ("M-p"        , spawn "rofi -show drun -modi")
    , ("M-S-p"      , spawn "rofi -show window -modi")
    ]

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

myLayout = withSpaces Full ||| Full ||| withSpaces tiled ||| withSpaces (Mirror tiled )
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1      -- Default number of windows in the master pane
        ratio   = 1/2    -- Default proportion of screen occupied by master pane
        delta   = 3/100  -- Percent of screen to increment by when resizing panes
        withSpaces layout = spacingWithEdge 30 $ layout
