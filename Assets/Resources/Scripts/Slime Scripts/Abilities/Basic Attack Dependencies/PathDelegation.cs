using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PathDelegation : MonoBehaviour
{
    public GameObject basicAttack;

    private List<AbilityProjectile> basicAttackPool = new List<AbilityProjectile>();
    public List<BaseAbility> abilitiesPool;

    public virtual void DependentBehavior() { }//for unique behavior in descendants

    #region ability methods
    public BaseAbility AbilityMap(Slime _slime)
    {
        int abilityIndex = 0;
        bool set = false;

        while (!set)
        {
            abilityIndex = Random.Range(0, abilitiesPool.Count);

            if (!_slime.abilities.Contains(abilitiesPool[abilityIndex]))
                set = true;
        }

        Debug.Log("Should've attached -> " + abilitiesPool[abilityIndex]);
        return abilitiesPool[abilityIndex];
    }
    #endregion

    #region basicAttack methods
    public void RegisterItem(AbilityProjectile _projectile)
    {
        if (!basicAttackPool.Contains(_projectile))
            basicAttackPool.Add(_projectile);
    }
    public void BasicAttackPath(Transform _castPoint, Slime _caller)
    {
        GameObject _newPooledObj = Instantiate(basicAttack, _castPoint.position, _castPoint.rotation);
        _newPooledObj.SetActive(true);
        _newPooledObj.GetComponent<AbilityProjectile>().Initialize(_caller);
    }
    public void RequestBasicAttack(Transform _castPoint, Slime _caller)//temp, change to modular version after testing
    {
        bool requestComplete = false;

        if (basicAttackPool.Count > 0)
        {
            for (int i = 0; i < basicAttackPool.Count; i++)
            {
                if (!basicAttackPool[i].gameObject.activeSelf 
                    && !basicAttackPool[i].impactObject.gameObject.activeSelf)
                {
                    requestComplete = true;
                    basicAttackPool[i].transform.parent = _castPoint;
                    basicAttackPool[i].transform.position = _castPoint.position;
                    basicAttackPool[i].transform.rotation = _castPoint.rotation;
                    basicAttackPool[i].transform.parent = null;
                    basicAttackPool[i].gameObject.SetActive(true);
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
}
