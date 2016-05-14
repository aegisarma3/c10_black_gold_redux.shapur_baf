// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_FindTerrainSlope", _this] call Zen_StackAdd;
private ["_center", "_normal", "_phi"];

if !([_this, [["VOID"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    (0)
};

_center = [(_this select 0)] call Zen_ConvertToPosition;

_normal = surfaceNormal _center;
_phi = acos((_normal select 2) / (vectorMagnitude _normal));

call Zen_StackRemove;
(_phi)
