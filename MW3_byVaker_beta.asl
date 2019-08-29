state("iw5sp")
{
	string64 map: 0x18002C0;
	int gamestate: 0xC75210;
	int missionstate: 0x5955D4;
	int glassintact: 0x1DD3064;
	float coordX: 0x54D360;
	float coordY: 0x54D364;
}

startup
{
	vars.missionList = new List<string>{
		"sp_ny_manhattan", "sp_ny_harbor", "sp_intro", "hijack", "sp_warlord", "london", "hamburg", "sp_payback", "sp_paris_a",
		"paris_ac130", "sp_prague", "prague_escape", "castle", "sp_berlin", "rescue_2", "sp_dubai"
	};
}
 
start
{
	return ((current.map == "sp_ny_manhattan") && (current.missionstate != 0));
}

split
{
	return ((vars.missionList.Contains(current.map) && (current.map != old.map)) || ((current.map == "sp_dubai") && (current.glassintact == 0) && (current.missionstate == 3)));
}
 
reset
{
	return ((current.map == "sp_ny_manhattan") && ((old.map != "sp_ny_manhattan") || ((current.missionstate == 0) && (Math.Floor(current.coordX) == -4233) && (Math.Floor(current.coordY) == -3652))));
}

isLoading
{
	return (current.gamestate == 0);
}
