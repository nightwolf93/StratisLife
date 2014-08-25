private["_display","_money"];

createDialog "bank_dialog";

_display = findDisplay 4000;
_money = _display displayCtrl 4001;
_money_me = _display displayCtrl 4002;

_money ctrlSetText str stratis_money + "$";
_money_me ctrlSetText str stratis_money_player + "$";