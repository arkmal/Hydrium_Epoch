//Custom Actions
fnc_usec_selfActions    = compile preprocessFileLineNumbers "script\fn_selfActions.sqf";

// Extra Right Click Menu
player_selectSlot	    = compile preprocessFileLineNumbers "script\ui_selectSlot.sqf";

//RC Bloodbag FIX
player_useMeds 			= compile preprocessFileLineNumbers "script\player_useMeds.sqf";

//Remove Trading Animations
player_traderMenuHive   = compile preprocessFileLineNumbers "script\player_traderMenuHive.sqf";

if (!isDedicated) then {
    /* Use command menu instead of scroll menu? (default = false) */
	DZE_SNAP_PRO_USE_COMMAND_MENU = false;
	
	DZE_SNAP_BUILD_NUMKEYS = [0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B];
	
    player_build = compile preprocessFileLineNumbers "script\snap_pro\player_build.sqf";
    snap_build = compile preprocessFileLineNumbers "script\snap_pro\snap_build.sqf";
    dayz_spaceInterrupt = compile preprocessFileLineNumbers "script\snap_pro\dayz_spaceInterrupt.sqf";
};
