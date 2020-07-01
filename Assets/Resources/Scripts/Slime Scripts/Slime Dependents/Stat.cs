using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Stat
{
    public int BaseStatValue { get; set; }
    public int StatAffinity { get; set; }
    public int currentStatValue;

    private float affinityRNG = .25f;
    private int level;
    private int levelFlux;
    private int maxLevel;
    private GenerationMapping.Generation gen;

    public void InitializeStat(int _level, int _levelFlux, int _maxLevel, GenerationMapping.Generation _gen)
    {
        level = _level;
        levelFlux = _levelFlux;
        maxLevel = _maxLevel;
        gen = _gen;

        GenerateBaseStat();
    }

    public void GenerateBaseStat()
    {
        BaseStatValue = Random.Range(level - levelFlux, (level + levelFlux) + 1);
        Mathf.Clamp(BaseStatValue, 1, maxLevel);

        AffinityCheck();

        if (gen != GenerationMapping.Generation.Gen01)
            ProcessGenData();
    }
    public void AffinityCheck()
    {
        int loopIterations = 0;

        if (gen == GenerationMapping.Generation.Gen01)
            loopIterations = 1;
        else if (gen == GenerationMapping.Generation.Gen02)
            loopIterations = 2;
        else if (gen == GenerationMapping.Generation.Gen03)
            loopIterations = 3;
        else if (gen == GenerationMapping.Generation.Gen04)
            loopIterations = 4;
        else if (gen == GenerationMapping.Generation.Gen05)
            loopIterations = 5;
        else if (gen == GenerationMapping.Generation.Gen06)
            loopIterations = 6;

        for (int i = 0; i < loopIterations; i++)
        {
            if (Random.value <= affinityRNG)
                StatAffinity++;
        }
    }
    public void ProcessGenData()
    {
        int inheritedBaseStat = (BaseStatValue / 2);
        BaseStatValue += inheritedBaseStat;

        int affinityModifier = level * StatAffinity;
        BaseStatValue += affinityModifier;
    }
}
