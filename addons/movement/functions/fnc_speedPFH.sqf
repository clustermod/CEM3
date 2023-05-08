#include "script_component.hpp"
/*
 * Author: Eric
 * Handles movement speed changes
 * 
 * Arguments:
 * None
 * 
 * Return Value:
 * None
 * 
 * Example:
 * [] call cem_movement_fnc_speedPFH
 * 
 * Public: No
 */

if (visibleMap) exitWith { };
if (!isNull objectParent cem_player) exitWith { };
if ((speed cem_player) isEqualTo 0) exitWith { };
if ((toUpper ((animationState cem_player) select [0,4])) isNotEqualTo "AMOV") exitWith { [cem_player, 1] remoteExec ["setAnimSpeedCoef"]; };
if ((toUpper ((animationState cem_player) select [8,4])) isEqualTo "MLMP") exitWith { [cem_player, 1] remoteExec ["setAnimSpeedCoef"]; };

private _speed = [] call FUNC(getSpeed);
if (GVAR(oldSpeed) isNotEqualTo _speed) then {
	if ((_speed select 0) isEqualTo "WALK") then {
		cem_player forceWalk true;
	} else {
		cem_player forceWalk false;
	};

	GVAR(oldSpeed) = _speed;
};

/* Needs to be run on every frame due to strange arma bug */
[cem_player, (_speed select 1)] remoteExec ["setAnimSpeedCoef"];