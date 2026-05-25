{ ... }: {
  xdg.configFile."cosmic/com.system76.CosmicComp/v1/inputs".text = ''
    (
        numlock: true,
    )
  '';
  xdg.configFile."cosmic/com.system76.CosmicComp/v1/keys".text = ''
    (
        repeat_delay: 600,
        repeat_rate: 25,
        xkb_config: Some((
            layout: "fr",
            variant: "oss",
            options: None,
            model: "",
        )),
    )
  '';
}
