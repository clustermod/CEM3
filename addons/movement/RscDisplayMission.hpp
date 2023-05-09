class RscSlider;
class RscPicture;
class RscControlsGroupNoScrollbars;

class RscDisplayEmpty {
    class controls;
};

class RscDisplayMission: RscDisplayEmpty {
    class controls: controls {
        class GVAR(movementInfoGroup): RscControlsGroupNoScrollbars {
            onLoad = QUOTE([ARR_2(_this select 0, QQGVAR(movementInfoGroup))] call FUNC(onLoad));
            x = QUOTE(safezoneX);
            y = QUOTE(safezoneY);
            w = QUOTE(safeZoneW);
            h = QUOTE(safeZoneH);

            class controls {
                class GVAR(stance_indicator): RscPicture {
                    onLoad = QUOTE([ARR_2(_this select 0, QQGVAR(stance_indicator))] call FUNC(onLoad));
                    x = QUOTE(UI_GRID_W * 2.0);
                    y = QUOTE(safeZoneH - (UI_GRID_H * 16));
                    w = QUOTE(UI_GRID_W * 12.37501);
                    h = QUOTE(UI_GRID_H * 13.92189);
                    text = QPATHTOF(UI\stance_1.paa);
                    style = 48;
                    colorBackground[] = {1, 1, 1, 1};
                    colorText[] = {1, 1, 1, 1};
                    font = "PuristaMedium";
                    sizeEx = QUOTE(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
                };

                class GVAR(speed_bar): GVAR(stance_indicator) {
                    onLoad = QUOTE([ARR_2(_this select 0, QQGVAR(speed_bar))] call FUNC(onLoad));
                    x = QUOTE(UI_GRID_W * 2.2);
                    y = QUOTE(safeZoneH - (UI_GRID_H * 8.8));
                    w = QUOTE(UI_GRID_W * 12.37501);
                    h = QUOTE(UI_GRID_H * 12.99376);
                    text = QPATHTOF(UI\speed_indicator_bar.paa);
                };

                class GVAR(stance_bar): GVAR(stance_indicator) {
                    onLoad = QUOTE([ARR_2(_this select 0, QQGVAR(stance_bar))] call FUNC(onLoad));
                    x = QUOTE(UI_GRID_W * -4.5);
                    y = QUOTE(safeZoneH - (UI_GRID_H * 14));
                    w = QUOTE(UI_GRID_W * 12.37501);
                    h = QUOTE(UI_GRID_H * 11.13851);
                    text = QPATHTOF(UI\stance_indicator_bar.paa);
                };

                class GVAR(speed_arrow): GVAR(stance_indicator) {
                    onLoad = QUOTE(ARR_2([_this select 0, QQGVAR(speed_arrow))] call FUNC(onLoad));
                    x = QUOTE(UI_GRID_W * 14);
                    y = QUOTE(safeZoneH - (UI_GRID_H * 3.1));
                    w = QUOTE(UI_GRID_W * 0.74250);
                    h = QUOTE(UI_GRID_H * 0.55687);
                    text = QPATHTOF(UI\down_arrow.paa);
                };

                class GVAR(stance_arrow): GVAR(stance_indicator) {
                    onLoad = QUOTE(ARR_2([_this select 0, QQGVAR(stance_arrow))] call FUNC(onLoad));
                    x = QUOTE(UI_GRID_W * 0.7);
                    y = QUOTE(safeZoneH - (UI_GRID_H * 14));
                    w = QUOTE(UI_GRID_W * 0.74250);
                    h = QUOTE(UI_GRID_H * 0.55687);
                    text = QPATHTOF(UI\right_arrow.paa);
                };
            };
        };
    };
};

