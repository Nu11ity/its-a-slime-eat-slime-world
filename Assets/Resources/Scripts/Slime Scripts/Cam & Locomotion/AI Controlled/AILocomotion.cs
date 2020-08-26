using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class AILocomotion : BaseLocomotion
{
    public enum ControlledState { Default, Aggressive, Defensive }
    public ControlledState controlledState;

    public Transform focusPoint;
    public bool hasMovePoint;

    void Awake()
    {
        Controller = GetComponent<CharacterController>();
    }
    void Update()
    {
        UpdateController();
        SetRotation();
    }
    public override void SetRotation()
    {
        Vector3 lookPos = focusPoint.position - visualOrientation.position;
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
        if(enableMovement)
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


            //movement is based off the look direction.
            //if we simply control where the slime looks we have targeting down
            //then we need to focus on stop distances for abiltiies
            //

            if(!hasMovePoint)
                moveThrottle += ort * (0 * transform.lossyScale.z * moveInfluence * Vector3.forward);
            else if(hasMovePoint)
            {
                float dist = (focusPoint.position - transform.position).magnitude;
                if (dist <= 5f)
                    hasMovePoint = false;
            }
        }
    }
}
