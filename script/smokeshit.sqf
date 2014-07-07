/*
       by: http://infiSTAR.de  Credits to infistar for the actual script
       Edited by FragZ
 
    */
    [] spawn {
            hint "Smoke Weed Everyday ! :)";
			player removeMagazine 'ItemKiloHemp';
            Remove_Drug_effects =
            {
                    {
                            ppEffectDestroy _x;
                    } forEach (_this select 0);
                    ppEffectDestroy nonapsi_ef;
                    ppEffectDestroy wetdist1;
                    ppEffectDestroy ppe;
                    ppEffectDestroy ppe2;
                    ppEffectDestroy ppe3;
                    setaperture 0;
                    "dynamicBlur" ppEffectAdjust [0];
                    "dynamicBlur" ppEffectCommit 16;
                    "colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
                    "colorCorrections" ppEffectCommit 0;
            };
            _time = time;
            _effects = [];
			player playMoveNow "ActsPercMstpSnonWpstDnon_sceneBardak01";
            while {true} do
            {
                    nonapsi_ef = ppEffectCreate ["colorCorrections", 1555];
                    _effects = _effects + [nonapsi_ef];
                    nonapsi_ef ppEffectEnable true;
                    nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
                    nonapsi_ef ppEffectCommit 1;
                    sleep random(1);
                    wetdist1 = ppEffectCreate ["wetDistortion", 2006];
                    _effects = _effects + [wetdist1];
                    wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
                    wetdist1 ppEffectEnable true;
                    wetdist1 ppEffectCommit 0;
                    ppe = ppEffectCreate ["colorCorrections", 1555];
                    _effects = _effects + [ppe];
                    ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]];
                    ppe ppEffectCommit 1;
                    ppe ppEffectEnable true;
                    ppe2 = ppEffectCreate ["chromAberration", 1555];
                    _effects = _effects + [ppe2];
                    ppe2 ppEffectAdjust [0.01,0.01,true];
                    ppe2 ppEffectCommit 1;
                    ppe2 ppEffectEnable true;
                    ppe3 = ppEffectCreate ["radialBlur", 1555];
                    _effects = _effects + [ppe3];
                    ppe3 ppEffectEnable true;
                    ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15];
                    ppe3 ppEffectCommit 1;
                    sleep random(1);
                    r_player_blood = r_player_bloodTotal;            																			   	//set their blood to the maximum allowed
					r_player_lowblood = false;                       																				 //set lowblood setting to false
				10 fadeSound 1;                                																					    //slowly fade their volume back to maximum
					"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;    															//disable post processing blur effect
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;    //give them their colour back
					r_player_lowblood = false;                        																				//just double checking their blood isnt low
					player setVariable["USEC_BloodQty",r_player_bloodTotal,true];    																//set their blood back up to maximum again
					if (_time + 60 < time) exitWith {[_effects] call Remove_Drug_effects;};
            };
    };
