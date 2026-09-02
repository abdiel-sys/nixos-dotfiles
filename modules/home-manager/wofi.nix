{
  programs.wofi = {
    enable = true;
    settings = {
      width = 750;
      height = 400;
      allow_images = true;
      show_all = false;
      term = "foot";
      alway_parse_args = true;
      hide_scroll = true;
      insensitive = true;
      columns = 1;
    };
  };
}
