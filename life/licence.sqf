//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

fn_add_licence = {
	private ["_licence", "_id"];
	_licence = _this select 0;	
	_id = parseNumber(_licence select 0);
	stratis_licences = stratis_licences + [_id];
};

fn_have_licence = {
	private ["_licence", "_id", "_return"];
	_licence = _this select 0;
	_id = parseNumber(_licence select 0);
	_return = false;
	if(_id in stratis_licences) then
	{
		_return = true;
	};
	_return;	
};

fn_buy_permisconduire = {
	if(!([licence_car] call fn_have_licence)) then 
	{
		if(stratis_money_player >= price_licence_car) then
		{
			stratis_money_player = stratis_money_player - price_licence_car;
			[licence_car] call fn_add_licence;
			hint format["Tu as désormais ton permis de conduire !"];
		}else{
			hint format["Tu n'as pas assez d'argent pour acheter le permis de conduire, il te manque %1$", str(price_licence_car - stratis_money_player)];
		};
	}
	else
	{
		hint format["Tu as déjà ton permis de conduire !"];
	};
};

fn_buy_licencecuivre = {
	if(!([licence_cuivre] call fn_have_licence)) then 
	{
		if(stratis_money_player >= price_licence_cuivre) then
		{
			stratis_money_player = stratis_money_player - price_licence_cuivre;
			[licence_cuivre] call fn_add_licence;
			hint format["Tu peux désormais traiter le cuivre !"];
		}else{
			hint format["Tu n'as pas assez d'argent pour acheter cette licence, il te manque %1$", str(price_licence_cuivre - stratis_money_player)];
		};
	}
	else
	{
		hint format["Tu sais déjà traiter le cuivre !"];
	};
};

fn_buy_licencecannabis = {
	if(!([licence_cuivre] call fn_have_licence)) then 
	{
		if(stratis_money_player >= price_licence_cannabis) then
		{
			stratis_money_player = stratis_money_player - price_licence_cannabis;
			[licence_canabis] call fn_add_licence;
			hint format["Tu peux désormais traiter le cannabis !"];
		}else{
			hint format["Tu n'as pas assez d'argent pour acheter cette licence, il te manque %1$", str(price_licence_cannabis - stratis_money_player)];
		};
	}
	else
	{
		hint format["Tu sais déjà traiter le cannabis !"];
	};
};

fn_buy_licencearme = {
	if(!([licence_arme] call fn_have_licence)) then 
	{
		if(stratis_money_player >= price_licence_arme) then
		{
			stratis_money_player = stratis_money_player - price_licence_arme;
			[licence_arme] call fn_add_licence;
			hint format["Tu as désormais le droit légal de porter une arme !"];
		}else{
			hint format["Tu n'as pas assez d'argent pour acheter cette licence, il te manque %1$", str(price_licence_arme - stratis_money_player)];
		};
	}
	else
	{
		hint format["Tu as déjà le droit légal de porter une arme !"];
	};
};