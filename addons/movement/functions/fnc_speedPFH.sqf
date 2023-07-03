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

if (GVAR(safeMapping)) then {
    if (visibleMap || { !isNull objectParent cem_player }) exitWith { };
};

if ((speed cem_player) isEqualTo 0) exitWith {
    if (!GVAR(AnimSpeedDisabled)) then {
        [cem_player, 1] remoteExec ["setAnimSpeedCoef"]; 
        GVAR(AnimSpeedDisabled) = true;
    };
};

private _speed = [] call FUNC(getSpeed);
if (GVAR(oldSpeed) isNotEqualTo _speed) then {
    if ((_speed select 0) isEqualTo "WALK") then {
        cem_player forceWalk true;
    } else {
        cem_player forceWalk false;
    };

    [cem_player, (_speed select 1)] remoteExec ["setAnimSpeedCoef"];
    GVAR(AnimSpeedDisabled) = false;
    GVAR(oldSpeed) = _speed;
};

/* Needs to be run on every frame due to some strange arma bug resetting the animSpeedCoef to 1 on every frame */