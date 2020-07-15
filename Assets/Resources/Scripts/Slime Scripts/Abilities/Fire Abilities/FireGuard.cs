using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FireGuard")]
public class FireGuard : BaseAbility
{
    public float globalCD;
    private float cooldownTimer;

    public override void AbilityActivated()
    {
        if (OnCooldown)
            return;

        OnCooldown = true;
        Debug.LogError("Used Fire Guard");
        //Shield of fire around player, lasts x seconds.
        //Additionally causes damage against attackers in range
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
