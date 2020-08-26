using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HealDot : BaseDOT
{
    [Header("Heal Behavior")]
    public float healthRegenSpeed;

    public void Heal()
    {
        if (MySlime.CurrentHealth < MySlime.MaxHealth)
            MySlime.CurrentHealth += Time.deltaTime * healthRegenSpeed;
    }

    public override void TickDamageCast()
    {
        Heal();

        if (damage < 0)
            return;         

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
    
}
