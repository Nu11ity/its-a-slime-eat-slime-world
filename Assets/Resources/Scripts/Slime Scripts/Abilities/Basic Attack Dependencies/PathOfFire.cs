using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PathOfFire : PathDelegation
{
    public AbilityPoolContainerDot infernalBreathe;

    public void RegisterDOTAbility(BaseDOT _dot, int _id)
    {
        if(_id == 0)//infernalBreathe
        {
            if(infernalBreathe.ContainCheck(_dot) == false)
            {
                infernalBreathe.objectPool.Add(_dot);
                _dot.MyParent = poolParent;
            }
        }
        else if (_id == 1)//other
        {
            //other ability
        }
    }
    public void RegisterProjectileAbility(BaseProjectile _projectile, int _id)
    {
        //reference PathOfWater's take on this
    }
    public void BasicDOTSetup(Transform _castPoint, Slime _caller, AbilityPoolContainerDot _ability)
    {
        GameObject _newPoolObj = Instantiate(_ability.prefabObj, _castPoint.position, _castPoint.rotation);
        _newPoolObj.SetActive(true);
        _newPoolObj.GetComponent<BaseDOT>().DefineCaller(_caller);

        if (_ability.abilityState == AbilityPoolContainerDot.AbilityState.Anchored)
            _newPoolObj.transform.parent = _castPoint;
    }
    public void RequestAbilityDOT(Transform _castPoint, Slime _caller, AbilityPoolContainerDot _ability)
    {
        bool requestComplete = false;

        if (_ability.objectPool.Count > 0)
        {
            for (int i = 0; i < _ability.objectPool.Count; i++)
            {
                if (!_ability.objectPool[i].gameObject.activeSelf
                    && _ability.objectPool[i].transform.parent != null)
                {
                    requestComplete = true;
                    _ability.objectPool[i].DefineCaller(_caller);
                    _ability.objectPool[i].transform.parent = _castPoint;
                    _ability.objectPool[i].transform.position = _castPoint.position;
                    _ability.objectPool[i].transform.rotation = _castPoint.rotation;

                    if(_ability.abilityState == AbilityPoolContainerDot.AbilityState.Free)
                        _ability.objectPool[i].transform.parent = null;

                    _ability.objectPool[i].gameObject.SetActive(true);
                    return;
                }
            }
            if (!requestComplete)
            {
                BasicDOTSetup(_castPoint, _caller, _ability);
            }
        }
        else
        {
            BasicDOTSetup(_castPoint, _caller, _ability);
        }
    }

    public override void DependentBehavior()
    {
        //in case this requires specific behavior behind water types.
    }
}
