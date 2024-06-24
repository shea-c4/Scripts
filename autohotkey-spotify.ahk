; 4/7 leaving these examples for future reference
;#z::Run "https://www.autohotkey.com"  ; Win+Z

;^!n::  ; Ctrl+Alt+N
;{
;    if WinExist("Untitled - Notepad")
;        WinActivate
;    else
;        Run "Notepad"
;}
ActiveId := WinGetID("A")
SpotifyWinTitle := "ahk_exe Spotify.exe"

GetSpotifyControl()
{
   SpotifyControls := WinGetControlsHwnd(SpotifyWinTitle)
   return SpotifyControls[1]
}

#^Left:: ; ctrl+win+left arrow rewind spotify 15s
{   
   if WinExist(SpotifyWinTitle)
   {
      SpotifyControl := GetSpotifyControl()
      ; ControlFocus is needed because spotify ignores window messages without it
      ; note: it does not push the window into the foreground
      ControlFocus SpotifyControl, SpotifyWinTitle
      ;Sleep 250 ; seems to be needed if key combo is already in use
      ControlSend "{Shift down}{Left}{Shift up}", SpotifyControl, SpotifyWinTitle
   }
}
#^Right:: ; ctrl+win+right arrow fast forward spotify 15s
{
   if WinExist(SpotifyWinTitle)
   {
      SpotifyControl := GetSpotifyControl()
      ControlFocus SpotifyControl, SpotifyWinTitle
      ;Sleep 250 ; seems to be needed if key combo is already in use
      ControlSend "{Shift down}{Right}{Shift up}", SpotifyControl, SpotifyWinTitle
   }
}
