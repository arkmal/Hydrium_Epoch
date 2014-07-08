ENHANCED VEHICULE DEPLOYMENT

Credit : 
TheFarix
oOSmokyOo (for the original script on which this one was developed from.)
maca134 (for his wonderful Right Click Options To Items script.)
TheVampire (whose DZMS gave me plenty of ideas on how to rework this script.)
[VB]AWOL (whose code in player_craftItem.sqf and remove.sqf I referenced for some parts of the deployment script.)

Features:
Deployable mountain bike, motorcycle, and Mozzie.
Easy to configure required materials for each vehicle.
Right click on toolbox to deploy vehicles.
Stop deployment/packing of vehicles by moving.
Prevent packing of destroyed deployable vehicles.
Prevent packing of locked vehicles.
Allow for selling of deployable vehicles (configurable by the admin).
Remove deployable vehicles from hive to prevent them from respawning on reset. (Infinite parts exploit)
Materials are dropped on the ground when packing like the other remove actions (workbench, wreckage, weapons crates) instead of automatically added to the player's inventory.
Remove ammo from all vehicles when deployed. (Infinite grenades exploit with Mozzie)

Installation
 
Step 1: Custom variables.sqf
 
If you do not have a custom variables.sqf, create an empty file in the custom scripts directory of your mission folder. Edit it to include the following:
EVDVehicleArray = ["MMT_Civ","TT650_Civ","CSJ_GyroC"];
dayz_allowedObjects = dayz_allowedObjects + EVDVehicleArray;

if(isServer) then {
	DZE_safeVehicle = DZE_safeVehicle + EVDVehicleArray;
};
If you already have a custom variables.sqf, then add the above code to the bottom.
 
Step 2: Custom compiles.sqf
 
If you do not have a custom compiles.sqf, create an empty file the custom scripts directory of your mission folder. Edit it to include the following:
if (!isDedicated) then {
	fnc_usec_selfActions =			compile preprocessFileLineNumbers "SCRIPT_PATH\fn_selfActions.sqf";
	player_selectSlot =				compile preprocessFileLineNumbers "SCRIPT_PATH\ui_selectSlot.sqf";
};
Where "SCRIPT_PATH" is the path of you custom scripts folder from your mission folder. If you already have a custom compiles.sql, then add/modify fnc_usec_selfActions and player_selectSlot depending on the style of custom compiles.sql you are using.
 
Step 3: Modify init.sqf
 
Next open the mission's init.sqf and search for the following:
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
Below it, add:
call compile preprocessFileLineNumbers "SCRIPT_PATH\variables.sqf";
Next, find the following:
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
Below it, add:
call compile preprocessFileLineNumbers "SCRIPT_PATH\compiles.sqf";	//Compile custom functions
You now have a custom variable.sqf and compiles.sqf, which will be used by other scripts and modifications.
 
Step 4:  Custom ui_selectSlot.sqf
 
Unpack dayz_code.pbo and copy dayz_code\compile\ui_selectSlot.sqf to your custom scripts folder. Open your copied ui_selectSlot.sqf and search for the following around line 57:
_pos set [3,_height];
Above it add the following:
	// Add extra context menus
	_erc_cfgActions = (missionConfigFile >> "ExtraRc" >> _item);
	_erc_numActions = (count _erc_cfgActions);
	if (isClass _erc_cfgActions) then {
		for "_j" from 0 to (_erc_numActions - 1) do {
			_menu =  _parent displayCtrl (1600 + _j + _numActions);
			_menu ctrlShow true;
			_config =  (_erc_cfgActions select _j);
			_text =  getText (_config >> "text");
			_script =  getText (_config >> "script");
			_height = _height + (0.025 * safezoneH);
			uiNamespace setVariable ['uiControl', _control];
			_menu ctrlSetText _text;
			_menu ctrlSetEventHandler ["ButtonClick",_script];
		};
	};
Step 5: Modify description.ext
 
Open description.ext in your mission folder. At the very bottom of description.ext, add:
#include "SCRIPT_PATH\extra_rc.hpp"
Step 6: Create extra_rc.hpp
 
Next, create an empty file named extra_rc.hpp in your custom scripts folder. Inside the file, add the following:
class ExtraRc {
	class ItemToolbox {
		class BuildBike {
			text = "Deploy Bike";
			script = "['MMT_Civ'] execVM 'SCRIPT_PATH\EVD\EVD_deploy.sqf'";
		};
		class BuildMotorcycle {
			text = "Deploy Motorcycle";
			script = "['TT650_Civ'] execVM 'SCRIPT_PATH\EVD\EVD_deploy.sqf'";
		};
		class BuildMozzie {
			text = "Deploy Mozzie";
			script = "['CSJ_GyroC'] execVM 'SCRIPT_PATH\EVD\EVD_deploy.sqf'";
		};
	};
};
If you already have Right Click Options To Items installed and have other scripts that use it, your extra_rc.hpp will look similar to this:
class ExtraRc {
	class ItemBloodbag {
		class Use {
			text = "Use Bloodbag";
			script = "execVM 'SCRIPT_PATH\SelfBB\SelfBB.sqf'";
		};
	};
	class ItemToolbox {
		class BuildBike {
			text = "Deploy Bike";
			script = "['MMT_Civ'] execVM 'SCRIPT_PATH\EVD\EVD_deploy.sqf'";
		};
		class BuildMotorcycle {
			text = "Deploy Motorcycle";
			script = "['TT650_Civ'] execVM 'SCRIPT_PATH\EVD\EVD_deploy.sqf'";
		};
		class BuildMozzie {
			text = "Deploy Mozzie";
			script = "['CSJ_GyroC'] execVM 'SCRIPT_PATH\EVD\EVD_deploy.sqf'";
		};
	};
};
Step 7: Custom fn_selfActions.sqf
 
Copy dayz_code\compile\fn_selfActions.sqf to your custom scripts folder. Open your copied fn_selfActions.sqf and search for the following:
	// All Traders
	if (_isMan and !_isPZombie and _traderType in serverTraders) then {
Above it, add the following:
	//Pack Vehicles
	if (_typeOfCursorTarget in EVDVehicleArray and _hasToolbox and !(locked _cursorTarget) and (damage _cursorTarget < 1)) then {
		if (s_player_packvehicle < 0) then {
			s_player_packvehicle = player addAction ["Pack Vehicle", "SCRIPT_PATH\EVD\EVD_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packvehicle;
		s_player_packvehicle = -1;
	};
Step 8: The finishing touches
 
Download the attached file and unzip it into your custom scripts directory. Edit EVD\EVD_deploy.sqf and EVD\EVD_pack.sqf and change SCRIPT_PATH to the path of your custom scripts directory. Finally, edit EVD\EVD_common.sqf to configure the script to suit your tastes. If you add more vehicles as deplorable, you will need to add the class names to EVDVehicleArray in your custom variables.sqf, modify extra_rc.hpp to add an additional option, and add the required materials to the EVDGetMaterials function in EVD\EVD_common.sqf.
