// PPSSPP Patapon autosplit
// This is janky so ya
state("PPSSPPWindows64")
{
    int LevelID : 0x00C113D8, 0x48, 0x8, 0x30; // Each map has a static id, but it also changes as it loads so werid
    int WeirdID : 0xC29B30 // this relates to events in game but is not static for each level (constantly counting up)
}
init
{
    vars.StartSplit = 0;
    vars.flip = 0;
    vars.PataPlainLock = 0;
    vars.AncestGuardLock = 0;
    vars.SecretJuJuLock = 0; 
    vars.SandLock = 0;
    vars.ZigoMultilock = 0;
    vars.GiantLock = 0;
    vars.OozeLock = 0;
    vars.MountainLordLock = 0;
    vars.VolcanoLock = 0;
    vars.KharmaPetLock = 0;
    vars.DarkLock=0;
    vars.EndSplit = 0;
}


start // starts after signing but not instantly needs retimed +~1 second
{
    if(current.LevelID != old.LevelID)
    {
        if(current.LevelID == 60989)
        {
            vars.StartSplit++;   
        }
        if(current.LevelID != 60989 && vars.StartSplit == 3 )
        {
            vars.StartSplit = 0;
            return true;
        }
    }
}

update
{
  // print("flip" + vars.flip);
}

