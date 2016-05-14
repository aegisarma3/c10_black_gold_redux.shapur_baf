// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_FrameworkLibrary.sqf"

#define LW(X) if (typeName X == "STRING") then { \
        X = toLower X; \
    }

#define LWA(X)     { \
        X set [_forEachIndex, (toLower _x)]; \
    } forEach X;

_Zen_stack_Trace = ["Zen_ConfigGetVehicleClasses", _this] call Zen_StackAdd;
private ["_classType", "_side", "_faction", "_subType", "_weaponState", "_dlcType", "_returnClasses", "_cfgVehicles", "_class", "_vehicleClass", "_weapons", "_magazines", "_vehicleSide", "_vehicleFaction", "_uniqueFilterArgs", "_sideString", "_textSingular"];

if !([_this, [["ARRAY", "STRING"], ["SIDE", "STRING"], ["ARRAY", "STRING"], ["ARRAY", "STRING"], ["STRING"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([])
};

_classType = _this select 0;

_side = "all";
_subType = "all";
_faction = "all";
_weaponState = "both";
_dlcType = "All";
_sideString = "#";

if (count _this > 1) then {
    _side = _this select 1;
};

if (count _this > 2) then {
    _subType = _this select 2;
};

if (count _this > 3) then {
    _faction = _this select 3;
};

if (count _this > 4) then {
    _weaponState = toLower (_this select 4);
};

if (count _this > 5) then {
    _dlcType = _this select 5;
};

LW(_side);
LW(_classType) else {
    LWA(_classType)
};
LW(_subType) else {
    LWA(_subType)
};
LW(_faction) else {
    LWA(_faction)
};
LW(_dlcType) else {
    LWA(_dlcType)
};

switch (_side) do {
    case West: {
        _sideString = "nato";
    };
    case East: {
        _sideString = "east";
    };
    case Resistance: {
        _sideString = "ind";
    };
    case "all": {
        _sideString = "#";
    };
};

_uniqueFilterArgs = format ["%1%2%3%4%5%6", _classType, _side, _subType, _faction, _weaponState, _dlcType];

if (count (missionNamespace getVariable [(format ["Zen_ConfigGetVehicleClasses_%1", _uniqueFilterArgs]), []]) != 0) exitWith {
    call Zen_StackRemove;
    (missionNamespace getVariable (format ["Zen_ConfigGetVehicleClasses_%1", _uniqueFilterArgs]))
};

_returnClasses = [];
_cfgVehicles = configFile >> "CfgVehicles";

{
    scopeName "for";
    _vehicleClass = toLower getText (_x >> "vehicleClass");
    if ([_vehicleClass, _classType] call Zen_ValueIsInArray) then {
        _class = configName _x;
        _vehicleSide = [_class] call Zen_GetSide;

        if (_vehicleSide == sideLogic) then {
            breakTo "for";
        };

        if !(([_side, "All"] call Zen_ValuesAreEqual) || {([_side, _vehicleSide] call Zen_ValuesAreEqual)}) then {
            if !(["ammo", _classType] call Zen_ValueIsInArray) then {
                breakTo "for";
            };
        };

        _vehicleFaction = toLower getText (_x >> "faction");
        if !(([_faction, "All"] call Zen_ValuesAreEqual) || {([_faction, _vehicleFaction] call Zen_ValueIsInArray)}) then {
            breakTo "for";
        };

        _textSingular = toLower getText (_x >> "textSingular");
        if !(([_subType, "All"] call Zen_ValuesAreEqual) || {([_textSingular, _subType] call Zen_ValueIsInArray)}) then {
            breakTo "for";
        };

        _vehDLC = toLower getText (_x >> "DLC");
        if !(([_dlcType, "All"] call Zen_ValuesAreEqual) || {([_vehDLC, _dlcType] call Zen_ValueIsInArray)}) then {
            breakTo "for";
        };

        if (([_vehicleClass, ["men", "menRecon", "menDiver", "menSniper"]] call Zen_ValueIsInArray) && {((["UAV", _class] call Zen_StringIsInString) || (["underwear", _class] call Zen_StringIsInString))}) then {
            breakTo "for";
        };

        if ((["ammo", _classType] call Zen_ValueIsInArray) && {(!([_sideString, _class] call Zen_StringIsInString))}) then {
            breakTo "for";
        };

        #define FILTER_TURRETS \
            _turretWeapons = []; \
            0 = [_turretWeapons, getArray (_x >> "weapons")] call Zen_ArrayAppendNested; \
            { \
                0 = [_turretWeapons, getArray (_x >> "weapons")] call Zen_ArrayAppendNested; \
            } forEach ("true" configClasses (_x >> "turrets")); \
            { \
                _turretWeapons = [_turretWeapons, ZEN_FMW_ZAF_FS(_x)] call Zen_ArrayFilterCondition; \
            } forEach ["smoke", "horn", "laser", "flare", "throw", "put"]; \

        switch (_weaponState) do {
            case "both": {};
            case "all": {};
            case "armed": {
                FILTER_TURRETS
                if (count _turretWeapons == 0) then {
                    breakTo "for";
                };
            };
            case "unarmed": {
                FILTER_TURRETS
                if (count _turretWeapons != 0) then {
                    breakTo "for";
                };
            };
            default {
                0 = ["Zen_ConfigGetVehicleClasses", "Invalid armament status given", _this] call Zen_PrintError;
                call Zen_StackPrint;
            };
        };

        _returnClasses pushBack _class;
    };
} forEach ("(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> "CfgVehicles"));

if (["ammo", _classType] call Zen_ValueIsInArray) then {
    _returnClasses = [_returnClasses, ["box_ind_ammoveh_f", "box_east_ammoveh_f", "box_nato_ammoveh_f"]] call Zen_ArrayFilterValues;
};

missionNamespace setVariable [(format ["Zen_ConfigGetVehicleClasses_%1", _uniqueFilterArgs]), _returnClasses];
call Zen_StackRemove;
(_returnClasses)
