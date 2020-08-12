using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Slime : MonoBehaviour
{
    #region Notes
    //further define variables and properies
    //further add to methods for procedural stat and affinity on slimes

    /* Defining base stats on generation
     --------------------------------------
      baseStat = 
        if(gen 1)
            {generated stat based off level}
        else if(!gen 1)
            {(inherited stat / 2)}

        stat = baseStat + (affinity * lvl)
     --------------------------------------
    gen 1 level 1
    Strength -> Random.Range(1, lvl +/- value)
    Agility -> Random.Range(1, lvl +/- value)
    Intellect -> Random.Range(1, lvl +/- value)
    Endurance -> Random.Range(1, lvl +/- value)
    Spirit -> Random.Range(1, lvl +/- value)

    gen 1 level 3 
    Strength -> Random.Range(1, lvl +/- value)
    Agility -> Random.Range(1, lvl +/- value)
    Intellect -> Random.Range(1, lvl +/- value)
    Endurance -> Random.Range(1, lvl +/- value)
    Spirit -> Random.Range(1, lvl +/- value)

    gen 1 level 9
    Strength -> Random.Range(1, lvl +/- value)
    Agility -> Random.Range(1, lvl +/- value)
    Intellect -> Random.Range(1, lvl +/- value)
    Endurance -> Random.Range(1, lvl +/- value)
    Spirit -> Random.Range(1, lvl +/- value)
    */

    //Formula -> Affinity aka IV ------ stat = generated stat + (affinity * lvl) + (inherited stat / 2) 
    //Gen 1 level 5 slime ->
    /* 
     Strength(A^1) -> 5 + (1 * 5) + 0;
     Agility -> 5
     Intellect -> 5
     Endurance -> 5
     Spirit -> 5
    */
    //Gen 2 level 10 slime
    /* slime A + slime B | Highest stats for each stat is what is kept, then divided by 2.
     Strength(A^1) -> 10 + (1 * 10) + (37/2);
     Agility(A^2) -> 10 + (2 * 10) + (40/2);
     Intellect -> 10 + (30/2);
     Endurance(A^1) -> 10 + (1 * 10) + (37/2);
     Spirit -> (A^2) -> 10 + (2 * 10) + (40/2);
    */
    #endregion

    #region properties & variables
    [Header("Slime Type")]
    [SerializeField]
    private bool isAlive;
    public bool IsAlive { get { return isAlive; } }//read only
    public enum Archetype { Undefined, Fire, Water, Nature }
    public Archetype archetype;

    //UI for ability icons, their slot point, and reference for fill bars

    public BaseAbility basicAttack;
    public AbilityTimer BasicAttackTimer { get; set; }

    public List<BaseAbility> abilities = new List<BaseAbility>();
    public List<AbilityTimer> AbilityTimers { get; set; }

    public SlimeCombatCanvas myCombatCanvas;//Null

    [Header("Level Mapping")]
    public LevelMapping levelMapping;
    private int trackedLevel;

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
    private float currentHealth;
    public float CurrentHealth
    {//Might need to be float for smoother Fill Meter
        get { return currentHealth; }
        set
        {
            currentHealth = value;
            currentHealth = Mathf.Clamp(currentHealth, 0, MaxHealth);
            myCombatCanvas.SetHealthFillMeter(currentHealth, MaxHealth);
        }
    }

    [Header("Energy Mapping")]
    public float energyRegenSpeed;
    public int maxEnergy;

    [SerializeField]
    private float currentEnergy;
    public float CurrentEnergy
    {
        get { return currentEnergy; }
        set
        {
            currentEnergy = value;
            currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
            myCombatCanvas.SetEnergyFillMeter(currentEnergy, maxEnergy);
        }
    }
    #endregion

    #region Initalize Slime methods
    private void InitializeAbilities()
    {
        AbilityTimers = new List<AbilityTimer>();
        for (int i = 0; i < abilities.Count; i++)
        {
            AbilityTimers.Add(new AbilityTimer());
            myCombatCanvas.SetAbilityIcon(i, abilities[i].abilityIcon);
        }

        BasicAttackTimer = new AbilityTimer();
        BasicAttackTimer.GlobalCD = basicAttack.globalCD;

        for (int i = 0; i < AbilityTimers.Count; i++)
            AbilityTimers[i].GlobalCD = abilities[i].globalCD;
    }
    public void OnCombatEnd()
    {
        UpdateSlimeCheck();
        //restore health?
        //restore energy?
        //etc....
    }
    public void OnSpawnedToWorld()
    {
        isAlive = true;
        levelMapping.LevelToExperience();
        statMapping.GenerateStats(levelMapping.level, levelMapping.levelFlux);
        trackedLevel = levelMapping.level;
        CurrentHealth = MaxHealth;

        //Ability Mapping
        for (int i = 0; i < 3; i++)
            abilities.Add(AbilityManager.Instance.AbilityMapRequest(this));
        InitializeAbilities();
    }
    public void UpdateSlimeCheck()
    {
        if(trackedLevel != levelMapping.level)
        {
            trackedLevel = levelMapping.level;
            statMapping.strength.BaseStatValue++;
            statMapping.agility.BaseStatValue++;
            statMapping.intellect.BaseStatValue++;
            statMapping.endurance.BaseStatValue++;
            statMapping.spirit.BaseStatValue++;
            statMapping.SetStats(levelMapping.level);
        }
    }
    #endregion

    #region Health & Energy methods
    //add method for the regen of energy passively
    public void PassiveEnergyRegen()
    {
        if(CurrentEnergy < maxEnergy)
            CurrentEnergy += Time.deltaTime * energyRegenSpeed;
    }
    public void DrainEnergy(int _drainAmt)
    {
        CurrentEnergy -= _drainAmt;
        Mathf.Clamp(CurrentEnergy, 0, maxEnergy);
    }
    public void TakeDamage(int _damage)
    {
        if (!isAlive)
            return;

        if (CurrentHealth > 0)
            Debug.Log("Play injured sfx");

        CurrentHealth -= _damage;

        if(CurrentHealth <= 0)
            Die();
    }
    public void HealDamage(int _heal)
    {
        CurrentHealth += _heal;
        Mathf.Clamp(CurrentHealth, 0, MaxHealth);
    }
    public void Die()
    {
        isAlive = false;
        //play wounded anim
        //Play death audio
        //play death vfx
        //reset slime
    }
    #endregion
}
