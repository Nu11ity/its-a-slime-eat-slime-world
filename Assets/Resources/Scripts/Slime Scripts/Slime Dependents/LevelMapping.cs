using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[System.Serializable]
public class LevelMapping
{    
    public int level;

    public int CurrentExperience { get; set; }

    private int trackedEXP;
    private int startingEXP;
    private int remainingEXP;
    private int multiplier = 25;
    private int xpDifference;


    public void MapLevel(int _min, int _max)//set thru spawner
    {
        level = Random.Range(_min, _max++);
    }
    public void GainXP(int _experience)
    {
        trackedEXP += _experience;
        LevelToExperience();

        if (xpDifference <= 0)
            LevelUp();
    }
    private void LevelUp()
    {
        trackedEXP = 0;
        level++;
        LevelToExperience();
    }
    public void LevelToExperience()
    {
        startingEXP = multiplier * level * level - 25 * level;
        CurrentExperience = startingEXP + trackedEXP;
        remainingEXP = 25 * (level + 1) * (level + 1) - 25 * (level + 1);
        xpDifference = (remainingEXP - CurrentExperience);
        Mathf.Clamp(xpDifference, 0, Mathf.Infinity);
    }
    public void SetExperienceVisuals(Slider _xpBar)
    {
        _xpBar.minValue = startingEXP;
        _xpBar.maxValue = remainingEXP;
        _xpBar.value = CurrentExperience;
    }
}
