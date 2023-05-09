#include "script_component.hpp"
/*
 * Author: Eric
 * Handles User Interface for movement and stances
 * 
 * Arguments:
 * None
 * 
 * Return Value:
 * None
 * 
 * Example:
 * [] call cem_movement_fnc_PFHInterface
 * 
 * Public: No
 */
disableSerialization;

private _parent = uiNamespace getVariable [QGVAR(movementInfoGroup), controlNull];
if (visibleMap) exitWith { _parent ctrlShow false; };
if (!isNull objectParent CEM_player) exitWith { _parent ctrlShow false; };

private _movementInfoGroup = uiNamespace getVariable [QGVAR(movementInfoGroup), controlNull];
private _stanceIndicator = uiNamespace getVariable [QGVAR(stance_indicator), controlNull];
private _stanceSlider = uiNamespace getVariable [QGVAR(stance_bar), controlNull];
private _stanceArrow = uiNamespace getVariable [QGVAR(stance_arrow), controlNull];
private _speedSlider = uiNamespace getVariable [QGVAR(speed_bar), controlNull];
private _speedArrow = uiNamespace getVariable [QGVAR(speed_arrow), controlNull];

_parent ctrlShow true;

/* Selective UI */
_stanceIndicator ctrlShow GVAR(showStanceIndicator);
_stanceSlider ctrlShow GVAR(showStanceSlider);
_stanceArrow ctrlShow GVAR(showStanceSlider);
_speedSlider ctrlShow GVAR(showSpeedSlider);
_speedArrow ctrlShow GVAR(showSpeedSlider);

/* Adjust stance indication */
_stance = [] call FUNC(getStance);
if (GVAR(oldStance_ui) != _stance) then {
	_parent ctrlSetFade 0;
	_parent ctrlCommit 0;
	_stanceIndicator ctrlSetText (QPATHTOF(UI\stance_) + str _stance + ".paa");

	private _pos = ctrlPosition _stanceSlider;
	private _y = _pos select 1;
	private _h = _pos select 3;
	private _stancePos = _y + (((_h - 0.015) / 8) * _stance);

	_stanceArrow ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 84.75), _stancePos];
	_stanceArrow ctrlCommit 0;

	if (GVAR(fadeIndicator)) then {
		_parent ctrlSetFade 1;
		_parent ctrlCommit 3;
	};

	GVAR(oldStance_ui) = _stance;
};


/* Adjust speed indication */
private _speed = ([] call FUNC(getSpeed)) select 2;
if (GVAR(oldSpeed_ui) isNotEqualTo _speed) then {
	_parent ctrlSetFade 0;
	_parent ctrlCommit 0;
	private _pos = ctrlPosition _speedSlider;
	private _x = _pos select 0;
	private _w = _pos select 2;
	private _speedPos = _x + (((_w - 0.015) / 7) * _speed);

	_speedArrow ctrlSetPosition [_speedPos, safezoneY + safezoneH - (UI_GRID_H * 36.6125)];
	_speedArrow ctrlCommit 0;

	if (GVAR(fadeIndicator)) then {
		_parent ctrlSetFade 1;
		_parent ctrlCommit 3;
	};

	GVAR(oldSpeed_ui) = _speed;
};

/* Update UI if scale or resolution is changed */
private _newResolution = [getResolution select 0, getResolution select 1];
private _newScale = getResolution select 5;
if (_newScale isNotEqualTo (GVAR(oldResolution) select 1) || { _newResolution isNotEqualTo (GVAR(oldResolution) select 0) }) then {
	_movementInfoGroup ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 118.95005), safezoneY + safezoneH - (UI_GRID_H * 18.375), (UI_GRID_W * 14.35501), (UI_GRID_H * 18.56251)];
	_stanceIndicator ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 83.10002), safezoneY + safezoneH - (UI_GRID_H * 50.21251), (UI_GRID_W * 12.37501), (UI_GRID_H * 13.92189)];
	_stanceSlider ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 89.95), safezoneY + safezoneH - (UI_GRID_H * 47.8125), (UI_GRID_W * 12.37501), (UI_GRID_H * 11.13851)];
	_stanceArrow ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 84.75), safezoneY + safezoneH - (UI_GRID_H * 47.8125), (UI_GRID_W * 0.74250), (UI_GRID_H * 0.55687)];
	_speedSlider ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 83.25), safezoneY + safezoneH - (UI_GRID_H * 42.3125), (UI_GRID_W * 12.37501), (UI_GRID_H * 12.99376)];
	_speedArrow ctrlSetPosition [safezoneX + safezoneW - (UI_GRID_W * 71.35), safezoneY + safezoneH - (UI_GRID_H * 36.6125), (UI_GRID_W * 0.74250), (UI_GRID_H * 0.55687)];

	_movementInfoGroup ctrlCommit 0;
	_stanceIndicator ctrlCommit 0;
	_stanceSlider ctrlCommit 0;
	_stanceArrow ctrlCommit 0;
	_speedSlider ctrlCommit 0;
	_speedArrow ctrlCommit 0;
	GVAR(oldResolution) = [_newResolution, _newScale];
};