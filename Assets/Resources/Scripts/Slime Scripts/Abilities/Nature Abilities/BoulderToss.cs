using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/NatureType/Boulder Toss")]
public class BoulderToss : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime) { Debug.Log("Boulder Toss"); }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Boulder Toss"); }
    public override void AbilityActivated() { Debug.Log("Boulder Toss"); }
}
