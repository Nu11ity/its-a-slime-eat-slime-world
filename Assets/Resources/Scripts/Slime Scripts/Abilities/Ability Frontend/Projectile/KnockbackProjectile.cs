using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KnockbackProjectile : BaseProjectile
{
    [Header("Inherit Dependents")]
    public float knockbackForce;
    public float castOffset;
    private float mass = 3;

    public bool showGizmos;

    public override void DamageCast()
    {
        Vector3 offset = transform.position - transform.forward * castOffset;
        targets = Physics.OverlapSphere(offset, radius, desiredLayers);
        if (targets.Length > 0)
        {
            for (int i = 0; i < targets.Length; i++)
            {
                if(targets[i].gameObject != MySlime.gameObject)
                {
                    if (targets[i].gameObject.layer == slimeLayer)
                    {
                        targets[i].GetComponent<Slime>().TakeDamage(damage);
                        Vector3 dir = targets[i].transform.position - offset;
                        float force = Mathf.Clamp(knockbackForce / mass, 0, knockbackForce);
                        targets[i].GetComponent<ThirdPersonLocomotion>().AddImpact(dir, force);
                    }
                    OnImpact();
                    FadeOut();
                }                           
            }
        }
    }
    void OnDrawGizmos()
    {
        if(showGizmos)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawSphere(transform.position - transform.forward * castOffset, radius);
        }       
    }
}
