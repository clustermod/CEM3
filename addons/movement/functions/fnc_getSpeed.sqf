#include "script_component.hpp"
/*
 * Author: Eric
 * Get's the player's CE:M Speed
 * 
 * Arguments:
 * None
 * 
 * Return Value:
 * Speed <ARRAY>
 *   - Animation type <STRING>
 *   - Animation speed <NUMBER>
 * 
 * Example:
 * [] call cem_movement_fnc_getSpeed
 * 
 * Public: Yes
 */

private _trans = (((animationState cem_player) find "_") != -1 && (animationState cem_player) select [((animationState cem_player) find "_")+1, 1] == "a");
private _wepState = (((animationState cem_player) select [13,3]) == "low");
private _inputs = (inputAction "WalkRunTemp" > 0 || inputAction "WalkRunToggle" > 0 || inputAction "turbo" > 0 || inputAction "TurboToggle" > 0 || stance cem_player == "PRONE");

if _trans exitWith { ["JOG", 1, 7] };
if _wepState exitWith { ["JOG", 1, 7] };
if _inputs exitWith { ["JOG", 1, 7] };

GVAR(speeds) select GVAR(speed);