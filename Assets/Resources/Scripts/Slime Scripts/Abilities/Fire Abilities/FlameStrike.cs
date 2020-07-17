using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FlameStrike")]
public class FlameStrike : BaseAbility
{
    public override void AbilityActivated()
    {        
        Debug.LogError("Used FlameStrike");
        //cone based fire blast
    }
}
