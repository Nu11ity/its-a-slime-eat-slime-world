using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/FireType/Calamity")]
public class Calamity : BaseAbility
{
    public override void AbilityActivated(Transform _castPoint, Slime _slime) { Debug.Log("Calamity"); }
    public override void AbilityActivated(Slime _slime) { Debug.Log("Calamity"); }
    public override void AbilityActivated() { Debug.Log("Calamity"); }    
}
