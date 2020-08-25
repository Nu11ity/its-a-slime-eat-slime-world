using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BaseSlime : MonoBehaviour
{
    [Header("!o--BaseSlime Data--o!")]
    public Archetype archetype;
    public enum Archetype { Undefined, Fire, Water, Nature }    

    public BaseAbility basicAttack;
    public List<BaseAbility> abilities = new List<BaseAbility>();

    [Header("Level Mapping")]
    public LevelMapping levelMapping;
    protected int trackedLevel;

    [Header("Stat Mapping")]
    public StatMapping statMapping;

    [Header("Health Mapping")]
    public int hpMultiplier;

    public int MaxHealth
    {//read only
        get
        {
            return statMapping.endurance.CurrentStatValue * hpMultiplier;
        }
    }

    [SerializeField]
    protected float currentHealth;
    public virtual float CurrentHealth
    {
        get { return currentHealth; }
        set
        {
            currentHealth = value;
            currentHealth = Mathf.Clamp(currentHealth, 0, MaxHealth);
        }
    }

    public int maxEnergy;
    [SerializeField]
    protected float currentEnergy;
    public virtual float CurrentEnergy
    {
        get { return currentEnergy; }
        set
        {
            currentEnergy = value;
            currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
        }
    }

    public virtual void OnSpawnToWorld()
    {
        levelMapping.LevelToExperience();
        statMapping.GenerateStats(levelMapping.level, levelMapping.levelFlux);
        trackedLevel = levelMapping.level;
        CurrentHealth = MaxHealth;

        for (int i = 0; i < 3; i++)
            abilities.Add(AbilityManager.Instance.AbilityMapRequest(this));
    }
}
