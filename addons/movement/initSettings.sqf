private _category = format ["CE: %1", localize LSTRING(Category)];

[
    QGVAR(fadeIndicator),
    "CHECKBOX",
    [localize LSTRING(fadeIndicator), LLSTRING(fadeIndicatorTooltip)],
    _category,
    false,
    false,
    { }
] call CBA_fnc_addSetting;

[
    QGVAR(showStanceIndicator),
    "CHECKBOX",
    [localize LSTRING(ShowStanceIndicator), LLSTRING(ShowStanceIndicatorTooltip)],
    _category,
    true,
    false,
    { }
] call CBA_fnc_addSetting;

[
    QGVAR(showStanceSlider),
    "CHECKBOX",
    [localize LSTRING(ShowStanceSlider), localize LSTRING(ShowStanceSliderTooltip)],
    _category,
    true,
    false,
    { }
] call CBA_fnc_addSetting;

[
    QGVAR(showSpeedSlider),
    "CHECKBOX",
    [localize LSTRING(ShowSpeedSlider), localize LSTRING(ShowSpeedSliderTooltip)],
    _category,
    true,
    false,
    { }
] call CBA_fnc_addSetting;

[
    QGVAR(safeMapping),
    "CHECKBOX",
    [localize LSTRING(safeMapping), localize LSTRING(safeMappingTooltip)],
    _category,
    true,
    false,
    { }
] call CBA_fnc_addSetting;

[
    QGVAR(camouflageCoefMin),
    "SLIDER",
    ["Camouflage Coef Min", "Minimum camouflage coef when speed is minimal"],
    _category,
    [0.0, 1.0, 0.1, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(camouflageCoefMax),
    "SLIDER",
    ["Camouflage Coef Max", "Max camouflage coef when speed is max"],
    _category,
    [0.0, 1.0, 0.8, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(audibleCoefMin),
    "SLIDER",
    ["Audible Coef Min", "Minimum Audible coef when speed is minimal"],
    _category,
    [0.0, 1.0, 0.1, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(audibleCoefMax),
    "SLIDER",
    ["Audible Coef Max", "Max Audible coef when speed is max"],
    _category,
    [0.0, 1.0, 0.8, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(envVolumeMin),
    "SLIDER",
    ["Env Volume Min", "When speed is min"],
    _category,
    [0.0, 1.0, 0.05, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(envVolumeMax),
    "SLIDER",
    ["Env Volume Max", "When speed is max"],
    _category,
    [0.0, 1.0, 1.0, 2]
] call CBA_fnc_addSetting;

[
    QGVAR(envFadeTime),
    "SLIDER",
    ["Environment Fade Duration (sec)", "How fast environment volume is change"],
    _category,
    [0.1, 20.0, 5.0, 1]
] call CBA_fnc_addSetting;

