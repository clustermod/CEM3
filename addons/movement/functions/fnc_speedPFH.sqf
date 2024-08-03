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
    private _speedCoeff = (_speed select 1);
    [cem_player, _speedCoeff] remoteExec ["setAnimSpeedCoef"];

    // _speedCoeff is in range [0.5, 1], _coeff in [0, 1].
    private _coeff = (_speedCoeff - 0.5) * 2;
    [cem_player, ["camouflageCoef", (_coeff max GVAR(camouflageCoefMin)) min GVAR(camouflageCoefMax)]] remoteExec ["setUnitTrait"];
    [cem_player, ["audibleCoef", (_coeff max GVAR(audibleCoefMin)) min GVAR(audibleCoefMax)]] remoteExec ["setUnitTrait"];
};