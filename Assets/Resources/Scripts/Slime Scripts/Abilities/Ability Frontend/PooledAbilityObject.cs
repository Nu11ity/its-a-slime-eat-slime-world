using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PooledAbilityObject : MonoBehaviour
{
    //knows if anchored or not?
    //needs to define slime caller so doesn't damage it
    //make initialize instead be awake, and set to pool their
    //ability based objects use this, so baseprojectile and baseDOT

    public enum RegisterMethod { registered, unregistered }
    public RegisterMethod registerMethod;

    public enum Path { Fire, Water, Nature }
    public Path path;//know path so can know parent

    public int id;
    public bool anchor;
    public Transform MyParent { get; set; }
    public Slime MySlime { get; set; }

    public virtual void SetSlime(Slime _caller)
    {
        MySlime = _caller;
    }
    public void Awake()//register to pool on creation
    {
        if(registerMethod == RegisterMethod.registered)
            AbilityManager.Instance.RegisterItemToPool(this);       
    }

}
