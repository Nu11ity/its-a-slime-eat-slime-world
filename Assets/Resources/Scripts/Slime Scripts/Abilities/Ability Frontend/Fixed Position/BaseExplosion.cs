using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseExplosion : PooledAbilityObject
{
    public float startDelay;
    public float duration;
    public float radius;
    public int damage;
    public LayerMask desiredLayers;
    public List<Transform> castPositions;
    public bool showGizmos;
    

    private float currentTime;
    private Collider[] targets;
    private bool allowCasting;

    void Update()
    {
        if(allowCasting)
        {
            OnCastBehavior();
            //stun cast...
            //knock cast...

            currentTime += Time.deltaTime;
            if (currentTime >= duration)
                gameObject.SetActive(false);
        }
    }
    void OnEnable()
    {
        if(startDelay > 0)
            Invoke("BeginStartDelay", startDelay);
    }
    void BeginStartDelay()
    {
        allowCasting = true;
    }
    void OnDisable()
    {
        allowCasting = false;
        currentTime = 0;
    }
    public virtual void OnCastBehavior()
    {
        for (int i = 0; i < castPositions.Count; i++)
        {
            targets = Physics.OverlapSphere(castPositions[i].position, radius, desiredLayers);
            if(targets.Length > 0)
            {
                for (int j = 0; j < targets.Length; j++)
                {
                    if(targets[j].gameObject != MySlime.gameObject)
                    {
                        targets[j].GetComponent<Slime>().TakeDamage(damage);
                    }
                }
            }
        }
    }
    void OnDrawGizmos()
    {
        if (showGizmos)
        {
            if(castPositions.Count > 0)
            {
                Gizmos.color = Color.yellow;
                for (int i = 0; i < castPositions.Count; i++)
                    Gizmos.DrawSphere(castPositions[i].position, radius);
            }        
        }
    }
}
