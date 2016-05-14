#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"



// Black Gold by Toaster[BTS]
// Version = 1.0

Zen_Debug_Arguments = false;

enableSaving [false, false];

//player addItem "ACRE_PRC152";
// ACRE2
[player, "operador"] execVM "aegis_radio.sqf";


[] spawn {
	sleep 900;
	//[fog,overcast,use ppEfx,allow rain,force wind,vary fog,use wind audio,EFX strength]
	// init the EFX scripts
	MKY_arSandEFX = [[0.23,0.021,100],"",true,false,true,true,true,3];
	nul = [] execVM "MKY\MKY_Sand_Snow_Init.sqf";
};




// Apaga os maracdores do mapa
#define _MARKERALPHA(ARG1) ARG1 setMarkerAlpha 0;
_MARKERALPHA("t");
_MARKERALPHA("t_1");
_MARKERALPHA("t_2");
_MARKERALPHA("t_3");
_MARKERALPHA("t_4");
_MARKERALPHA("t_5");
_MARKERALPHA("t_6");
_MARKERALPHA("t_7");

_MARKERALPHA("mkr01");
_MARKERALPHA("mkr02");
_MARKERALPHA("mkr03");
_MARKERALPHA("mkr04");
_MARKERALPHA("mkr05");
_MARKERALPHA("mkr06");

// Troca loadouts
//execVM "Loadouts.sqf";


// Executa a intro
execVM "Intro.sqf";



// Desabilita o lixo do thermal image
0 = [] spawn {

	_layer = 85125;
	while {true} do
	{
		if (currentVisionMode player == 2) then
			{
				_layer	cutText ["ERR 0921F - No battery or insufficient memory","BLACK",-3];
				waituntil {currentVisionMode player != 2};
				_layer cutText ["", "PLAIN"];
			};
			sleep 0.5;
	};
};






// Clients param por aqui
if (!isServer) exitWith {};
sleep 1;


// Multiplica os danos
0 = [allUnits, true] call Zen_MultiplyDamage;

// Cacheia os grupos para performance
GrpAegis_alpha = group aegis_alpha;

// Cria os carros
alphaCar = ["carAlpha", "B_Truck_01_transport_F"] call Zen_SpawnGroundVehicle;

// Manda o carro pro objetivo
0 = [alphaCar, ["alpha", "carAlpha"], GrpAegis_alpha, "normal"] spawn Zen_OrderInsertion;

// Coloca os squads no carro
0 = [GrpAegis_alpha, alphaCar] call Zen_MoveInVehicle;

// impede que a galera tome tiro logo de cara
west setFriend [resistance, 1];
resistance setFriend [west, 1];


// Fortificacoes
0 = ["mkr01", 10] call Zen_SpawnFortification;
0 = ["mkr02", 10] call Zen_SpawnFortification;
0 = ["mkr04", 10] call Zen_SpawnFortification;
0 = ["mkr05", 10] call Zen_SpawnFortification;
0 = ["mkr06", 10] call Zen_SpawnFortification;






// Popula base militar
_t = ["t", west,"infantry",4] call Zen_SpawnInfantryGarrison;
_t1 = ["t_1",west,"infantry",4] call Zen_SpawnInfantryGarrison;
_t2 = ["t_2",west,"infantry",4] call Zen_SpawnInfantryGarrison;
_t3 = ["t_3",west,"infantry",4] call Zen_SpawnInfantryGarrison;
_t4 = ["t_4",west,"infantry",4] call Zen_SpawnInfantryGarrison;
_t6 = ["t_6",west,"infantry",4] call Zen_SpawnInfantryGarrison;
_t7 = ["t_7",west,"infantry",4] call Zen_SpawnInfantryGarrison;

// Popula os vilarejos e regiões locais
ZEN_FMW_CS_SPM("mkr01", 3, west);
ZEN_FMW_CS_SPM("mkr02", 3, west);
ZEN_FMW_CS_SPM("mkr03", 3, west);
ZEN_FMW_CS_SPM("mkr04", 3, west);
ZEN_FMW_CS_SPM("mkr05", 3, west);
ZEN_FMW_CS_SPM("mkr06", 3, west);


// Adiciona Civs
ZEN_FMW_CS_SPM("mkr03", 4, civilian);

// Espera o squad eliminar gregor ou o tenente
waituntil {
	sleep 2;
	(!alive captain || !alive vip)
};

// Libera o tiro para matar os squads
west setFriend [resistance, 0];
resistance setFriend [west, 0];



// Espera até os objetivos serem completados
waitUntil {
    sleep 10;
    (!alive fuel01 && !alive fuel02 && !alive fuel03 && !alive fuel04 && !alive captain && !alive vip && !alive eng)
};


// Faz golf aguardar menos de 100 metros
waitUntil {
	sleep 2;
	(([ex, "golf"] call Zen_Find2dDistance) < 100)
};



// Completa a missão
"end2" call bis_fnc_endMission;

Zen_MP_Closure_Packet = ["bis_fnc_endMission", "end2"];
publicVariable "Zen_MP_Closure_Packet";
