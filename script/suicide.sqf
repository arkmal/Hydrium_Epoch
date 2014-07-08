private ["_Secondary","_SMessage","_sound","_dis"];
//###########################################################################################################
//#################################ASIAN KID suicide script#################################################
//###########################################################################################################
//CONFIG//
/*
0 is to set false
1 is to set true
*/
sound = 1;         //Enable if you want a message to show before the player dies
messages = 1;     //Enable if you want a message to show before the player dies
////////////////////////EXTRA////////////////////////////////////////////
customsound = 0; //If you want to use your own sound
_customsoundname = "scream"; //Must define it in the description.ext
/////////////////////////////////////////////////////////////////////////
_dis = 50;      //Distance heard by the souund
_SMessage = format["Mon nom est %1 et je n'ai pas le courage de vivre...",format["%1", name player]];  //suicide message
//###########################################################################################################
///////////////////////////////
////////////Starting////////////
///////////////////////////////
canAbort = true; //stops people from aborting
player addEventHandler ["fired", {if (alive player) then { player SetDamage 1.1;};}];
sleep 1;
///////////////////////////////
////////////Message////////////
///////////////////////////////
if (messages == 1) then {
cutText [format[_SMessage], "PLAIN DOWN"];
};
///////////////////////////////
////////////Actions////////////
///////////////////////////////
player playmove "PlayerStand";
sleep 1.5;
player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
sleep 8.4;
///////////////////////////////
/////Scream before death///////
///////////////////////////////
if (sound == 1) then {
if (customsound == 1) then {
_sound = [_customsoundname] call bis_fnc_selectRandom;
}else{
_sound = ["z_scream_3","z_scream_"] call bis_fnc_selectRandom;
};
_nul = [nil, player, rSAY, [_sound,_dis]] call RE;
sleep 0.5;
};
///////////////////////////////
///////Player shoots///////////
///////////////////////////////
canAbort = false;
player fire _Secondary;
sleep 0.2;
///////////////////////////////
///////Over kills them/////////
///////////////////////////////
r_player_blood = r_player_blood - 13000;
player setVariable["USEC_BloodQty",r_player_blood,true];
_unit = player;
_selection = "body"; 
_damage = 1;
_unit setHit[_selection,_damage];
//###########################################################################################################
//###########################################END OF SUICDE#############################################################
//###########################################################################################################
