using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/NatureType/Wall Of Stone")]
public class WallOfStone : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.LogError("Used Wall Of Stone");
        //summons a rock wall in shape of circle. On slime position cast, none moveable.
    }
}
