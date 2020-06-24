using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VisualOrientation : MonoBehaviour
{
    public Transform targetVisual;
    public float rotSpeed = 10f;

    private Camera cam;
    private bool isRotating = false;

    void Awake()
    {
        cam = GetComponentInChildren<Camera>();
    }
    void Update()
    {
        if (isRotating)
            SetRotation(targetVisual, cam.gameObject);

        if (targetVisual.rotation.eulerAngles.y == cam.transform.rotation.eulerAngles.y)
            isRotating = false;
        else
            isRotating = true;
    }
    private void SetRotation(Transform visual, GameObject camera)
    {
        var lookPos = visual.position - cam.transform.position;
        lookPos.y = 0;
        var rotation = Quaternion.LookRotation(lookPos);
        visual.rotation = Quaternion.Slerp(visual.rotation, rotation, Time.deltaTime * rotSpeed);
        //visual.rotation = Quaternion.Lerp(visual.rotation, camera.transform.rotation, rotSpeed * Time.deltaTime);
    }
}
