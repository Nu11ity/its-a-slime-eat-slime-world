using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/Calamity")]
public class Calamity : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Calamity");
        //free move circle that deals massive direct damage on impact only.
    }
}
