using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/NatureType/Rockslide")]
public class Rockslide : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Rockslide");
        //Lane based, wide, short length. Rocks push forward
    }
}
