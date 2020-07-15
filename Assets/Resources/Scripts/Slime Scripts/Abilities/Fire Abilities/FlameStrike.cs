using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FlameStrike")]
public class FlameStrike : BaseAbility
{
    public float globalCD;
    private float cooldownTimer;

    public override void AbilityActivated()
    {
        if (OnCooldown)
            return;

        OnCooldown = true;
        Debug.LogError("Used FlameStrike");
        //cone based fire blast
    }
    public override void AbilityUpdateMethod()
    {
        if(OnCooldown)
        {
            cooldownTimer += Time.deltaTime;

            if(cooldownTimer >= globalCD)
            {
                OnCooldown = false;
                cooldownTimer = 0;
            }
        }
    }
}
