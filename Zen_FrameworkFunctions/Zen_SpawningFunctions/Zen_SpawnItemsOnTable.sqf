// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_SpawnItemsOnTable", _this] call Zen_StackAdd;
private ["_tableArray", "_table", "_item", "_itemClassname", "_itemArray", "_itemClassArray", "_itemShiftX", "_itemShiftY"];

if !([_this, [["ARRAY"], ["ARRAY"]], [["STRING"], ["OBJECT"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([])
};

_itemClassArray = _this select 0;
_tableArray = _this select 1;
_itemArray = [];

{
    if (_forEachIndex >= count _tableArray) exitWith {};
    _itemClassname = _x;
    _table = _tableArray select _forEachIndex;

    _item = createVehicle [_itemClassname, (getPosATL _table), [], 0, "NONE"];
    _itemArray pushBack _item;

    0 = [_item, _table, ZEN_STD_OBJ_BBZ(_table), (random 360)] call Zen_TransformObject;

    0 = [_item, (vectorUp _table)] spawn {
        sleep 0.1;
        (_this select 0) setVectorUp (_this select 1);
    };

    _item enableSimulation false;
    _table enableSimulation false;

    // _itemShiftX = ((random (ZEN_STD_OBJ_BBX(_table) / 2)) - (ZEN_STD_OBJ_BBX(_item) / 2)) * ZEN_STD_MTH_RNP;
    // _itemShiftY = ((random (ZEN_STD_OBJ_BBY(_table) / 2)) - (ZEN_STD_OBJ_BBY(_item) / 2)) * ZEN_STD_MTH_RNP;

    // _itemShiftX = _itemShiftX * cos (getDir _table) + _itemShiftY * sin (getDir _table);
    // _itemShiftY = -_itemShiftX * sin (getDir _table) + _itemShiftY * cos (getDir _table);

    // ZEN_STD_OBJ_TPT(_item, _itemShiftX, _itemShiftY, 0)
} forEach _itemClassArray;

call Zen_StackRemove;
(_itemArray)
