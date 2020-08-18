﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseProjectile : PooledAbilityObject
{
    public PooledImpactObject impactObject;
    public bool allowCasting;
    public float lifeTime;
    public float speed;
    public LayerMask desiredLayers;
    public int slimeLayer;
    public int damage;
    public float radius;
    public List<GameObject> disableOnImpact;
    public bool showGizmos;
    public float castOffset;

    protected float currentLife;
    protected bool begunFadeout;
    protected Collider[] targets;

    void OnDrawGizmos()
    {
        if (showGizmos)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawSphere(transform.position - transform.forward * castOffset, radius);
        }
    }
    public void Update()
    {
        if (begunFadeout)
            return;//stops everything progressing

        currentLife += Time.deltaTime;
        if (currentLife > lifeTime)
            FadeOut();

        if (allowCasting && gameObject.activeSelf)
        {
            transform.position = transform.position + transform.forward * Time.deltaTime * speed;
            DamageCast();
        }      
    }
    protected virtual void FadeOut()
    {
        begunFadeout = true;
        allowCasting = false;
        for (int j = 0; j < disableOnImpact.Count; j++)
            disableOnImpact[j].SetActive(false);
        Invoke("ResetToPool", 1.2f);
    }
    protected virtual void ResetToPool()
    {
        transform.parent = MyParent;
        gameObject.SetActive(false);
    }
    public virtual void DamageCast()
    {
        targets = Physics.OverlapSphere(transform.position, radius, desiredLayers);
        if (targets.Length > 0)
        {
            for (int i = 0; i < targets.Length; i++)
            {
                if (targets[i].gameObject != MySlime.gameObject)
                {
                    if (targets[i].gameObject.layer == slimeLayer)
                        targets[i].GetComponent<Slime>().TakeDamage(damage);

                    OnImpact();
                    FadeOut();
                }
            }
        }
    }
    public virtual void OnImpact()
    {
        impactObject.transform.parent = null;
        impactObject.gameObject.SetActive(true);
    }
    protected virtual void OnDisable()
    {
        currentLife = 0;
        begunFadeout = false;
        allowCasting = true;
        for (int j = 0; j < disableOnImpact.Count; j++)
            disableOnImpact[j].SetActive(true);
    }
}
