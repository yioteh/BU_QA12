function name1()
{
  Aliases.Explorer.wndDesktop.SHELLDLL_DefView.FolderView.ClickItem("readme", 0);
  Aliases.Explorer.wndDesktop.SHELLDLL_DefView.FolderView.Keys("[Del]");
  Aliases.Explorer.dlgConfirmFileDelete.btnYes.ClickButton();
}
