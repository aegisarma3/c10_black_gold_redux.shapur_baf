 private["_unit", "_localUnitType", "_localRadioList"];
 _unit = _this select 0;
 _localUnitType = _this select 1;
if(player != _unit) exitWith { false };

["ACRE_PRC152", "default", "aegis"] call acre_api_fnc_copyPreset;


["ACRE_PRC152", "aegis", 1, "description", "AEGISNET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "aegis", 2, "description", "AEGISNET 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "aegis", 3, "description", "AEGISNET 3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "aegis", 4, "description", "SUPORTE"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "aegis", 5, "description", "ARTILHARIA"] call acre_api_fnc_setPresetChannelField;



["ACRE_PRC152", "aegis"] call acre_api_fnc_setPreset;


_this spawn {
         _unit = _this select 0;
        _localUnitType = _this select 1;
        sleep 4;
        waitUntil { ([] call acre_api_fnc_isInitialized ) };

        switch _localUnitType do {
                case 'operador': {
                    [ ([] call acre_api_fnc_getCurrentRadio), 1] call acre_api_fnc_setRadioChannel;
                };
        };
};