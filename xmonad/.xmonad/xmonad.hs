
-- Misc
{-# LANGUAGE DeriveDataTypeable, NoMonomorphismRestriction, TypeSynonymInstances, MultiParamTypeClasses, FlexibleContexts #-}

-- Imports
import XMonad

-- Core
import XMonad.Core

-- Actions
import XMonad.Actions.CycleWS (nextWS, prevWS, toggleWS, toggleOrView)
import XMonad.Actions.FloatKeys
import XMonad.Actions.GridSelect

-- Hooks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks (avoidStruts, avoidStrutsOn, manageDocks)
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

-- Layout
import XMonad.Layout
import XMonad.Layout.IM
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Layout.OneBig
import XMonad.Layout.Master
import XMonad.Layout.Spacing
import XMonad.Layout.Reflect
import XMonad.Layout.Minimize
import XMonad.Layout.MosaicAlt
import XMonad.Layout.NoBorders (smartBorders, noBorders, withBorder)
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.SimpleFloat
import XMonad.Layout.LayoutHints
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier

-- Operations
import XMonad.Operations

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import XMonad.Prompt.AppendFile (appendFilePrompt)
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)

-- StackSet
import XMonad.StackSet (RationalRect (..), currentTag)

-- Util
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.Cursor
import XMonad.Util.Scratchpad (scratchpadManageHook, scratchpadSpawnActionCustom)
import XMonad.Util.NamedScratchpad

-- Data
import Data.List
import Data.Ratio ((%))
import Data.Monoid

-- Graphics
import Graphics.X11.ExtraTypes.XF86

-- System
import System.IO (Handle, hPutStrLn)
import System.Exit

-- Qualified
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import qualified XMonad.Actions.FlexibleResize as Flex

-- APPEARANCE CONFIG

-- Font
myFont   = "Envy Code R:size=11"
dzenFont = "Envy Code R:size=11"
conkyFont = "Source Han Sans,源ノ角ゴシック,Source Han Sans Normal,源ノ角ゴシック Normal:style=Normal,Regular:size=11"


-- Color
colorBlack    = "#1A1A1A"	-- Background (Dzen BG)
colorBlackAlt = "#404040"	-- Black Xdefaults
colorGrey     = "#444444"	-- Grey (Dzen FG)
colorGreyAlt  = "#161616"	-- Grey dark
colorWhite    = "#808080"	-- Foreground (Shell FG)
colorWhiteAlt = "#9D9D9D"	-- White dark (Dzen FG)
colorMagenta  = "#8E82A2"
colorBlue     = "#87AFD7"
colorYellow   = "#FFE863"
colorRed      = "#D75F5F"
colorGreen    = "#BDE077"

-- Arrow
myArrow = "^fg(" ++ colorWhiteAlt ++ ")>^fg(" ++ colorBlue ++ ")>^fg(" ++ colorGrey ++ ")>"

-- Border
myNormalBorderColor  = "#222222"
myFocusedBorderColor = "#A54242"

-- Tab Theme
myTabTheme :: Theme
myTabTheme = defaultTheme {
		fontName              = myFont
		, inactiveBorderColor = colorBlackAlt
		, inactiveColor       = colorBlack
		, inactiveTextColor   = colorGrey
		, activeBorderColor   = colorGrey
		, activeColor         = colorBlackAlt
		, activeTextColor     = colorWhiteAlt
		, urgentBorderColor   = colorGrey
		, urgentColor         = colorGreen
		, decoHeight          = 14
	}

myXPConfig :: XPConfig
myXPConfig = defaultXPConfig {
		font                = myFont
		, bgColor           = colorBlack
		, fgColor           = colorWhite
		, bgHLight          = colorBlue
		, fgHLight          = colorWhite
		, borderColor       = colorGreyAlt
		, promptBorderWidth = 1
		, height            = 16
		, position          = Top
		, historySize       = 100
		, historyFilter     = deleteConsecutive
		, autoComplete      = Nothing
	}

