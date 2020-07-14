﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class BaseAbility : ScriptableObject
{
    [Header("ability data")]
    public string abilityName;
    public Sprite abilityIcon;
    public int abilityCost;
    public enum AffinityBonus { None, Strength, Agility, Intellect, Endurance, Spirit }
    public AffinityBonus affinityBonus;
    public enum Forecast { Instant, BoundCircle, FreeCircle, Lane, Cone }
    public Forecast forecast;
    public Vector3 forecastScaler;
    public bool OnCooldown { get; set; }


    public abstract void AbilityActivated();
    public abstract void AbilityUpdateMethod();
}
