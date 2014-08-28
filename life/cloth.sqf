//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

/* 
BACKPACK
"B_AssaultPack_khk",  
"B_AssaultPack_khk_holder",  
"B_AssaultPack_dgtl",  
"B_AssaultPack_rgr",  
"B_AssaultPack_rgr_Medic",  
"B_AssaultPack_rgr_Repair",  
"B_AssaultPack_sgg",  
"B_AssaultPack_blk",  
"B_AssaultPack_blk_DiverExp",  
"B_AssaultPack_blk_DiverTL",  
"B_AssaultPack_cbr",  
"B_AssaultPack_mcamo",  
"B_AssaultPack_ocamo",  
"B_Kitbag_mcamo",  
"B_Kitbag_sgg",  
"B_Kitbag_cbr",  
"B_FieldPack_blk",  
"B_FieldPack_blk_DiverExp",  
"B_FieldPack_blk_DiverTL",  
"B_FieldPack_ocamo",  
"B_FieldPack_cbr",  
"B_FieldPack_cbr_AT",  
"B_FieldPack_cbr_Repair",  
"B_Carryall_ocamo",  
"B_Carryall_oucamo",  
"B_Carryall_oucamo_Exp",  
"Bag_Base",  
"B_AssaultPack_Base",  
"B_Kitbag_Base",  
"B_FieldPack_Base",  
"B_Bergen_Base",  
"B_Carryall_Base"
*/

fn_open_cloth_dialog = {
	private ["_clothType", "_clothList"];
	dialog_cloth_buy_items = [];
	_clothType = _this select 0;
	_clothList = [];
	_valid = true;

	switch(_clothType) do { // http://wiki.7thcavalry.us/wiki/ARMA_3_Clothing_and_headgear
		case "civ": { // Civilian cloth shop 
			_clothList = _clothList + [["Polo Rouge-Blanc", "U_C_Poloshirt_redwhite", 500, "uniform"]];
			_clothList = _clothList + [["Polo Bleu", "U_C_Poloshirt_blue", 500, "uniform"]];
			_clothList = _clothList + [["Blouson Cuir (Surf)", "U_OrestesBody", 2000,"uniform"]];
			_clothList = _clothList + [["Polo Bleu avec bandes", "U_C_Poloshirt_tricolour", 500, "uniform"]];
			_clothList = _clothList + [["Tenue d'ouvrier", "U_C_WorkerCoveralls", 500, "uniform"]];

			_clothList = _clothList + [["Petit sac à dos (Marron)", "B_AssaultPack_cbr", 500, "backpack"]];
		};

		case "cop0": { // Cop cloth shop
			if(!([licence_cop0] call fn_have_licence)) then { hint format["Il vous manque la licence : %1", licence_cop0 select 1]; _valid = true; };

			_clothList = [["Tenue de recrue", "U_Rangemaster", 6500, "uniform"]];

			_clothList = _clothList + [["Sac de recrue (Hex)", "B_AssaultPack_ocamo", 8000, "backpack"]];

			_clothList = _clothList + [["Bonnet (Noir)", "H_Watchcap_blk", 2500, "headgear"]];
		};
	};

	if(_valid) then {
		dialog_cloth_buy_items = _clothList;

		disableSerialization;
		createDialog "cloth_buy_dialog";
		{
			lbAdd[7001, format["%1", _x select 0]];
		} forEach _clothList;
	};
};

fn_buy_cloth_dialog_select = {
	_ctrlId = _this select 0;
	_entry = _this select 1;
	_display = findDisplay 7000;
	_txt = _display displayCtrl 7003;
	_cloth = dialog_cloth_buy_items select _entry;
	_txt ctrlSetText format["Prix : %1$", str(_cloth select 2)];
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
	_clothType = _cloth select 3;

	switch(_clothType) do {
		case "uniform": { _clothed addUniform (_cloth select 1); };
		case "backpack": { _clothed addBackpack (_cloth select 1); };
		case "headgear": { _clothed addHeadgear (_cloth select 1); };
	};	
};