split
{
    if(current.LevelID != old.LevelID)
    {
        if(current.LevelID == 159993)
        {
            vars.EndSplit = 1;   
        }
        if(current.LevelID != 159993 && vars.EndSplit == 1)
        {
            vars.EndSplit = 0;
            return true;
        }
    }
    if(current.LevelID == old.LevelID){
        if(current.LevelID == 53873){vars.flip = 0;} // if in polis make sure flip is floped
        if(current.WeirdID == (2+old.WeirdID)){ // the WeirdID goes up 2 at the end of each level so i only want to listen then
            if(vars.flip == 1) // the WeirdID goes up two at the start of the maps so this sheniagans
            {
                vars.flip = 0;
                int test = current.LevelID; // cause switch dont like it
                switch(test)
                {
                    case 107028 : return true;                  //Patapons Come Home
                    case 108759 : if(vars.PataPlainLock==0)     //Patapata Plains
                    {
                        vars.PataPlainLock = 1;                 
                        return true;
                    }
                        break;
                    case 110570 : return true;                  //Escape form Exile
                    case 112139 : return true;                  //Zigotons Strike Back
                    case 114085 : return true;                  //The battle for Zigoton Fort at Dodon Basin
                    case 115836 : return true;                  //Gong the Hawkeye
                    case 117923 : if(vars.AncestGuardLock==0)   //Ancestral Guardian
                    {
                        vars.AncestGuardLock = 1;
                        return true;
                    }
                        break;
                    case 119987 : if(vars.SecretJuJuLock==0)    //Secret Juju at Lostdon
                    {
                        vars.SecretJuJuLock = 1;
                        return true;
                    }
                        break;
                    case 69504 : return true;                   //Desert Crossing
                    case 132138 : if(vars.SandLock==0)          //Creatures of the Sand
                    {
                        vars.SandLock = 1;
                        return true;
                    }
                        break;
                    case 65762 : if(vars.ZigoMultilock==0||vars.ZigoMultilock==1)      //Zigotons Attack
                    {
                        vars.ZigoMultilock++;
                        return true;
                    }
                        break;
                    case 144174 : if(vars.GiantLock==0)         //Giant Beast of the Deplorable Desert
                    {
                        vars.GiantLock = 1;
                        return true;
                    }
                        break;
                    case 71192 : return true;                   //Battle for Heave Ho Oasis
                    case 72901 : return true;                   //Gong Returns
                    case 133562 : return true;                  //Sandy Paradise
                    case 146099 : return true;                  //Guardian of Knell
                    case 67857 : return true;                   //Convoy Escort
                    case 75185 : return true;                   //Despair
                    case 76809 : return true;                   //Ray of Hope
                    case 135009 : if(vars.OozeLock==0)          //A World of Ooze
                    {
                        vars.OozeLock = 1;
                        return true;
                    }  
                        break;               
                    case 79148 : return true;                   //Door of Promise
                    case 81195 : return true;                   //Battle! Mt.Bachikoi Fort
                    case 147516 : if(vars.MountainLordLock==0)  //Lord of the Mountains	
                    {
                        vars.MountainLordLock = 1;
                        return true;
                    } 
                        break;
                    case 91375 : return true;                   //Legendary Night Sky
                    case 101521 : return true;                  //Meden Kidnapped
                    case 93160 : return true;                   //Gong Vows to Fight
                    case 150393 : if(vars.VolcanoLock==0)       //Volcano Guardian
                    {
                        vars.VolcanoLock = 1;
                        return true;
                    } 
                        break;
                    case 94672 : return true;                   //Crossing Zigoton Territory
                    case 96284 : return true;                   //Facing Gate Ghoul Baban
                    case 97734 : return true;                       //Zigoton Queen
                    case 154954 : if(vars.KharmaPetLock==0)     //Kharma’s Pet	
                    {
                        vars.KharmaPetLock = 1;
                        return true;
                    }
                        break;
                    case 99312 : return true;                   //Final Showdown
                    case 156875 : if(vars.DarkLock==0)          //Servant of Darkness
                    {
                        vars.DarkLock = 1;
                        vars.flip = 0;
                        return true;
                    }
                        break;
                }
            }
            int test2 = current.LevelID; // cause switch dont like it
            switch(test2) // ignore the first WeirdID trigger and i only want to do it on maps so i have to do this i think 
            {
                case 107028 :   vars.flip = 1; break;     // Patapons Come Home 
                case 108759 :   vars.flip = 1; break;     // Hunting on Patapata Plain 
                case 110570 :   vars.flip = 1; break;     // Escape from Exile
                case 112139 :   vars.flip = 1; break;     // Zigotons Strike Back
                case 114085 :   vars.flip = 1; break;     // The battle for Zigoton Fort at Dodon Basin
                case 115836 :   vars.flip = 1; break;     // Gong the Hawkeye
                case 117923 :   vars.flip = 1; break;     // Ancestral Guardian
                case 119987 :   vars.flip = 1; break;     // Secret Juju at Lostdon
                case 69504 :    vars.flip = 1; break;     // Desert Crossing
                case 132138 :   vars.flip = 1; break;     // Creatures of the Sand  
                case 65762 :    vars.flip = 1; break;     // Zigotons Attack                                       
                case 144174 :   vars.flip = 1; break;     // Giant Beast of the Deplorable Desert	                                
                case 71192 :    vars.flip = 1; break;     // Battle for Heave Ho Oasis
                case 72901 :    vars.flip = 1; break;     // Gong Returns                                          
                case 133562 :   vars.flip = 1; break;     // Sandy Paradise                                
                case 146099 :   vars.flip = 1; break;     // Guardian of Knell                                     
                case 67857 :    vars.flip = 1; break;     // Convoy Escort    
                case 75185 :    vars.flip = 1; break;     // Despair                                               
                case 76809 :    vars.flip = 1; break;     // Ray of Hope                                       
                case 135009 :   vars.flip = 1; break;     // A World of Ooze                          
                case 79148 :    vars.flip = 1; break;     // Door of Promise
                case 81195 :    vars.flip = 1; break;     // Battle! Mt.Bachikoi Fort
                case 147516 :   vars.flip = 1; break;     // Lord of the Mountains
                case 91375 :    vars.flip = 1; break;     // Legendary Night Sky
                case 101521 :   vars.flip = 1; break;     // Meden Kidnapped
                case 93160 :    vars.flip = 1; break;     // Gong Vows to Fight
                case 150393 :   vars.flip = 1; break;     // Volcano Guardian
                case 94672 :    vars.flip = 1; break;     // Crossing Zigoton Territory
                case 96284 :    vars.flip = 1; break;     // Facing Gate Ghoul Baban
                case 97734 :    vars.flip = 1; break;     // Zigoton Queen
                case 154954 :   vars.flip = 1; break;     // Kharma’s Pet	
                case 99312 :    vars.flip = 1; break;     // Final Showdown
                case 156875 :   vars.flip = 1; break;     // Servant of Darkness
                case 159993 :   vars.flip = 1; break;     // Earthend
            }
        }  
    }
}

reset
{
    if(current.LevelID == 24269) // resets on Main menu
    {
        vars.StartSplit = 0;
        vars.flip = 0;
        vars.PataPlainLock = 0;
        vars.AncestGuardLock = 0;
        vars.SecretJuJuLock = 0; 
        vars.SandLock = 0;
        vars.ZigoMultilock = 0;
        vars.GiantLock = 0;
        vars.OozeLock = 0;
        vars.MountainLordLock = 0;
        vars.VolcanoLock = 0;
        vars.KharmaPetLock = 0;
        vars.DarkLock=0;
        vars.EndSplit = 0;
        return true;
    }
}