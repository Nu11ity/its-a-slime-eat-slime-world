using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Slime : MonoBehaviour
{
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
