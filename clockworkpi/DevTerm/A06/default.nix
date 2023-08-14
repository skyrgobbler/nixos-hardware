{ pkgs, lib, ... }:

{
  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelPatches = [ 
      {
        name = "a06-dts";
        patch = (fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-001-a06-dts.patch";
          sha256 = "10gzx98apb47795w69cpafscp285i203r8b6pzan5pwk324z9b19";
        });
      }
      {
        name = "a06-power";
        patch = (fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-002-power.patch";
          sha256 = "1il25l90s0cn7c61rzj2fhs51147vydc8zmiyw4xxc59rfpm96a7";
        });
        extraStructuredConfig = {
          MFD_AXP20X = lib.kernel.yes;
          MFD_AXP20X_I2C = lib.kernel.yes;
          REGULATOR_AXP20X = lib.kernel.yes;
        };
      }
      {
        name = "a06-audio";
        patch = (fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-003-audio.patch";
          sha256 = "1fbdfmfx5lkh3q4zf8ify6s4ngi6bf0kcjyl9wpvgd63dsyfw6lv";
        });
        extraStructuredConfig = {
          SND_SOC_ES8323 = lib.kernel.module;
        };
      }
      {
        name = "a06-panel";
        patch = (fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-004-panel.patch";
          sha256 = "0fdvgr36x68rwqyw1fg60m4rxq5kd1x5slbdrfxpw8s3sdcsr1g6";
        });
        extraStructuredConfig = {
          DRM_PANEL_CWD686 = lib.kernel.module;
        };
      }
      {
        name = "a06-backlight";
        patch = (fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-005-backlight.patch";
          sha256 = "0hb8whf2gmh2vmn5jajqwxd5lybw0sasp106vw2l9y4936bm5w5v";
        });
        extraStructuredConfig = {
          BACKLIGHT_OCP8178 = lib.kernel.module;
        };
      }
      {
        name = "a06-panel_2";
        patch = (fetchpatch {
          url = "https://raw.githubusercontent.com/clockworkpi/DevTerm/main/Code/patch/armbian_build_a06/patch/kernel-006-panel.patch";
          sha256 = "0ihiih8j8s55kkn8d4i2f9a295635galr81zgv4zzy6fw520ihcn";
        });
      }
    ];
  };
  hardware.enableRedistributableFirmware = true;
}
