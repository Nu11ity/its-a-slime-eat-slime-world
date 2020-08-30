using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RootDot : BaseDOT
{
    [Header("Root behavior")]
    public float rootDuration;

    private List<GameObject> rootedTargets = new List<GameObject>();
    private Collider[] targets;

    public override void OnDisableExpanded()
    {
        if (rootedTargets.Count > 0)
            rootedTargets.Clear();
    }
    public override void TickDamageCast()
    {
        tickValue += Time.deltaTime;
        if(tickValue >= tickDelay)
        {
            for (int i = 0; i < castPositions.Count; i++)
            {
                targets = Physics.OverlapSphere(castPositions[i].position, radius, desiredLayers);
                if(targets.Length > 0)
                {
                    for (int j = 0; j < targets.Length; j++)
                    {
                        if (targets[j].gameObject != MySlime.gameObject)
                        {
                            Slime hitSlime = targets[j].GetComponent<Slime>();
                            hitSlime.TakeDamage(damage);

                            //root behavior
                            if (rootedTargets.Count > 0)
                            {
                                if (!rootedTargets.Contains(targets[j].gameObject))
                                {
                                    rootedTargets.Add(targets[j].gameObject);
                                    hitSlime.MyStatusControls.SetRootDuration(duration);
                                }
                            }
                            else
                            {
                                rootedTargets.Add(targets[j].gameObject);
                                hitSlime.MyStatusControls.SetRootDuration(duration);
                            }
                        }
                    }
                }
            }
            tickValue = 0;
        }
    }
}
