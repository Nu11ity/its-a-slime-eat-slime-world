using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FreeMoveAbility : MonoBehaviour
{
    public CustomCamera cam;

    public Transform origin;
    public Transform endPoint;
    //public Vector3 currentPos;

    private float min = 1.65f;
    private float max = 4.67f;
    public int percent;


    public int vectorPercent;

    void Update()
    {//min -> 1.650001 && max -> 4.665044
        float value = (cam.transform.localPosition.y - min) / (max - min);
        value *= 100;
        percent = (int)value;
        percent = Mathf.Clamp(percent, 0, 100);


        float vectorVal = (transform.localPosition.z - origin.localPosition.z) / (endPoint.localPosition.z - origin.localPosition.z);
        vectorVal *= 100;
        vectorPercent = (int)vectorVal;
        vectorPercent = Mathf.Clamp(vectorPercent, 0, 100);

        if (vectorPercent < percent)
            Debug.Log("Vector move forward");
        else if (vectorPercent > percent)
            Debug.Log("vector move back");
    }
}
