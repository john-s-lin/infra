{ ... }:
{
  home = {
    file = {
      ".config/opencode/opencode.jsonc".source = ./opencode/opencode.jsonc;
      ".config/opencode/AGENTS.md".source = ./opencode/AGENTS.md;
      ".config/opencode/package.json".source = ./opencode/package.json;
      ".config/opencode/agent/ask.md".source = ./opencode/agent/ask.md;
      ".config/opencode/agent/build.md".source = ./opencode/agent/build.md;
      ".config/opencode/agent/plan.md".source = ./opencode/agent/plan.md;
      ".config/opencode/agent/review.md".source = ./opencode/agent/review.md;
    };
    sessionVariables = {
      OPENCODE_ENABLE_EXA = 1;
    };
  };
}
