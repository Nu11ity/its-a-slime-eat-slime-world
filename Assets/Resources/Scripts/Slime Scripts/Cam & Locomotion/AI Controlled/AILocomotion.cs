﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class AILocomotion : BaseLocomotion
{
    [Header("Behavior")]
    public ControlledState controlledState;
    public enum ControlledState { Aggressive, Defensive, Waiting }

    public bool DisableBehavior { get; set; }
    public bool EnemyActive
    {
        get
        {//read only
            if (EnemySlime != null)
                if (EnemySlime.CurrentHealth <= 0)
                    return false;

            return true;
        }
    }

    [Header("Focus points")]
    private Vector3 moveTarget;
    public Vector3 MoveTarget
    {//read only
        get
        {
            Aim();

            if (controlledState == ControlledState.Defensive)
                moveTarget = DefensivePositioning();
            else if (controlledState == ControlledState.Waiting)
                moveTarget = DefensivePositioning();//change
            else//Aggressive
                moveTarget = TargetSlime.transform.position;

            return moveTarget;
        }
    }
    private BaseLocomotion targetSlime;
    public Slime EnemySlime { get; set; }
    public BaseLocomotion TargetSlime
    {
        get
        {//read only
            if (targetSlime == null)
            {
                targetSlime = FindObjectOfType<PlayerLocomotion>();
                EnemySlime = targetSlime.GetComponent<Slime>();
            }

            return targetSlime;
        }
    }


    public Transform projectileSpawner;
    public bool hasMovePoint;

    [Header("Distance attributes")]
    public bool stoppingDist;
    public float LeadSpeed { get; set; }
    private float distance;//Read only
    public float Distance{ get {return distance = (TargetSlime.transform.position - transform.position).magnitude; } }

    public void Aim()
    {
        float t;

        if (Distance <= 18f)
            t = (TargetSlime.transform.position - transform.position).magnitude / LeadSpeed;
        else
            t = (TargetSlime.transform.position - transform.position).magnitude / 26f;

        Vector3 futurePos = TargetSlime.transform.position + TargetSlime.Controller.velocity * t;
        Vector3 aim = (futurePos - transform.position).normalized;
        aim.y = 0;
        projectileSpawner.transform.rotation = Quaternion.LookRotation(aim);
    }
    
    public void OnDrawGizmos()
    {
        Vector3 nodeFront = transform.position + (transform.forward) * 10f;
        Vector3 nodeBack = transform.position + (-transform.forward) * 10f;
        Vector3 nodeRight = transform.position + (transform.right) * 10f;
        Vector3 nodeLeft = transform.position + (-transform.right) * 10f;

        Gizmos.color = Color.yellow;
        Gizmos.DrawSphere(nodeFront, 1f);
        Gizmos.DrawSphere(nodeBack, 1f);
        Gizmos.DrawSphere(nodeRight, 1f);
        Gizmos.DrawSphere(nodeLeft, 1f);
    }
    private Vector3 RandomPos { get; set; }
    private float atNewPos;
    private bool foundPosition;
    private int layerIndex = 8; 
    public Vector3 DefensivePositioning()
    {
        if(!foundPosition)
        {
            bool locationSafe = false;
            while(!locationSafe)
            {
                List<bool> safe = new List<bool>();
                Vector3 randomPos = Random.insideUnitSphere * 45f;
                randomPos.y = 0;
                RandomPos = randomPos;
                Collider[] safetyCheck = Physics.OverlapSphere(RandomPos, 3f);
                if (safetyCheck.Length > 0)
                {
                    for (int i = 0; i < safetyCheck.Length; i++)
                    {
                        //Debug.Log("Inside unit sphere -> " + safetyCheck[i].name + ", Surface angle = " + safetyCheck[i].transform.eulerAngles.y);
                        if (safetyCheck[i].gameObject.layer != layerIndex)//the issue is here!!!!!!!!!!!!!!!!!!!!!!!!!!!! <-----
                            safe.Add(false);
                        else
                            safe.Add(true);
                    }
                }

                if (safe.Contains(false))
                    locationSafe = false;
                else
                    locationSafe = true;
            }
            foundPosition = true;        
        }
        if (foundPosition)
        {
            atNewPos = (transform.position - RandomPos).magnitude;
            if (atNewPos <= 1.5f)
                foundPosition = false;
        }
        return RandomPos;
    }
    public void DistanceChecks()
    {
        if(EnemyActive)
        {
            if (Distance <= 3)
                stoppingDist = true;
            else
                stoppingDist = false;
        }
        else if(!EnemyActive)
        {
            stoppingDist = false;
        }
    }
    void Awake()
    {
        Controller = GetComponent<CharacterController>();
    }
    void Update()
    {
        if (DisableBehavior)
        {
            Controller.enabled = false;
            return;
        }

        DistanceChecks();
        UpdateController();
        SetRotation();
    }
    public override void SetRotation()
    {
        Vector3 lookPos = MoveTarget - visualOrientation.position;
        lookPos.y = 0;
        Quaternion rotation = Quaternion.LookRotation(lookPos);
        visualOrientation.rotation = Quaternion.Slerp(visualOrientation.rotation, rotation, Time.deltaTime * rotSpeed);
        if (Controller.isGrounded)
        {//fixed looking away on jump(above)
            if (Controller.velocity.magnitude > 0)
            {
                Vector3 newPos = slimeOrientation.position - (transform.position - Controller.velocity);
                newPos.y = 0;
                var slimeRot = Quaternion.LookRotation(newPos);
                slimeOrientation.rotation = Quaternion.Slerp(slimeOrientation.rotation, slimeRot, Time.deltaTime * (rotSpeed / 2f));
            }
            else
            {
                //slimeVisual.rotation = slimeVisual.parent.transform.rotation;
                Quaternion desiredRot = slimeOrientation.parent.transform.rotation;
                slimeOrientation.rotation = Quaternion.Slerp(slimeOrientation.rotation, desiredRot, Time.deltaTime * (rotSpeed / 2.5f));
            }
        }
    }
    public void UpdateController()
    {
        UpdateMovement();
        UpdateImpactData();

        //jump

        Vector3 moveDirection = Vector3.zero;
        float motorDamp = (1.0f + (damping * simulationRate * Time.deltaTime));
        moveThrottle.x /= motorDamp;
        moveThrottle.y = (moveThrottle.y > 0.0f) ? (moveThrottle.y / motorDamp) : moveThrottle.y;
        moveThrottle.z /= motorDamp;

        moveDirection += moveThrottle * simulationRate * Time.deltaTime;
        moveDirection.y += gravity * Time.deltaTime;

        if (Controller.isGrounded && moveThrottle.y <= transform.lossyScale.y * .001f)
        {
            float bumpUpOffset = Mathf.Max(Controller.stepOffset, new Vector3(moveDirection.x, 0, moveDirection.z).magnitude);
            moveDirection -= bumpUpOffset * Vector3.up;
        }

        Vector3 predictedXZ = Vector3.Scale((Controller.transform.localPosition + moveDirection), new Vector3(1, 0, 1));

        Controller.Move(moveDirection);
        Vector3 actualXZ = Vector3.Scale(Controller.transform.localPosition, new Vector3(1, 0, 1));

        if (predictedXZ != actualXZ)
            moveThrottle += (actualXZ - predictedXZ) / (simulationRate * Time.deltaTime);
    }
    public override void UpdateMovement()
    {
        if(enableMovement && !stoppingDist)
        {
            moveScale = 1;

            moveScale *= simulationRate * Time.deltaTime;

            float moveInfluence = acceleration * .1f * moveScale * moveScaleMultiplier;

            Quaternion ort = visualOrientation.rotation;
            Vector3 ortEuler = ort.eulerAngles;
            ortEuler.z = ortEuler.x = 0f;
            ort = Quaternion.Euler(ortEuler);

            moveThrottle += ort * (transform.lossyScale.z * moveInfluence * Vector3.forward);

            moveInfluence = acceleration * 0.1f * moveScale * moveScaleMultiplier;

            if(!hasMovePoint)
                moveThrottle += ort * (0 * transform.lossyScale.z * moveInfluence * Vector3.forward);
            else if(hasMovePoint)
            {
                float dist = (MoveTarget - transform.position).magnitude;
                if (dist <= 5f)
                    hasMovePoint = false;
            }
        }
    }
}