#include "script_component.hpp"

GVAR(speeds) = [["WALK", 0.5], ["WALK", 0.7], ["WALK", 1], ["WALK", 1.2], ["WALK", 1.5], ["WALK", 1.8], ["JOG", 0.9], ["JOG", 1]];
GVAR(oldStance_ui) = -1;
GVAR(oldSpeed) = ["", -1];
GVAR(oldSpeed_ui) = -1;
GVAR(speed) = 7;

private _newResolution = [getResolution select 0, getResolution select 1];
private _newScale = getResolution select 5;
GVAR(oldResolution) = [_newResolution, _newScale];

[FUNC(speedPFH)] call CBA_fnc_addPerFrameHandler;
[FUNC(interfacePFH)] call CBA_fnc_addPerFrameHandler;