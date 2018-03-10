
-- http://www.linuxandlife.com/2011/11/how-to-configure-xmonad-arch-linux.html
-- http://pastebin.com/vvtZKAgw
-- http://thinkingeek.com/2011/11/21/simple-guide-configure-xmonad-dzen2-conky/

-- Imports
import XMonad

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)

-- Hooks
import XMonad.Operations
 
import System.IO
import System.Exit
 
import XMonad.Util.Run
 
 
import XMonad.Actions.CycleWS
 
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
 
import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
import XMonad.Layout.Minimize
 
import Data.Ratio ((%))
 
import qualified XMonad.StackSet as W
import qualified Data.Map as M

audLayout = avoidStruts
	
	$ smartBorders
	
	$ tiled ||| minimize (Tall 1 (3/100) (1/2)) ||| Mirror tiled ||| Full
	
	where
		-- default tiling algorithm partitions the screen into two panes
		tiled = spacing 5 $ Tall nmaster delta ratio
		
        -- golden = Tall nmaster delta goldenRatio
	
		-- The default number of windows in the master pane
		nmaster = 1
	
		-- Default proportion of screen occupied by master pane
		ratio = 2/3
	
		-- Percent of screen to increment by when resizing panes
		delta = 5/100
		
		goldenRatio = 6/10 -- sic
		
        -- horizontal = Mirror tiled
        
		
-- Define amount and names of workspaces
audWorkspaces = ["1:main","2:chat","3","whatever","5:media","6","7","8:web"]


-- Define layout for specific workspaces
nobordersLayout = noBorders $ Full

-- Put all layouts together
-- audLayout = onWorkspace "2:chat" nobordersLayout $ defaultLayouts


-- audManageHook = composeAll [
		-- Attach some applications for specific workspaces.
		-- That means when you open an app, xmonad will automatically move it to a defined workspace. 
		-- className =? "Iron" --> doShift "8:web",
		-- className =? "Xchat" --> doShift "2:chat"
		-- If you dont want xmonad to tile some applications,
		-- you can do add the following lines to the myManageHook like this:
		-- className =? "Gimp" --> doFloat,
		-- className =? "Gnome-player" --> doFloat
	-- ]

-- Note: to know the className of an app,
-- you can run the command "xprop" on the terminal,
-- the cursor will change to the crosshair shape then use this crosshair
-- to click on the app. The className of this app will appear on the terminal afterward.


-- keysToAdd x = [((modMask, xK_p), spawn "exe=`dmenu_run -b -nb black -nf yellow -sf yellow` && eval \"exec $exe\""), ((mod4Mask , xK_Up), W.swapUp), ((mod4Mask , xK_Down), W.swapDown), ((mod4Mask , xK_Left), W.swapLeft), ((mod4Mask , xK_Right), W.swapRight)]
-- keysToAdd x = [((modMask, xK_p), spawn "exe=`dmenu_run -b -nb black -nf yellow -sf yellow` && eval \"exec $exe\""), ((mod4Mask , xK_Up), W.swapUp), ((mod4Mask , xK_Down), W.swapDown)]

-- keysToDel x = [((mod4Mask .|. shiftMask), xK_c)]

-- newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x)) -- to include new keys to existing keys

-- audKeys x = foldr M.delete (newKeys x) (keysToDel x) -- to delete the unused keys
-- audKeys x = foldr (newKeys x)

-- Dzen/Conky
audXmonadBar = "dzen2 -x '1440' -y '0' -h '15' -w '640' -ta 'l' -fg '#FFFFFF' -bg '#1B1D1E'"
-- audXmonadBar = "status.sh | dzen2 -ta r -fn '-*-profont-*-*-*-*-11-*-*-*-*-*-iso8859' -x '1440' -y '0' -h '15' -w '640' -ta 'l' -bg '#2c2c32' -fg 'grey70' -p -e ''"
audStatusBar = "conky -c ~/.xmonad/.conky_dzen | dzen2 -x '2080' -w '1440' -h '15' -ta 'r' -bg '#1B1D1E' -fg '#FFFFFF' -y '0'"
-- audBitmapsDir = "~/.xmonad/dzen2"

--Bar
audLogHook :: Handle -> X ()
audLogHook h = dynamicLogWithPP $ defaultPP

-- Key mapping {{{
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
	[
		((modMask, xK_m), withFocused minimizeWindow),
		((modMask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin)
	]

-- Startup hook
-- audStartupHook = spawnHere "$HOME/wallpaper.sh"		-- ERROR:- xmonad.hs:129:18: Not in scope: ‘spawnHere’


main = do
	dzenLeftBar <- spawnPipe audXmonadBar
	dzenRightBar <- spawnPipe audStatusBar
	xmonad $ defaultConfig {
		layoutHook = audLayout,
		-- layoutHook = avoidStruts $ layoutHook defaultConfig,
		-- workspaces = audWorkspaces,
		-- manageHook = audManageHook <+> manageHook defaultConfig,
		logHook = audLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd,
		-- keys = audKeys,
		borderWidth = 2,
		normalBorderColor = "#ABC123",
		focusedBorderColor = "#456DEF"
		-- startupHook = audStartupHook
	}

