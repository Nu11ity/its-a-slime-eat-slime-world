using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class AbilityPoolContainerDot
{
    public enum AbilityState { Anchored, Free }
    public AbilityState abilityState;
    public GameObject prefabObj;
    public List<BaseDOT> objectPool = new List<BaseDOT>();

    public bool ContainCheck(BaseDOT _object)
    {
        if (!objectPool.Contains(_object))
            return false;
        else
            return true;
    }
}
[System.Serializable]
public class AbilityPoolContainerProjectile
{
    public GameObject prefabObj;
    public List<BaseProjectile> objectPool = new List<BaseProjectile>();

    public bool ContainCheck(BaseProjectile _object)
    {
        if (!objectPool.Contains(_object))
            return false;
        else
            return true;
    }
}

[System.Serializable]
public class AbilityPoolContainer
{
    public GameObject prefabObj;
    public List<GameObject> objectPool = new List<GameObject>();

    public bool ContainCheck(GameObject _object)
    {
        if (!objectPool.Contains(_object))
            return false;
        else
            return true;
    }
}
