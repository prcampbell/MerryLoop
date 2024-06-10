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