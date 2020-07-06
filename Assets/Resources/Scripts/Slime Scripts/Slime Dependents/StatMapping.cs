using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class GenerationMapping
{
    public enum Generation { Gen01, Gen02, Gen03, Gen04, Gen05, Gen06 }
    public Generation generation;

    public int gen01LevelCap;
    public int gen02LevelCap;
    public int gen03LevelCap;
    public int gen04LevelCap;
    public int gen05LevelCap;
    public int gen06LevelCap;
}

[System.Serializable]
public class StatMapping
{ 
    public Stat strength;
    public Stat agility;
    public Stat intellect;
    public Stat endurance;
    public Stat spirit;

    [Tooltip("Controls setting our generation and associated level cap")]
    public GenerationMapping genMap;

    private int currentLevel;
    private int currentMaxLevel;
    private int levelFlux;

    public void GenerateStats(int _level, int _levelFlux)//main function call for generation
    {
        currentLevel = _level;
        levelFlux = _levelFlux;
        currentMaxLevel = GenerationDefinedLevelCap();

        strength.InitializeStat(currentLevel, levelFlux, currentMaxLevel, genMap.generation);
        agility.InitializeStat(currentLevel, levelFlux, currentMaxLevel, genMap.generation);
        intellect.InitializeStat(currentLevel, levelFlux, currentMaxLevel, genMap.generation);
        endurance.InitializeStat(currentLevel, levelFlux, currentMaxLevel, genMap.generation);
        spirit.InitializeStat(currentLevel, levelFlux, currentMaxLevel, genMap.generation);

        SetStats();
    }
    public void SetStats(int _level)
    {
        currentLevel = _level;
        SetStats();
    }
    public void SetStats()
    {//formula -> stat = (baseStat + level) + (affiinity * lvl)
        strength.CurrentStatValue = strength.BaseStatValue + (strength.StatAffinity * currentLevel);
        agility.CurrentStatValue = agility.BaseStatValue + (agility.StatAffinity * currentLevel);
        intellect.CurrentStatValue = intellect.BaseStatValue + (intellect.StatAffinity * currentLevel);
        endurance.CurrentStatValue = endurance.BaseStatValue + (endurance.StatAffinity * currentLevel);
        spirit.CurrentStatValue = spirit.BaseStatValue + (spirit.StatAffinity * currentLevel);
    }
    public int GenerationDefinedLevelCap()
    {
        if (genMap.generation == GenerationMapping.Generation.Gen01)
            return genMap.gen01LevelCap;
        else if (genMap.generation == GenerationMapping.Generation.Gen02)
            return genMap.gen02LevelCap;
        else if (genMap.generation == GenerationMapping.Generation.Gen03)
            return genMap.gen03LevelCap;
        else if (genMap.generation == GenerationMapping.Generation.Gen04)
            return genMap.gen04LevelCap;
        else if (genMap.generation == GenerationMapping.Generation.Gen05)
            return genMap.gen05LevelCap;
        else
            return genMap.gen06LevelCap;
    } 
}
