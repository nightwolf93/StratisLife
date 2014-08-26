//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

fn_open_cloth_dialog = {
	private ["_clothType", "_clothList"];
	disableSerialization;

	dialog_cloth_buy_items = [];
	_clothType = _this select 0;
	_clothList = [];
	createDialog "cloth_buy_dialog";

	switch(_clothType) do { // http://wiki.7thcavalry.us/wiki/ARMA_3_Clothing_and_headgear
		case "civ": { // Civilian cloth shop 
			_clothList = _clothList + [["Polo Rouge-Blanc", "U_C_Poloshirt_redwhite", 500, "uniform"]];
			_clothList = _clothList + [["Polo Bleu", "U_C_Poloshirt_blue", 500, "uniform"]];
			_clothList = _clothList + [["Blouson Cuir (Surf)", "U_OrestesBody", 2000,"uniform"]];
			_clothList = _clothList + [["Polo Bleu avec bandes", "U_C_Poloshirt_tricolour", 500, "uniform"]];
			_clothList = _clothList + [["Tenue d'ouvrier", "U_C_WorkerCoveralls", 500, "uniform"]];
		};

		case "cop": { // Cop cloth shop
			_clothList = [["Tenue de recrue", "U_Rangemaster", 500, "uniform"]];

		};
	};
	dialog_cloth_buy_items = _clothList;

	{
		lbAdd[7001, format["%1", _x select 0]];
	} forEach _clothList;
};

fn_shop_buy_cloth = {
	_display = findDisplay 7000;
	_lb = _display displayCtrl 7001;
	_index = lbSelection _lb;
	_index = _index select 0;
	if(isNil "_index") then { _index = 0; };
	_cloth = dialog_cloth_buy_items select _index;
	_cost = _cloth select 2;
	playSound "sell";

	if(stratis_money_player >= _cost) then {
		[[player, _cloth],"fn_set_cloth",nil,true ] call BIS_fnc_MP;
	}
	else {
		hint format["Il vous manque %1$ !", str(_cost - stratis_money_player)];
	};
};

fn_set_cloth = {
	_clothed = _this select 0;
	_cloth = _this select 1;

	_clothed addUniform (_cloth select 1);
};