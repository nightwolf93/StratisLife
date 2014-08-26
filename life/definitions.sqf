//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//				  By Nightwolf	     //
//				          v1.0.0.0   //
///////////////////////////////////////////////////////

stratis_admin_level = 0;
stratis_money = 20000;
stratis_money_player = 40000;
stratis_inaction = false;
stratis_inventory = [];
stratis_licences = [];
stratis_vehicles_player = [];

////////////////
/// Dialogs ////
////////////////

dialog_garage_buy_pos = '';
dialog_garage_buy_items = [];
dialog_garage_buy_def = [];

dialog_cloth_buy_items = [];

////////////////
/// Licences ///
////////////////

licence_cuivre =        ["0", "Traitement du cuivre"];
licence_fer =           ["1", "Traitement du fer"];
licence_pierre =        ["2", "Traitement de la pierre"];
licence_sable =         ["3", "Traitement du sable"];
licence_sel =           ["4", "Traitement du sel"];
licence_or =            ["5", "Traitement d'or"];
licence_petrole =       ["6", "Traitement de pétrole"];
licence_cannabis =      ["7", "Traitement de cannabis"];
licence_cacaine =       ["8", "Traitement de cocaïne"];
licence_heroine =       ["9", "Traitement d'Héroïne"];
licence_cop0 =          ["10", "Jeune policier"];
licence_cop1 =		["11", "Brigadier de police"];
licence_cop2 =		["12", "Lieutenant de police"];
licence_cop3 =		["13", "Capitaine de police"];
licence_cop4 =		["14", "Commandant de police"];
licence_car =           ["15", "Permis de conduire"];

//////////////
/// Items ////
//////////////
 
item_cuivretrait =      ["0", "Cuivre", "1000"];
item_fertrait =         ["1", "Fer", "1500"];
item_pierretrait =      ["2", "Pierre", "1500"];
item_sabletrait =       ["3", "Sable", "1500"];
item_seltrait =         ["4", "Sel", "1500"];
item_ortrait =          ["5", "Or", "2000"];
item_petroletrait = 	["6", "Pétrole", "2000"];
item_cannabistrait =	["7", "Cannabis", "2500"];
item_cocainetrait =     ["8", "Cocaïne", "2500"];
item_heroinetrait =     ["9", "Héroïne", "3000"];
item_cuivre =           ["10", "Cuivre Brute", "0"];
item_fer =              ["11", "Fer Brute", "0"];
item_pierre =           ["12", "Rocher", "0"];
item_sable =            ["13", "Grain de sable", "0"];
item_sel =              ["14", "Sel Brute", "0"];
item_or =               ["15", "Or Brute", "0"];
item_petrole =          ["16", "Pétrole Brute", "0"];
item_cannabis =         ["17", "Chanvre", "0"];
item_cocaine =          ["18", "Coca", "0"];
item_heroine =          ["19", "Pavot", "0"];
item_crustace =         ["20", "Crustacé", "500"];

items_life = [
        item_cuivretrait,
        item_fertrait,
        item_pierretrait,
        item_sabletrait,
        item_seltrait,
        item_ortrait,
        item_petroletrait,
        item_cannabistrait,
        item_cocainetrait,
        item_heroinetrait,
        item_cuivre,
        item_fer,
        item_pierre,
        item_sable,
        item_sel,
        item_or,
        item_petrole,
        item_cannabis,
        item_cocaine,
        item_heroine,
        item_crustace     
];

licence_life = [
        licence_cuivre,
        licence_fer,
        licence_pierre,
        licence_sable,
        licence_sel,
        licence_or,
        licence_petrole,
        licence_cannabis,
        licence_cocaine,
        licence_heroine,
        licence_cop0,
        licence_car,
        licence_cop0,	
	licence_cop1,
	licence_cop2,
	licence_cop3,
	licence_cop4
];

//////////////
/// Prices ///
//////////////

price_licence_cuivre = 15000;
price_licence_fer = 25000;
price_licence_pierre = 25000;
price_licence_sable = 25000;
price_licence_sel = 25000;
price_licence_or = 30000;
price_licence_petrole = 30000;
price_licence_cannabis = 35000;
price_licence_cocaine = 35000;
price_licence_heroine = 40000;
price_licence_car = 1500;

////////////////
/// Vehicles ///
////////////////

vehicle_offroad_0 = ["0", "Tout-Terrain (Civil)", "offroad_0", "15000", "textures\mini\offroad_0_mini.paa"];
vehicle_offroad_cop = ["1", "Tout-Terrain (Police)", "offroad_cop", "16500", "textures\mini\offroad_cop_mini.paa"];
vehicle_quadbike = ["2", "Quad (Civil)", "quadbike", "2500", "textures\mini\quadbike_mini.paa"];
vehicle_hatchback = ["3", "Hatchback (Civil)", "hatchback_0", "19000", "textures\mini\hatchback_mini.paa"];
vehicle_hatchback_cop = ["4", "Hatchback Sport (Police)", "hatchback_cop", "20000", "textures\mini\hatchback_cop_mini.paa"];

vehicles_life = [
        vehicle_offroad_0,
        vehicle_offroad_cop,
        vehicle_quadbike,
        vehicle_hatchback,
        vehicle_hatchback_cop
];

///////////////
/// Actions ///
///////////////

player addAction ["Miner du cuivre", "[] call fn_get_cuivre", [], -10, false, false,"","(player distance getMarkerPos(""get_cuivre_1"")) < 20"];
player addAction ["Récolter des crustacés", "[] call fn_get_crustace", [], -10, false, false,"","(player distance getMarkerPos(""get_crust_1"")) < 20"];
player addAction ["Récolter du chanvre", "[] call fn_get_chanvre", [], -10, false, false,"","(player distance getMarkerPos(""get_chanvre_1"")) < 20"];
//player addAction ["Debug", "[] call fn_debug_test"];

disableSerialization;