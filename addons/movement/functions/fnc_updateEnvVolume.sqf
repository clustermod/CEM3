#include "script_component.hpp"
/*
 * Author: Dmitrii Zganiaiko
 * Updates environment volume based on the selected speed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call cem_movement_fnc_updateEnvVolume
 *
 * Public: No
 */

GVAR(envFadeTime) fadeEnvironment (((GVAR(speed) / 7.0) max GVAR(envVolumeMin)) min GVAR(envVolumeMax));