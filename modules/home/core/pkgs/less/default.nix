{
  programs.less = {
    enable = true;
    keys = ''
      #command

      #line-edit
      ^A         home
      ^E         end
      ^B         left
      ^F         right
      ^P         up
      ^N         down
      ^D         delete
      ^W         word-backspace

      #env
      LESS=-FRX
    '';
  };
}
