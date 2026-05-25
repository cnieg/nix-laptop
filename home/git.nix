{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
      fetch.prune = true;
      user = {
        name = "Dominique ARNOU";
        email = "dominique.arnou@gmail.com";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
