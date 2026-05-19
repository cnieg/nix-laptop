{ ... }: {
  home.packages = [ ];

  # Forcer la configuration du clavier directement dans le compositeur de COSMIC
  xdg.configFile."cosmic/com.system76.CosmicComp/v1/keys".text = ''
    (
        xkb_config: Some((
            layout: "fr",
            variant: "oss", # Options: "oss" ou ""
            options: None,
            model: "",
        )),
    )
  '';
}
