using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FireGuard")]
public class FireGuard : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime) { Debug.Log("Infernal Guard"); }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Infernal Guard"); }
    public override void AbilityActivated() { Debug.Log("Infernal Guard"); }
}
