//Defined in ms_run.ash

//Defined in ms_util.ash
boolean inAftercore();

boolean isHermitAvailable();

boolean isGalaktikAvailable();

boolean isGeneralStoreAvailable();

boolean isArmoryAndLeggeryStoreAvailable();

boolean isMusGuildStoreAvailable();

boolean isMystGuildStoreAvailable();

boolean isArmoryAvailable();

boolean isUnclePAvailable();

boolean inKnollSign();

boolean inCanadiaSign();

boolean inGnomeSign();

boolean autosellCrap()

//Defined in ms_inventory.ash

boolean auto_buyUpTo(int num, item it);
int equipmentAmount(item equipment);
boolean possessEquipment(item equipment);
boolean acquireGumItem(item it);
boolean acquireTotem();

//Defined in ms_day.ash

void initializeDay(int day);
boolean dailyEvents();

//Defined in ms_01.ash
void tootOriole();
void tootGetMeat();