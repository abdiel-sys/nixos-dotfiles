{lib, ...}: {
  programs.nvf.settings.vim = {
    notes = {
      obsidian = {
        enable = true;
        setupOpts = {
          workspaces = [
            {
              name = "notebook";
              path = "~/sync/notebook";
            }
          ];
          templates = {
            folder = "templates";
            date_format = "%Y-%m-%d-%a";
            time_format = "%H:%M";
          };
          legacy_commands = false;
          note_id_func = lib.generators.mkLuaInline ''
            function(title)
              local suffix = ""

              if title ~= nil then
                suffix = title
                  :gsub(" ", "-")
                  :gsub("[^A-Za-z0-9-]", "")
                  :lower()
              else
                for _ = 1, 4 do
                  suffix = suffix .. string.char(math.random(65, 90))
                end
              end

              return tostring(os.time()) .. "-" .. suffix
            end
          '';
          ui = {
            enable = false;
          };
        };
      };
    };
  };
}
