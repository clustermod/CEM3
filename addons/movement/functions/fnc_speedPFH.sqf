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

private _speed = [] call FUNC(getSpeed);
if (GVAR(oldSpeed) isNotEqualTo _speed) then {
    if ((_speed select 0) isEqualTo "WALK") then {
        cem_player forceWalk true;
    } else {
        cem_player forceWalk false;
    };

    GVAR(AnimSpeedDisabled) = false;
    GVAR(oldSpeed) = _speed;
};

// Setting speedcoef every frame to make compatible with other mods
// Allow overriding by other modders / scripters
if (!GVAR(override)) then {
    [cem_player, (_speed select 1)] remoteExec ["setAnimSpeedCoef"];
};