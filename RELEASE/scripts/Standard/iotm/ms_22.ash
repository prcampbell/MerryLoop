//Cosmic Bowling Ball
//Combat Lover's Locket
//Grey Goose
//Unbreakable Umbrella
//MayDay Contract
//June Cleaver
//Designer Sweatpants
//Tiny Stillsuit
//Jurassic Parka
//Fallbot
//Cookbookbat
//Model Train Set
//Cursed Magnifying Glass


boolean auto_haveTrainSet()
{
	return auto_get_campground() contains $item[model train set] && auto_is_valid($item[model train set]); //check if the model train set is in the campground
}

void ms_modifyTrainSet(int one, int two, int three, int four, int five, int six, int seven, int eight)
{
	string page = `choice.php?pwd&whichchoice=1485&option=1&slot[0]=1&slot[1]=8&slot[2]=16&slot[3]=13&slot[4]=20&slot[5]=3&slot[6]=6&slot[7]=2`;
	visit_url(page,true,true);
	visit_url("main.php");
	return;
}

void auto_checkTrainSet()
{
	int lastTrainsetConfiguration = get_property("lastTrainsetConfiguration").to_int();
	int trainsetPosition = get_property("trainsetPosition").to_int();
	string trainsetConfiguration = get_property("trainsetConfiguration");
	if(!auto_haveTrainSet()) return;
	/* A list of what the station numbers are (thanks Zdrvst for compiling this list for your CS script)
	1: meat
	2: mp regen
	3: all stats
	4: hot res, cold dmg
	5: stench res, spooky dmg
	6: wood, joiners, or stats (orc chasm bridge stuff)
	7: candy
	8: double next stop
	9: cold res, stench dmg
	11: spooky res, sleaze dmg
	12: sleaze res, hot dmg
	13: monster level
	14: mox stats
	15: basic booze
	16: mys stats
	17: mus stats
	18: food drop buff
	19: copy last food drop
	20: ore
	*/
	string[int] stationInts;
	stationInts[1] = "meat_mine";
	stationInts[2] = "tower_fizzy";
	stationInts[3] = "viewing_platform";
	stationInts[4] = "tower_frozen";
	stationInts[5] = "spooky_graveyard";
	stationInts[6] = "logging_mill";
	stationInts[7] = "candy_factory";
	stationInts[8] = "coal_hopper";
	stationInts[9] = "tower_sewage";
	stationInts[11] = "oil_refinery";
	stationInts[12] = "oil_bridge";
	stationInts[13] = "water_bridge";
	stationInts[14] = "groin_silo";
	stationInts[15] = "grain_silo";
	stationInts[16] = "brain_silo";
	stationInts[17] = "brawn_silo";
	stationInts[18] = "prawn_silo";
	stationInts[19] = "trackside_diner";
	stationInts[20] = "ore_hopper";
	int one = 8; //doubler
	int two;
	int three;
	int four;
	if(my_level() < 11) //check if we need more stats. There is no check for disregard instant karma because
	//if we do check, we will never double lumber mill, which is more beneficial than continuing to double mainstat.
	{
		if(my_primestat() == $stat[Muscle])
		{
			two = 17;
		}
		else if(my_primestat() == $stat[Mysticality])
		{
			two = 16;
		}
		else
		{
			two = 14;
		}
		three = 3; //all stats
		four = 6; //lumber mill
	}
	else if(fastenerCount() < 30 || lumberCount() < 30)//Double lumber mill to clear orc bridge faster
	{
		two = 6; //lumber mill
		if(my_primestat() == $stat[Muscle])
		{
			three = 17;
		}
		else if(my_primestat() == $stat[Mysticality])
		{
			three = 16;
		}
		else
		{
			three = 14;
		}
		four = 3; //all stats
	}
	else //no need for main stats or bridge parts so lets do resistances and offstats
	{
		two = 11; //spooky res, sleaze dmg
		three = 4; //hot res, cold dmg
		if(my_primestat() == $stat[Muscle])
		{
			four = 14; //Moxie for Muscle peeps
		}
		else if(my_primestat() == $stat[Mysticality])
		{
			four = 14; //Moxie for Mysticality peeps
		}
		else
		{
			four = 17; //Muscle for Moxie peeps
		}
	}
	int five = 1; //meat
	int six = 2; //mp regen
	int seven;
	//Initialize trapper to know whether we have enough ore or not
	int L8Step = internalQuestStatus("questL08Trapper");
	if (my_level()>=8 && L8Step==0){
		L8_trapperTalk();
	}
	if (needOre()){
		seven = 20; //ore
	} 
	else
	{
		if(my_primestat() == $stat[Muscle])
		{
			seven = 16; //Mysticality for Muscle peeps
		}
		else if(my_primestat() == $stat[Mysticality])
		{
			seven = 17; //Muscle for Mysticality peeps
		}
		else
		{
			seven = 16; //Mysticality for Moxie peeps
		}
	}
	int eight = 13; //monster level
	if((monster_level_adjustment() > get_property("auto_MLSafetyLimit").to_int() && get_property("auto_MLSafetyLimit") != "") || get_property("auto_MLSafetyLimit").to_int() == -1){
		eight = 9; //cold res, stench dmg
	}
	int turnsSinceTSConfigured = min(trainsetPosition - lastTrainsetConfiguration, 40);
	string expectedConfig = stationInts[one] + "," + stationInts[two] + "," + stationInts[three] + "," + stationInts[four] + "," + stationInts[five] + "," + stationInts[six] + "," + stationInts[seven] + "," + stationInts[eight];

	boolean changedTSConfig;
	if(expectedConfig != trainsetConfiguration)
	{
		changedTSConfig = true;
	}
	else
	{
		changedTSConfig = false;
	}

	//only check for the page if it has been 0 turns or 40 turns since last configured and the configuration has changed
	if ((turnsSinceTSConfigured == 0) || ((turnsSinceTSConfigured == 40) && changedTSConfig))
	{
		string page = visit_url("campground.php?action=workshed"); //once it is available, still double check that we can actually change the config
		if (contains_text(page,'value="Save Train Set Configuration"')){
			auto_modifyTrainSet(one, two, three, four, five, six, seven, eight);
		}
		return;
	}
}
