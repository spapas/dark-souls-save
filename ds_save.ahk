#SingleInstance Force
#MaxHotkeysPerInterval 99999
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


SAVE_FOLDER_DS1 := "C:\Users\serafeim\Documents\NBGI\DARK SOULS REMASTERED\1638\"
SAVE_FILENAME_DS1 := "DRAKS0005.sl2"
BACKUP_FOLDER_DS1 := "C:\Users\serafeim\Documents\Saved Games\ds1\"


GetFolderMax(f) 
{
	MAX := 0
	Loop, Files, %f%\*.* 
	{
		NUM_EXT := 1 * A_LoopFileExt

		if (NUM_EXT> MAX) 
		{
			MAX := NUM_EXT
		}
	}
	
	return MAX
}

F7::
{
	;MsgBox % "F7"
	;MsgBox % "Will copy " . SAVE_FILENAME_DS1 . " to " . BACKUP_FOLDER_DS1
		
	MAX_P1 := GetFolderMax(BACKUP_FOLDER_DS1) + 1
	;MsgBox % "Max + 1 is " . MAX_P1
	
	SOURCE := SAVE_FOLDER_DS1 . SAVE_FILENAME_DS1 
	DEST := BACKUP_FOLDER_DS1 . SAVE_FILENAME_DS1 . "." . MAX_P1
	
	;MsgBox % "Will copy " . SOURCE . " to " . DEST
	FileCopy, %SOURCE%, %DEST%
	return
}

^F8::
{
	;MsgBox % "F8"
	MAX := GetFolderMax(BACKUP_FOLDER_DS1)
	MAX_FILE := BACKUP_FOLDER_DS1 . SAVE_FILENAME_DS1 . "." . MAX
	;MsgBox % "Maxfile is " . MAX_FILE
	
	SOURCE := MAX_FILE 
	DEST := SAVE_FOLDER_DS1 . SAVE_FILENAME_DS1 
	
	;MsgBox % "Will copy " . SOURCE . " to " . DEST
	FileCopy, %SOURCE%, %DEST%, 1
	return
}
