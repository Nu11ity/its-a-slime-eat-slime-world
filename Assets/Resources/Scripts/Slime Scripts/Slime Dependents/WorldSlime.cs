using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

[System.Serializable]
public class WSlimeBehavior
{
    public float speed;
    public int intervalTicks;
    public float duration;
    public float Timer { get; set; }
}

public class WorldSlime : MonoBehaviour, IInteractable
{
    public SlimeData data;

    [Header("Control Behavior")]
    public GameObject interactVisual;
    public NavMeshAgent agent;
    public enum States { Wander, Idle }
    public States currentState;

    public WSlimeBehavior wander;
    public WSlimeBehavior idle;

    public float intervalCheck;
    private float interval;

    public LayerMask desiredLayer;//interactable
    public float allyCallRange;

    private Vector3 randomPoint;
    private Vector3 finalPos;
    private NavMeshHit hit;

    private WorldSlimeSpawner spawner;
    public WorldSlimeSpawner Spawner
    {
        get
        {
            if (spawner == null)
                spawner = GetComponentInParent<WorldSlimeSpawner>();

            return spawner;
        }
    }

    public void Update()
    {
        DetermineStates();
    }
    //private void SpawnSphere(Vector3 _pos)
    //{
    //    GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
    //    sphere.transform.position = _pos;
    //}

    #region IInteractable Behavior
    public void ConvertToCaptureReady()
    {
        Debug.Log(this.name + " is in a capture ready state");
    }
    public void OnHoverEnter()
    {
        Debug.Log("OnHoverEnter thru -> " + transform.name);
        interactVisual.SetActive(true);
    }
    public void OnHoverExit()
    {
        Debug.Log("OnHoverExit thru -> " + transform.name);
        interactVisual.SetActive(false);
    }

    private Collider[] allies;
    public void Interact()
    {
        Debug.Log("Interacted with -> " + transform.name);
        AbilityManager.Instance.slimeManager.automatedSlimes.Add(this);
        allies = Physics.OverlapSphere(transform.position, allyCallRange, desiredLayer);
        if(allies.Length > 0)
        {
            for (int i = 0; i < allies.Length; i++)
            {
                if(allies[i].GetComponent<WorldSlime>())
                {
                    Debug.Log("Found an ally in -> " + allies[i].transform.name);
                    AbilityManager.Instance.slimeManager.automatedSlimes.Add(allies[i].GetComponent<WorldSlime>());
                }
            }
        }

        AbilityManager.Instance.slimeManager.InitializedCombat = true;
    }
    #endregion  

    #region States Behavior
    private void DetermineStates()
    {
        interval -= Time.deltaTime;
        if (interval <= 0)
        {
            idle.Timer = 0;
            wander.Timer = 0;

            currentState = (States)Random.Range(0, 2);
            interval = intervalCheck * TickMultiplier();
        }
        RunStates();
    }
    private int TickMultiplier()
    {
        int tickValue = 1;

        if (currentState == States.Wander)
            tickValue = wander.intervalTicks;
        else if (currentState == States.Idle)
            tickValue = idle.intervalTicks;

        Mathf.Clamp(tickValue, 1, Mathf.Infinity);
        return tickValue;
    }
    private void RunStates()
    {
        if (!agent.enabled)
            return;

        if (currentState == States.Wander)
            Wander();
        else if (currentState == States.Idle)
            Idle();
    }
    private void Wander()
    {
        wander.Timer -= Time.deltaTime;

        if (wander.Timer <= 0)
        {
            agent.speed = wander.speed;
            bool successful = false;
            while(!successful)
            {
                randomPoint = Spawner.RelativeRandomPosition() + transform.position;

                if (NavMesh.SamplePosition(randomPoint, out hit, 20, 1))
                {
                    successful = true;
                    finalPos = hit.position;
                    agent.SetDestination(finalPos);

                    //SpawnSphere(finalPos);
                }
            }           

            wander.Timer = wander.duration;
        }      
    }
    private void Idle()
    {
        idle.Timer -= Time.deltaTime;

        if(idle.Timer <= 0)
        {
            agent.speed = idle.speed;
            idle.Timer = idle.duration;
        }
    }
    #endregion
}
