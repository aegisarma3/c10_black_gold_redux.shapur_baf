// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#define ZEN_STD_ARR_RI(A) (floor random count A)
#define ZEN_STD_ARR_RE(A) (A select (floor random count A))
#define ZEN_STD_ARR_UR(A, I) \
    A set [I, A select (count A - 1)]; \
    A resize (count A - 1);

#define ZEN_STD_MSC_WSD(S) \
    waitUntil { \
        sleep 2; \
        (scriptDone S) \
    };

#define ZEN_STD_MSC_SF(F) sleep (F / diag_fps);

#define ZEN_STD_MTH_RNP (if (random 1 > 0.5) then {1} else {-1})
#define ZEN_STD_MTH_VCC(V) ([(vectorMagnitude [(V select 0), (V select 1), 0]), (V select 1) atan2 (V select 0), (V select 2)])
#define ZEN_STD_MTH_VCP(V) ([(vectorMagnitude V), (V select 1) atan2 (V select 0), acos((V select 2) / (vectorMagnitude V))])
#define ZEN_STD_MTH_TPT(P, X, Y, Z) ([(P select 0) + X, (P select 1) + Y, (P select 2) + Z])

#define ZEN_STD_OBJ_BBX(O) abs ((((boundingBoxReal O) select 0) select 0) - (((boundingBoxReal O) select 1) select 0))
#define ZEN_STD_OBJ_BBY(O) abs ((((boundingBoxReal O) select 0) select 1) - (((boundingBoxReal O) select 1) select 1))
#define ZEN_STD_OBJ_BBZ(O) abs ((((boundingBoxReal O) select 0) select 2) - (((boundingBoxReal O) select 1) select 2))

#define ZEN_STD_OBJ_CBP(V, B) \
    V = 0; \
    for "_i" from 0 to 100 do { \
        if ((B buildingPos V) isEqualTo [0,0,0]) exitWith {}; \
        V = V + 1; \
    }; \
    V = V - 1;

#define ZEN_STD_OBJ_CVS(V) (getNumber (configFile >> "CfgVehicles" >> (typeOf V) >> "transportSoldier"))
#define ZEN_STD_OBJ_DVC(V) \
    { \
        deleteVehicle _x; \
    } forEach (crew V + [V]);

#define ZEN_STD_OBJ_OGO(U, V) \
    U orderGetIn false; \
    { \
        unassignVehicle _x; \
        _x leaveVehicle V; \
    } forEach U;

#define ZEN_STD_OBJ_OGI(U, V) \
    { \
         _x assignAsCargo V; \
    } forEach U; \
    U orderGetIn true;

#define ZEN_STD_OBJ_PZT(O) ((getPosATL O) select 2)
#define ZEN_STD_OBJ_PZS(O) ((getPosASL O) select 2)
#define ZEN_STD_OBJ_TPT(O, X, Y, Z) O setPosATL [((getPosATL O) select 0) + X, ((getPosATL O) select 1) + Y, ((getPosATL O) select 2) + Z];
#define ZEN_STD_OBJ_VIA(V) ((getArray (configFile >> "CfgVehicles" >> (typeOf V) >> "weapons")) > 0)

#define ZEN_STD_PRS_GAD(V, I, D) \
    if (count _this > I) then { \
        V = _this select I; \
    } else { \
        V = D; \
    };

#define ZEN_STD_PRS_GOA(V, I) \
    if (count _this > I) then { \
        V = _this select I; \
    };
