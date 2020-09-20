﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class DotBehaviorModule
{
    public enum Behaviors { Dot, Heal, Root, Stun, Slow, Force }
    public List<Behaviors> behaviors = new List<Behaviors>();

    public int tickDamageAmt;
    public float healthRegenSpeed;
    public float rootDuration;
    public float stunDuration;
    public float slowDuration;
    public float slowIntensity;
    public float pullForce;
}
public class BaseDOT : PooledAbilityObject
{
    public DotBehaviorModule module;
    public List<Transform> castPositions;
    public LayerMask desiredLayers;
    public float radius;
    public float duration;
    public float tickDelay;    
    public enum CheckMethod { PS, Other }
    public CheckMethod checkMethod;
    [Tooltip("index in ps pool that controls if stops playing to turn off this gameobject")]
    public int psIndex;

    public List<ParticleSystem> ps;
    public bool showGizmos;

    private float durationValue;
    protected float tickValue;
    private ParticleSystem.MainModule mainModule;
    protected List<GameObject> hitTargets = new List<GameObject>();

    void IntegrityMet()//-------
    {
        if(MySlime != null)
        {
            if (MySlime.MyStatusControls.SilenceDuration > 0 || MySlime.MyStatusControls.StunDuration > 0)
            {
                transform.parent = MyParent;
                gameObject.SetActive(false);
            }
        }        
    }
    private void ControlThruParticle()
    {
        if(ps[psIndex].isPlaying)
        {
            OnCastBehavior();
            durationValue += Time.deltaTime;
            if (durationValue >= duration)
            {
                for (int i = 0; i < ps.Count; i++)
                {
                    mainModule = ps[i].main;
                    mainModule.loop = false;
                }
            }
        }
        else
        {
            transform.parent = MyParent;
            gameObject.SetActive(false);
        }
    }
    private void ControlThruDuration()
    {
        OnCastBehavior();
        durationValue += Time.deltaTime;
        if (durationValue >= duration)
        {
            transform.parent = MyParent;
            gameObject.SetActive(false);
        }
    }
    void Update()
    {
        if (checkMethod == CheckMethod.PS)
            ControlThruParticle();
        else if (checkMethod == CheckMethod.Other)
            ControlThruDuration();

        IntegrityMet();
    }
    public virtual void OnDisableExpanded()
    {
        if (hitTargets.Count > 0)
            hitTargets.Clear();
    }
    private void OnDisable()
    {
        if(ps.Count > 0)
        {
            for (int i = 0; i < ps.Count; i++)
            {
                mainModule = ps[i].main;
                mainModule.loop = true;
            }
        }
        OnDisableExpanded();
        tickValue = 0;
        durationValue = 0;
        MySlime = null;
    }
    private bool ContainerCheck(GameObject _obj)
    {
        if (hitTargets.Count > 0)
        {
            if (!hitTargets.Contains(_obj))
                return true;
            else
                return false;
        }
        return true;
    }
    public virtual void OnCastBehavior()
    {
        if (module.behaviors.Contains(DotBehaviorModule.Behaviors.Heal))
            ApplyHeal();

        tickValue += Time.deltaTime;
        if(tickValue >= tickDelay)
        {
            for (int i = 0; i < castPositions.Count; i++)
            {
                Collider[] targets = Physics.OverlapSphere(castPositions[i].position, radius, desiredLayers);
                if(targets.Length > 0)
                {
                    for (int j = 0; j < targets.Length; j++)
                    {
                        if (targets[j].gameObject != MySlime.gameObject)
                        {
                            Slime hitSlime = targets[j].GetComponent<Slime>();
                            //we do need to damage and apply constant force every tick
                            if (module.behaviors.Contains(DotBehaviorModule.Behaviors.Dot))
                                ApplyDamage(hitSlime);
                            if (module.behaviors.Contains(DotBehaviorModule.Behaviors.Force))
                                ApplyForce(hitSlime);

                            if (ContainerCheck(targets[j].gameObject))
                            {//We only need to root, stun, slow, silence one time with high duration
                                hitTargets.Add(targets[j].gameObject);                             
                              
                                if (module.behaviors.Contains(DotBehaviorModule.Behaviors.Root))
                                    ApplyRoot(hitSlime);
                                if (module.behaviors.Contains(DotBehaviorModule.Behaviors.Stun))
                                    ApplyStun(hitSlime);
                                if (module.behaviors.Contains(DotBehaviorModule.Behaviors.Slow))
                                    ApplySlow(hitSlime);          
                            }                         
                        }
                    }
                }
            }
            tickValue = 0;
        }    
    }
    #region Behavior Methods
    private void ApplyDamage(Slime _hitSlime)
    {
        _hitSlime.TakeDamage(module.tickDamageAmt);
    }
    private void ApplyRoot(Slime _hitSlime)
    {
        _hitSlime.MyStatusControls.SetRootDuration(module.rootDuration);
    }
    private void ApplyStun(Slime _hitSlime)
    {
        _hitSlime.MyStatusControls.SetStunDuration(module.stunDuration);
    }
    private void ApplySlow(Slime _hitSlime)
    {
        _hitSlime.MyStatusControls.SetSlowDuration(module.slowDuration, module.slowIntensity);
    }
    public void ApplyForce(Slime _hitSlime)
    {
        Vector3 dir = _hitSlime.transform.position - transform.position;
        _hitSlime.MyStatusControls.RequestContinousForce(dir, module.pullForce);
    }
    public void ApplyHeal()
    {
        if (MySlime.CurrentHealth < MySlime.MaxHealth)
            MySlime.CurrentHealth += Time.deltaTime * module.healthRegenSpeed;
    }
   
    #endregion
    void OnDrawGizmos()
    {
        if (showGizmos)
        {
            if (castPositions.Count > 0)
            {
                Gizmos.color = Color.yellow;
                for (int i = 0; i < castPositions.Count; i++)
                    Gizmos.DrawSphere(castPositions[i].position, radius);
            }
        }
    }
}
