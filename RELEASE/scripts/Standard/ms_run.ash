import ms_header.ash;

import ms_util.ash;
import ms_inventory.ash;
import ms_day.ash;

import ms_01.ash;


void main()
{
    //General mafia set up
    cli_execute('autoattack 0');
    cli_execute('refresh all');
    cli_execute('mood apathetic');
    cli_execute('/whitelist bonus adv');

    //I should probably set restore options but whatever.

    initializeDay(my_daycount());
    dailyEvents();

    //handle pulls
    //daily events
    //diet
    //tasks
    //bedtime

    //cli_execute('make bitchin meat car; mcd 10');

}


/*

Generic
Order Blueberry muffin
buy 11 chewing gum
use 11 chewing gum (fish for totem + sauce pan)
Council


acquire continuum tranfunctioner

IotM stuff
summon waffles (aug. 24)
summon sax
summon tuba
summon FLUDA
summon skateboard
summon Spooky VHS tape
SIT : CryptoBotany
use model trainset
coal, logging mill, brain silo, diner, ore, MP, platform, ml
Lyle Candycane Buff
familiar slimeling
equip stillsuit
go to burning leaves
harvest garden
shake tea tree
familiar cookbookbat
get dressed
apriling band helmet
jurassic parka
parka acid
june cleaver
rake
designer sweat pants
everfull dart holster
spring shoes
astral belt
lock tiny rake
fallguy send haunted pantry
numberology YR war frat 151st captain
maximize ml
mayam rings yam wood yam clock
mayam rings vessel yam cheese explosion
sell stuff
parka ml
familiar patriotic eagle
cast astral shell, cast elemental sauce
adventure in Haunted Kitchen, eagle screech undead + bullseye/grovelling gravel
2 runs in Spooky Forest
familiar cookbookbat
locket black crayon beetle (habitat + olfact)
*/
