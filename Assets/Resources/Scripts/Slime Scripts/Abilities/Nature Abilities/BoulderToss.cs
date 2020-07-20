using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/NatureType/Boulder Toss")]
public class BoulderToss : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Boulder Toss");
        //toss boulder at free move circle position
    }
}
