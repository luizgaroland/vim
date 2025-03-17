import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders

main = do
    xmonad $ gnomeConfig {
       modMask = mod4Mask,
       manageHook = hookzin
    } `additionalKeys` myKeys

myKeys = [
            ((mod4Mask, xK_p), spawn "dmenu_run"),
            ((mod4Mask, xK_d), spawn "shutter -s")
         ]


hookzin = manageHook gnomeConfig 

