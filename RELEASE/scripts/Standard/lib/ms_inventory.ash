
boolean auto_buyUpTo(int num, item it)
{
	if(item_amount(it) >= num)
	{
		return true;	//we already have the target amount
	}
	if(($items[Ben-Gal&trade; Balm, Hair Spray] contains it) && !isGeneralStoreAvailable())
	{
		return false;
	}
	if(($items[Blood of the Wereseal, Cheap Wind-Up Clock, Turtle Pheromones] contains it) && !isMusGuildStoreAvailable())
	{
		return false;
	}

	int missing = num - item_amount(it);
	int maxprice = get_property("autoBuyPriceLimit").to_int();
	if(can_interact() && shop_amount(it) > 0 && mall_price(it) < maxprice)	//prefer to buy from yourself
	{
		take_shop(min(missing, shop_amount(it)), it);
		missing = num - item_amount(it);
	}
	if(missing > 0)
	{
		buy(missing, it, maxprice);
	}
	return (item_amount(it) >= num);
}


int equipmentAmount(item equipment)
{
	if(equipment == $item[none])
	{
		return 0;
	}

	int amount = item_amount(equipment) + equipped_amount(equipment, true);

	return amount;
}

boolean possessEquipment(item equipment)
{
	return equipmentAmount(equipment) > 0;
}

boolean acquireGumItem(item it)
{
	if(!isGeneralStoreAvailable())
	{
		return false;
	}

	if(!($items[Disco Ball, Disco Mask, Helmet Turtle, Hollandaise Helmet, Mariachi Hat, Old Sweatpants, Pasta Spoon, Ravioli Hat, Saucepan, Seal-Clubbing Club, Seal-Skull Helmet, Stolen Accordion, Turtle Totem, Worthless Gewgaw, Worthless Knick-Knack, Worthless Trinket] contains it))
	{
		return false;
	}

	int have = item_amount(it);

	while((have == item_amount(it)) && (my_meat() >= npc_price($item[Chewing Gum on a String])))
	{
		auto_buyUpTo(1, $item[Chewing Gum on a String]);
		use(1, $item[Chewing Gum on a String]);
	}

	return (have + 1) == item_amount(it);
}

boolean acquireTotem()
{
	//this function checks if you have a valid totem for casting turtle tamer buffs with. Returning true if you do. If you don't, it will attempt to acquire one in a reasonable manner.

	//check if there is a valid totem in inventory or equipped, return true if there is.
	//check the closet from best to worst. If found in closet, uncloset 1 and return true
	
	foreach totem in $items[primitive alien totem, flail of the seven aspects, chelonian morningstar, mace of the tortoise, ouija board\, ouija board, turtle totem]
	{
		if (possessEquipment(totem))
		{
			return true;
		}
		if (0 < closet_amount(totem))
		{
			take_closet(1, totem);
			return true;
		}
	}


    //try fishing in the sewer for a turtle totem
    if(acquireGumItem($item[turtle totem]))
    {
        return true;
    }
	
	//did not get a totem. Give up
	return false;
}