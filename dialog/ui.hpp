class stratlife_btn_blue {
	moving = 0;
	type = 1;
	style = 112;
	colorDisabled[] = {0.596,0.596,0.596,1};
	colorSelection[] = {0.047,0.416,0.608,1};
	colorFocused[] = {0.047,0.416,0.608,1};
	colorBorder[] = {0.047,0.416,0.608,1};
	colorShadow[] = {0.047,0.416,0.608,1};
	autocomplete = false;
	colorText[] = {1,1,1,1};
	borderSize = 0;
	colorBackground[] = {0.008,0.678,0.898,1};
	font = "EtelkaNarrowMediumPro";
	sizeEx = 0.025;
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	soundEnter[] = {"confirm", 0.562341,1 };
	soundPush[] = {"confirm", 0.562341,1 };
	soundClick[] = {"confirm", 0.562341,1 };
	soundEscape[] = {"confirm", 0.562341,1 };
	colorBackgroundActive[] = {0.047,0.416,0.608,1};
	colorBackgroundDisabled[] = {0.008,0.678,0.898,1};
};

class stratlife_listbox {
	idc = -1;
	type = 5;
	style = 0 + 0x10;
	font = "EtelkaNarrowMediumPro";
	sizeEx = 0.035;
	    rowHeight = 0.03;
	color[] =  {0,0,0,1};
	colorText[] =  {0,0,0,1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] =  {1,1,1,1};
	colorSelect2[] =  {1,1,1,1};
	colorSelectBackground[] =  {0.008,0.678,0.898,1};
	colorSelectBackground2[] =  {0.008,0.678,0.898,1};
	columns[] = {0.1, 0.7, 0.1, 0.1};
	period = 0;
	colorBackground[] = {0.792,0.792,0.792,1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	colorDisabled[] = {0,0,0,1};

	class ListScrollBar {
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;		
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class stratlife_label {
	idc = -1;
	moving = 0;
	type = CT_STATIC;
	style = 0;
	colorText[] = {0.008,0.678,0.898,1};
	colorBackground[] = {1,1,1,1};
	font = "EtelkaNarrowMediumPro";
};