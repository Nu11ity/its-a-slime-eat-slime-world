using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PathOfWater : PathDelegation
{
    public AbilityPoolContainerProjectile tidelessWaves;

    
    public void RegisterProjectileAbility(BaseProjectile _projectile, int _id)//needs to be modular ability calls, currently only works for wave spell
    {
        if(_id == 0)//Tideless Waves
        {
            if (tidelessWaves.ContainCheck(_projectile) == false)
            {
                tidelessWaves.objectPool.Add(_projectile);
                _projectile.MyParent = poolParent;
            }
        }
        else if (_id == 1)//other ability
        {

        }
    }
    public void RegisterDOTAbility(BaseDOT _dot, int _id)
    {

    }
    public void BasicProjectileSetup(Transform _castPoint, Slime _caller, AbilityPoolContainerProjectile _ability)
    {
        GameObject _newPoolObj = Instantiate(_ability.prefabObj, _castPoint.position, _castPoint.rotation);
        _newPoolObj.SetActive(true);
        _newPoolObj.GetComponent<BaseProjectile>().Initialize(_caller);
    }
    public void RequestAbilityProjectile(Transform _castPoint, Slime _caller, AbilityPoolContainerProjectile _ability)
    {
        bool requestComplete = false;

        if(_ability.objectPool.Count > 0)
        {
            for (int i = 0; i < _ability.objectPool.Count; i++)
            {
                if(!_ability.objectPool[i].gameObject.activeSelf
                    && !_ability.objectPool[i].impactObject.gameObject.activeSelf
                    && _ability.objectPool[i].transform.parent != null)
                {
                    requestComplete = true;
                    _ability.objectPool[i].DefineCaller(_caller);
                    _ability.objectPool[i].transform.parent = _castPoint;
                    _ability.objectPool[i].transform.position = _castPoint.position;
                    _ability.objectPool[i].transform.rotation = _castPoint.rotation;
                    _ability.objectPool[i].transform.parent = null;
                    _ability.objectPool[i].gameObject.SetActive(true);
                    return;
                }
            }
            if(!requestComplete)
            {
                BasicProjectileSetup(_castPoint, _caller, _ability);
            }
        }
        else
        {
            BasicProjectileSetup(_castPoint, _caller, _ability);
        }
    }
    public void RequestAbilityDOT(Transform _castPoint, Slime _caller)
    {

    }


    public override void DependentBehavior()
    {
        //in case this requires specific behavior behind water types.
    }
}
