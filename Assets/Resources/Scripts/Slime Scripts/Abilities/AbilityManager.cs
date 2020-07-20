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

    #region Pool Management and delegation
    //[Header("Ability Prefabs, /w Pools")]
    //each ability needs a prefab for spawn reference.
    //each ability also needs a pool, so not wasting resources.
    //rinse and repeat for all skills

    [Header("Slime BaseAbility Pools")]
    public List<BaseAbility> fireAbilities;
    public List<BaseAbility> natureAbilities;
    public List<BaseAbility> waterAbilities;
    public List<BaseAbility> natureFireAbilities;
    public List<BaseAbility> waterNatureAbilities;
    public List<BaseAbility> fireWaterAbilities;


    List<BaseAbility> AbilityPool(Slime.Archetype _type)
    {
        if(_type == Slime.Archetype.Fire)
            return fireAbilities;
        else if(_type == Slime.Archetype.Nature)
            return natureAbilities;        
        else if (_type == Slime.Archetype.Water)
            return waterAbilities;

        else if (_type == Slime.Archetype.NatureFire)
            return natureFireAbilities;
        else if (_type == Slime.Archetype.WaterNature)
            return waterNatureAbilities;
        else if (_type == Slime.Archetype.FireWater)
            return fireWaterAbilities;

        return null;
    }
    public BaseAbility AbilityMap(Slime _slime)
    {
        List<BaseAbility> abilities = new List<BaseAbility>();
        abilities = AbilityPool(_slime.archetype);

        int abilityIndex = 0;
        bool set = false;

        while (!set)
        {
            abilityIndex = Random.Range(0, abilities.Count);
            if (!_slime.abilities.Contains(abilities[abilityIndex]))
            {
                set = true;
            }
        }
        Debug.Log("Should've attached -> " + abilities[abilityIndex]);
        return abilities[abilityIndex];
    }
    #endregion
}
