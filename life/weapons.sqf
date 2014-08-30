//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

fn_open_weapons_dialog = {
	_type = _this select 0;
	_weaponsList = [];
	dialog_wpn_buy_items = [];
	_valid = true;

	switch(_type) do { // https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
		case "civ": {
			_weaponsList = _weaponsList + [["Rook", "hgun_Rook40_F", 10000, "weapon"]];
			_weaponsList = _weaponsList + [["P07", "hgun_P07_F", 12500,"weapon"]];

			_weaponsList = _weaponsList + [["Munition 9mm", "16Rnd_9x21_Mag", 150,"magazine"]];
		};
	};

	if(_valid) then {
		dialog_wpn_buy_items = _weaponsList;

		disableSerialization;
		createDialog "weapons_buy_dialog";
		{
			lbAdd[8001, format["%1", _x select 0]];
		} forEach _weaponsList;
	};
};

fn_buy_weapons_dialog_select = {
	_ctrlId = _this select 0;
	_entry = _this select 1;
	_display = findDisplay 8000;
	_txt = _display displayCtrl 8003;
	_wpn = dialog_wpn_buy_items select _entry;
	_txt ctrlSetText format["Prix : %1$", str(_wpn select 2)];
};

fn_shop_buy_weapons = {
	_display = findDisplay 8000;
	_lb = _display displayCtrl 8001;
	_index = lbSelection _lb;
	_index = _index select 0;
	if(isNil "_index") then { _index = 0; };
	_wpn = dialog_wpn_buy_items select _index;
	_cost = _wpn select 2;
	playSound "sell";

	if(stratis_money_player >= _cost) then {
		stratis_money_player = stratis_money_player - _cost;
		[[player, _wpn],"fn_add_weapons",nil,true ] call BIS_fnc_MP;
	}
	else {
		hint format["Il vous manque %1$ !", str(_cost - stratis_money_player)];
	};	
};

fn_add_weapons = {
	_p = _this select 0;
	_wpn = _this select 1;
	_equipType = _wpn select 3;

	switch(_equipType) do {
		case "weapon": { _p addWeapon (_wpn select 1); };
		case "magazine": { _p addMagazines ["16Rnd_9x21_Mag", 1]};
	};	
};