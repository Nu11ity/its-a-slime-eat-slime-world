using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GizmosDemo : MonoBehaviour
{
    public float size;
    public Color color;

    public void OnDrawGizmos()
    {
        Gizmos.color = color;
        Gizmos.DrawSphere(transform.position, size);
    }
}