-- GridSelect Color Scheme
myColorizer :: Window -> Bool -> X (String, String)
myColorizer = colorRangeFromClassName
	(0x00, 0x00, 0x00)	-- Lowest inactive BG
	(0x60, 0xA0, 0xC0)	-- Highest inactive BG
	(0x34, 0x75, 0xAA)	-- Active BG
	(0xBB, 0xBB, 0xBB)	-- Inactive FG
	(0x00, 0x00, 0x00)	-- Active FG

myGSConfig :: t-> GSConfig Window
myGSConfig colorizer = (buildDefaultGSConfig myColorizer) {
		gs_cellheight    = 50
		, gs_cellwidth   = 200
		, gs_cellpadding = 10
		, gs_font        = myFont
	}

-- Workspaces
myWorkspaces :: [WorkspaceId]
myWorkspaces = ["[1:WEB]", "[2:CODE]", "[3:TERM]", "[4:CHAT]", "[5:GFX]", "[6:OTHER]"]

-- LAYOUT CONFIG

-- Layouts
myTitle = named "T"  $  spacing 5 $  smartBorders $  ResizableTall 1 0.03 0.05 []
myMirr  = named "MT" $  spacing 5 $  smartBorders $  Mirror myTitle
myMosA  = named "M"  $  spacing 5 $  smartBorders $  MosaicAlt M.empty
myObig  = named "O"  $  spacing 5 $  smartBorders $  OneBig 0.05 0.05
myTabs  = named "TS" $  spacing 5 $  smartBorders $  tabbed shrinkText myTabTheme
myFull  = named "TS" $  spacing 5 $  smartBorders $  tabbedAlways shrinkText myTabTheme
myTabM  = named "TM" $  spacing 5 $  smartBorders $  mastered 0.01 0.04 $  tabbed shrinkText myTabTheme
myGimp  = named "G" $ spacing 5 $ withIM (0.15) (Role "gimp-toolbox") $ reflectHoriz $ withIM (0.20) (Role "gimp-dock") myMosA
myChat  = named "C" $ spacing 5 $ withIM (0.20) (Title "Buddy List") $ Mirror $ ResizableTall 1 0.03 0.5 []

-- Transformers (W + f)
data TABBED = TABBED deriving (Read, Show, Eq, Typeable)
instance Transformer TABBED Window where
	transform TABBED x k = k myFull (\_ -> x)

-- Layout Hook
{-
myLayoutHook = id
	$ gaps [(U, 16), (D, 16), (L, 0), (R, 0)]
	$ avoidStruts
	$ minimize
	$ mkToggle (single TABBED)
	$ mkToggle (single MIRROR)
	$ mkToggle (single REFLECTX)
	$ mkToggle (single REFLECTY)
	$ onWorkspace (myWorkspaces !! 1) webLayouts	-- Workspace 1 layouts
	$ onWorkspace (myWorkspaces !! 2) codeLayouts	-- Workspace 2 layouts
	$ onWorkspace (myWorkspaces !! 4) chatLayouts	-- Workspace 4 layouts
	$ onWorkspace (myWorkspaces !! 5) gimpLayouts	-- Workspace 5 layouts
	$ allLayouts
	where
		allLayouts  = myTitle ||| myObig  ||| myMirr ||| myMosA ||| myTabM ||| myFull ||| Full
		webLayouts  = myTabs  ||| myTabM
		codeLayouts = myTabM  ||| myTitle
		chatLayouts = myChat
		gimpLayouts = myGimp
-}

myLayoutHook = id
	$ avoidStruts
	
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
        
-- MANAGE HOOK CONFIG

-- Scratchpad (W + º)
manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect (0) (1/50) (1) (3/4))
scratchPad = scratchpadSpawnActionCustom "urxvt -name scratchpad"

