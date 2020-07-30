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

    [Header("Slime Basic Attack Prefabs")]
    public GameObject fireBasicAttack;
    public GameObject waterBasicAttack;
    public GameObject natureBasicAttack;

    public List<AbilityProjectile> fireBasicAttackPool = new List<AbilityProjectile>();
    public List<AbilityProjectile> waterBasicAttackPool = new List<AbilityProjectile>();
    public List<AbilityProjectile> natureBasicAttackPool = new List<AbilityProjectile>();

    public void DelegateBasicAttackPool(AbilityProjectile _projectile)
    {
        if (_projectile.path == AbilityProjectile.Path.Fire)
        {
            if(!fireBasicAttackPool.Contains(_projectile))
                fireBasicAttackPool.Add(_projectile);
        }
        else if(_projectile.path == AbilityProjectile.Path.Water)
        {
            if(!waterBasicAttackPool.Contains(_projectile))
                waterBasicAttackPool.Add(_projectile);
        }
        else if (_projectile.path == AbilityProjectile.Path.Nature)
        {
            if(!natureBasicAttackPool.Contains(_projectile))
                natureBasicAttackPool.Add(_projectile);
        }
    }
    public List<AbilityProjectile> DetermineBasicAttackPool(Slime _requester)
    {
        if (_requester.archetype == Slime.Archetype.Fire)
            return fireBasicAttackPool;
        else if (_requester.archetype == Slime.Archetype.Water)
            return waterBasicAttackPool;
        else
            return natureBasicAttackPool;
    }
    public void BasicAttackPath(Transform _castPoint, Slime _caller)
    {
        GameObject _newPooledObj = null;

        if (_caller.archetype == Slime.Archetype.Fire)
            _newPooledObj = Instantiate(fireBasicAttack, _castPoint.position, _castPoint.rotation);
        else if(_caller.archetype == Slime.Archetype.Water)
            _newPooledObj = Instantiate(waterBasicAttack, _castPoint.position, _castPoint.rotation);
        else
            _newPooledObj = Instantiate(natureBasicAttack, _castPoint.position, _castPoint.rotation);

        _newPooledObj.SetActive(true);
        _newPooledObj.GetComponent<AbilityProjectile>().Initialize(_caller);
    }
    public void RequestBasicAttack(Transform _castPoint, Slime _caller)//temp, change to modular version after testing
    {
        bool requestComplete = false;

        if(DetermineBasicAttackPool(_caller).Count > 0)
        {
            for (int i = 0; i < DetermineBasicAttackPool(_caller).Count; i++)
            {
                if(!DetermineBasicAttackPool(_caller)[i].gameObject.activeSelf)
                {
                    requestComplete = true;
                    DetermineBasicAttackPool(_caller)[i].transform.parent = _castPoint;
                    DetermineBasicAttackPool(_caller)[i].transform.position = _castPoint.position;
                    DetermineBasicAttackPool(_caller)[i].transform.rotation = _castPoint.rotation;
                    DetermineBasicAttackPool(_caller)[i].transform.parent = null;
                    DetermineBasicAttackPool(_caller)[i].gameObject.SetActive(true);
                    return;
                }
            }
            if (!requestComplete)
            {
                BasicAttackPath(_castPoint, _caller);
            }
        }
        else
        {
            BasicAttackPath(_castPoint, _caller);
        }
    }
    #endregion

    #region BaseAbility Mapping
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
