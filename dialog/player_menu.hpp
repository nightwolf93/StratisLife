class player_menu_dialog {
	idd = 5000;
	movingEnable = true;           // the dialog can be moved with the mouse (see "moving" below)
	enableSimulation = true;      // freeze the game
	controlsBackground[] = { };    // no background controls needed
	objects[] = { };               // no objects needed
	controls[] = { bg_dialog, header_title, listbox_items, money_onme, money_bank }; 

	class header_title {
		idc = -1;              // set to -1, unneeded
		moving = 1;            // left click (and hold) this control to move the dialog
		                       // (requires "movingEnabled" to be 1, see above)
		type = CT_STATIC;      // constant
		style = 2;       // constant
		text = "Menu Joueur - Stratis Life";
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;

		colorBackground[] = {0.008,0.678,0.898,1};
		colorText[] = {1,1,1,1};

		x = safeZoneX;
		y = safeZoneY;
		w = 0.80;
		h = 0.06;
	};

	class bg_dialog {
		idc = -1;
		moving = 0;
		type = CT_STATIC;
		style = 112;
		x = safeZoneX;
		y = safeZoneY;
		w = 0.80;
		h = 0.50;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;
		text = "";
	};

	class listbox_items : stratlife_listbox {
		idc = 5001;
		x = safeZoneX + 0.03;
		y = safeZoneY + 0.09;
		w = 0.20;
		h = 0.25;
	};

	class money_onme : stratlife_label {
		idc = 5002;
		x = safeZoneX + 0.25;
		y = safeZoneY + 0.09;
		w = 0.40;
		h = 0.05;
		sizeEx = 0.035;
		text = "";
	};

	class money_bank : stratlife_label {
		idc = 5003;
		x = safeZoneX + 0.25;
		y = safeZoneY + 0.14;
		w = 0.40;
		h = 0.05;
		sizeEx = 0.035;
		text = "";
	};
};