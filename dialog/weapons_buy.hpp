class weapons_buy_dialog {
	idd = 8000;
	movingEnable = true;           // the dialog can be moved with the mouse (see "moving" below)
	enableSimulation = true;      // freeze the game
	controlsBackground[] = { };    // no background controls needed
	objects[] = { };               // no objects needed
	controls[] = { bg_dialog, header_title, listbox_items, buy_wpn_btn, cost_wpn }; 

	class header_title {
		idc = -1;              // set to -1, unneeded
		moving = 1;            // left click (and hold) this control to move the dialog
		                       // (requires "movingEnabled" to be 1, see above)
		type = CT_STATIC;      // constant
		style = 2;       // constant
		text = "Armes";
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;

		colorBackground[] = {0.008,0.678,0.898,1};
		colorText[] = {1,1,1,1};

		x = safeZoneX + (safeZoneW / 2) - 0.35;
		y = safeZoneY + (safeZoneH / 2) - 0.25;
		w = 0.35;
		h = 0.06;
	};

	class bg_dialog {
		idc = -1;
		moving = 0;
		type = CT_STATIC;
		style = 112;
		x = safeZoneX + (safeZoneW / 2) - 0.35;
		y = safeZoneY + (safeZoneH / 2) - 0.25;
		w = 0.35;
		h = 0.48;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;
		text = "";
	};

	class listbox_items : stratlife_listbox {
		idc = 8001;
		x = safeZoneX + 0.015 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.09 + (safeZoneH / 2) - 0.25;
		w = 0.32;
		h = 0.30;
		onLBSelChanged = "[(_this select 0),(_this select 1)] call fn_buy_weapons_dialog_select";
	};


	class buy_wpn_btn : stratlife_btn_blue {
		idc = 8002;
		x = safeZoneX + 0.24 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.40 + (safeZoneH / 2) - 0.25;
		w = 0.10;
		h = 0.05;
		sizeEx = 0.035;
		text = "Acheter";
		action = "[] call fn_shop_buy_weapons";
	};

	class cost_wpn : stratlife_label {
		idc = 8003;
		x = safeZoneX + 0.02 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.40 + (safeZoneH / 2) - 0.25;
		w = 0.15;
		h = 0.05;
		sizeEx = 0.035;
		text = "Prix : 0$";
	};
};