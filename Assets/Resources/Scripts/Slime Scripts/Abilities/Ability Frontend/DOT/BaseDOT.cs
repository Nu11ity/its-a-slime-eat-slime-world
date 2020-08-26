using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseDOT : PooledAbilityObject
{
    public List<Transform> castPositions;
    public LayerMask desiredLayers;
    public int damage;
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

    private void ControlThruParticle()
    {
        if(ps[psIndex].isPlaying)
        {
            TickDamageCast();
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
        TickDamageCast();
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
    }
    public virtual void OnDisableExpanded()
    {
        //if derived children need extra logic in disable
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
    public virtual void TickDamageCast()
    {
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
                            targets[j].GetComponent<Slime>().TakeDamage(damage);
                    }
                }
            }
            tickValue = 0;
        }    
    }
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
