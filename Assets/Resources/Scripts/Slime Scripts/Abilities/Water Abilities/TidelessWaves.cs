using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/WaterType/Tideless Waves")]
public class TidelessWaves : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime)
    {
        Debug.Log("Tideless Waves");
        AbilityManager.Instance.pathOfWater.RequestAbilityProjectile(_castPoint, _slime, AbilityManager.Instance.pathOfWater.tidelessWaves);
    }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Tideless Waves"); }
    public override void AbilityActivated() { Debug.Log("Tideless Waves"); }
}