-- Manage Hook
myManageHook :: ManageHook
myManageHook = (composeAll . concat $ [
		[resource                          =? r --> doIgnore                         | r <- myIgnores] --  Ignore Desktop
		, [className                       =? c --> doShift (myWorkspaces !! 0)      | c <- myWebS]    --  Move myWebS windows to workspace 1 by classname
		, [className                       =? c --> doShift (myWorkspaces !! 1)      | c <- myCodeS]   --  Move myCodeS windows to workspace 2 by classname
		, [className                       =? c --> doShift (myWorkspaces !! 2)      | c <- myTermS]   --  Move myTermS windows to workspace 3 by classname
		, [className                       =? c --> doShift (myWorkspaces !! 3)      | c <- myChatS]   --  Move myChatS windows to workspace 4 by classname
		, [className                       =? c --> doShift (myWorkspaces !! 4)      | c <- myGfxS]    --  Move myGfxS windows to workspace 5 by classname
		, [className                       =? c --> doShiftAndGo (myWorkspaces !! 5) | c <- myOtherS]  --  Move myOtherS windows to workspace 6 by classname and shift
		, [className                       =? c --> doCenterFloat                    | c <- myFloatCC] --  Float center geometry by classname
		, [className                       =? c --> doF W.focusDown                  | c <- myFocusDC] --  Don't focus on launching by classname
		, [name                            =? n --> doCenterFloat                    | n <- myFloatCN] --  Float center geometry by name
		, [name                            =? n --> doSideFloat NW                   | n <- myFloatSN] --  Float side NW geometry by name
		, [isFullscreen                         --> doFullFloat]
	]) <+> manageScratchPad
	where
		doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws
		role            = stringProperty "WM_WINDOW_ROLE"
		name            = stringProperty "WM_NAME"
		myIgnores       = ["desktop", "desktop_window"]
		myWebS          = ["google-chrome", "Google-chrome", "google-chrome-stable", "Google-chrome-stable"]
		myCodeS         = ["gvim", "Gvim", "GVIMi", "sublime_text", "Sublime_text", "subl3", "Subl3", "code", "Code", "libin", "Ltbin", "atom", "Atom", "MonoDevelop", "Pipeline", "nw", "Nw", "emacs", "Emacs"]
		myTermS         = ["urxvt", "URxvt", "rxvt", "rxvt-unicode"]
		myChatS         = ["irssi","Pidgin", "skype", "skype-call-recorder"]
		myGfxS          = ["gimp", "Gimp", "gimp-2.8", "Gimp-2.8", "inkscape", "Inkscape"]
		myOtherS        = ["Transmission-gtk"]
		myFloatCC       = ["Main", "Gksu"]
		myFloatCN       = []
		myFloatSN       = ["Event Tester"]
		myFocusDC       = ["Event Tester", "Notify-osd"]
		-- myFloatCC    = ["MPlayer", "File-roller", "zsnes", "Gcalctool", "Exo-helper-1", "Gksu", "PSX", "Galculator", "Nvidia-settings", "XFontSel", "XCalc", "XClock", "Desmume", "Ossxmix", "Xvidcap", "Main", "Wicd-client.py", "com-mathworks-util-PostVMInit"]
		-- myFloatCN    = ["ePSXe - Enhanced PSX emulator", "Seleccione Archivo", "Config Video", "Testing plugin", "Config Sound", "Config Cdrom", "Config Bios", "Config Netplay", "Config Memcards", "About ePSXe", "Config Controller", "Config Gamepads", "Select one or more files to open", "Add media", "Choose a file", "Open Image", "File Operation Progress", "Firefox Preferences", "Preferences", "Search Engines", "Set up sync", "Passwords and Exceptions", "Autofill Options", "Rename File", "Copying files", "Moving files", "File Properties", "Replace", ""]
		-- myFloatSN    = ["Event Tester"]
		-- myFocusDC    = ["Event Tester", "Notify-osd"]

-- STATUS BAR CONFIG

-- UrgencyHook
myUrgencyHook = withUrgencyHook dzenUrgencyHook {
		args = ["-fn", dzenFont, "-bg", colorBlack, "-fg", colorGreen]
	}

