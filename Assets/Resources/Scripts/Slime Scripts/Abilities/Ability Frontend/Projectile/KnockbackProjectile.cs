using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KnockbackProjectile : BaseProjectile
{
    [Header("Inherit Dependents")]
    public float knockbackForce;
    private float mass;

    public override void DamageCast()
    {
        Vector3 offset = transform.position - transform.forward * radius;
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
        Gizmos.color = Color.yellow;
        Gizmos.DrawSphere(transform.position - transform.forward * radius, radius);
    }
}
