// Vehicle Service Point (Refuel) by Axe Cop

private ["_vehicle","_args","_servicePoint","_costs","_updateInterval","_amount","_type","_name"];

_vehicle = _this select 0;
if (!local _vehicle) exitWith { diag_log format["Error: called service_point_refuel.sqf with non-local vehicle: %1", _vehicle] };

_args = _this select 3;
_servicePoint = _args select 0;
_costs = _args select 1;
_updateInterval = _args select 2;
_amount = _args select 3;

if !([_costs] call player_checkAndRemoveItems) exitWith {};

_type = typeOf _vehicle;
_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");

if (isNil "SP_refueling") then {
	SP_refueling = true;
	
	_vehicle engineOn false;
	titleText [format["Refuel %1 ...", _name], "PLAIN DOWN"];
	[_vehicle,"refuel",0,false] call dayz_zombieSpeak;
	
	while {(vehicle player == _vehicle) && (local _vehicle)} do {
		private "_fuel";
		if ([0,0,0] distance (velocity _vehicle) > 1) exitWith {
			titleText [format["Refuel de %1 arrêtée", _name], "PLAIN DOWN"];
		};
		_fuel = (fuel _vehicle) + _amount;
		if (_fuel > 0.99) exitWith {
			_vehicle setFuel 1;
			titleText [format["%1 rempli", _name], "PLAIN DOWN"];
		};
		_vehicle setFuel _fuel;
		sleep _updateInterval;
	};
	
	SP_refueling = nil;
};
