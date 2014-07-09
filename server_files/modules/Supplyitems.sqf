if (isNil "DZE_Event_Supplyitems") then {DZE_Event_Supplyitems = false;};
if (DZE_Event_Supplyitems) exitWith {};//Only exit if this particular mission is already running - Allows other Epoch Events to run even if this event is still running.
DZE_Event_Supplyitems = true;//This must be changed for other mission types to allow different missions to run alongside each other.
private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_debug", "_start_time", "_loot", "_loot_box", "_spawnRoll", "_position", "_loot_pos", "_debug_marker","_loot_box", "_markerName","_debugMarkerName"];
private["_clutter","_loot_lists"];
_spawnChance =  75; // Percentage chance of event happening
_markerRadius = 500; // Radius the loot can spawn and used for the marker
_debug = false; // If true puts a marker exactly were the loot spawns and always spawns loot (no random chance)

if(!_debug)then{//Ignore chance when debugging (Always runs)
// Random chance of event happening
_spawnRoll = random 100;//Probably not necessary to use 100 - Is what I am used to :)
if (_spawnRoll < _spawnChance) exitWith {};
};

_loot_lists = [

[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodMRE","FoodMRE","FoodMRE","FoodMRE","FoodMRE"]
],
[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaRbull","ItemSodaR4z0r","ItemSodaRbull","ItemSodaR4z0r","ItemSodaRbull","ItemSodaR4z0r","ItemSodaRbull","ItemSodaR4z0r","FoodbaconCooked","FoodchickenCooked","FoodbaconCooked","FoodchickenCooked","FoodbaconCooked","FoodchickenCooked","FoodbaconCooked","FoodchickenCooked","FoodbaconCooked","FoodchickenCooked","FoodbaconCooked","FoodchickenCooked","FoodbaconCooked","FoodchickenCooked"]
],
[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["ItemSandbag","ItemSandbag","Skin_Camo1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_Graves_Light_DZ","Skin_Sniper1_DZ","Skin_Soldier1_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ"]
],
[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["ItemTankTrap","ItemTankTrap","ItemTankTrap","Skin_Functionary1_EP1_DZ","Skin_Pilot_EP1_DZ","Skin_Priest_DZ","Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_RU_Policeman_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ","Skin_Functionary1_EP1_DZ","Skin_Priest_DZ"]
],
[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_BanditW1_DZ","Skin_GUE_Commander_DZ","kin_GUE_Soldier_2_DZ","Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_Sniper_DZ","Skin_Ins_Soldier_GL_DZ","Skin_TK_INS_Soldier_EP1_DZ","Skin_TK_INS_Warlord_EP1_DZ","Skin_GUE_Commander_DZ"]
],
[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["PartGlass","PartGlass","PartGlass","PartGlass","PartGlass","PartGlass","PartEngine","PartEngine","PartFueltank","PartWheel","PartWheel","PartWheel","PartWheel","PartWheel","PartWheel","ItemTent","ItemJerrycan","ItemTent","ItemJerrycan","ItemTent","ItemJerrycan"]
],
[["ItemKnife","ItemMatchbox","ItemToolbox","ItemMachete","ItemToolbox"],
["PartVRotor","PartVRotor","PartEngine","PartEngine","PartFueltank","ItemJerrycan","ItemJerrycan","ItemJerrycan","ItemJerrycan","ItemJerrycan"]
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
_markerName setMarkerColor "ColorGreen";
_markerName setMarkerAlpha 0.5;
_markerName setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
_markerName setMarkerText "Supply Items";//Text too small to be seen. Useful as setMarkerText forces marker to be global if mission is ever run from a client (HC)
 
// Configurate Marker - Refresh Marker Script by *hs-s.com | waTTe - www.banditparty.de
/*
 _markerRadius = 500;
 _markershape = "ELLIPSE";
 _markercolor = "ColorGreen";
 _missiontype = 0; //0=EPOCH_EVENT_RUNNING 1=SPECIAL_EVENT_RUNNING
 _refreshmarker = [_location,_markerRadius,_markershape,_markercolor,_missiontype] execVM "\z\addons\dayz_server\modules\refreshmarker.sqf";
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
*/ 
if (_debug) then {
_debugMarkerName = format ["loot_event_debug_marker_%1", _start_time];
createMarker [_debugMarkerName , _loot_pos];
_debugMarkerName setMarkerShape "ICON";
_debugMarkerName setMarkerType "mil_dot";
_debugMarkerName setMarkerColor "ColorBlack";//Allows text / dot to be seen.
_debugMarkerName setMarkerAlpha 1;
_debugMarkerName setMarkerText "Supply Items";
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

diag_log "LOOT:Supplyitems Supply Event Setup, waiting for completion.";

private["_eventOn","_nrObjs"];//Additional - Message players when mission complete.
_eventOn = true;
_nrObjs = [];
while {_eventOn}do{
_nrObjs = nearestObjects [_loot_box, ["All"], 7];
	if(count _nrObjs >0)then{
		{
			if(isPlayer _x)then{
			[nil,nil,"per",rTITLETEXT,format["The supply truck cargo has been found by %1.",name _x],"PLAIN DOWN"] call RE;
			_eventOn = false;
			//diag_log format["LOOT:Event complete. Found by %1", name _x];
			};
		}forEach _nrObjs;
	};
sleep 12;
};
 
// Clean up
DZE_Event_Supplyitems = false;
deleteVehicle _loot_box;
deleteMarker _markerName;
if (_debug) then {
deleteMarker _debugMarkerName;
};
