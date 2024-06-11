void initializeDay(int day)
{
	if(inAftercore())
	{
		return;
	}

    tootOriole();

    if(day == 1)
    {
        tootGetMeat();

        if((item_amount($item[Antique Accordion]) == 0) && (item_amount($item[Aerogel Accordion]) == 0) && (item_amount($item[Toy Accordion]) == 0) && ((my_meat() > npc_price($item[Toy Accordion])) && (npc_price($item[Toy Accordion]) != 0)))
        {
            //Try to get Antique Accordion early if we possibly can.
            if(isUnclePAvailable() && ((my_meat() > npc_price($item[Antique Accordion])) && (npc_price($item[Antique Accordion]) != 0)))
            {
                auto_buyUpTo(1, $item[Antique Accordion]);
            }
            // Removed "else". In some situations when mafia or supporting scripts are behaving wonky we may completely fail to get an accordion
            if((isArmoryAvailable()) && (item_amount($item[Antique Accordion]) == 0))
            {
                auto_buyUpTo(1, $item[Toy Accordion]);
            }
        }
        acquireTotem();
        if(!possessEquipment($item[Saucepan]))
        {
            acquireGumItem($item[Saucepan]);
        }

        string temp = visit_url("guild.php?place=challenge");
        
        if((get_property("lastCouncilVisit").to_int() < my_level()))
		{
			cli_execute("counters");
			council();
		}
    }
    if(day == 2)
    {

    }

}

boolean dailyEvents()
{
    if(item_amount($item[Clan VIP Lounge Key]) > 0)
	{
		if(get_property("_deluxeKlawSummons").to_int() == 0)
		{
			cli_execute("clan_viplounge.php?action=klaw");
			cli_execute("clan_viplounge.php?action=klaw");
			cli_execute("clan_viplounge.php?action=klaw");
		}
	}
    if (get_property("_klawSummons").to_int() == 0 && get_clan_rumpus() contains 'Mr. Klaw "Skill" Crane Game') 
    {
		cli_execute("clan_rumpus.php?action=click&spot=3&furni=3");
		cli_execute("clan_rumpus.php?action=click&spot=3&furni=3");
		cli_execute("clan_rumpus.php?action=click&spot=3&furni=3");
	}
    if(have_skill($skill[That\'s Not a Knife]) && !get_property("_discoKnife").to_boolean())
	{
		foreach it in $items[Boot Knife, Broken Beer Bottle, Candy Knife, Sharpened Spoon, Soap Knife]
		{
			if(item_amount(it) == 1)
			{
				put_closet(1, it);
			}
		}
		use_skill(1, $skill[That\'s Not a Knife]);
	}

    //SIT
    //2002 Store
    //SceptreSkills
    //Aprilling Band Items

    return true;
}