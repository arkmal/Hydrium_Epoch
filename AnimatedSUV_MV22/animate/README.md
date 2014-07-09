Download the latest release:<br/>
https://github.com/ebaydayz/Animated-Osprey-and-SUV/archive/master.zip<br/>

See the opendayz topic for install steps:<br/>
http://opendayz.net/threads/release-mv22-folding-and-animated-armored-suv-turret.20108/


Animated Armored SUV and Osprey
Compatible with all mods that use these vehicles
​
What it does: Adds actions to:
Fold, unfold, open ramp and close ramp on Osprey only when the engine is off. Turning the engine on will automatically unfold wings.
Close and open hatch on armored SUV. The hatch can not be closed while the gunner seat is occupied. You can not switch to gunner while the hatch is closed.
Requirements:
Easy = Blue <10
mission pbo
​
Install Steps:
1. If you do not have a custom compiles.sqf
Spoiler

2. If you do not have a custom variables.sqf:
Spoiler

3. In @DayZYourMod\addons\dayz_code\init\variables.sqf find this:
Code (Text):
dayz_resetSelfActions = {
   s_player_equip_carry = -1;
   s_player_dragbody = -1;
   s_player_fire = -1;
  ...
   s_player_upgradestroage = -1;
   s_player_lockUnlock_crtl = -1;
};
call dayz_resetSelfActions;
Copy all of the above to the very bottom of your custom variables.sqf. Add these 6 lines directly below the last action, which is usually:
s_player_upgradestroage = -1; or s_player_lockUnlock_crtl = -1;
Code (Text):
   mv22_fold = -1;
   mv22_unfold = -1;
   mv22_open = -1;
   mv22_close = -1;
   suv_close = -1;
   suv_open = -1;
4. If you do not have a custom fn_selfActions.sqf
Spoiler

5. Add this to your compiles.sqf:
Code (Text):
if (!isDedicated) then {
   mv22_pack = compile preprocessFileLineNumbers "\ca\air2\mv22\scripts\pack.sqf";
};
6. In fn_selfActions.sqf find this:
Code (Text):
} else {
   player removeAction s_player_grabflare;
   player removeAction s_player_removeflare;
   s_player_grabflare = -1;
   s_player_removeflare = -1;
};
Below that add this:
Code (Text):
if (_inVehicle && (_vehicle isKindOf "MV22")) then {
   if (isEngineOn _vehicle) then {[_vehicle,0] call mv22_pack;};
   if (mv22_fold < 0) then {
     themv22 = _vehicle;
     if !(isEngineOn themv22) then {
       mv22_fold = themv22 addAction ["Fold","scripts\animate\mv22_fold.sqf","",5,false,true];
       mv22_unfold = themv22 addAction ["UnFold","scripts\animate\mv22_unfold.sqf","",5,false,true];
       mv22_open = themv22 addAction ["Open Ramp","scripts\animate\mv22_open.sqf","",5,false,true];
       mv22_close = themv22 addAction ["Close Ramp","scripts\animate\mv22_close.sqf","",5,false,true];
     };
   };
   if (isEngineOn themv22) then {
     themv22 removeAction mv22_fold;
     mv22_fold = -1;
     themv22 removeAction mv22_unfold;
     mv22_unfold = -1;
     themv22 removeAction mv22_open;
     mv22_open = -1;
     themv22 removeAction mv22_close;
     mv22_close = -1;
   };
} else {
    if (!isNil "themv22") then {
       themv22 removeAction mv22_fold;
       mv22_fold = -1;
       themv22 removeAction mv22_unfold;
       mv22_unfold = -1;
       themv22 removeAction mv22_open;
       mv22_open = -1;
       themv22 removeAction mv22_close;
       mv22_close = -1;
   };
};

if (_inVehicle && (_vehicle isKindOf "ArmoredSUV_Base_PMC")) then {
   if ((_vehicle animationPhase "HideGun_01") == 1) then {
     _unit = _vehicle turretUnit [0];
     if (!(isNull _unit)) then {
       _unit action ["moveToCargo",_vehicle,2];
       titleText ["\n\nYou must open the hatch first.","PLAIN DOWN"];titleFadeOut 4;
     };
   };
   if (suv_close < 0) then {
     thesuv = _vehicle;
     suv_close = thesuv addAction ["Close Hatch","scripts\animate\suv_close.sqf","",5,false,true];
     suv_open = thesuv addAction ["Open Hatch","scripts\animate\suv_open.sqf","",5,false,true];
   };
} else {
    if (!isNil "thesuv") then {
        thesuv removeAction suv_close;
        suv_close = -1;
        thesuv removeAction suv_open;
        suv_open = -1;
    };
};
 
7. Put the scripts\animate\ folder in your mission root.

8. If using antihax and addActions check is enabled:
Spoiler
In AHConfig.sqf find:
Code (Text):
/*  ALLOWED Actions  */ _dayzActions =
"([
DonorSkins,wardrobe,s_player_maintain_area,...
Add to the list:
Code (Text):
mv22_fold,mv22_unfold,mv22_open,mv22_close,suv_close,suv_open

