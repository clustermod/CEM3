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

/* Get animation properties */
private _animation = toLower animationState cem_player;
private _action = (_animation select [1,3]);
private _pose = (_animation select [5,3]);
private _movement = (_animation select [9,3]);
private _stance = (_animation select [13,3]);
private _weapon = (_animation select [17,3]);
private _direction = (_animation select [21,3]);

/* If limping return max of 2 */
if (_movement isEqualTo "lmp") exitWith { 
    (GVAR(speeds) select (GVAR(speed) min 2)) + [cem_movement_speed]; 
};

/* If unit is not moving */
if (_action isNotEqualTo "mov") exitWith { 
    ["JOG", 1, 7] 
};

/* If weapon is lowered */
if (_stance isEqualTo "low") exitWith { 
    ["JOG", 1, 7] 
};

/* If is sprinting */
if (_movement isEqualTo "eva") exitWith { 
    ["JOG", 1, 7] 
};

/* If is prone */
if (_pose isEqualTo "pne") exitWith { 
    ["JOG", 1, 7] 
};

(GVAR(speeds) select GVAR(speed)) + [cem_movement_speed];