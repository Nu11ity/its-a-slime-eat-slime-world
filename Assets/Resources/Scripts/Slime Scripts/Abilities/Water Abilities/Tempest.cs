using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/WaterType/Tempest")]
public class Tempest : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Tempest");
        //instant cast self buff
    }
}
