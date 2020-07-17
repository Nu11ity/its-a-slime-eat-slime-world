using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FireGuard")]
public class FireGuard : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Fire Guard");
        //instant cast self buff/ protections
    }
}
