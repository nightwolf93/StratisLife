//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

fn_buy_vehicles_dialog = {
	private ["_vehicles_available", "_def", "_pos"];
	_vehicles_available = _this select 0;
	_pos = _this select 1;

	dialog_garage_buy_pos = _pos;
	dialog_garage_buy_items = [];
	dialog_garage_buy_def = [];

	disableSerialization;
	createDialog "garage_buy_dialog";
	
	{
		_def = [_x] call fn_get_vehicle_def;
		dialog_garage_buy_items = dialog_garage_buy_items + [_def];
		lbAdd[6001, format["%1", _def select 1]];
	} forEach _vehicles_available;
};

fn_buy_vehicles_dialog_select = {
	private ["_ctrlId", "_entry", "_cost", "_def"];
	_ctrlId = _this select 0;
	_entry = _this select 1;
	_def = dialog_garage_buy_items select _entry;
	dialog_garage_buy_def = _def;
	_display = findDisplay 6000;
	_img = _display displayCtrl 6004;
	_cost = _display displayCtrl 6002;
	_img ctrlSetText (_def select 4);
	_cost ctrlSetText format["Prix : %1$", _def select 3];
};

fn_garage_buy = {
	private ["_cost", "_def"];
	if(count dialog_garage_buy_def < 1) exitWith { hint "Achat impossible !"; };
	if(!([licence_car] call fn_have_licence)) exitWith { hint "Il vous manque votre permis de conduire !"; };

	_def = dialog_garage_buy_def;
	_cost = parseNumber(_def select 3);
	if(stratis_money_player >= _cost) then {
		[_def select 2, dialog_garage_buy_pos] call fn_spawn_vehicle;
		stratis_money_player = stratis_money_player - _cost;
		playSound "sell";
		closeDialog 0;
	}
	else{
		hint format["Vous n'avez pas assez d'argent sur vous, il vous manque %1$ !", str(_cost - stratis_money_player)];
	};
};

fn_get_vehicle_def = {
	private ["_return", "_name", "_value"];
	_name = _this select 0;
	_return = nil;

	{
		if((_x select 2) == _name) then {
			_return = _x;
		};		
	} forEach vehicles_life;

	_return;	
};

fn_spawn_vehicle = {
	private ["_name", "_pos", "_vehicle"];

	_name = _this select 0;
	_pos = _this select 1;
	_vehicle = nil;

	//Definitions des vehicules
	switch(_name) do {
		case "quadbike": { _vehicle = "B_Quadbike_01_F" createVehicle (getMarkerPos _pos); [[_vehicle ,_pos],"fn_spawn_quadbike",nil,true ] call BIS_fnc_MP; };
		case "offroad_0": { _vehicle = "C_Offroad_01_F" createVehicle (getMarkerPos _pos); [[_vehicle ,_pos],"fn_spawn_offroad_0",nil,true ] call BIS_fnc_MP; };
		case "offroad_cop": { _vehicle = "C_Offroad_01_F" createVehicle (getMarkerPos _pos); [[_vehicle ,_pos],"fn_spawn_offroad_cop1",nil,true ] call BIS_fnc_MP; };
		case "hatchback_0": { _vehicle = "C_Hatchback_01_F" createVehicle (getMarkerPos _pos); [[_vehicle ,_pos],"fn_spawn_hatchback_0",nil,true ] call BIS_fnc_MP; };
		case "hatchback_cop": { _vehicle = "C_Hatchback_01_sport_F" createVehicle (getMarkerPos _pos); [[_vehicle ,_pos],"fn_spawn_hatchback_cop",nil,true ] call BIS_fnc_MP; };
	};
	[[_vehicle ,"UNLOCKED"],"fn_set_vehicle_lock",nil,true ] call BIS_fnc_MP; // Lock the vehicle

	_vehicle;
	
};

fn_set_vehicle_lock = {
	private ["_vehicle", "_state"];
	_vehicle = _this select 0;
	_state = _this select 1;	

	_vehicle setVehicleLock _state;
};

fn_spawn_hatchback_0 = {
	private ["_vehicle", "_pos"];
	_vehicle = _this select 0;
	_pos = _this select 1;

	clearMagazineCargo _vehicle;
	clearWeaponCargo _vehicle;
	clearItemCargo _vehicle;

	_vehicle;
};

fn_spawn_hatchback_cop = {
	private ["_vehicle", "_pos"];
	_vehicle = _this select 0;
	_pos = _this select 1;

	_vehicle setObjectTexture [0, "textures\hatchback_cop_i.paa"];
	clearMagazineCargo _vehicle;
	clearWeaponCargo _vehicle;
	clearItemCargo _vehicle;
	_vehicle animate ["HidePolice", 0]; 

	[_vehicle] call fn_add_siren_to_vehicle;

	_vehicle;
};

fn_spawn_quadbike = {
	private ["_vehicle", "_pos"];
	_vehicle = _this select 0;
	_pos = _this select 1;

	clearMagazineCargo _vehicle;
	clearWeaponCargo _vehicle;
	clearItemCargo _vehicle;

	_vehicle;
};

fn_spawn_offroad_0 = {
	private ["_vehicle", "_pos"];
	_pos = _this select 0;

	clearMagazineCargo _vehicle;
	clearWeaponCargo _vehicle;
	clearItemCargo _vehicle;

	_vehicle;
};

fn_spawn_offroad_cop1 = {
	private ["_vehicle", "_pos"];
	_vehicle = _this select 0;
	_pos = _this select 1;

	_vehicle setObjectTexture [0, "textures\offroad_cop.paa"];
	_vehicle setObjectTexture [1, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"];
	clearMagazineCargo _vehicle;
	clearWeaponCargo _vehicle;
	clearItemCargo _vehicle;
	_vehicle animate ["HidePolice", 0]; 

	[_vehicle] call fn_add_siren_to_vehicle;

	_vehicle;
};