-- StatusBars
myWorkspaceBar, myBottomStatusBar, myTopStatusBar :: String
myWorkspaceBar    = "dzen2 -x '0' -y '0' -h '17' -w '920' -ta 'l' -fg '" ++ colorWhiteAlt ++ "' -bg '" ++ colorBlack ++ "' -fn '" ++ conkyFont ++ "' -p -e ''" -- dzenFont ++ "' -p -e ''"
myBottomStatusBar = "conky -c ~/.xmonad/.conkydzenbottom | dzen2 -x '0' -y '1200' -h '17' -w '1920' -fg '" ++ colorWhiteAlt ++ "' -bg '" ++ colorBlack ++ "' -fn '" ++  conkyFont ++ "' -ta r -e ''" -- dzenFont ++ "' -ta r -e ''"
myTopStatusBar    = "conky -c ~/.xmonad/.conkydzentop | dzen2 -x '920' -y '0' -h '17' -w '1920' -fg '" ++ colorWhiteAlt ++ "' -bg '" ++ colorBlack ++ "' -fn '" ++  conkyFont ++ "' -ta r -e ''" -- dzenFont ++ "' -ta r -e ''"

-- myWorkspaceBar Config
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP {
		ppOutput            = hPutStrLn h
		, ppSort            = fmap (namedScratchpadFilterOutWorkspace.) (ppSort defaultPP)	-- Hide "NSP" from workspace list
		, ppOrder           = orderText
		, ppExtras          = []
		, ppSep             = "^fg(" ++ colorGrey ++ ")"
		, ppWsSep           = ""
		, ppCurrent         = dzenColor colorYellow colorBlack . pad
		, ppUrgent          = dzenColor colorGreen colorBlack . pad . wrapClickWorkSpace . (\a -> (a,a))
		, ppVisible         = dzenColor colorGrey colorBlack .pad . wrapClickWorkSpace . (\a -> (a,a))
		, ppHidden          = dzenColor colorWhiteAlt colorBlack . pad . wrapClickWorkSpace .(\a -> (a,a))
		, ppHiddenNoWindows = dzenColor colorGrey colorBlack . pad . wrapClickWorkSpace .(\a -> (a,a))
		, ppLayout          = dzenColor colorGreen colorBlack . pad . wrapClickLayout . layoutText
		, ppTitle           = dzenColor colorWhiteAlt colorBlack . pad . wrapClickTitle . titleText . dzenEscape
	}
	where
		-- Display config
		orderText (ws:l:t:_) = [ws,l,t]
		titleText []         = "Desktop " ++ myArrow
		titleText x          = (shorten 82 x) ++ " " ++ myArrow
		layoutText "Minimize T"  = "ReTall"
		layoutText "Minimize O"  = "OneBig"
		layoutText "Minimize TS" = "Tabbed"
		layoutText "Minimize TM" = "Master"
		layoutText "Minimize M"  = "Mosiac"
		layoutText "Minimize MT" = "Mirror"
		layoutText "Minimize G"  = "Mosiac"
		layoutText "Minimize C"  = "Mirror"
		layoutText "Minimize ReflectX T"  = "^fg(" ++ colorGreen ++ ")ReTall X^fg()"
		layoutText "Minimize ReflectX O"  = "^fg(" ++ colorGreen ++ ")OneBig X^fg()"
		layoutText "Minimize ReflectX TS" = "^fg(" ++ colorGreen ++ ")Tabbed X^fg()"
		layoutText "Minimize ReflectX TM" = "^fg(" ++ colorGreen ++ ")Master X^fg()"
		layoutText "Minimize ReflectX M"  = "^fg(" ++ colorGreen ++ ")Mosiac X^fg()"
		layoutText "Minimize ReflectX MT" = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		layoutText "Minimize ReflectX G"  = "^fg(" ++ colorGreen ++ ")Mosiac X^fg()"
		layoutText "Minimize ReflectX C"  = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		layoutText "Minimize ReflectY T"  = "^fg(" ++ colorGreen ++ ")ReTall X^fg()"
		layoutText "Minimize ReflectY O"  = "^fg(" ++ colorGreen ++ ")OneBig X^fg()"
		layoutText "Minimize ReflectY TS" = "^fg(" ++ colorGreen ++ ")Tabbed X^fg()"
		layoutText "Minimize ReflectY TM" = "^fg(" ++ colorGreen ++ ")Master X^fg()"
		layoutText "Minimize ReflectY M"  = "^fg(" ++ colorGreen ++ ")Mosiac X^fg()"
		layoutText "Minimize ReflectY MT" = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		layoutText "Minimize ReflectY G"  = "^fg(" ++ colorGreen ++ ")Mosiac X^fg()"
		layoutText "Minimize ReflectY C"  = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		layoutText "Minimize ReflectX ReflectY T"  = "^fg(" ++ colorGreen ++ ")ReTall X^fg()"
		layoutText "Minimize ReflectX ReflectY O"  = "^fg(" ++ colorGreen ++ ")OneBig X^fg()"
		layoutText "Minimize ReflectX ReflectY TS" = "^fg(" ++ colorGreen ++ ")Tabbed X^fg()"
		layoutText "Minimize ReflectX ReflectY TM" = "^fg(" ++ colorGreen ++ ")Master X^fg()"
		layoutText "Minimize ReflectX ReflectY M"  = "^fg(" ++ colorGreen ++ ")Mosiac X^fg()"
		layoutText "Minimize ReflectX ReflectY MT" = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		layoutText "Minimize ReflectX ReflectY G"  = "^fg(" ++ colorGreen ++ ")Mosiac X^fg()"
		layoutText "Minimize ReflectX ReflectY C"  = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		layoutText x                  = "^fg(" ++ colorGreen ++ ")Mirror X^fg()"
		-- Clickable config
		wrapClickLayout content       = "^ca(1, xdotool key alt+space)" ++ content ++ "^ca()"	-- Clickable layout
		wrapClickTitle content        = "^ca(1, xdotool key alt+j)" ++ content ++ "^ca()"	-- Clickable title
		wrapClickWorkSpace (idx, str) = "^ca(1, " ++ xdo "w;" ++ xdo index ++ ")" ++ "^ca(3, " ++ xdo "e;" ++ xdo index ++ ")" ++ str ++ "^ca()^ca()"	-- Clickable workspaces
			where
				wsIdxToString Nothing  = "1"
				wsIdxToString (Just n) = show (n + 1)
				index                  = wsIdxToString (elemIndex idx myWorkspaces)
				xdo key                = "xdotool key alt+" ++ key

