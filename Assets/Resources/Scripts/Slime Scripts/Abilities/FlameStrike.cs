using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FlameStrike")]
public class FlameStrike : BaseAbility
{
    public float globalCD;
    private bool onCooldown;
    private float cooldownTimer;

    public override void AbilityActivated()
    {
        
    }
    public override void AbilityUpdateMethod()
    {
        if(onCooldown)
        {
            cooldownTimer += Time.deltaTime;

            if(cooldownTimer >= globalCD)
            {
                onCooldown = false;
                cooldownTimer = 0;
            }
        }
    }
}
