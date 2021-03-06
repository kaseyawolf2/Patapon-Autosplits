// Emulated Patapon on ppsspp autosplit
state("Patapon")
{
//bool prerenderedVideo : ppsspp_libretro.dll+A4E170;
int LevelID : "ppsspp_libretro.dll","A0EAC0";
}

startup
{
    
}

start 
{
 
}

split 
{
    switch(LevelID)
    {
        case 116:
        return true;
    }
}

reset
{
    //return 
}