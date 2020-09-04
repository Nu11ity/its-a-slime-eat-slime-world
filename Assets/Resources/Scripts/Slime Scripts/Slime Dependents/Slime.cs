﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Slime : BaseSlime
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
    [Header("!o--Slime Data--o!")]
    [SerializeField]
    private bool isAlive;
    public bool IsAlive { get { return isAlive; } }

    private CaptureBehavior myCaptureBehavior;
    public CaptureBehavior MyCaptureBehavior
    {
        get
        {
            if (myCaptureBehavior == null)
                myCaptureBehavior = GetComponent<CaptureBehavior>();

            return myCaptureBehavior;
        }
    }

    private StatusController myStatusControls;
    public StatusController MyStatusControls
    {//Read only
        get
        {
            if (myStatusControls == null)
                myStatusControls = GetComponent<StatusController>();

            return myStatusControls;
        }
    }

    public enum SlimeControlType { Player, AI }
    public SlimeControlType slimeControlType;

    [Header("Slime Type")]   
    public List<Sprite> slimePortrait = new List<Sprite>();
    public Sprite MyPortrait { get; set; }

    public AbilityTimer BasicAttackTimer { get; set; }
    public List<AbilityTimer> AbilityTimers { get; set; }


    public Color FullColor, EmptyColor;
    public Image healthRadialObj;
    private CombatCanvas myCombatCanvas;
    public CombatCanvas MyCombatCanvas
    {
        get
        {
            if(myCombatCanvas == null)
            {
                if(slimeControlType == SlimeControlType.Player)
                    return myCombatCanvas = AbilityManager.Instance.playerCombatCanvas;
                else if(slimeControlType == SlimeControlType.AI)
                    return myCombatCanvas = AbilityManager.Instance.enemyCombatCanvas;
            }
            return myCombatCanvas;
        }
    }

    public override float CurrentHealth
    {//Might need to be float for smoother Fill Meter
        get { return currentHealth; }
        set
        {
            currentHealth = value;
            currentHealth = Mathf.Clamp(currentHealth, 0, MaxHealth);
            UpdateHealthRadial(currentHealth, MaxHealth);
            MyCombatCanvas.SetHealthFillMeter(currentHealth, MaxHealth);
        }
    }

    [Header("Energy Mapping")]
    public float energyRegenSpeed;

    public override float CurrentEnergy
    {
        get { return currentEnergy; }
        set
        {
            currentEnergy = value;
            currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
            MyCombatCanvas.SetEnergyFillMeter(currentEnergy, maxEnergy);
        }
    }
    #endregion

    #region Initalize Slime methods
    void OnUpdateCombatUI()
    { 
        if (slimeControlType == SlimeControlType.AI)
        {
            for (int i = 0; i < abilities.Count; i++)
                MyCombatCanvas.SetAbilityIcon(i, abilities[i].abilityIcon);

            MyCombatCanvas.SetSlime(this);//portrait set
        }
    }
    private void InitializeAbilities()
    {       
        AbilityTimers = new List<AbilityTimer>();
        for (int i = 0; i < abilities.Count; i++)
        {
            AbilityTimers.Add(new AbilityTimer());

            if(slimeControlType == SlimeControlType.Player)
                MyCombatCanvas.SetAbilityIcon(i, abilities[i].abilityIcon);
        }

        if (archetype == Archetype.Fire)
            MyPortrait = slimePortrait[0];
        else if (archetype == Archetype.Water)
            MyPortrait = slimePortrait[1];
        else if (archetype == Archetype.Nature)
            MyPortrait = slimePortrait[2];

        BasicAttackTimer = new AbilityTimer();
        BasicAttackTimer.GlobalCD = basicAttack.globalCD;

        for (int i = 0; i < AbilityTimers.Count; i++)
            AbilityTimers[i].GlobalCD = abilities[i].globalCD;

        if(slimeControlType == SlimeControlType.Player)
            MyCombatCanvas.SetSlime(this);//portrait set
    }
    public void OnCombatEnd()
    {
        UpdateSlimeCheck();
        //restore health?
        //restore energy?
        //etc....
    }
    public override void OnSpawnToWorld()
    {
        isAlive = true;
        base.OnSpawnToWorld();
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
    public void UpdateHealthRadial(float _value, float _max)
    {
        if(healthRadialObj != null && healthRadialObj.gameObject.activeSelf)
        {
            float t = _value / _max;
            healthRadialObj.fillAmount = t;
            healthRadialObj.color = Color.Lerp(EmptyColor, FullColor, t);
        }
    }

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
        {
            Debug.Log("Inured + " + this.name);
            CurrentHealth -= _damage;

            if (slimeControlType == SlimeControlType.AI)
                OnUpdateCombatUI();
        }

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

        MyCombatCanvas.RemoveSlimeUI(this);
        for (int i = 0; i < abilities.Count; i++)
        {
            MyCombatCanvas.SetAbilityIcon(i, MyCombatCanvas.abilityUIMask);
            MyCombatCanvas.SetAbilityMask(i, false);
        }
        MyCombatCanvas.SetHealthFillMeter(1, 1);
        MyCombatCanvas.SetEnergyFillMeter(1, 1);

        MyCaptureBehavior.RemoveFromCombat();

        //Played Knocked out vfx/sfx
        //Change Anim to wobble
        //Let whichever class know it's in a capture ready state
    }
    #endregion
}
