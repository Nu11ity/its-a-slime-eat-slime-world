using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CustomCamera : MonoBehaviour
{
    //Sensitivity & inverted options
    public enum MouseState { Standard, Inverted }
    public MouseState mouseState;
    public Transform focusPoint;
    [Range(1, 10)]
    public float sensitivity;
    [Range(1, 5)]
    public float damping;//1.5, 3, 5
    public float yAngleMin;
    public float yAngleMax;
    public Vector3 camOffset;

    private float currentX;
    private float currentY;

    private Vector3 newCamPos;
    private Vector3 cameraMask;
    private Quaternion newCamRot;
    private const float distance = 7.5f;
    private float pushValue;

    private void Update()
    {
        GetInput();
        CheckObstructions();
    }
    private void LateUpdate()
    {
        UpdateCameraPosition();
    }
    private void GetInput()
    {
        currentX += Input.GetAxis("Mouse X") * sensitivity;
        if(mouseState == MouseState.Inverted)
            currentY += Input.GetAxis("Mouse Y") * sensitivity;
        else
            currentY -= Input.GetAxis("Mouse Y") * sensitivity;
        currentY = Mathf.Clamp(currentY, yAngleMin, yAngleMax);
    }
    private void UpdateCameraPosition()
    {
        newCamRot = Quaternion.Euler(currentY, currentX, 0);

        newCamPos = focusPoint.position + newCamRot * camOffset;
        cameraMask = focusPoint.position + newCamRot * camOffset;

        CheckObstructions();
        transform.position = Vector3.Lerp(transform.position, newCamPos, damping * Time.deltaTime);
        transform.LookAt(focusPoint);
    }

    private void CheckObstructions()
    {
        pushValue = distance / damping;
        RaycastHit hit;
        if (Physics.Linecast(focusPoint.position, cameraMask, out hit))
        {
            newCamPos = new Vector3(hit.point.x + hit.normal.x * distance, transform.position.y, hit.point.z + hit.normal.z * distance);
        }
        Debug.DrawLine(focusPoint.position, cameraMask);
    }
}
