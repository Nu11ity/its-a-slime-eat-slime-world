using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class BaseAbility : ScriptableObject
{
    [Header("ability data")]
    public string abilityName;
    public Sprite abilityIcon;
    public int abilityCost;

    public abstract void AbilityActivated();
    public abstract void AbilityUpdateMethod();
}
