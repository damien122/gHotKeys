#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\diagram_v2_21.ico
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Description=Tool to define global hotkeys for media control
#AutoIt3Wrapper_Res_Fileversion=1.0.0.2
#AutoIt3Wrapper_Res_ProductName=gHotKeys
#AutoIt3Wrapper_Res_CompanyName=Damien122
#AutoIt3Wrapper_Res_LegalCopyright=Damien122
#AutoIt3Wrapper_Res_SaveSource=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Damien122

 Script Function:
	Set Global Hotkeys for Media Key replacement

#ce ----------------------------------------------------------------------------

#include '_Startup.au3'
FileInstall(".\config.ini", @ScriptDir & "\config.ini")

Global Const $__configFileName = "config.ini"
Global $__firstrun, $__nextButton, $__prevButton, $__playButton


Func Setup()
   If $__firstrun == True Then
      _StartupFolder_Install() ; Add the running EXE to the Current Users startup folder.
      ShellExecute(@StartupDir & '\')
      IniWrite($__configFileName, "GENERAL", "firstrun", "False")
   EndIf
EndFunc

Func SetGlobalHotKeys()
   HotKeySet($__playButton, "PlayPause")	; value from config.ini
   HotKeySet($__nextButton, "NextSong")	; value from config.ini
   HotKeySet($__prevButton, "PrevSong")	; value from config.ini
EndFunc

Func PrevSong()
   send("{MEDIA_PREV}")
EndFunc


Func NextSong()
   send("{MEDIA_NEXT}")
EndFunc


Func PlayPause()
   send("{MEDIA_PLAY_PAUSE}")
EndFunc


Func ReadConfig()
   local $sectionList = IniReadSectionNames ( @ScriptDir & "\" & $__configFileName )
   If Not @error Then
      For $i = 1 To $sectionList[0]
         Switch String($sectionList[$i])
            Case "GENERAL"
               local $firstrunvalue = IniRead($__configFileName, $sectionList[$i], "firstrun", "default")
               If StringCompare($firstrunvalue, "true") == 0 Or StringCompare($firstrunvalue, "True") == 0 Then
                  $__firstrun = True
               ElseIf StringCompare($firstrunvalue, "false") == 0 Or StringCompare($firstrunvalue, "False") == 0 Then
                  $__firstrun = False
               ElseIf StringCompare($firstrunvalue, "default") == 0 Then
                  $__firstrun = True
               EndIf
            Case "Play"
                $__playButton =  IniRead($__configFileName, $sectionList[$i], "Key", "default")
            Case "Next"
                $__nextButton =  IniRead($__configFileName, $sectionList[$i], "Key", "default")
            Case "Prev"
                $__prevButton =  IniRead($__configFileName, $sectionList[$i], "Key", "default")
            Case Else
               MsgBox(16, "ERROR", "Config File not fount at " & @ScriptDir)
               Exit(-1)
         EndSwitch
      Next
   Else
      MsgBox(16, "ERROR", "Config File not fount at " & @ScriptDir)
      Exit(-1)
   EndIf
EndFunc


; ---- MAIN ---
ReadConfig()
Setup()
SetGlobalHotKeys()

while 1
   Sleep(100)
WEnd
; ---- MAIN END ---