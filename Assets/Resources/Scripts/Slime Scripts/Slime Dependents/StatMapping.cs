using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class StatMapping
{
    //current stats are tracked to allow for buffs/debuffs
    public int baseStrength;
    public int currentStrength { get; set; }

    public int baseAgility;
    public int currentAgility { get; set; }

    public int baseIntellect;
    public int currentIntellect { get; set; }

    public int baseEndurance;
    public int currentEndurance { get; set; }

    public int baseSpirit;
    public int currentSpirit { get; set; }

    

}
