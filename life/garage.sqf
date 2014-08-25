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
	private ["_vehicles_available", "_def"];
	_vehicles_available = _this select 0;
	dialog_garage_buy_items = [];

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
	_display = findDisplay 6000;
	_img = _display displayCtrl 6004;
	_cost = _display displayCtrl 6002;
	_img ctrlSetText (_def select 4);
	_cost ctrlSetText format["Prix : %1$", _def select 3];
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
		case "offroad_0": { _vehicle = [_pos] call fn_spawn_offroad_0; };
		case "offroad_1": { _vehicle = [_pos] call fn_spawn_offroad_1; };
		case "offroad_cop": { _vehicle = "C_Offroad_01_F" createVehicle (getMarkerPos _pos); [[_vehicle ,_pos],"fn_spawn_offroad_cop1",nil,true ] call BIS_fnc_MP; };
	};
	[[_vehicle ,"LOCKED"],"fn_set_vehicle_lock",nil,true ] call BIS_fnc_MP; // Lock the vehicle

	_vehicle;
	
};

fn_set_vehicle_lock = {
	private ["_vehicle", "_state"];
	_vehicle = _this select 0;
	_state = _this select 1;	

	_vehicle setVehicleLock _state;
};

fn_spawn_offroad_0 = { // Offroad white
	private ["_vehicle", "_pos"];
	_pos = _this select 0;

	_vehicle = "C_Offroad_01_F" createVehicle (getMarkerPos _pos);
	_vehicle setObjectTexture [0, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"];
	clearMagazineCargo _vehicle;
	clearWeaponCargo _vehicle;
	clearItemCargo _vehicle;

	_vehicle;
};

fn_spawn_offroad_1 = { // Offroad blue
	private ["_vehicle", "_pos"];
	_pos = _this select 0;

	_vehicle = "C_Offroad_01_F" createVehicle (getMarkerPos _pos);
	_vehicle setObjectTexture [0, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa"];
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