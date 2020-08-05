using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/NatureType/Wall Of Stone")]
public class WallOfStone : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime) { Debug.Log("Wall Of Stone"); }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Wall Of Stone"); }
    public override void AbilityActivated() { Debug.Log("Wall Of Stone"); }
}
