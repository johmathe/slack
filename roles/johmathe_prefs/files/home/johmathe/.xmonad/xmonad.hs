import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.LayoutScreens
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myLayouts = simpleTabbed ||| Full ||| tall ||| Mirror tall ||| simpleFloat
	where tall = Tall 1 (3/100) (1/2)

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/johmathe/.xmonad/xmobar.rc"
  xmonad $ defaultConfig 
             { modMask = mod4Mask
             , terminal = "xterm"
             , manageHook = manageDocks <+> manageHook defaultConfig
             , layoutHook = avoidStruts $ myLayouts
             , logHook = (dynamicLogWithPP $ xmobarPP
                                               { ppOutput = hPutStrLn xmproc
                                               , ppTitle = xmobarColor "green" "" . shorten 50
                                               } ) >> updatePointer (Relative 0 0)
             } `additionalKeys`
             [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
             , ((mod4Mask, xK_p)              , spawn "exe=$(dmenu_path | dmenu) && eval \"exec $exe\"")
             -- Pretend there are 2 physical screens
             , ((mod4Mask .|. shiftMask, xK_t), layoutScreens 2 (TwoPane 0.5 0.5))
             -- ...and revert to a single one
             , ((mod4Mask .|. shiftMask, xK_o), rescreen)
             ]
