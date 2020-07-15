using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/Calamity")]
public class Calamity : BaseAbility
{
    public float globalCD;
    private float cooldownTimer;

    public override void AbilityActivated()
    {
        if (OnCooldown)
            return;

        OnCooldown = true;
        Debug.LogError("Used Calamity");
        //AOE based meteor storm
    }
    public override void AbilityUpdateMethod()
    {
        if (OnCooldown)
        {
            cooldownTimer += Time.deltaTime;

            if (cooldownTimer >= globalCD)
            {
                OnCooldown = false;
                cooldownTimer = 0;
            }
        }
    }
}
