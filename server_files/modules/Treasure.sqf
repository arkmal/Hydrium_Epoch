if (isNil "DZE_Event_Treasure") then {DZE_Event_Treasure = false;};

if (DZE_Event_Treasure) exitWith {};			//Only exit if this particular mission is already running - Allows other Epoch Events to run even if this event is still running.
DZE_Event_Treasure = true;						//This must be changed for other mission types to allow different missions to run alongside each other.

private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_debug", "_start_time", "_loot", "_loot_box", "_spawnRoll", "_position", "_loot_pos", "_debug_marker","_loot_box", "_markerName","_debugMarkerName","_smokeMarker"];
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
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemBriefcase100oz"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemObsidian"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemTopaz"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemRuby"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemSapphire"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemAmethyst"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemEmerald"]
],
[["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemCitrine"]
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

/
// DEFAULT MARKER
_markerName =  format ["loot_event_marker_%1", _start_time];	//To delete this later you must use the name, not the object..
createMarker [_markerName, _position];
_markerName setMarkerShape "ELLIPSE";
_markerName setMarkerColor "ColorGreen";
_markerName setMarkerAlpha 0.5;
_markerName setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
_markerName setMarkerText "Treasure";							//Text too small to be seen. Useful as setMarkerText forces marker to be global if mission is ever run from a client (HC)


// Configurable Marker - Refresh Marker Script by *hs-s.com | waTTe - www.banditparty.de
/*
 _markerRadius = 4000;
 _markershape = "RECTANGLE";
 _markercolor = "ColorBlack";
 _missiontype = 1; //0=EPOCH_EVENT_RUNNING 1=SPECIAL_EVENT_RUNNING
 _refreshmarker = [_location,_markerRadius,_markershape,_markercolor,_missiontype] execVM "\z\addons\dayz_server\modules\refreshmarker.sqf";
*/
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;

if (_debug) then {
_debugMarkerName = format ["loot_event_debug_marker_%1", _start_time];
createMarker [_debugMarkerName , _loot_pos];
_debugMarkerName setMarkerShape "ICON";
_debugMarkerName setMarkerType "mil_dot";
_debugMarkerName setMarkerColor "ColorBlack";//Allows text / dot to be seen.
_debugMarkerName setMarkerAlpha 1;
_debugMarkerName setMarkerText "Treasure";
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
 
/*
//Create Visible Marker with SMOKE

_dayTime = dayTime;
if (_dayTime > 6 && _dayTime < 18.5) then {
_smokeMarker = "SmokeShellRed" createVehicle getPosATL _loot_box;
_smokeMarker setPosATL (getPosATL _loot_box);
_smokeMarker attachTo [_loot_box,[0,0,0]];
};
if (_dayTime > 18.5 && _dayTime < 6) then {
_smokeMarker = "ARTY_Flare_Medium" createVehicle getPosATL _loot_box;
_smokeMarker setPosATL (getPosATL _loot_box);
_smokeMarker attachTo [_loot_box, [0,0,0]];
};
*/

// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);

// Send center message to users 

[nil,nil,"per",rTITLETEXT,"New Event! Look Fot The Red Smoke!","PLAIN DOWN"] call RE;

diag_log "LOOT:Treasure Event Setup, waiting for completion.";

private["_eventOn","_nrObjs"];//Additional - Message players when mission complete.
_eventOn = true;
_nrObjs = [];
while {_eventOn}do{
_nrObjs = nearestObjects [_loot_box, ["All"], 7];
	if(count _nrObjs >0)then{
		{
			if(isPlayer _x)then{
			[nil,nil,"per",rTITLETEXT,format["The treasure has been found by %1.",name _x],"PLAIN DOWN"] call RE;
			_eventOn = false;
			//diag_log format["LOOT:Event complete. Found by %1", name _x];
			};
		}forEach _nrObjs;
	};
sleep 12;
};
 
// Clean up

DZE_Event_Treasure = false;
deleteMarker _markerName;
deleteVehicle _loot_box;
//deleteMarker _smokeMarker;

if (_debug) then {
deleteMarker _debugMarkerName;
};
