// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_FindBuildingPositions", _this] call Zen_StackAdd;
private ["_building", "_allowRoof", "_Xdist", "_Ydist", "_points", "_positions", "_i", "_2dPos", "_floorPositions", "_j", "_3dPos"];

if !([_this, [["VOID"], ["SCALAR"], ["BOOLEAN"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([[0,0,0]])
};

_building = nearestBuilding ([(_this select 0)] call Zen_ConvertToPosition);
_Xdist = ZEN_STD_OBJ_BBX(_building) / 2;
_Ydist = ZEN_STD_OBJ_BBY(_building) / 2;

ZEN_STD_PRS_GAD(_points, 1, round (_Xdist * _Ydist / 2) )
ZEN_STD_PRS_GAD(_allowRoof, 2, false)
_positions = [];

for "_i" from 1 to _points do {
    _2dPos = [(getPosATL _building), [_Xdist, _Ydist], 90 - (getDir _building), 0, 360] call Zen_PositionRectangle;
    _2dPos set [2, ZEN_STD_OBJ_PZS(_building) - 5];
    _floorPositions = [];

    for "_j" from 1 to 25 do {
        _2dPos = ZEN_STD_MTH_TPT(_2dPos, 0, 0, 0.2);
        if (!(terrainIntersectASL [_2dPos, ZEN_STD_MTH_TPT(_2dPos, 0, 0, 0.2)]) && {!(lineIntersects [_2dPos, ZEN_STD_MTH_TPT(_2dPos, 0, 0, 0.2), objNull, objNull])}) exitWith {};
    };

    _3dPos =+ _2dPos;
    for "_j" from 1 to 50 do {
        if ((((ASLToATL _3dPos) select 2) < 2) && {!(lineIntersects [ZEN_STD_MTH_TPT(_3dPos, 0, 0, 0.5), ZEN_STD_MTH_TPT(_3dPos, 0, 0, 50), objNull, objNull])}) exitWith {};

        if ((lineIntersects [_3dPos, ZEN_STD_MTH_TPT(_3dPos, 0, 0, -0.4), objNull, objNull]) && {!(lineIntersects [_3dPos, ZEN_STD_MTH_TPT(_3dPos, 0, 0, 0.5), objNull, objNull])}) then {
            if (_allowRoof) then {
                _floorPositions pushBack _3dPos;
            } else {
                if !(lineIntersects [ZEN_STD_MTH_TPT(_3dPos, 0, 0, 0.4), ZEN_STD_MTH_TPT(_3dPos, 0, 0, 50), objNull, objNull]) then {
                    _wallCount = 0;
                    for "_k" from 0 to 330 step 30 do {
                        if (lineIntersects [ZEN_STD_MTH_TPT(_3dPos, 0, 0, 0.4), ZEN_STD_MTH_TPT(_3dPos, 5 * cos _k, 5 * sin _k, 50), objNull, objNull]) then {
                            _wallCount = _wallCount + 1;
                        };
                    };
                    if (_wallCount > 4) then {
                        _floorPositions pushBack _3dPos;
                    };
                } else {
                    _floorPositions pushBack _3dPos;
                };
            };
        };

        _3dPos = ZEN_STD_MTH_TPT(_3dPos, 0, 0, 0.5);
    };

    if (count _floorPositions > 0) then {
        _positions pushBack (ZEN_STD_ARR_RE(_floorPositions));
    };
};

{
    _3dPos =+ _x;
    for "_i" from 1 to 20 do {
        if (lineIntersects [_3dPos, ZEN_STD_MTH_TPT(_3dPos, 0, 0, -0.02), objNull, objNull]) exitWith {};
        _3dPos = ZEN_STD_MTH_TPT(_3dPos, 0, 0, -0.02);
    };
    _positions set [_forEachIndex, ASLToATL _3dPos];
} forEach _positions;

call Zen_StackRemove;
(_positions)
