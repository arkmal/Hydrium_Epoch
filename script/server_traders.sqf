// DayZ Epoch TRADERS for 17
serverTraders = [
"Tanny_PMC", 					// Hero Vendor 				// Caravan // 
//["Ammunition",478],["Clothes",476],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]
"Graves",						// Ammunition Friendly 		// SCHRATTEN
"US_Delta_Force_AR_EP1",		// Weapons Friendly 		// SCHRATTEN
"GUE_Commander",				// Friendly Vehicles 		// SCHRATTEN
"Damsel3",						// General Store 			// LENZBURG
"Soldier_MG_PKM_PMC",			// Weapons neutral 			// LENZBURG 
"GUE_Worker2",					// Ammunition Neutral 		// LENZBURG 
"GUE_Woodlander2",				// Neutral Building/Parts	// LENZBURG
"RUS_Soldier2",					// Bandit Trader 			// Caravan
"Drake_Light",					// Aircraft Dealer 			// Caravan
"GUE_Woodlander3",				// Vehicles Neutral 		// LENZBURG
"Soldier_GL_PMC",				// Black Market Vendor 		// LENZBURG
"GUE_Villager3",				// Friendly Building/Parts	// SCHRATTEN
"CIV_EuroWoman01_EP1",			// General Store 2 			// SCHRATTEN
"Dr_Annie_Baker_EP1",			// Medical Supplies			// SCHRATTEN
"RUS_Commander",				// North Wholesaler
"Damsel5",						// General Store 3 			// EMMEN // Caravan 
//["Backpacks",632],["Clothes",631],["Cooked Meats",634],["Drinks",633],["Packaged Food",635]
"TK_Special_Forces_MG_EP1",		// West Wholesaler			// Caravan
//["Wholesale",636]
"TK_Special_Forces_EP1",		// North Boat Vendor
"Ins_Soldier_AR",				// Weapons neutral 2 		//EMMEN  // Caravan
//["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]
"Ins_Lopotev",					// Ammunition Neutral 2 	// EMMEN // Caravan
//["Assault Rifle Ammo",643],["Light Machine Gun Ammo",644],["Pistol Ammo",646],["Shotguns and Single-shot Ammo",649],["Sniper Rifle Ammo",647],["Submachine Gun Ammo",648]
"Ins_Worker2",					// Vehicles Neutral 2 		// EMMEN // Caravan
//["Bikes and ATV",650],["Buses and Vans",651],["Cargo Trucks",653],["Fuel Trucks",655],["Military Unarmed",658],["Trucks",659],["Used Cars",660],["Utility Vehicles",661]
"Ins_Woodlander3",				// Neutral Building/Parts 	// EMMEN // Caravan
//["Building Supplies",662],["Toolbelt Items",663],["Vehicle Parts",664]
"Dr_Hladik_EP1",				// Medical Supplies 2 		// EMMEN // Caravan
"pook_Doc_Bell47",				// Medical Supplies 3 		// LENZBURG 
"Ins_Woodlander2",				// Boat Trader SOUTH 			// Caravan
"US_Delta_Force_Undercover_Takistani06_EP1"						// Gemmes Trader
];

