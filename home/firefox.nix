{ pkgs, ... }: {
  home.packages = [ pkgs.passbolt-cli ];

  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "passbolt@nautilus.email" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/passbolt/latest.xpi";
        };
      };
      DisableTelemetry = true;
      OfferToSaveLogins = false;
    };
  };
}
