{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.brave
  ];

  programs.firefox.enable = false;
  programs.chromium = {
    enable = true;
    extraOpts = {
      AllowDinosaurEasterEgg = false;
      BookmarkBarEnabled = false;
      RestoreOnStartup = 1;
    };
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
      "cofdbpoegempjloogbagkncekinflcnj" # DeepL
      "ghmbeldphafepmbegfdlkpapadhbakde" # Proton Pass
      "eninkmbmgkpkcelmohdlgldafpkfpnaf" # Reddit Untranslate
      "fakeocdnmmmnokabaiflppclocckihoj" # Sprucemarks
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "kkmlkkjojmombglmlpbpapmhcaljjkde" # Zhongwen: Zh-En Dictionary
    ];
    extraOpts.ExtensionSettings = {
      # Dark reader
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" = {
        toolbar_pin = "force_pinned";
        file_url_navigation_allowed = true;
      };
      # Proton Pass
      "ghmbeldphafepmbegfdlkpapadhbakde" = {
        toolbar_pin = "force_pinned";
      };
      # Vimium
      "dbepggeogbaibhgnhhndojpepiihcmeb" = {
        toolbar_pin = "force_pinned";
        file_url_navigation_allowed = true;
      };
      # Zhongwen: Zh-En Dictionary
      "kkmlkkjojmombglmlpbpapmhcaljjkde" = {
        toolbar_pin = "force_pinned";
      };
    };
  };

  xdg.mime.defaultApplications = {
    "text/html" = "brave-browser.desktop";
    "application/xhtml+xml" = "brave-browser.desktop";
    "x-scheme-handler/http" = "brave-browser.desktop";
    "x-scheme-handler/https" = "brave-browser.desktop";
    "x-scheme-handler/about" = "brave-browser.desktop";
    "x-scheme-handler/unknown" = "brave-browser.desktop";
  };
}
