{ pkgs, lib, ... }:

{
  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelPatches = [ 
      {
        name = "a06-dts";
        patch = (pkgs.fetchpatch {
          url = "https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-clockworkpi-a06/-/raw/master/0001-arm64-dts-clockworkpi-a06-dts.patch";
          sha256 = "rxwHVpHkA3Fl4krAgcO//EQqCaIadcIrbrmbzjjy8AQ=";
        });
      }
      {
        name = "a06-power";
        patch = (pkgs.fetchpatch {
          url = "https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-clockworkpi-a06/-/raw/master/0002-mfd-axp20x-add-clockworkpi-a06-power-support.patch";
          sha256 = "OAPUDx7igMEqx6PFy0ptiSCe+LDL1ev/ud40tZPsBP8=";
        });
        extraStructuredConfig = {
          MFD_AXP20X = lib.kernel.yes;
          MFD_AXP20X_I2C = lib.kernel.yes;
          REGULATOR_AXP20X = lib.kernel.yes;
        };
      }
      {
        name = "a06-panel";
        patch = (pkgs.fetchpatch {
          url = "https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-clockworkpi-a06/-/raw/master/0004-gpu-drm-panel-add-cwd686-driver.patch";
          sha256 = "5m2aoGv53r8ej0a9Ujb7YzT3gF7UhaoPc1uiI+7Zl7s=";
        });
        extraStructuredConfig = {
          DRM_PANEL_CWD686 = lib.kernel.module;
        };
      }
      {
        name = "a06-backlight";
        patch = (pkgs.fetchpatch {
          url = "https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-clockworkpi-a06/-/raw/master/0005-video-backlight-add-ocp8178-driver.patch";
          sha256 = "Fku53Vly8KoXgcEhp/8Norw0sQKT4i4kUeSU2K08bmA=";
        });
        extraStructuredConfig = {
          BACKLIGHT_OCP8178 = lib.kernel.module;
        };
      }
      {
        name = "a06-power-charger";
        patch = (pkgs.fetchpatch {
          url = "https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-clockworkpi-a06/-/raw/master/0004-power-supply-Add-Support-for-RK817-Charger.patch";
          sha256 = "KjhW51LY+WK0XCbcyqm56OV2rR0wiiJCv7rYN/IoOzI=";
        });
      }
    ];
  };
  hardware.enableRedistributableFirmware = true;
}
