class bank_dialog {
	idd = 4000;                      // set to -1, because we don't require a unique ID
	movingEnable = true;           // the dialog can be moved with the mouse (see "moving" below)
	enableSimulation = true;      // freeze the game
	controlsBackground[] = { };    // no background controls needed
	objects[] = { };               // no objects needed
	controls[] = { bg_dialog, header_title, mymoney_title, mymoney_value, moneyonme_title, moneyonme_value, money_edit_box, money_get_btn, money_deposit_btn };  // our "Hello world" text as seen below:
	
	class header_title {
		idc = -1;              // set to -1, unneeded
		moving = 1;            // left click (and hold) this control to move the dialog
		                       // (requires "movingEnabled" to be 1, see above)
		type = CT_STATIC;      // constant
		style = 2;       // constant
		text = "Compte banquaire";
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;

		colorBackground[] = {0.008,0.678,0.898,1};
		colorText[] = {1,1,1,1};

		x = safeZoneX;
		y = safeZoneY;
		w = 0.40;
		h = 0.06;
	};

	class bg_dialog {
		idc = -1;
		moving = 0;
		type = CT_STATIC;
		style = 112;
		x = safeZoneX;
		y = safeZoneY;
		w = 0.40;
		h = 0.50;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;
		text = "";
	};

	class mymoney_title {
		idc = -1;
		moving = 0;
		type = CT_STATIC;
		style = 0;
		x = safeZoneX + 0.005;
		y = safeZoneY + 0.08;
		w = 0.20;
		h = 0.06;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.030;
		text = "Argent en banque :";
	};

	class mymoney_value {
		idc = 4001;
		moving = 0;
		type = CT_STATIC;
		style = 0;
		x = safeZoneX + 0.20;
		y = safeZoneY + 0.08;
		w = 0.10;
		h = 0.05;
		colorText[] = {0.008,0.678,0.898,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.040;
		text = "";
	};

	class moneyonme_title {
		idc = -1;
		moving = 0;
		type = CT_STATIC;
		style = 0;
		x = safeZoneX + 0.005;
		y = safeZoneY + 0.12;
		w = 0.20;
		h = 0.06;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.030;
		text = "Argent sur moi :";
	};

	class moneyonme_value {
		idc = 4002;
		moving = 0;
		type = CT_STATIC;
		style = 0;
		x = safeZoneX + 0.20;
		y = safeZoneY + 0.12;
		w = 0.10;
		h = 0.05;
		colorText[] = {0.008,0.678,0.898,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.040;
		text = "0$";
	};

	class money_edit_box {
		idc = 4003;
		moving = 0;
		type = 2;
		style = ST_LEFT;
		x = safeZoneX + 0.050;
		y = safeZoneY + 0.20;
		w = 0.30;
		h = 0.05;
		colorDisabled[] = {0.596,0.596,0.596,1};
		colorSelection[] = {0.008,0.678,0.898,1};
		autocomplete = false;
		colorText[] = {0,0,0,1};
		colorBackground[] = {0.596,0.596,0.596,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.025;
		text = "1";
	};

	class money_get_btn : stratlife_btn_blue {
		idc = 4004;
		x = safeZoneX + 0.050;
		y = safeZoneY + 0.30;
		w = 0.10;
		h = 0.05;
		text = "Retirer";
		action = "[] call fn_bank_get";
	};

	class money_deposit_btn : stratlife_btn_blue {
		idc = 4005;
		x = safeZoneX + 0.25;
		y = safeZoneY + 0.30;
		w = 0.10;
		h = 0.05;
		text = "Déposer";
		action = "[] call fn_bank_deposit";
	};
};