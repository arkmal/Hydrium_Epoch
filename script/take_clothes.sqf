/* 
Script By Zabn
V2.0 Updated 2014
*/

private["_isEpoch","_itemNew","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result","_animState","_takeClothesUsageTime","_started","_finished","_takeClothesUseTime"];

if (!isNil "DZE_ActionInProgress") then { // check if this is dayz epoch
	if (DZE_ActionInProgress) exitWith {}; // Do not allow if any script is running.
};

_body = (_this select 3) select 0;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["Vous ne pouvez faire cette action sur une échelle!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["Action impossible dans un véhicule", "PLAIN DOWN"]};

player removeAction s_player_clothes;
s_player_clothes = -1;

_skin = (typeOf _body);

_itemNew = _skin;

switch (_itemNew) do {
	case "Survivor3_DZ": {
		_itemNew = "Survivor2_DZ";
	};
	case "Bandit1_DZ": {
		_itemNew = "Survivor2_DZ";
	};
};

_itemNew = "Skin_" + _itemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);

_takeClothesUseTime = 6;

r_interrupt = false; 
r_doLoop = true; 
_takeClothesUsageTime = time;
_animState = animationState player;
_started = false;
_finished = false;

if(_okSkin) then {
	_clothesTaken = _body getVariable["clothesTaken",false];
	if(!_clothesTaken) then {
		while {r_doLoop} do {
			private ["_isMedic"];
			
			_clothesTaken = _body getVariable["clothesTaken",false];
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if(_clothesTaken) then { 
				r_doLoop = false; 
			};
			if (_isMedic) then {
				_started = true;
			};
			if(!_isMedic && !r_interrupt && (time - _takeClothesUsageTime) < _takeClothesUseTime) then {
				player playActionNow "Medic"; 
				_isMedic = true;
			};
			if (_started && !_isMedic && (time - _takeClothesUsageTime) > _takeClothesUseTime) then {
				r_doLoop = false; 
				_finished = true;
			};
			if (r_interrupt) then {
				r_doLoop = false; 
			};
			sleep 0.1;
		};
		r_doLoop = false; 

		if(_finished) then {
			_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
			_result = [player,_itemNew] call BIS_fnc_invAdd;
			if (_result) then {
				_body setVariable["clothesTaken",true,true];
				cutText [format["Un %1 a été ajouté à votre inventaire!",_itemNewName], "PLAIN DOWN"];
			} else {
				cutText [format["Pas assez de place dans l'inventaire pour %1 :(",_itemNewName], "PLAIN DOWN"];
			};
		} else {
			if(_clothesTaken) then { 
				player switchMove "";
				player playActionNow "stop";
				cutText ["Cette tenue a déjà été prise!", "PLAIN DOWN"];
			} else {
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
				cutText [format["Interruption!"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
			};
		};
	} else {
		cutText ["Cette tenue a déjà été prise!", "PLAIN DOWN"];
	};
} else {
	cutText [format["Ce %1 n'est pas retirable",_skin], "PLAIN DOWN"];
};
