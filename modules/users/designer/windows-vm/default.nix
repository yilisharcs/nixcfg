{
  home.file.".local/bin/vm.sh".source = ./vm.sh;

  xdg.desktopEntries = {
    "WindowsVM" = {
      type = "Application";
      name = "Windows VM";
      icon = "virt-manager";
      exec = "vm.sh";
      terminal = false;
    };
  };
}
