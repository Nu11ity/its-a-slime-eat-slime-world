using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class ThirdPersonLocomotion : MonoBehaviour
{
    public Transform orientationTracker;
    [Range(0, 3)]
    public float acceleration = .5f;
    [Range(0, 3)]
    public float damping = .3f;
    [Range(0, 3)]
    public float backAndSideDampen = .75f;
    public bool enableMovement;
    public float gravity = -5.86f;
    public float jumpForce = .3f;

    public CharacterController controller { get; set; }

    private float moveScale = 1;
    private Vector3 moveThrottle = Vector3.zero;
    private float moveScaleMultiplier = 1.0f;
    private float simulationRate = 60;

    void Awake()
    {
        controller = GetComponent<CharacterController>();
    }

    void Update()
    {
        UpdateController();
    }

    public void UpdateController()
    {
        UpdateMovement();

        if (Input.GetKeyDown(KeyCode.Space))
            Jump();

        Vector3 moveDirection = Vector3.zero;
        float motorDamp = (1.0f + (damping * simulationRate * Time.deltaTime));
        moveThrottle.x /= motorDamp;
        moveThrottle.y = (moveThrottle.y > 0.0f) ? (moveThrottle.y / motorDamp) : moveThrottle.y;
        moveThrottle.z /= motorDamp;

        moveDirection += moveThrottle * simulationRate * Time.deltaTime;
        moveDirection.y += gravity * Time.deltaTime;

        if (controller.isGrounded && moveThrottle.y <= transform.lossyScale.y * .001f)
        {
            float bumpUpOffset = Mathf.Max(controller.stepOffset, new Vector3(moveDirection.x, 0, moveDirection.z).magnitude);
            moveDirection -= bumpUpOffset * Vector3.up;
        }

        Vector3 predictedXZ = Vector3.Scale((controller.transform.localPosition + moveDirection), new Vector3(1, 0, 1));

        controller.Move(moveDirection);
        Vector3 actualXZ = Vector3.Scale(controller.transform.localPosition, new Vector3(1, 0, 1));

        if (predictedXZ != actualXZ)
            moveThrottle += (actualXZ - predictedXZ) / (simulationRate * Time.deltaTime);      
    }

    public void UpdateMovement()
    {
        if(enableMovement)
        {
            bool moveForward = Input.GetKey(KeyCode.W);
            bool moveLeft = Input.GetKey(KeyCode.A);
            bool moveRight = Input.GetKey(KeyCode.D);
            bool moveBack = Input.GetKey(KeyCode.S);

            moveScale = 1f;

            if ((moveForward && moveLeft) || (moveForward && moveRight) ||
                    (moveBack && moveLeft) || (moveBack && moveRight))
                moveScale = 0.85f;

            if (!controller.isGrounded)
                moveScale = .65f;

            moveScale *= simulationRate * Time.deltaTime;

            float moveInfluence = acceleration * .1f * moveScale * moveScaleMultiplier;

            Quaternion ort = orientationTracker.rotation;
            Vector3 ortEuler = ort.eulerAngles;
            ortEuler.z = ortEuler.x = 0f;
            ort = Quaternion.Euler(ortEuler);

            if (moveForward)
                moveThrottle += ort * (transform.lossyScale.z * moveInfluence * Vector3.forward);
            if (moveBack)
                moveThrottle += ort * (transform.lossyScale.z * moveInfluence * backAndSideDampen * Vector3.back);
            if (moveLeft)
                moveThrottle += ort * (transform.lossyScale.x * moveInfluence * backAndSideDampen * Vector3.left);
            if (moveRight)
                moveThrottle += ort * (transform.lossyScale.x * moveInfluence * backAndSideDampen * Vector3.right);

            moveInfluence = acceleration * 0.1f * moveScale * moveScaleMultiplier;
        }
    }

    public bool Jump()
    {
        if (!controller.isGrounded)
            return false;

        moveThrottle.y += Mathf.Sqrt(jumpForce);
        return true;
    }
    public void Stop()
    {
        controller.Move(Vector3.zero);
        moveThrottle = Vector3.zero;
    }
}
