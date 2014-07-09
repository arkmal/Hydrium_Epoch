//Custom Actions
fnc_usec_selfActions    = compile preprocessFileLineNumbers "script\fn_selfActions.sqf";

// Extra Right Click Menu
player_selectSlot	    = compile preprocessFileLineNumbers "script\ui_selectSlot.sqf";

//RC Bloodbag FIX
player_useMeds 			= compile preprocessFileLineNumbers "script\player_useMeds.sqf";

//Remove Trading Animations
player_traderMenuHive   = compile preprocessFileLineNumbers "script\player_traderMenuHive.sqf";

if (!isDedicated) then {
    player_build = compile preprocessFileLineNumbers "script\snap_pro\player_build.sqf";
    snap_build = compile preprocessFileLineNumbers "script\snap_pro\snap_build.sqf";
    dayz_spaceInterrupt = compile preprocessFileLineNumbers "script\snap_pro\dayz_spaceInterrupt.sqf";
};
