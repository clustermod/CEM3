#include "script_component.hpp"
/*
 * Author: Eric
 * Gets a units actual incremential stance
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Stance <NUMBER>
 *
 * Example:
 * call cem_movement_fnc_getStance
 *
 * Public: Yes
 */

/* Get animation properties */
private _animation = toLower animationState cem_player;
private _pose = (_animation select [5,3]);
private _direction = (_animation select [21,3]);

private _st = (createHashMapFromArray [["erc", 1], ["knl", 4], ["crh", 4], ["pne", 7]]) getordefault [_pose, -1];
if (_st isEqualTo -1) exitWith { -1 };

private _mod = (createHashMapFromArray [["dow", 1], ["up", -1]]) getordefault [_direction, 0];
_st = _st + _mod;

_st;