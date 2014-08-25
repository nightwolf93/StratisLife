//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

0 cutText["Chargement de votre personnage ..","BLACK FADED"];
execVM("life\mp.sqf");
execVM("life\definitions.sqf");
execVM("life\licence.sqf");
execVM("life\vehicles\siren.sqf");
execVM("life\garage.sqf");
0 cutText ["","BLACK IN"];

///////////////////////////////
/////// Player Functions //////
///////////////////////////////

fn_debug_test = {
	private ["_meters"];
	_meters=player distance getMarkerPos("get_cuivre_1");
	hint format["Distance : %1", str(_meters)];	
};

fn_display_player_menu = { /* Display the player menu */
	private ["_index", "_item"];
	if(!stratis_inaction) then
	{
		createDialog "player_menu_dialog";
		_display = findDisplay 5000;
		_index = 0;
		_money_me = _display displayCtrl 5002;
		_money_me ctrlSetText format["Argent sur moi : %1$", str stratis_money_player];
		_money_bank = _display displayCtrl 5003;
		_money_bank ctrlSetText format["Argent en banque : %1$", str stratis_money];

		{
			if(typeName _x == "SCALAR") then {
				if(_x > 0) then {
					_item = items_life select _index;

					lbAdd[5001, format["x%2 %1", _item select 1, str(_x)]];
				};
			};
			_index = _index + 1;
		} forEach stratis_inventory;
	}
};

fn_open_bank = {
	private["_display","_money"];
	disableSerialization;

	createDialog "bank_dialog";

	_display = findDisplay 4000;
	_money = _display displayCtrl 4001;
	_money_me = _display displayCtrl 4002;

	_money ctrlSetText str stratis_money + "$";
	_money_me ctrlSetText str stratis_money_player + "$";	
};

fn_add_inventory = { /*  Add item to the player inventory */
	private ["_item", "_name", "_id", "_quantity", "_item_quant"];
	_item = _this select 0;
	_item_quant = _this select 1;
	_id = parseNumber(_item select 0);
	_name = _item select 1;
	_quantity = 0;

	if (_name in stratis_inventory) then 
	{ 
		_quantity = stratis_inventory select _id;
		stratis_inventory set [_id, _quantity + _item_quant];
	} else 
	{ 
		stratis_inventory set [_id, _item_quant];
		stratis_inventory set [_id + 10000, _name]; 
	};
};

fn_get_item_quantity = { /*  Get item quantity in inventory from item template */
	private ["_item", "_name", "_id", "_return"];
	_return = 0;
	_item = _this select 0;
	_id = parseNumber(_item select 0);
	_name = _item select 1;
	if (_name in stratis_inventory) then 
	{ 
		_return = stratis_inventory select _id;
	} else 
	{ 
		_return = 0;
	};

	_return;
};

fn_set_item_quantity = { /* Set the quantity of the item in the inventory */
	private ["_item", "_name", "_id", "_quantity"];
	_item = _this select 0;
	_quantity = _this select 1;
	_id = parseNumber(_item select 0);

	stratis_inventory set [_id, _quantity];
};


///////////////////////////////
/////// Bank Functions ////////
///////////////////////////////

fn_refresh_bank = {
	_display = findDisplay 4000;
	_money = _display displayCtrl 4001;
	_money_me = _display displayCtrl 4002;

	_money ctrlSetText str stratis_money + "$";
	_money_me ctrlSetText str stratis_money_player + "$";
};

fn_bank_get = {
    private ["_amount"];
    _amount = parseNumber(ctrlText 4003);

    if(_amount > 0 and stratis_money >= _amount) then
    {
    	stratis_money = stratis_money - _amount;
    	stratis_money_player = stratis_money_player + _amount;
    } else {
    	hint "Vous ne possédez pas assez d'argent pour ce transfert !";
	};

    [] call fn_refresh_bank;
};

fn_bank_deposit = {
    private ["_amount"];
    _amount = parseNumber(ctrlText 4003);

    if(_amount > 0 and stratis_money_player >= _amount) then
    {
    	stratis_money = stratis_money + _amount;
    	stratis_money_player = stratis_money_player - _amount;
    } else {
    	hint "Vous ne possédez pas assez d'argent pour ce transfert !";
	};

    [] call fn_refresh_bank;
};

/////////////////////////////////////////
/////// Getting/Traitment Functions /////
/////////////////////////////////////////

fn_get_cuivre = {
	if(!stratis_inaction) then
	{
		stratis_inaction = true;
		for "_i" from 0 to 2 do {
			player playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
			TitleText["Minage du cuivre ..","PLAIN"];
			titleFadeOut 2;
			sleep 2;
		};
		
		[item_cuivre, 1] call fn_add_inventory;
		stratis_inaction = false;
	};
};

fn_trait_cuivre = {
	private ["_quantity"];		

	_quantity = [item_cuivre] call fn_get_item_quantity;
	if([licence_cuivre] call fn_have_licence) then
	{
		if(_quantity > 0) then
		{
			TitleText["Traitement ..","PLAIN"];
			titleFadeOut 2;
			sleep 2;
			[item_cuivre, 0] call fn_set_item_quantity;
			[item_cuivretrait, _quantity] call fn_add_inventory;
			TitleText["Cargaison traiter !","PLAIN"];
		}
		else
		{
			hint "Vous ne possédez aucune cargaison de cuivre sur vous !";
		};
	}else{
		hint "Vous ne possédez pas la licence du traitement de cuivre !";
	};
};

fn_get_crustace = {
	if(!stratis_inaction) then
	{
		stratis_inaction = true;
		player playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
		TitleText["Recherche de crustacés ..","PLAIN"];
		titleFadeOut 2;
		sleep 2;
		
		[item_crustace, 1] call fn_add_inventory;
		stratis_inaction = false;
	}
};

fn_sell_crustace = {
	private ["_quantity", "_reward"];
	if(!stratis_inaction) then
	{
		_quantity = [item_crustace] call fn_get_item_quantity;
		if(_quantity > 0) then
		{
			TitleText["Négociation avec les vendeur","PLAIN"];
			titleFadeOut 2;
			sleep 2;

			_reward = _quantity * 1000;

			stratis_money_player = stratis_money_player + _reward;
			[item_crustace, 0] call fn_set_item_quantity;

			hint format["Cargaison vendus pour %1$", str _reward];
			playSound "sell";
		} else {
			hint "Vous ne possédez aucune cargaison de crustacés sur vous !";
		};
	}	
};

fn_get_chanvre = {
	if(!stratis_inaction) then
	{
		stratis_inaction = true;
		for "_i" from 0 to 2 do {
			player playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
			TitleText["Récolte du chanvre ..","PLAIN"];
			titleFadeOut 2;
			sleep 2;
		};
		
		[item_cannabis, 1] call fn_add_inventory;
		stratis_inaction = false;
	}
};

/////////////////////////////////////////
//////////// Dialog Shortcut ////////////
/////////////////////////////////////////

waituntil {!(IsNull (findDisplay 46))};
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "(if (_this select 1 == 21) then {[] call fn_display_player_menu;})"]