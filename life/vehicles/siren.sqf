//   _____ _             _   _     _      _  __      //
//  / ____| |           | | (_)   | |    (_)/ _|     //
// | (___ | |_ _ __ __ _| |_ _ ___| |     _| |_ ___  //
//  \___ \| __| '__/ _` | __| / __| |    | |  _/ _ \ //
//  ____) | |_| | | (_| | |_| \__ \ |____| | ||  __/ //
// |_____/ \__|_|  \__,_|\__|_|___/______|_|_| \___| //
//									By Nightwolf	 //
//									v1.0.0.0 		 //
///////////////////////////////////////////////////////

fn_add_siren_to_vehicle = {
	private ["_vehicle"];
	_vehicle = _this select 0;

	//Definitions de la sirene de police
	_vehicle setVariable ["hasSiren", true];
	_vehicle setVariable ["sirenOn", false];
	_vehicle addAction ["Siren (On)", { [[_this select 3],"fn_siren_vehicle",nil,true ] call BIS_fnc_MP; }, _vehicle, -10, false, false,"","driver _target == _this AND !(_target getVariable('sirenOn')) AND _target getVariable('hasSiren')"];
	_vehicle addAction ["Siren (Off)", { [[_this select 3],"fn_siren_off",nil,true ] call BIS_fnc_MP; }, _vehicle, -10, false, false,"","driver _target == _this AND _target getVariable('sirenOn') AND _target getVariable('hasSiren')"];
};

fn_siren_vehicle = {
	private ["_vehicle"];
	_vehicle = _this select 0;
	_vehicle setVariable ["sirenOn", true];
	_vehicle animate ["BeaconsStart",1];
	_lightRed = [5, 0.5, 0.5];
	_lightBlue = [0.5, 0.5, 5];
	lightleft = "#lightpoint" createVehicle getpos _vehicle;  
    lightleft setLightColor _lightRed;
    lightleft setLightBrightness 0.3; 
    lightleft setLightAmbient _lightRed;
    lightleft lightAttachObject [_vehicle, [-3, 0.8, 0]]; 
    lightleft setLightAttenuation [3, 0, 0, 0.6];

    lightright = "#lightpoint" createVehicle getpos _vehicle;  
    lightright setLightColor _lightBlue;
    lightright setLightBrightness 0.3; 
    lightright setLightAmbient _lightBlue;
    lightright lightAttachObject [_vehicle, [3, 0.8, 0]]; 
    lightright setLightAttenuation [3, 0, 0, 0.6];
	_leftRed = true; 

	_vehicle setVariable ["lightleft", lightleft];
	_vehicle setVariable ["lightright", lightright];

	while{_vehicle getVariable("sirenOn")} do 
    { 
		if(_leftRed) then 
		{ 
			_leftRed = false; 
			lightleft setLightColor _lightRed;
			lightleft setLightAmbient _lightRed;
			lightright setLightColor _lightBlue;
			lightright setLightAmbient _lightBlue;
			_vehicle say3d "siren1";
		} 
		else 
		{ 
			_leftRed = true; 
			lightleft setLightColor _lightBlue;
			lightleft setLightAmbient _lightBlue;
			lightright setLightColor _lightRed;
			lightright setLightAmbient _lightRed;
		}; 
	sleep 4.5; 
    };
};

fn_siren_off = {
	private ["_vehicle"];
	_vehicle = _this select 0;
	_vehicle animate ["BeaconsStart",0];
	_vehicle setVariable ["sirenOn", false];
	lightleft = _vehicle getVariable("lightleft");
	lightright = _vehicle getVariable("lightright");
	deleteVehicle lightleft;
	deleteVehicle lightright;
};