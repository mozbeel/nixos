{
  inputs,
  pkgs,
  pkgs-unstable,
  config,
  ...
}:

let
  inherit (pkgs.stdenv.hostPlatform) system;

  opencode =
    let
      pkg = inputs.opencode.packages.${system}.default;
    in
    pkgs.symlinkJoin {
      inherit (pkg) name;
      paths = [ pkg ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        rm $out/bin/opencode
        makeWrapper ${pkgs.firejail}/bin/firejail $out/bin/opencode \
          --add-flags "--noprofile" \
          --add-flags "--blacklist=sops" \
          --add-flags "--blacklist=${pkgs-unstable.sops}/bin/sops" \
          --add-flags "--blacklist=${pkgs.sops}/bin/sops" \
          --add-flags "--" \
          --add-flags "${pkg}/bin/opencode"
        sed -i 's|${pkgs.firejail}/bin/firejail|/run/wrappers/bin/firejail|' $out/bin/opencode
      '';
    };

  rime = inputs.rime.packages.${system}.default;
in
{
  programs.opencode = {
    enable = true;
    package = opencode;

    # rules = ''
    #   # Rules
    #
    #   - **NEVER** perform commits.
    #
    #   ## Exploration (CRITICAL)
    #
    #   - **ALWAYS** explore the codebase:
    #     - "Where is X?"
    #     - "Find files matching Y"
    #     - "How does Z work?"
    #     - Any search that might need multiple glob/grep/read cycles
    #
    #   ## Tooling
    #
    #   - Prefer `rg` / `rg --files` for search.
    #   - Use `ast-grep` for structural search.
    #   - If a tool is missing, use `nix run` (e.g., `nix run nixpkgs#ripgrep -- rg ...`).
    #   - For multi-tool sessions, use `nix shell` to enter a temporary environment.
    #
    #   ## Scratchpad (Knowledge Cache)
    #
    #   - `.scratchpad/*.md` persists across sessions.
    #   - Use the format `YYYY-MM-DD-topic.md` for scratchpad files (e.g., `2025-11-03-zig-stdlib_changes.md`).
    #   - Domain agents (nix, zig) read/write scratchpad directly.
    #   - Before deep exploration: check scratchpad.
    #   - After expensive research: write to scratchpad.
    #
    #   ## Domain Agents
    #
    #   - `nix`: ALL Nix/NixOS work.
    #   - `obsidian`: Notes/knowledge base.
    #   - `zig`: Zig development.
    # '';
    settings = {
      keybinds = {
        leader = "ctrl+x";
        app_exit = "ctrl+c,ctrl+d,<leader>q";
        editor_open = "<leader>e";
        theme_list = "<leader>t";
        sidebar_toggle = "<leader>b";
        username_toggle = "none";
        status_view = "<leader>s";
        session_export = "<leader>x";
        session_new = "<leader>n";
        session_list = "<leader>l";
        session_timeline = "none";
        session_share = "none";
        session_unshare = "none";
        session_interrupt = "escape";
        session_compact = "<leader>c";
        session_child_cycle = "<leader>right";
        session_child_cycle_reverse = "<leader>left";
        session_parent = "<leader>up";
        messages_page_up = "ctrl+b";
        messages_page_down = "ctrl+f";
        messages_half_page_up = "none";
        messages_half_page_down = "none";
        messages_first = "<leader>g,home";
        messages_last = "<leader>shift+g,end";
        messages_next = "none";
        messages_previous = "none";
        messages_copy = "<leader>y";
        messages_undo = "<leader>u";
        messages_redo = "<leader>r";
        messages_last_user = "none";
        messages_toggle_conceal = "<leader>h";
        model_list = "<leader>m";
        model_cycle_recent = "f2";
        model_cycle_recent_reverse = "shift+f2";
        variant_cycle = "ctrl+t";
        command_list = "ctrl+p";
        agent_list = "<leader>a";
        agent_cycle = "tab";
        agent_cycle_reverse = "shift+tab";
        input_clear = "ctrl+c";
        input_paste = "ctrl+v";
        input_submit = "return";
        input_newline = "shift+return,ctrl+return,alt+return,ctrl+j";
        input_move_left = "left";
        input_move_right = "right";
        input_move_up = "up";
        input_move_down = "down";
        input_select_left = "shift+left";
        input_select_right = "shift+right";
        input_select_up = "shift+up";
        input_select_down = "shift+down";
        input_line_home = "ctrl+a";
        input_line_end = "ctrl+e";
        input_select_line_home = "ctrl+shift+a";
        input_select_line_end = "ctrl+shift+e";
        input_visual_line_home = "alt+a";
        input_visual_line_end = "alt+e";
        input_select_visual_line_home = "alt+shift+a";
        input_select_visual_line_end = "alt+shift+e";
        input_buffer_home = "home";
        input_buffer_end = "end";
        input_select_buffer_home = "shift+home";
        input_select_buffer_end = "shift+end";
        input_delete_line = "ctrl+shift+d";
        input_delete_to_line_end = "ctrl+k";
        input_delete_to_line_start = "ctrl+u";
        input_backspace = "backspace,shift+backspace";
        input_delete = "ctrl+d,delete,shift+delete";
        input_undo = "ctrl+-,super+z";
        input_redo = "ctrl+.,super+shift+z";
        input_word_forward = "alt+f,alt+right,ctrl+right";
        input_word_backward = "alt+b,alt+left,ctrl+left";
        input_select_word_forward = "alt+shift+f,alt+shift+right";
        input_select_word_backward = "alt+shift+b,alt+shift+left";
        input_delete_word_forward = "alt+d,alt+delete,ctrl+delete";
        input_delete_word_backward = "ctrl+w,ctrl+backspace,alt+backspace";
        history_previous = "up";
        history_next = "down";
        terminal_suspend = "ctrl+z";
      };

      plugin = [
        # "opencode-openai-codex-auth@4.2.0"
        "opencode-gemini-auth@1.3.6"
        "opencode-anthropic-auth@0.0.9"
      ];
      mcp = {
        rime = {
          type = "local";
          command = [
            "${rime}/bin/rime"
            "stdio"
          ];
          enabled = true;
        };
      };
    };
  };
}
