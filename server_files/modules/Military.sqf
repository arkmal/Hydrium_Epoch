if (isNil "DZE_Event_Military") then {DZE_Event_Military = false;};
if (DZE_Event_Military) exitWith {};//Only exit if this particular mission is already running - Allows other Epoch Events to run even if this event is still running.
DZE_Event_Military = true;//This must be changed for other mission types to allow different missions to run alongside each other.
private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_debug", "_start_time", "_loot", "_loot_box", "_spawnRoll", "_position", "_loot_pos", "_debug_marker","_loot_box", "_markerName","_debugMarkerName"];
private["_clutter","_loot_lists"];
_spawnChance =  75; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // If true puts a marker exactly were the loot spawns and always spawns loot (no random chance)

if(!_debug)then{//Ignore chance when debugging (Always runs)
// Random chance of event happening
_spawnRoll = random 100;//Probably not necessary to use 100 - Is what I am used to :)
if (_spawnRoll < _spawnChance) exitWith {};
};

_loot_lists = [
[
["G36a","G36C","G36_C_SD_eotech","G36K","MP5A5","MP5SD","G36a","G36C","G36_C_SD_eotech","G36K","MP5A5","MP5SD","G36a","G36C","G36_C_SD_eotech","G36K","MP5A5","MP5SD"],
["20Rnd_556x45_Stanag","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD""30Rnd_556x45_StanagSD""30Rnd_556x45_StanagSD""30Rnd_556x45_StanagSD""30Rnd_556x45_StanagSD"]
],
[
["M9SD","M9SD","MakarovSD","MakarovSD"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD"]
],
[
["M9SD","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M8_carbineGL","M8_carbineGL","M9SD","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M8_carbineGL","M8_carbineGL"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"]
],
[
["M9SD","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M9SD","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"]
],
[
["BAF_LRR_scoped","M24","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M24","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL"],
["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24"]
],
[
["BAF_LRR_scoped_W","M249","DMR","M4SPR","M8_carbineGL","M8_carbineGL"],
["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"]
],
[
["revolver_gold_EP1","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","revolver_gold_EP1","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL"],
["HandGrenade_West","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellOrange","SmokeShellPurple","SmokeShellBlue","PipeBomb","Mine","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911"]
],
[
["DMR""revolver_gold_EP1","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","revolver_gold_EP1","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL"],
["20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24"]
],
[
["MG36","Mk_48","M240","M249","M8_SAW"],
["100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249"]
],
[
["M16A2","M16A2","M16A2","M16A2GL","M16A4","M16A4","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["M8_carbine","M8_carbine","M8_carbineGL","M8_compact","M8_compact","M8_compact"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
]
];

_loot = _loot_lists call BIS_fnc_selectRandom;

// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';//Good idea !
 
// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
 
//diag_log(format["Spawning loot event at %1", _position]);

_markerName =  format ["loot_event_marker_%1", _start_time];//To delete this later you must use the name, not the object..
createMarker [_markerName, _position];
_markerName setMarkerShape "ELLIPSE";
_markerName setMarkerColor "ColorRed";
_markerName setMarkerAlpha 0.5;
_markerName setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
_markerName setMarkerText "Building Supplies";//Text too small to be seen. Useful as setMarkerText forces marker to be global if mission is ever run from a client (HC)

// Configurate Marker - Refresh Marker Script by *hs-s.com | waTTe - www.banditparty.de
/*
 _markerRadius = 500;
 _markershape = "ELLIPSE";
 _markercolor = "ColorRed";
 _missiontype = 1; //0=EPOCH_EVENT_RUNNING 1=SPECIAL_EVENT_RUNNING
 _refreshmarker = [_location,_markerRadius,_markershape,_markercolor,_missiontype] execVM "\z\addons\dayz_server\modules\refreshmarker.sqf";
*/
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debugMarkerName = format ["loot_event_debug_marker_%1", _start_time];
createMarker [_debugMarkerName , _loot_pos];
_debugMarkerName setMarkerShape "ICON";
_debugMarkerName setMarkerType "mil_dot";
_debugMarkerName setMarkerColor "ColorRed";//Allows text / dot to be seen.
_debugMarkerName setMarkerAlpha 1;
_debugMarkerName setMarkerText "Military";
};

//diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle ["USVehicleBox",_loot_pos,[], 0, "NONE"];
_loot_box setVariable ["permaLoot",true];//Required to remove from Epoch loot cleaning process.
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);

// Send center message to users 

[nil,nil,"per",rTITLETEXT,"New Event! Check Your Map!","PLAIN DOWN"] call RE;

diag_log "LOOT:Military Event Setup, waiting for completion.";

private["_eventOn","_nrObjs"];//Additional - Message players when mission complete.
_eventOn = true;
_nrObjs = [];
while {_eventOn}do{
_nrObjs = nearestObjects [_loot_box, ["All"], 7];
	if(count _nrObjs >0)then{
		{
			if(isPlayer _x)then{
			[nil,nil,"per",rTITLETEXT,format["The military cargo has been found by %1.",name _x],"PLAIN DOWN"] call RE;
			_eventOn = false;
			//diag_log format["LOOT:Event complete. Found by %1", name _x];
			};
		}forEach _nrObjs;
	};
sleep 12;
};
 
// Clean up
DZE_Event_Military = false;
deleteVehicle _loot_box;
deleteMarker _markerName;
if (_debug) then {
deleteMarker _debugMarkerName;
};
