using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/WaterType/Tideless Waves")]
public class TidelessWaves : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Tideless Waves");
        //wave pushes forward in lane, short width, long range
    }
}
