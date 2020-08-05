using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/FlameStrike")]
public class FlameStrike : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime)
    {
        Debug.Log("Flame Strike");
        AbilityManager.Instance.pathOfFire.RequestAbilityDOT(_castPoint, _slime, AbilityManager.Instance.pathOfFire.infernalBreathe);
    }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Flame Strike"); }
    public override void AbilityActivated() { Debug.Log("Flame Strike"); }
}
