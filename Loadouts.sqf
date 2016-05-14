comment "Exported from Arsenal by Toaster";

comment "Remove existing items";
removeAllWeapons toaster;
removeAllItems toaster;
removeAllAssignedItems toaster;
removeUniform toaster;
removeVest toaster;
removeBackpack toaster;
removeHeadgear toaster;
removeGoggles toaster;

comment "Add containers";
toaster forceAddUniform "U_PMC_CombatUniformLS_BSSPBB";
for "_i" from 1 to 3 do {toaster addItemToUniform "30Rnd_556x45_Stanag";};
toaster addVest "V_PlateCarrier1_PMC_blk";
for "_i" from 1 to 10 do {toaster addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {toaster addItemToVest "RH_15Rnd_45cal_fnp";};
for "_i" from 1 to 2 do {toaster addItemToVest "HandGrenade";};
toaster addBackpack "PMC_AssaultPack_Blk";

for "_i" from 1 to 5 do {toaster addItemToBackpack "SmokeShell";};
toaster addHeadgear "H_Cap_blk_CMMG";
toaster addGoggles "G_Spectacles_Tinted";

comment "Add weapons";
toaster addWeapon "RHARD_MK18AFGD_B_F";
toaster addPrimaryWeaponItem "muzzle_MK18_L";
toaster addPrimaryWeaponItem "PEQ15_A3_Top";
toaster addPrimaryWeaponItem "optic_Aco";
toaster addWeapon "RH_fnp45";
toaster addHandgunItem "RH_gemtech45";
toaster addHandgunItem "RH_X300";
toaster addHandgunItem "RH_docter";
toaster addWeapon "Rangefinder";

comment "Add items";
toaster linkItem "ItemMap";
toaster linkItem "ItemCompass";
toaster linkItem "ItemWatch";
toaster linkItem "ItemGPS";

toaster addItem "ACRE_PRC152";

comment "Set identity";
toaster setFace "GreekHead_A3_05";
toaster setSpeaker "Male01ENG";
[toaster,"thedudeabidesblk"] call bis_fnc_setUnitInsignia;






comment "Exported from Arsenal by Odisi66";

comment "Remove existing items";
removeAllWeapons odisi;
removeAllItems odisi;
removeAllAssignedItems odisi;
removeUniform odisi;
removeVest odisi;
removeBackpack odisi;
removeHeadgear odisi;
removeGoggles odisi;

comment "Add containers";
odisi forceAddUniform "U_PMC_IndUniformLS_GSBPBB";
odisi addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {odisi addItemToUniform "30Rnd_556x45_Stanag";};
odisi addVest "V_PlateCarrier1_PMC_rgr";
for "_i" from 1 to 9 do {odisi addItemToVest "30Rnd_556x45_mag_RHARD_M855";};
for "_i" from 1 to 2 do {odisi addItemToVest "RH_17Rnd_9x19_g17";};
for "_i" from 1 to 3 do {odisi addItemToVest "HandGrenade";};
odisi addItemToVest "SmokeShell";
odisi addItemToVest "SmokeShellRed";
odisi addItemToVest "SmokeShellGreen";
odisi addBackpack "PMC_B_Kitbag_blk";
for "_i" from 1 to 3 do {odisi addItemToBackpack "RPG32_F";};
for "_i" from 1 to 3 do {odisi addItemToBackpack "HandGrenade";};
odisi addItemToBackpack "SmokeShell";
odisi addItemToBackpack "SmokeShellRed";
odisi addItemToBackpack "SmokeShellGreen";
odisi addItemToBackpack "RH_17Rnd_9x19_g17";
odisi addHeadgear "H_Booniehat_GCAMO";

comment "Add weapons";
odisi addWeapon "RHARD_M4DDRP_F";
odisi addPrimaryWeaponItem "muzzle_MK18D_L";
odisi addPrimaryWeaponItem "PEQ15_A3_Top";
odisi addPrimaryWeaponItem "optic_Holosight";
odisi addWeapon "launch_RPG32_F";
odisi addWeapon "RH_g17";
odisi addHandgunItem "RH_gemtech9";
odisi addHandgunItem "RH_X300";
odisi addWeapon "Laserdesignator";

comment "Add items";
odisi linkItem "ItemMap";
odisi linkItem "ItemCompass";
odisi linkItem "ItemWatch";

odisi linkItem "ItemGPS";
odisi linkItem "NVGoggles_INDEP";
odisi addItem "ACRE_PRC152";
comment "Set identity";
odisi setFace "GreekHead_A3_01";
odisi setSpeaker "Male07ENG";
[odisi,"doyouevenlift"] call bis_fnc_setUnitInsignia;




comment "Exported from Arsenal by Arthur L.M [AEGIS]";

comment "Remove existing items";
removeAllWeapons arthur;
removeAllItems arthur;
removeAllAssignedItems arthur;
removeUniform arthur;
removeVest arthur;
removeBackpack arthur;
removeHeadgear arthur;
removeGoggles arthur;

comment "Add containers";
arthur forceAddUniform "U_PMC_IndUniformRS_GSBPBB";
arthur addItemToUniform "hlc_muzzle_556NATO_KAC";
arthur addItemToUniform "RH_sfn57";
arthur addItemToUniform "SmokeShell";
arthur addItemToUniform "SmokeShellGreen";
arthur addItemToUniform "hlc_30rnd_556x45_EPR";
arthur addVest "V_PlateCarrier1_PMC_marpat";
for "_i" from 1 to 11 do {arthur addItemToVest "hlc_30rnd_556x45_EPR";};
for "_i" from 1 to 5 do {arthur addItemToVest "hlc_30rnd_556x45_SOST";};
for "_i" from 1 to 2 do {arthur addItemToVest "MiniGrenade";};
arthur addBackpack "B_FieldPack_khk";
for "_i" from 1 to 10 do {arthur addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 5 do {arthur addItemToBackpack "hlc_30rnd_556x45_EPR";};
for "_i" from 1 to 5 do {arthur addItemToBackpack "hlc_30rnd_556x45_SOST";};
for "_i" from 1 to 3 do {arthur addItemToBackpack "RH_20Rnd_57x28_FN";};
arthur addHeadgear "H_Cap_pmc";
arthur addGoggles "G_Bandanna_shades";

comment "Add weapons";
arthur addWeapon "hlc_rifle_bcmjack";
arthur addPrimaryWeaponItem "optic_Hamr";
arthur addWeapon "RH_fn57";
arthur addHandgunItem "RH_sfn57";
arthur addHandgunItem "RH_X300";
arthur addWeapon "Trixie_Rangefinder";
arthur addItem "ACRE_PRC152";

comment "Add items";
arthur linkItem "ItemMap";
arthur linkItem "ItemCompass";
arthur linkItem "ItemWatch";
arthur linkItem "ItemGPS";
arthur linkItem "pmc_earpiece";

comment "Set identity";
arthur setFace "WhiteHead_20";
arthur setSpeaker "Male07ENG";
[arthur,"teamamerica"] call bis_fnc_setUnitInsignia;





comment "Exported from Arsenal by Cb Jovem";

comment "Remove existing items";
removeAllWeapons aegis_alpha;
removeAllItems aegis_alpha;
removeAllAssignedItems aegis_alpha;
removeUniform aegis_alpha;
removeVest aegis_alpha;
removeBackpack aegis_alpha;
removeHeadgear aegis_alpha;
removeGoggles aegis_alpha;

comment "Add containers";
aegis_alpha forceAddUniform "U_PMC_IndUniformRS_BSBPBB";
aegis_alpha addItemToUniform "MineDetector";
for "_i" from 1 to 2 do {aegis_alpha addItemToUniform "SmokeShellRed";};
for "_i" from 1 to 2 do {aegis_alpha addItemToUniform "SmokeShellGreen";};
aegis_alpha addItemToUniform "Chemlight_blue";
aegis_alpha addVest "V_PlateCarrierInd_PMC_blk";
for "_i" from 1 to 2 do {aegis_alpha addItemToVest "HandGrenade";};
aegis_alpha addItemToVest "SmokeShell";
aegis_alpha addItemToVest "SmokeShellRed";
for "_i" from 1 to 2 do {aegis_alpha addItemToVest "Chemlight_red";};
for "_i" from 1 to 9 do {aegis_alpha addItemToVest "Trixie_10x762_Mag";};
aegis_alpha addBackpack "PMC_B_Carryall_blk";
for "_i" from 1 to 7 do {aegis_alpha addItemToBackpack "RH_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {aegis_alpha addItemToBackpack "HandGrenade";};
aegis_alpha addItemToBackpack "SatchelCharge_Remote_Mag";
for "_i" from 1 to 12 do {aegis_alpha addItemToBackpack "Trixie_10x762_Mag";};
aegis_alpha addHeadgear "H_Capbw_pmc";
aegis_alpha addGoggles "G_Tactical_Clear";

comment "Add weapons";
aegis_alpha addWeapon "Trixie_CZ750_Black";
aegis_alpha addPrimaryWeaponItem "Trixie_Cyclone";
aegis_alpha addPrimaryWeaponItem "acc_pointer_IR";
aegis_alpha addPrimaryWeaponItem "Trixie_LSMARK4_Delta";
aegis_alpha addWeapon "RH_m9";
aegis_alpha addHandgunItem "RH_m9qd";
aegis_alpha addHandgunItem "RH_X300";
aegis_alpha addWeapon "Laserdesignator";

comment "Add items";
aegis_alpha linkItem "ItemMap";
aegis_alpha linkItem "ItemCompass";
aegis_alpha linkItem "ItemWatch";

aegis_alpha linkItem "B_UavTerminal";
aegis_alpha linkItem "NVGoggles_OPFOR";
aegis_alpha addItem "ACRE_PRC152";

comment "Set identity";
aegis_alpha setFace "WhiteHead_05";
aegis_alpha setSpeaker "Male01ENG";
[aegis_alpha,"biohazard"] call bis_fnc_setUnitInsignia;





comment "Exported from Arsenal by Sgt Pacoca2112";

comment "Remove existing items";
removeAllWeapons pacoca;
removeAllItems pacoca;
removeAllAssignedItems pacoca;
removeUniform pacoca;
removeVest pacoca;
removeBackpack pacoca;
removeHeadgear pacoca;
removeGoggles pacoca;

comment "Add containers";
pacoca forceAddUniform "U_PMC_CombatUniformLS_ChckDBS_GPSB";
pacoca addItemToUniform "cse_surgical_kit";
for "_i" from 1 to 3 do {pacoca addItemToUniform "RH_30Rnd_556x45_Mk262";};
pacoca addItemToUniform "RH_6Rnd_454_Mag";
pacoca addVest "V_PlateCarrierInd_PMC_blk";
for "_i" from 1 to 3 do {pacoca addItemToVest "cse_surgical_kit";};
for "_i" from 1 to 9 do {pacoca addItemToVest "RH_30Rnd_556x45_Mk262";};
pacoca addItemToVest "HandGrenade";
for "_i" from 1 to 6 do {pacoca addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {pacoca addItemToVest "RH_6Rnd_454_Mag";};
pacoca addBackpack "PMC_B_Kitbag_blk";
for "_i" from 1 to 25 do {pacoca addItemToBackpack "cse_bandage_basic";};
for "_i" from 1 to 25 do {pacoca addItemToBackpack "cse_packing_bandage";};
for "_i" from 1 to 6 do {pacoca addItemToBackpack "cse_tourniquet";};
for "_i" from 1 to 12 do {pacoca addItemToBackpack "cse_saline_iv";};
for "_i" from 1 to 12 do {pacoca addItemToBackpack "cse_saline_iv_500";};
for "_i" from 1 to 12 do {pacoca addItemToBackpack "cse_saline_iv_250";};
for "_i" from 1 to 25 do {pacoca addItemToBackpack "cse_morphine";};
for "_i" from 1 to 25 do {pacoca addItemToBackpack "cse_epinephrine";};
for "_i" from 1 to 13 do {pacoca addItemToBackpack "cse_atropine";};
for "_i" from 1 to 25 do {pacoca addItemToBackpack "cse_quikclot";};
for "_i" from 1 to 25 do {pacoca addItemToBackpack "cse_bandageElastic";};
for "_i" from 1 to 17 do {pacoca addItemToBackpack "cse_surgical_kit";};
pacoca addHeadgear "H_Cap_pmc";

comment "Add weapons";
pacoca addWeapon "RH_SAMR";
pacoca addPrimaryWeaponItem "RH_spr_mbs";
pacoca addPrimaryWeaponItem "RH_peq2";
pacoca addPrimaryWeaponItem "RH_ta31rco_2D";
pacoca addWeapon "RH_bullb";
pacoca addWeapon "Laserdesignator";

comment "Add items";
pacoca linkItem "ItemMap";
pacoca linkItem "ItemCompass";
pacoca linkItem "ItemWatch";
pacoca linkItem "ItemGPS";
pacoca linkItem "pmc_earpiece";
pacoca addItem "ACRE_PRC152";

comment "Set identity";
pacoca setFace "WhiteHead_06";
pacoca setSpeaker "Male02ENG";
[pacoca,"combatmedic"] call bis_fnc_setUnitInsignia;





