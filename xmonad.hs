import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.SetWMName

import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

main = do
    xmonad $ gnomeConfig {
       modMask = mod4Mask,
       startupHook = setWMName "LG3D"
    } `additionalKeys` myKeys

myKeys = [
            ((mod4Mask, xK_p), spawn "dmenu_run")
         ]

