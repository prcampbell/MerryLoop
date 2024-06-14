void initializeDay(int day)
{
	if(inAftercore())
	{
        print('In aftercore, bye!');
		return;
	}

    tootOriole();

    if(day == 1)
    {

        if (item_amount($item[earthenware muffin tin]) > 0 ||
	    (!get_property("_muffinOrderedToday").to_boolean() && 
			$items[blueberry muffin, bran muffin, chocolate chip muffin, earthenware muffin tin] contains get_property("muffinOnOrder").to_item())) {

		visit_url("place.php?whichplace=monorail&action=monorail_downtown");
		run_choice(7); // Visit the Breakfast Counter
		if (get_property("muffinOnOrder") != "")
		{
			cli_execute("refresh inv");
			if (item_amount(get_property("muffinOnOrder").to_item()) > 0)
			{
				// workaround mafia not clearing the property occasionally
				// see https://kolmafia.us/threads/ordering-a-muffin-at-the-breakfast-counter-doesnt-always-set-the-muffinonorder-property.26072/
				set_property("muffinOnOrder", "");
			}
		}
		if (!get_property("_muffinOrderedToday").to_boolean() && item_amount($item[earthenware muffin tin]) > 0) 
        {
			run_choice(1); // Order a blueberry muffin
		}
		run_choice(1); // Back to the Platform!
		run_choice(8); // Nevermind



        if (available_amount($item[rake]) < 1)
        {
            // visit the pile of burning leaves to grab the rakes
            visit_url("campground.php?preaction=leaves");
        }

        use_familiar($familiar[slimeling]);
        equip($slot[familiar], $item[tiny stillsuit]);
        

        tootGetMeat();
        if(creatable_amount($item[Bitchin\' Meatcar]) > 0)
        {
            create(1, $item[Bitchin\' Meatcar]);
        }

        use(1, $item[model trainset]);
        string page = `choice.php?pwd&whichchoice=1485&option=1&slot[0]=1&slot[1]=8&slot[2]=16&slot[3]=13&slot[4]=20&slot[5]=3&slot[6]=6&slot[7]=2`;
        visit_url(page,true,true);
        visit_url("main.php");

        if(have_effect($effect[Everything looks Yellow]) == 0)
        {
                    //Get dressed and zap
            equip($slot[hat], $item[Apriling Band Helmet]);
            equip($slot[shirt], $item[Jurassic Parka]);
            equip($slot[weapon], $item[June Cleaver]);
            equip($slot[off-hand], $item[Rake]);
            equip($slot[pants], $item[designer sweat pants]);
            equip($slot[acc1], $item[astral belt]);
            equip($slot[acc2], $item[cincho de mayo]);
            equip($slot[acc3], $item[spring shoes]);
            use_familiar($familiar[Jill-of-All-Trades]);
            equip($slot[familiar], $item[tiny rake]);

            cli_execute('parka dilophosaur');

            abort();
        }



        autosellCrap();
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