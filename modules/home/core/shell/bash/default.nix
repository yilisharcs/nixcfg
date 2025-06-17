{
  programs.bash = {
    enable = true;
    initExtra = ''
      PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
      PROMPT_COMMAND='history -a'
      HISTTIMEFORMAT="%F %T "

      bind    '"\C-o": edit-and-execute-command'
    '';
    historyControl = ["ignoreboth"];
    historyIgnore = [
      "vi"
      "vim"
      "nvim"
      ":q"
      "l[fs]"
      "pwd"
      "[bf]g"
    ];
    shellAliases = {
      ".." = "cd ..";
      cp = "cp -iv";
      rm = "rm -I";
    };
    shellOptions = [
      "checkwinsize"
      "histappend"
    ];
  };
}
