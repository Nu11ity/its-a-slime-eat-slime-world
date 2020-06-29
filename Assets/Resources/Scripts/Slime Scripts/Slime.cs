﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Slime : MonoBehaviour
{
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

    private void Awake()
    {
        //-> (Fire -> Nature -> water)
        //set stat/ properties
        //Strength -> Physical (Flame Touch, Natures grasp, ocean lance)
        //Agility -> Movement (Fire Step, Faery step, wave rider)
        //Intellect -> Magical (Flame Strike, Insect swarm, crashing waves)
        //Endurance -> 
        //Spirit -> 
        //
    }
    #region properties & variables
    private bool isAlive;
    public bool IsAlive
    {
        get { return isAlive; }
    }

    [SerializeField]
    private int currentHealth;
    public int CurrentHealth
    {
        get { return currentHealth; }
        set
        {
            value = Mathf.Clamp(value, 0, maxHealth);
            currentHealth = value;
        }
    }
    [SerializeField]
    private int maxHealth;
    public int MaxHealth
    {
        get { return maxHealth; }
        set { maxHealth = value; }
    }

    [SerializeField]
    private int currentEnergy;
    public int CurrentEnergy
    {
        get { return currentEnergy; }
        set { currentEnergy = value; }
    }
    [SerializeField]
    private int maxEnergy;
    public int MaxEnergy
    {
        get { return maxEnergy; }
        set { maxEnergy = value; }
    }
    #endregion

    #region functions/methods
    public void DrainEnergy(int _drainAmt)
    {
        CurrentEnergy -= _drainAmt;
        Mathf.Clamp(CurrentEnergy, 0, MaxEnergy);
    }
    public void TakeDamage(int _damage)
    {
        if (!isAlive)
            return;

        if (CurrentHealth > 0)
            Debug.Log("Play injured sfx");

        CurrentHealth -= _damage;
        Mathf.Clamp(CurrentHealth, 0, MaxHealth);

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
