// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_ConvertToObjectArray", _this] call Zen_StackAdd;
private ["_dataToConvert", "_returnArray", "_allUnits", "_tempArray"];

_dataToConvert = _this select 0;

if (count _this > 1) then {
    _dataToConvert = _this;
};

_returnArray = [];

switch (typeName _dataToConvert) do {
    case "OBJECT": {
        if !(isNull _dataToConvert) then {
            _returnArray = [_dataToConvert];
        };
    };
    case "GROUP": {
        if !(isNull _dataToConvert) then {
            _tempArray = units _dataToConvert;
            {
                if !(isNull _x) then {
                    _returnArray pushBack _x;
                };
            } forEach _tempArray;
        };
    };
    case "SIDE": {
        _allUnits = +allUnits;
        {
            if !(isNull _x) then {
                if ([(side _x), _dataToConvert] call Zen_ValuesAreEqual) then {
                    _returnArray pushBack _x;
                };
            };
        } forEach _allUnits;
    };
    case "ARRAY": {
        {
            switch (typeName _x) do {
                case "OBJECT": {
                    if !(isNull _x) then {
                        _returnArray pushBack _x;
                    };
                };
                case "ARRAY": {
                    0 = [_returnArray, (_x call Zen_ConvertToObjectArray)] call Zen_ArrayAppendNested;
                };
                case "GROUP": {
                    if !(isNull _x) then {
                        0 = [_returnArray, (units _x)] call Zen_ArrayAppendNested;
                    };
                };
                case "SIDE": {
                    0 = [_returnArray, (_x call Zen_ConvertToObjectArray)] call Zen_ArrayAppendNested;
                };
            };
        } forEach _dataToConvert;
    };
    default {
        _returnArray = _dataToConvert;
        0 = ["Zen_ConvertToObjectArray", "Given value cannot be converted to an array of objects", _this] call Zen_PrintError;
        call Zen_StackPrint;
    };
};

_returnArray = [_returnArray] call Zen_ArrayRemoveDuplicates;

call Zen_StackRemove;
(_returnArray)
