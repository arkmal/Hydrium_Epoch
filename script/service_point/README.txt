Credits :
Axe Cop
Remixed by Arkmal : No ream / Prices from refuel and repair

Main Features:
dynamic service points where you are able to select the options (default at every fuel station, if you want it's easy to add the epoch fuel pumps so you can build a service point in your base, you can also add vehicles or units if you want, like a NPC trader)
you can refuel and repair any vehicle by just sitting inside and get close to a service station (default 10m), then you get the actions menu attached to the vehicle, with rearm you have to be in the gunner seat because only that turret will be rearmed (for all cases the vehicle has to be local to your PC, so your have to be the driver/pilot or are alone in the vehicle)
the services don't have to be for free, you can add a price to every option like the traders (e.g. refuel is free but repair would cost 2 gold and rearm 3 10oz gold)
dynamic costs based on vehicle type
you can also disable any option if you don't want or need it, like disabling the rearm option completely
anything important is configurable in one place with config variables (there are comments in the config block, just take a look at the file service_point.sqf)

Installation :

Add this to your init.sqf in the 
"if (!isDedicated) then { PUT HERE SOMEWHERE (at the end is ok) }" block (so it will only be started on your client and not the server):

if (!isDedicated) then {
    // ... some other stuff ...
    // add the next line somewhere in this block
    execVM "service_point\service_point.sqf";
};

Download all files from here into a folder "service_point" inside your mission folder: 
https://github.com/vos/dayz/tree/master/service_point

If you want to change the path, there is one config variable in the file service_point.sqf called "_folder", you have to change that so it can access the other files needed for the script.
