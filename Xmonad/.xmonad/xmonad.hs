
import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.Minimize
import qualified Data.Map as M
import System.Exit -- exitWith
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
-- Fullscreen imports:
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W
import Control.Monad
import Data.Monoid (All (All))

{-
# Unity flavor sources:
http://www.haskell.org/haskellwiki/Xmonad/Using_xmonad_in_Unity_2D
http://markhansen.co.nz/xmonad-ubuntu-oneiric/
https://gist.github.com/1300108
-}

--myLayout = minimize (Tall 1 (3/100) (1/2)) -- ||| Full
--unityLayout = gaps [(U, 24)] $ layoutHook gnomeConfig
unityLayout = gaps [(U, 24)] (layoutHook gnomeConfig)
          ||| noBorders (fullscreenFull Full)

myKeys conf@(XConfig {XMonad.modMask = modm}) = -- M.fromList $ -- comment M.fromList when using 'newKeys'
             [
	       ((modm , xK_Escape)          , kill)
	     , ((modm , xK_s)               , spawn $ XMonad.terminal conf)
	     , ((modm , xK_f)               , spawn "alacritty")
         , ((modm , xK_x)               , spawn "firefox")
         , ((modm , xK_d)               , spawn "nautilus --new-window")
         , ((modm , xK_b)               , spawn "gvim")
         , ((modm , xK_v)               , spawn "code")
         , ((modm , xK_o)               , spawn "opera")
         , ((modm , xK_a)               , spawn "gnome-system-monitor")
         , ((modm , xK_c)               , spawn "chromium-browser")
         , ((modm , xK_i)               , spawn "insomnia")
         , ((modm .|. shiftMask , xK_d) , spawn "killall nautilus; nautilus")
         , ((modm .|. shiftMask , xK_Page_Up) , spawn "gnome-session-quit --reboot")
         , ((modm .|. shiftMask , xK_Page_Down) , spawn "gnome-session-quit --power-off")
             ]

newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

main = do
  xmonad $ gnomeConfig
    { terminal    = "gnome-terminal"
    , modMask     = mod4Mask
--    , doFloat     = ["Evince", "Totem"]
    , focusFollowsMouse = False
    , borderWidth = 2
    , normalBorderColor  = "#FFFFFF"
    , focusedBorderColor = "#000000" -- "#00FF00" -- terminal green -- "#A6E1FF" -- "green"
--    , layoutHook = noBorders Full
--    , layoutHook  = myLayout
    , layoutHook = unityLayout
    , keys       = newKeys
    , manageHook = unityManageHook
    }

unityManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
--    , className =? "Unity-2d-launcher" --> doFloat
    , className =? "Unity-2d-launcher" --> doIgnore
    ])

