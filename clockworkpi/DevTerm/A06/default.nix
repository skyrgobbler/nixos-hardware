{ pkgs, lib, ... }:

{
  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelPatches = [ 
      {
        name = "a06-dts";
        patch = (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-001-a06-dts.patch";
          sha256 = "bi7BdrkwacRXauzU3HMdZssj7dBwTzM6s5G9Tq5mkB8=";
        });
      }
      {
        name = "a06-power";
        patch = (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-002-power.patch";
          sha256 = "u2u9l4bU/iryoZ9p6HT8cvHtFNpIZG8dNDSFAGo8u+s=";
        });
        extraStructuredConfig = {
          MFD_AXP20X = lib.kernel.yes;
          MFD_AXP20X_I2C = lib.kernel.yes;
          REGULATOR_AXP20X = lib.kernel.yes;
        };
      }
      {
        name = "a06-audio";
        patch = (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-003-audio.patch";
          sha256 = "gAD85NUb1qx7JnYGogck5ozFJE6bPm6Cbgm7kvwbbQQ=";
        });
        extraStructuredConfig = {
          SND_SOC_ES8323 = lib.kernel.module;
        };
      }
      {
        name = "a06-panel";
        patch = (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-004-panel.patch";
          sha256 = "suZR+II27twqFsdscSo/uF2nhAIXPaGTaYmUdMYD7wc=";
        });
        extraStructuredConfig = {
          DRM_PANEL_CWD686 = lib.kernel.module;
        };
      }
      {
        name = "a06-backlight";
        patch = (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-005-backlight.patch";
          sha256 = "Fku53Vly8KoXgcEhp/8Norw0sQKT4i4kUeSU2K08bmA=";
        });
        extraStructuredConfig = {
          BACKLIGHT_OCP8178 = lib.kernel.module;
        };
      }
      {
        name = "a06-panel_2";
        patch = (pkgs.fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-006-panel.patch";
          sha256 = lib.fakeSha256;
        });
      }
    ];
  };
  hardware.enableRedistributableFirmware = true;
}
