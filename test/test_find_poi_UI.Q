[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=afdafe66-3ac9-480d-8b20-ad033fb5f7d3
Description=test_find_poi_UI
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
// initial setup for add-on
Plugin.RegDll.Reg "C:\Users\Roger\Downloads\������F\�j�z����3.1233\dm.dll"
set dm = createobject("dm.dmsoft")
ver = dm.Ver()
If len(ver) = 0 Then
    MessageBox "�Ыع�H����,�ˬd�t�άO�_�T�ΤFvbs�}���v��"
    EndScript
End If
dm_ret = dm.SetPath("C:\Users\Roger\Downloads\������F\pic")

// find poi window
Hwnd = Plugin.Window.Find(0, "poi")
HwndEx = Plugin.Window.FindEx(Hwnd, 0, "Chrome_RenderWidgetHostHWND", "Chrome Legacy Window")
//dm.FindWindow("", "poi")
//HwndEx = dm.FindWindowByProcess("poi.exe","","poi") 
//TracePrint Hwnd
//TracePrint HwndEx

// bind thewindow
dm_ret = dm.BindWindow(Hwnd, "dx2", "normal", "normal", 0)
Delay 1000 // delay for long process time
// check for sucessful bind
//dm_ret = dm.Capture(0,0,2000,2000,"screen.bmp")

//--------------------------------------------------------
// picture used
pic_return_test_panel = ".\return\test_panel.bmp" // poi exp timer
//--------------------------------------------------------

//--------------------------------------------------------
// main program
infinteLoopTillPicFoundWithDelay pic_return_test_panel

//--------------------------------------------------------

Function findPicWithRandomClick(filePath)
	// note: random click range box is the picture size
	//--------------------------------------------------------
    // Randomizer for click (148,243 to 242,339) where pic (95x97 pixiel)
    // initial Randomize
    Randomize
    // get pic size
    pic_size = dm.GetPicSize(filePath)
    //TracePrint pic_size // [width],[height]
    pic_size = split(pic_size,",")
    w = int(pic_size(0))
    h = int(pic_size(1))
    //TracePrint "�e��:"&w
    //TracePrint "����:"&h
    // get the Randomize numbers within the range (dont add 1 because -1 for 1 overlap pixiel)
    range_x = Int(w * Rnd)
    range_y = Int(h * Rnd)
    //TracePrint range_x
    //TracePrint range_y
    //--------------------------------------------------------
    
    //--------------------------------------------------------
    Rem recheck
    // check for right Delay
    //dm_ret = dm.Capture(0,0,2000,2000,"screen.bmp")
    // find attack button pic
    dm_ret = dm.FindPic(0, 0, 2000, 2000, filePath, "000000", 0.9, 0, intX, intY)
    //TracePrint intX
    //TracePrint intY
    If intX >= 0 and intY >= 0 Then
        //MessageBox "���"
        // Random Delay
		Delay 100*Int((25*Rnd)+1)
        Call Plugin.Bkgnd.LeftClick(HwndEx, intX+range_x, intY+range_y)
        //TracePrint intX+range_x
        //TracePrint intY+range_y
        //dm.MoveTo intX,intY
        //dm.LeftClick
    Else 
        MessageBox "�S���"
        // not found then Delay 1 sec and check again
        Delay 1000
		Goto recheck
    End If
    //--------------------------------------------------------
End Function

Function infinteLoopTillPicFoundWithDelay(filePath)
    // look for next button
    Rem recheck_next_btn
    // check for right Delay
    dm_ret = dm.Capture(0,0,2000,2000,"screen.bmp")
    // find attack button pic
    dm_ret = dm.FindPic(0, 0, 2000, 2000, filePath, "000000", 0.9, 0, intX, intY)
    //TracePrint intX
    //TracePrint intY
    If intX >= 0 and intY >= 0 Then
        MessageBox "���"
    Else
        MessageBox "�S���"
        // Delay 2 more sec for loading
        Delay 2000
        Goto recheck_next_btn
    End If
End Function

Function ramdomClickWithCertainRangeBox(width, height)
	//--------------------------------------------------------
	// initial Randomize
	Randomize
	// get the Randomize numbers within the range (dont add 1 because -1 for 1 overlap pixiel)
	range_x = Int(width * Rnd)
	range_y = Int(height * Rnd)
	// Random Delay
	Delay 100*Int((25*Rnd)+1)
	Call Plugin.Bkgnd.LeftClick(HwndEx, 7+range_x, 35+range_y)
	//--------------------------------------------------------
End Function

Sub OnScriptExit()
    dm_ret = dm.UnBindWindow()
End Sub
Hwnd = 0
HwndEx = 0