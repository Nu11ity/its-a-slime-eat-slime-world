using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AbilityManager : MonoBehaviour
{
    #region Initializes AbilityManager on call
    private static AbilityManager instance;
    public static AbilityManager Instance
    {
        get
        {
            if (instance)
                return instance;
            else
                instance = CreateAbilityManager();

            return instance;
        }
    } 
    private static AbilityManager CreateAbilityManager()
    {
        //GameObject newAM = new GameObject("AbilityTimer Manager");
        //AbilityManager newAbilityManager = newAM.AddComponent<AbilityManager>();
        GameObject newAM = GameObject.Instantiate(Resources.Load("Scripts/Slime Scripts/Abilities/Ability Manager") as GameObject);
        AbilityManager newAbilityManager = newAM.GetComponent<AbilityManager>();

        return newAbilityManager;
    }
    #endregion

    #region Path Management
    public PathDelegation pathOfFire;
    public PathDelegation pathOfWater;
    public PathDelegation pathOfNature;

    public void RegisterItemToPool(AbilityProjectile _projectile)
    {
        if (_projectile.path == AbilityProjectile.Path.Fire)
            pathOfFire.RegisterItem(_projectile);
        else if (_projectile.path == AbilityProjectile.Path.Water)
            pathOfWater.RegisterItem(_projectile);
        else if (_projectile.path == AbilityProjectile.Path.Nature)
            pathOfNature.RegisterItem(_projectile);
    } 
    public void RegisterBasicAttack(Transform _castPoint, Slime _caller)
    {
        if (_caller.archetype == Slime.Archetype.Fire)
            pathOfFire.RequestBasicAttack(_castPoint, _caller);
        else if (_caller.archetype == Slime.Archetype.Water)
            pathOfWater.RequestBasicAttack(_castPoint, _caller);
        else if (_caller.archetype == Slime.Archetype.Nature)
            pathOfNature.RequestBasicAttack(_castPoint, _caller);
    }
    public BaseAbility AbilityMapRequest(Slime _slime)
    {
        if (_slime.archetype == Slime.Archetype.Fire)
            return pathOfFire.AbilityMap(_slime);
        else if (_slime.archetype == Slime.Archetype.Water)
            return pathOfWater.AbilityMap(_slime);
        else if (_slime.archetype == Slime.Archetype.Nature)
            return pathOfNature.AbilityMap(_slime);

        Debug.LogError("Ability Map Request Couldn't be met");
        return null;
    }
    #endregion
}
