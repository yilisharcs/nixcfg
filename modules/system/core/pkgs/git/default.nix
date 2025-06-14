{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    gh
    neovim
  ];

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      diff.tool = "nvimdiff";
      merge.tool = "nvimdiff";
      pull.rebase = true;
      rebase.autoStash = true;
      safe.directory = "/etc/nixos";
    };
  };
}
