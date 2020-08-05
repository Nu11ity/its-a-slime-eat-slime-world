using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/NatureType/Rockslide")]
public class Rockslide : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime) { Debug.Log("Rockslide"); }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Rockslide"); }
    public override void AbilityActivated() { Debug.Log("Rockslide"); }
}
