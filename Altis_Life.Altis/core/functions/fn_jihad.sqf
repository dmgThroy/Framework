#include "..\..\script_macros.hpp"
/*
	File: fn_jihad.sqf
	Author: Credits to Yolo Joe for Original Script / Fixed by @Heavy_Bob and @Liam0.
	Special thanks to @NiiRoZz and @tkcjesse for additional input.
	Description:
	A suicide vest. Yes this is a bomb. Handle with causion.
*/
private["_unit","_bomb"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
// checks
if(isNil "_unit" || isNull _unit || !isPlayer _unit || life_isknocked || life_istazed || (vehicle _unit != _unit) || !alive _unit || (_unit GVAR ["restrained",false])) exitWith {};
if(vest _unit != "V_HarnessOGL_gry") exitWith {hint "You aren't wearing a suicide vest.";}; // Need add to localize but Jawshy i think do commit inside stringtable
if (player distance (getmarkerpos "civ_spawn_1") < 250 OR player distance (getmarkerpos "civ_spawn_2") < 250 OR player distance (getmarkerpos "civ_spawn_3") < 250 OR player distance (getmarkerpos "civ_spawn_4") < 250) exitWith {hint "Some supernatural force prevents you from detonating a bomb in this holy place!"};
// Bomb
_bomb = "Bomb_04_F";
[_unit,"jihad"] remoteExec ["life_fnc_say3D",RANY];
uiSleep 2.424;
_unit setDamage 999999999999;
_bomb createVehicle (ASLtoATL (getPosASL _unit));
removeVest _unit;