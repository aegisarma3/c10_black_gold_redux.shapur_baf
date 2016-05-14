// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_SpawnConvoy", _this] call Zen_StackAdd;
private ["_side", "_startPos", "_leadVehicleType", "_supplyVehicleType", "_troopVehicleType", "_leadVehicle", "_supplyVehicle", "_troopVehicle", "_troopCargo", "_troopGroup", "_vehGroup", "_roadDir", "_faction"];

if !([_this, [["VOID"], ["SIDE"], ["STRING", "ARRAY"]], [], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([objNull])
};

_startPos = [(_this select 0)] call Zen_ConvertToPosition;
_side = _this select 1;

ZEN_STD_PRS_GAD(_faction, 2, "All")

if ((count _this < 3) && {_side == west}) then {
    _faction = "blu_f";
};

switch (_side) do {
    // case west: {
        // _leadVehicleType = [["b_mrap_01_hmg_f", "B_MRAP_01_gmg_F"]] call Zen_ArrayGetRandom;
        // _supplyVehicleType = [["B_Truck_01_ammo_F", "B_Truck_01_repair_F", "B_Truck_01_medical_F", "B_Truck_01_fuel_F", "B_Truck_01_box_F"]] call Zen_ArrayGetRandom;
        // _troopVehicleType = [["b_mrap_01_f", "b_truck_01_covered_f", "b_truck_01_transport_f"]] call Zen_ArrayGetRandom;
    // };
    // case east: {
        // _leadVehicleType = [["o_mrap_02_hmg_f", "O_MRAP_02_gmg_F"]] call Zen_ArrayGetRandom;
        // _supplyVehicleType = [["O_Truck_03_device_F", "o_Truck_02_ammo_F", "o_Truck_02_fuel_F", "o_Truck_02_box_F", "o_Truck_02_medical_F"]] call Zen_ArrayGetRandom;
        // _troopVehicleType = [["o_mrap_02_f", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "o_truck_02_covered_f", "O_Truck_02_transport_F"]] call Zen_ArrayGetRandom;
    // };
    // case resistance: {
        // _leadVehicleType = [["i_mrap_03_hmg_f", "I_MRAP_03_gmg_F"]] call Zen_ArrayGetRandom;
        // _supplyVehicleType = [["I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_box_F", "I_Truck_02_medical_F"]] call Zen_ArrayGetRandom;
        // _troopVehicleType = [["i_mrap_03_f", "i_truck_02_covered_f", "i_truck_02_transport_f"]] call Zen_ArrayGetRandom;
    // };
    // default {
        // 0 = ["Zen_SpawnConvoy", "Invalid side given", _this] call Zen_PrintError;
        // call Zen_StackPrint;
        // _leadVehicleType = "";
    // };

    _leadVehicleType = [(["car", _side, "all", _faction, "Armed"] call Zen_ConfigGetVehicleClasses)] call Zen_ArrayGetRandom;
    _supplyVehicleType = [(["support", _side, "all", _faction] call Zen_ConfigGetVehicleClasses)] call Zen_ArrayGetRandom;
    _troopVehicleType = [(["car", _side, "all", _faction, "Unarmed"] call Zen_ConfigGetVehicleClasses)] call Zen_ArrayGetRandom;

    if (({typeName _x == "ARRAY"} count [_leadVehicleType, _supplyVehicleType, _troopVehicleType]) > 0) then {
        _leadVehicleType = "";
    };
};

if (_leadVehicleType == "") exitWith {
    0 = ["Zen_SpawnConvoy", "Invalid side and faction combination given", _this] call Zen_PrintError;
    call Zen_StackPrint;
    call Zen_StackRemove;
    ([objNull])
};

_roadDir = [_startPos] call Zen_FindRoadDirection;

_leadVehicle = [([_startPos, 30, _roadDir, "trig"] call Zen_ExtendPosition), _leadVehicleType, 90 - _roadDir] call Zen_SpawnGroundVehicle;
_supplyVehicle = [([_startPos, 15, _roadDir, "trig"] call Zen_ExtendPosition), _supplyVehicleType, 90 - _roadDir] call Zen_SpawnGroundVehicle;
_troopVehicle = [([_startPos, 1, _roadDir, "trig"] call Zen_ExtendPosition), _troopVehicleType, 90 - _roadDir] call Zen_SpawnGroundVehicle;

_troopCargo = ZEN_STD_OBJ_CVS(_troopVehicle) - 1;
_troopGroup = [_startPos, _side, "infantry", [1, _troopCargo]] call Zen_SpawnInfantry;
0 = [_troopGroup, _troopVehicle, "cargo"] call Zen_MoveInVehicle;

_vehGroup = group driver _leadVehicle;
((crew _supplyVehicle) + (crew _troopVehicle)) join _vehGroup;
_vehGroup setFormation "FILE";
_vehGroup setFormDir (getDir _leadVehicle);

call Zen_StackRemove;
([_leadVehicle, _supplyVehicle, _troopVehicle])
