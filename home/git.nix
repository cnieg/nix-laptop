{ ... }: {
  programs.git = {
    enable = true;
    userName = "Dominique ARNOU";
    userEmail = "dominique.arnou@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      fetch.prune = true;
    };
  };
}
