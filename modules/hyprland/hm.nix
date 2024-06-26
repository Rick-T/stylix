{
  config,
  lib,
  ...
}:
with config.lib.stylix.colors; let
  cfg = config.stylix.targets.hyprland;

  rgb = color: "rgb(${color})";
  rgba = color: alpha: "rgba(${color}${alpha})";

  settings = {
    decoration."col.shadow" = rgba base00 "99";
    general = {
      "col.active_border" = rgb base0A;
      "col.inactive_border" = rgb base03;
    };
    group = {
      "col.border_inactive" = rgb base0D;
      "col.border_active" = rgb base06;
      "col.border_locked_active" = rgb base06;
    };
    misc.background_color = rgb base00;
  };
in {
  options.stylix.targets.hyprland.enable =
    config.lib.stylix.mkEnableTarget "Hyprland" true;

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {inherit settings;};

    services.hyprpaper.settings = {
      preload = ["${config.stylix.image}"];
      wallpaper = [",${config.stylix.image}"];
    };
  };
}