-- BINDINGS CONFIG

-- Key Bindings
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $ [
		((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)	-- Launch a terminal
		
		, ((modMask, xK_F2), shellPrompt myXPConfig)	-- Launch Xmonad shell prompt
		, ((modMask, xK_F3), xmonadPrompt myXPConfig)	-- Launch Xmonad prompt
		
		, ((modMask, xK_g), goToSelected $ myGSConfig myColorizer)	-- Launch GridSelect
		
		-- , ((modMask, xK_masculine), scratchPad)	-- Scratchpad
		, ((modMask, xK_semicolon), scratchPad)	-- Scratchpad
		
		, ((modMask .|. shiftMask, xK_w), spawn "chromium")	-- Launch Chromium
		, ((modMask .|. shiftMask, xK_g), spawn "gvim")		-- Launch GVIM
		, ((modMask .|. shiftMask, xK_e), spawn "emacs")	-- Launch Emacs
		, ((modMask .|. shiftMask, xK_p), spawn "pcmanfm")	-- Launch PCManFM
		, ((modMask .|. shiftMask, xK_u), spawn "urxvt")	-- Launch urxvt terminal
		, ((modMask .|. shiftMask, xK_h), spawn "hyper")	-- Launch hyper terminal
		, ((modMask .|. shiftMask, xK_n), spawn "urxvt -e ncmpcpp")	-- Launch ncmpcpp in urxvt terminal
		, ((modMask .|. shiftMask, xK_c), kill)	-- Closed focused window
		
		, ((modMask, xK_p), spawn "dmenu_run -fn 'Envy Code R:size=12' -y '600' -h '27' -dim 0.0 -nb '#222222' -sb '#BDE077' -sf '#111111'")	-- Launch dmenu2
		, ((modMask, xK_d), spawn "i3-dmenu-desktop")	-- Launch i3-dmenu-desktop
		
		, ((modMask .|. controlMask .|. shiftMask, xK_r), spawn "shutdown -r now")	-- Reboot
		, ((modMask .|. controlMask .|. shiftMask, xK_s), spawn "shutdown -h now")	-- Shutdown
		
		, ((modMask, xK_space), sendMessage NextLayout)	-- Rotate through the available layout algorithms
		, ((modMask, xK_Tab), windows W.focusDown)	-- Move focus to the next window
		, ((modMask, xK_j), windows W.focusDown)	-- Move focus to the next window
		, ((modMask .|. shiftMask, xK_Tab), windows W.focusUp)	-- Move focus to the previous window
		, ((modMask, xK_k), windows W.focusUp)	-- Move focus to the previous window
		, ((modMask, xK_a), windows W.focusMaster)	-- Move focus to the master window
		, ((modMask, xK_Return), windows W.swapMaster)	-- Swap the focused window with the master window
		, ((modMask .|. shiftMask, xK_a), windows W.swapMaster)	-- Swap the focused window with the master window
		, ((modMask .|. shiftMask, xK_j), windows W.swapDown)	-- Swap the focused window with the next window
		, ((modMask .|. shiftMask, xK_k), windows W.swapUp)	-- Swap the focused window with the previous window
		
		, ((modMask, xK_h), sendMessage Shrink)	-- Shrink the master area
		, ((modMask, xK_l), sendMessage Expand)	-- Expand the master area
		, ((modMask, xK_Down), sendMessage MirrorShrink)	-- MirrorShrink the master area
		, ((modMask, xK_Up), sendMessage MirrorExpand)	-- MirrorExpand the master area
		
		, ((modMask .|. controlMask, xK_Left), withFocused (keysResizeWindow (-30, 0) (0,0)))	-- Shrink floated window horizontally
		, ((modMask .|. controlMask, xK_Right), withFocused (keysResizeWindow (30, 0) (0,0)))	-- Expand floated window horizontally
		, ((modMask .|. controlMask, xK_Up), withFocused (keysResizeWindow (0, -30) (0,0)))		-- Shrink floated window horizontally
		, ((modMask .|. controlMask, xK_Down), withFocused (keysResizeWindow (0, 30) (0,0)))	-- Expand floated window horizontally
		
		, ((modMask, xK_t), withFocused $ windows . W.sink)	-- Push window into tiling
		, ((modMask .|. shiftMask, xK_t), rectFloatFocused)	-- Push window into floating
		
		, ((modMask, xK_s), sendMessage $ XMonad.Layout.MultiToggle.Toggle TABBED)	-- Push layout into tabbed
		, ((modMask .|. shiftMask, xK_s), sendMessage $ Toggle MIRROR)	-- Push layout into mirror
		
		, ((modMask .|. shiftMask, xK_x), sendMessage $ XMonad.Layout.MultiToggle.Toggle REFLECTX)	-- Reflect layout by X
		, ((modMask .|. shiftMask, xK_y), sendMessage $ XMonad.Layout.MultiToggle.Toggle REFLECTY)	-- Reflect layout by Y
		
		-- , ((modMask, xK_m), withFocused minimizeWindow)	-- Minimize window
		-- , ((modMask .|. shiftMask, xK_m), sendMessage $ RestoreNextMinimizedWin)	-- Restore window
		, ((modMask .|. shiftMask, xK_f), fullFloatFocused)	-- Push window into full screen
		
		, ((modMask, xK_comma), sendMessage (IncMasterN 1))	-- Increment the number of windows in the master area
		, ((modMask, xK_period), sendMessage (IncMasterN (-1)))	-- Decrement the number of windows in the master area
		
		-- , ((modMask .|. controlMask .|. shiftMask, xK_Delete), spawn "xscreensaver-command -lock")			-- Lock screen
		, ((modMask .|. controlMask .|. shiftMask, xK_Delete), spawn "xsecurelock auth_pam_x11 saver_blank")	-- Lock screen
		
		, ((modMask, xK_q), restart "xmonad" True)						-- Restart xmonad
		, ((modMask .|. shiftMask, xK_q), io (exitWith ExitSuccess))	-- Quit xmonad
		
		, ((modMask, xK_slash), toggleWS)	-- Toggle to the workspace displayed previously
		-- , ((modMask, xK_o), toggleOrView (myWorkspaces !! 0))	-- If ws != 0 then move to workspace 0, else move to latest ws where called from
		
		, ((0, xK_Print), spawn "scrot ~/Pictures/%Y-%m-%d-%H:%M:%S.png; notify-send 'Screenshot has been saved to ~/Pictures'")	-- Take a screenshot
		, ((controlMask, xK_Print), spawn "notify-send 'Selection will be saved to ~/Pictures'; scrot -s ~/Pictures/%Y-%m-%d-%H:%M:%S.png")	-- Select area and take a screenshot
		
		-- Function key combinations
		, ((0, xF86XK_MonBrightnessDown), spawn $ "xbacklight -dec 5")
		, ((0, xF86XK_MonBrightnessUp), spawn $ "xbacklight -inc 5")
		, ((0, xF86XK_AudioRaiseVolume), spawn $ "amixer set Master 1+ unmute")
		, ((0, xF86XK_AudioLowerVolume), spawn $ "amixer set Master 1- unmute")
		, ((0, xF86XK_AudioMute), spawn $ "amixer -D pulse set Master 1+ toggle")


	]
	++
	[
		((m .|. modMask, k), windows $ f i)	-- Switch to n workspaces and send client to n workspaces
		| (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
		, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
	]
	++
	[
		((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))	-- Switch to n screens and send client to n screens
		| (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
		, (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
	]
	where
		fullFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery doFullFloat f
		rectFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery (doRectFloat $ RationalRect 0.05 0.05 0.9 0.9) f

-- Mouse Bindings
myMouseBindings :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $ [
		((modMask, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))	-- Set the window to floating mode and move by dragging
		, ((modMask, button2), (\w -> focus w >> windows W.shiftMaster))	-- Raise the window to the top of the stack
		, ((modMask, button3), (\w -> focus w >> Flex.mouseResizeWindow w))	-- Set the window to floating mode and resize by dragging
		, ((modMask, button4), (\_ -> prevWS))	-- Switch to previous workspace
		, ((modMask, button5), (\_ -> nextWS))	-- Switch to next workspace
	]

-- Main
main :: IO ()
main = do
	workspaceBar    <- spawnPipe myWorkspaceBar
	-- bottomStatusBar <- spawnPipe myBottomStatusBar
	topStatusBar    <- spawn myTopStatusBar
	
	-- Since not using .xinitrc this will initialize everything
	init <- spawn "~/.xmonad/.startxmonad"
	
	xmonad $ myUrgencyHook $ defaultConfig {
		terminal             = "urxvt"
		, focusFollowsMouse  = True
		, borderWidth        = 2
		, normalBorderColor  = myNormalBorderColor
		, focusedBorderColor = myFocusedBorderColor
		, layoutHook         = myLayoutHook
		, workspaces         = myWorkspaces
		, manageHook         = manageDocks <+> myManageHook
		, logHook            = (myLogHook workspaceBar) <+> ewmhDesktopsLogHook >> setWMName "LG3D"	-- ewmh needed so that chromium gain focus & LG3D is needed for Java to work properly
		, handleEventHook    = fullscreenEventHook
		, keys               = myKeys
		, mouseBindings      = myMouseBindings
		, startupHook        = setDefaultCursor xC_left_ptr >> setWMName "LG3D"
	}
	

