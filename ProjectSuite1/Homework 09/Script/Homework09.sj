function Main()
{
  try
  {
    create_and_check();
    test_flow(); 
    aqFile.Delete("C:\\Documents and Settings\\Tester\\Desktop\\readme.txt");
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function create_and_check()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys("^[ReleaseLast]trial test key: 345-12-lol");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.dlgSaveAs.SaveFile("C:\\Documents and Settings\\Tester\\Desktop\\readme.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "trial test key: 345-12-lol", false);
  Aliases.notepad.wndNotepad.Close();
}

function test_flow()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\readme.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Edit.Keys("test complete7 ");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
  Delay(1000);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\readme.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "test complete7 trial test key: 345-12-lol", false);
  Aliases.notepad.wndNotepad.Close();
}
