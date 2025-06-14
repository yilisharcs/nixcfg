{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    bat
    fzf
    less
  ];

  home.sessionVariables = {
    ZK_NOTEBOOK_DIR = "$HOME/notebook";
  };

  programs = {
    # zettelkasten helper
    zk = {
      enable = true;
      settings = {
        notebook = {
          dir = "~/notebook";
        };
        note = {
          language = "en";
          default-title = "{{id}}-untitled";
          filename = "{{slug title}}";
          extension = "md";
          template = "default.md";
          id-charset = "hex";
          id-length = 9;
          id-case = "lower";
        };
        group.chess = {
          note.filename = "{{format-date now}}-v-{{slug title}}";
          note.template = "chess.md";
        };
        group.journal = {
          note.filename = "{{format-date now}}";
          note.template = "daily.md";
        };
        group.source = {
          note.template = "source.md";
        };
        format.markdown = {
          link-format = "markdown";
          hashtags = true;
          colon-tags = false;
          multiword-tags = false;
        };
        tool = {
          shell = "${pkgs.bash}/bin/bash";
          pager = "less -FRX";
          fzf-preview = "bat -p --color always {-1}";
        };
        lsp.diagnostics = {
          wiki-title = "hint";
          dead-link = "error";
        };
        filter = {
          recents = "--sort created- --created-after 'last two weeks'";
        };
        alias = {
          ls = "zk list $@";
          list = "zk list --quiet $@";
          editlast = "zk edit --limit 1 --sort modified- $@";
          recent = "zk edit --sort created- --created-after 'last two weeks' --interactive";
          path = "zk list --quiet --format {{path}} --delimiter , $@";
          lucky = "zk list --quiet --format full --sort random --limit 1";
          hist = "zk list --format path --delimiter0 --quiet $@ | xargs -t -0 git log --patch --";
          daily = "zk new journal --no-input";
          che = "zk new \"$ZK_NOTEBOOK_DIR/\" --no-input --title \"$@\"";
          so = "zk new \"$ZK_NOTEBOOK_DIR/\" --no-input --title \"$@\"";
        };
      };
    };
  };
}