// Hero Vendor
menu_Tanny_PMC = [
	[["Ammunition",478],["Clothes",476],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]],
	[],
	"hero"
];
// Ammunition Friendly
menu_Graves = [
	[["Assault Rifle Ammo",480],["Light Machine Gun Ammo",481],["Pistol Ammo",484],["Shotguns and Single-shot Ammo",573],["Sniper Rifle Ammo",482],["Submachine Gun Ammo",483]],
	[],
	"friendly"
];
// Weapons Friendly
menu_US_Delta_Force_AR_EP1 = [
	[["Assault Rifle",485],["Light Machine Gun",486],["Pistols",489],["Shotguns and Single-shot",574],["Sniper Rifle",487],["Submachine Guns",488]],
	[],
	"friendly"
];
// Friendly Vehicles
menu_GUE_Commander = [
	[["Bikes and ATV",608],["Buses and Vans",563],["Cargo Trucks",564],["Fuel Trucks",492],["Military Unarmed",491],["Trucks",495],["Used Cars",585],["Utility Vehicles",565]],
	[],
	"friendly"
];
// General Store
menu_Damsel3 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Tin Bar",101]],
	"neutral"
];
// Weapons neutral
menu_Soldier_MG_PKM_PMC = [
	[["Assault Rifle",602],["Light Machine Gun",603],["Pistols",606],["Shotguns and Single-shot",607],["Sniper Rifle",605],["Submachine Guns",604]],
	[],
	"neutral"
];
// Ammunition Neutral
menu_GUE_Worker2 = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// Neutral Building/Parts
menu_GUE_Woodlander2 = [
	[["Building Supplies",508],["Toolbelt Items",510],["Vehicle Parts",509]],
	[],
	"neutral"
];
// Bandit Trader
menu_RUS_Soldier2 = [
	[["Ammunition",577],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
	[],
	"hostile"
];
// Aircraft Dealer
menu_Drake_Light = [
	[["Airplanes",517],["Helicopter Unarmed",519]],
	[],
	"neutral"
];
// Vehicles Neutral
menu_GUE_Woodlander3 = [
	[["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
//############################################

// Black Market Vendor
menu_Soldier_GL_PMC = [
	[["Black Market Ammo",527],["Black Market Weapons",526],["Explosives",529]],
	[],
	"neutral"
];
//############################################

// Friendly Building/Parts
menu_GUE_Villager3 = [
	[["Building Supplies",530],["Toolbelt Items",532],["Vehicle Parts",531]],
	[],
	"friendly"
];
// General Store 2
menu_CIV_EuroWoman01_EP1 = [
	[["Backpacks",538],["Clothes",628],["Cooked Meats",630],["Drinks",601],["Packaged Food",629]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Tin Bar",101]],
	"friendly"
];
// Medical Supplies
menu_Dr_Annie_Baker_EP1 = [
	[["Chem-lites/Flares",542],["Medical Supplies",541],["Smoke Grenades",543]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"friendly"
];
// North Wholesaler
menu_RUS_Commander = [
	[["Wholesale",555]],
	[],
	"neutral"
];
// General Store 3 
menu_Damsel5 = [
	[["Backpacks",632],["Clothes",631],["Cooked Meats",634],["Drinks",633],["Packaged Food",635]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Wiskey Bottle","Tin Bar",101]],
	"neutral"
];
// West Wholesaler
menu_TK_Special_Forces_MG_EP1 = [
	[["Wholesale",636]],
	[],
	"neutral"
];
// North Boat Vendor
menu_TK_Special_Forces_EP1 = [
	[["Boats Armed",558],["Boats Unarmed",557]],
	[],
	"neutral"
];
// Weapons neutral 2
menu_Ins_Soldier_AR = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Ammunition Neutral 2
menu_Ins_Lopotev = [
	[["Assault Rifle Ammo",643],["Light Machine Gun Ammo",644],["Pistol Ammo",646],["Shotguns and Single-shot Ammo",649],["Sniper Rifle Ammo",647],["Submachine Gun Ammo",648]],
	[],
	"neutral"
];
// Vehicles Neutral 2
menu_Ins_Worker2 = [
	[["Bikes and ATV",650],["Buses and Vans",651],["Cargo Trucks",653],["Fuel Trucks",655],["Military Unarmed",658],["Trucks",659],["Used Cars",660],["Utility Vehicles",661]],
	[],
	"neutral"
];
// Neutral Building/Parts
menu_Ins_Woodlander3 = [
	[["Building Supplies",662],["Toolbelt Items",663],["Vehicle Parts",664]],
	[],
	"neutral"
];
// Medical Supplies 2
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",666],["Medical Supplies",665],["Smoke Grenades",668]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];
// Boat Trader 2
menu_Ins_Woodlander2 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
// Medical Supplies 3
menu_pook_Doc_Bell47 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];

//Gems
menu_US_Delta_Force_Undercover_Takistani06_EP1 = [
	[["Gemstones",700]],
	[],
	"neutral"
];
