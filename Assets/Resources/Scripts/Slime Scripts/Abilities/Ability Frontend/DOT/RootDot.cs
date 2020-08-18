using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RootDot : BaseDOT
{
    public float rootDuration;

    private Collider[] targets;
    private float timeLeft;

    public void Root()
    {
        timeLeft += Time.deltaTime;
    }
    public override void OnDisableExpanded()
    {
        timeLeft = 0;
        if(targets.Length > 0)
        {
            for (int i = 0; i < targets.Length; i++)
            {
                if (targets[i].GetComponent<ThirdPersonLocomotion>().enableMovement == false && targets[i].GetComponent<Slime>().CurrentHealth > 0)
                    targets[i].GetComponent<ThirdPersonLocomotion>().enableMovement = true;
            }
        }
    }
    public override void TickDamageCast()
    {
        Root();

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
                            targets[j].GetComponent<Slime>().TakeDamage(damage);

                            //!!!COME BACK AND ADD ROOT FOR AI SLIME MOVEMENT CLASS!!!
                            //At that time, convert both this stop method, as well
                            //as the knockback method from projectiles, into the slime class itself.
                            if(timeLeft < rootDuration)
                                targets[j].GetComponent<ThirdPersonLocomotion>().enableMovement = false;
                            else
                                targets[j].GetComponent<ThirdPersonLocomotion>().enableMovement = true;
                            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        }
                    }
                }
            }
            tickValue = 0;
        }
    }
}
