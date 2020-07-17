using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/General/BasicAttack")]
public class BasicAttack : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Basic Attack");
    }
}
