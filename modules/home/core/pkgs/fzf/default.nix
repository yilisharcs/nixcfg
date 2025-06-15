{
  lib,
  ...
}:

{
  # Fuzzy finder
  programs.fzf = {
    enable = true;
    defaultCommand = lib.concatStrings [
      "fd"
      " --color=never"
      " --ignore-case"
      " --strip-cwd-prefix"
      " --hidden"
      " --follow"
      " --type f"
      " --type l"
      " --exclude={.git,.jj,.cache}"
    ];
    defaultOptions = [
      "--preview 'bat {} --color=always --wrap=never --style=plain --line-range=:500'"
      "--layout=reverse"
      "--multi"
      "--bind='ctrl-j:preview-page-down'"
      "--bind='ctrl-k:preview-page-up'"
      "--bind='backward-eof:abort'"
      "--bind='F4:toggle-preview'"
    ];
    historyWidgetOptions = [
      "--preview-window hidden"
      "--bind='ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"
      "--header 'Press CTRL-Y to copy command into clipboard'"
    ];
  };
}
