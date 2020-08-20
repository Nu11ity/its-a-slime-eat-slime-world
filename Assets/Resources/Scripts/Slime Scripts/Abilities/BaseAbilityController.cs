using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseAbilityController : MonoBehaviour
{
    public Transform laneSpawn;
    public Transform coneSpawn;
    public Transform boundCircleSpawn;
    public Transform freeCircleSpawn;

    public Slime SlimeData { get; set; }
    public bool RestrictCasting { get; set; }

    protected SlimeCombatCanvas canvas;
    protected SlimeAnimator animator;

    public virtual void CancelToggledAbility() {}
}
