
// Muda as cores
"ColorCorrections" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust [ 1, 1.08, -0.06, [ 0.5, 0.5, 0.5, 0 ], [ 1.0, 1.0, 1.0, 1.21 ], [ 0.09, 0.09, 0.09, 0.0 ] ];
"ColorCorrections" ppEffectCommit 0;

playMusic "mission";


0 fadeSound 0;
0 fadeMusic 0;
0 fadeSpeech 0;
enableRadio false;
enableEnvironment false;
clearRadio;



5 fadeSound 1;
5 fadeMusic 1;
5 fadeSpeech 1;
enableRadio true;
enableEnvironment true;

// camera basic initialization
_camera = "camera" camCreate [1443.69,675.32,3.54775];


_camera cameraEffect ["internal","back"];



private [ "_year", "_month", "_day", "_hour", "_minute", "_date", "_time" ];

_year = ( date select 0 );
_month = ( date select 1 );
_day = ( date select 2 );

if( _month < 10 ) then { _month = format[ "0%1", _month ] };
if( _day < 10 ) then { _day = format[ "0%1", _day ] };


_date = format[ "%1-%2-%3", _day, _month, _year ];

_hour = ( date select 3 );
_minute = ( date select 4 );

if( _hour < 10 ) then { _hour = format[ "0%1", _hour ] };
if( _minute < 10 ) then { _minute = format[ "0%1", _minute ] };


_time = format[ "%1:%2", _hour, _minute ];

[  
	[ 

		[ _date, "<t size='1.0' font='PuristaMedium'>%1</t>", 0 ], 
		[ _time, "<t size='1.0' font='PuristaBold'>%1</t><br/>", 5 ], 

		[ "Complexo Industrial", "<t size='0.9' font='PuristaBold'>%1</t><br/>", 5 ], 

		[ "Shapur", "<t size='0.9'>%1</t><br/>", 30 ]


	],
	-safezoneX, 
	0.85, 
	"<t align='right' shadow='1' size='1.0'>%1</t>" 
] spawn BIS_fnc_typeText;
 


// start
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };
// sleep 3;
 
[0, 0,false,true] call BIS_fnc_cinemaBorder;


// Camera 01
_camera camPreparePos [1443,675.32,3.54775];
_camera camSetTarget [2.1212,-1.60192e-007];
_camera setDir 5;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };


_camera camPreparePos [1442,675.32,3.54775];

_camera setDir 5;
_camera camCommitPrepared 10;
waitUntil { camCommitted _camera; };


// Camera 02
_camera camPreparePos [1152.83,1572.38,15.242];
_camera camSetTarget [13.3333,3.94841e-006];
_camera setDir 120;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };

_camera camPreparePos [1152.83,1572.38,16.500];
_camera setDir 120;
_camera camCommitPrepared 10;
waitUntil { camCommitted _camera; };


// Camera 03
_camera camPreparePos [1271.61,450.31,3.30];
_camera camSetTarget [14.2424,1.18914e-005];
_camera setDir 40;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };

_camera camPreparePos [1271.61,450.31,4];
_camera setDir 40;
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };


// Camera 04
_camera camPreparePos [1291.53,769.089,0.370342];
_camera camSetTarget [16.6666,2.04979e-005];
_camera setDir 300;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };

_camera camPreparePos [1292,769.089,0.370342];
_camera setDir 300;
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };


// Camera 05
_camera camPreparePos [1369.72,46.391,0.911819];
_camera camSetTarget cam01;
_camera setDir 5.68437;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };

_camera camPreparePos [1369,46.391,10];
_camera setDir 5.68437;
_camera camCommitPrepared 15;

[  
	[ 

		[ "AEGIS APRESENTA", "<t size='1.0' font='PuristaMedium'>%1</t><br/>", 0 ], 
		
		[ "OPERAÇÃO BLACK GOLD", "<t size='1' font='PuristaBold'>%1</t>", 40 ]

	],
	-safezoneX, 
	0.85, 
	"<t align='right' shadow='1' size='1.0'>%1</t>" 
] spawn BIS_fnc_typeText;

waitUntil { camCommitted _camera; };

_camera cameraEffect ["Terminate","Back"];
camDestroy _camera;
[1, 10,false,true] call BIS_fnc_cinemaBorder;
 




