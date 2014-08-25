class garage_buy_dialog {
	idd = 6000;
	movingEnable = true;           // the dialog can be moved with the mouse (see "moving" below)
	enableSimulation = true;      // freeze the game
	controlsBackground[] = { };    // no background controls needed
	objects[] = { };               // no objects needed
	controls[] = { bg_dialog, header_title, listbox_items, cost_veh, buy_veh_btn, veh_img }; 
	x = safeZoneX + 5;

	class header_title {
		idc = -1;              // set to -1, unneeded
		moving = 1;            // left click (and hold) this control to move the dialog
		                       // (requires "movingEnabled" to be 1, see above)
		type = CT_STATIC;      // constant
		style = 2;       // constant
		text = "Concessionnaire";
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;

		colorBackground[] = {0.008,0.678,0.898,1};
		colorText[] = {1,1,1,1};

		x = safeZoneX + (safeZoneW / 2) - 0.35;
		y = safeZoneY + (safeZoneH / 2) - 0.25;
		w = 0.70;
		h = 0.06;
	};

	class bg_dialog {
		idc = -1;
		moving = 0;
		type = CT_STATIC;
		style = 112;
		x = safeZoneX + (safeZoneW / 2) - 0.35;
		y = safeZoneY + (safeZoneH / 2) - 0.25;
		w = 0.70;
		h = 0.48;
		colorText[] = {0,0,0,1};
		colorBackground[] = {1,1,1,1};
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.060;
		text = "";
	};

	class listbox_items : stratlife_listbox {
		idc = 6001;
		x = safeZoneX + 0.015 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.09 + (safeZoneH / 2) - 0.25;
		w = 0.47;
		h = 0.30;
		onLBSelChanged = "[(_this select 0),(_this select 1)] call fn_buy_vehicles_dialog_select";
	};

	class cost_veh : stratlife_label {
		idc = 6002;
		x = safeZoneX + 0.50 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.40 + (safeZoneH / 2) - 0.25;
		w = 0.15;
		h = 0.05;
		sizeEx = 0.035;
		text = "Prix : 0$";
	};

	class buy_veh_btn : stratlife_btn_blue {
		idc = 6003;
		x = safeZoneX + 0.38 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.40 + (safeZoneH / 2) - 0.25;
		w = 0.10;
		h = 0.05;
		sizeEx = 0.035;
		text = "Acheter";
		action = "[] call fn_garage_buy";
	};

	class veh_img
	{    
		idc = 6004;
		shadow = 0;
		type = 0;
		style = 48;
		font = "EtelkaNarrowMediumPro";
		sizeEx = 0.05;
		x = safeZoneX + 0.49 + (safeZoneW / 2) - 0.35;
		y = safeZoneY + 0.09 + (safeZoneH / 2) - 0.25;
		h = 0.20;
		w = 0.20;	
		text = "";
		colorBackground[] = {1,1,1,1};
		colorText[] = {1,1,1,1};
	};  
};