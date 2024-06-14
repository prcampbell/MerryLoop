boolean inAftercore()
{
	return get_property("kingLiberated").to_boolean();
}

boolean isHermitAvailable()
{
	return true;
}

boolean isGalaktikAvailable()
{
	return true;
}

boolean isGeneralStoreAvailable()
{
	return true;
}

boolean isArmoryAndLeggeryStoreAvailable()
{
	return true;
}

boolean isMusGuildStoreAvailable()
{
	if ($classes[seal clubber, turtle tamer] contains my_class() && guild_store_available())
	{
		return true;
	}
	if (my_class() == $class[accordion thief] && my_level() >= 9 && guild_store_available())
	{
		return true;
	}
	return false;
}

boolean isMystGuildStoreAvailable() {
	if ($classes[Pastamancer, Sauceror] contains my_class() && guild_store_available()) {
		return true;
	}
	if (my_class() == $class[Accordion Thief] && my_level() >= 9 && guild_store_available()) {
		return true;
	}
	return false;
}

boolean isArmoryAvailable()
{
	return true;
}

boolean isUnclePAvailable()
{
	string page_text = visit_url("place.php?whichplace=desertbeach");
	return !page_text.contains_text("You don't know where a desert beach is");
}

boolean inKnollSign()
{
	return $strings[Mongoose, Vole, Wallaby] contains my_sign();
}

boolean inCanadiaSign()
{
	return $strings[Marmot, Opossum, Platypus] contains my_sign();
}

boolean inGnomeSign()
{
	return $strings[Blender, Packrat, Wombat] contains my_sign();
}

boolean autosellCrap()
{
	if(can_interact() && my_meat() > 20000)
	{
		return false;		//do not autosell stuff in casual or postronin unless you are very poor
	}

	foreach it in $items[dense meat stack, meat stack,  //quest rewards that are better off as meat. If we ever need it we can freely recreate them at no loss.
	Blue Money Bag, Red Money Bag, White Money Bag,  //vampyre path boss rewards and major source of meat in run.
	Space Blanket, //can be inside MayDay package. Only purpose is to sell for meat
	Void Stone] //dropped by Void Fights when Cursed Magnifying Glass is equiped. Only purpose is to sell for meat
	{
		if(item_amount(it) > 0)
		{
			auto_autosell(min(10,item_amount(it)), it);		//autosell all of this item
		}
	}
	foreach it in $items[Ancient Vinyl Coin Purse, Black Pension Check, CSA Discount Card, Fat Wallet, Gathered Meat-Clip, Old Leather Wallet, Penultimate Fantasy Chest, Pixellated Moneybag, Old Coin Purse, Shiny Stones, Warm Subject Gift Certificate]
	{
		if(item_amount(it) > 0 && auto_is_valid(it))
		{
			use(min(10,item_amount(it)), it);
		}
	}
	foreach it in $items[Bag Of Park Garbage]		//keeping 1 garbage in stock to avoid possible harmful loop with dinseylandfill_garbageMoney()
	{
		if(item_amount(it) > 1)		//for these items we want to keep 1 in stock. sell the rest
		{
			use(min(10,item_amount(it)-1), it);
		}
	}

	foreach it in $items[PADL Phone, perforated battle paddle, keg shield, beer bomb, flask flops, sea tangelo, see lychee, see honeydew]
	{
		if(item_amount(it) > 0)
		{
			auto_autosell(min(5,item_amount(it)), it);
		}
	}

	foreach it in $items[Awful Poetry Journal, Beach Glass Bead, Beer Bomb, Clay Peace-Sign Bead, Decorative Fountain, Dense Meat Stack, Empty Cloaca-Cola Bottle, Enchanted Barbell, Fancy Bath Salts, Frigid Ninja Stars, Feng Shui For Big Dumb Idiots, Giant Moxie Weed, Half of a Gold Tooth, Headless Sparrow, Imp Ale, Keel-Haulin\' Knife, Kokomo Resort Pass, Leftovers Of Indeterminate Origin, Mad Train Wine, Mangled Squirrel, Margarita, Meat Paste, Mineapple, Moxie Weed, Patchouli Incense Stick, Phat Turquoise Bead, Photoprotoneutron Torpedo, Plot Hole, Procrastination Potion, Rat Carcass, Smelted Roe, Spicy Jumping Bean Burrito, Spicy Bean Burrito, Strongness Elixir, Sunken Chest, Tambourine Bells, Tequila Sunrise, Uncle Jick\'s Brownie Mix, Windchimes]
	{
		if(item_amount(it) > 0)
		{
			auto_autosell(min(5,item_amount(it)), it);
		}
	}
	if(item_amount($item[hot wing]) > 3)
	{
		auto_autosell(item_amount($item[hot wing]) - 3, $item[hot wing]);
	}
	if(item_amount($item[Chaos Butterfly]) > 1)
	{
		auto_autosell(item_amount($item[Chaos Butterfly]) - 1, $item[Chaos Butterfly]);
	}
	return true;
}