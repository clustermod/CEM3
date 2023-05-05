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
if (!isNull objectParent CEM_player) exitWith { };

private _speed = [] call FUNC(getSpeed);
if (GVAR(oldSpeed) isNotEqualTo _speed) then {
	if ((_speed select 0) isEqualTo "WALK") then {
		CEM_player forceWalk true;
	} else {
		CEM_player forceWalk false;
	};

	GVAR(oldSpeed) = _speed;
};

/* Needs to be run on every frame due to strange arma bug */
[CEM_player, (_speed select 1)] remoteExec ["setAnimSpeedCoef"];