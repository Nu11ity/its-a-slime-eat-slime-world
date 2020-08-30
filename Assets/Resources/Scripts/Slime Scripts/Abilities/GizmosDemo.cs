using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GizmosDemo : MonoBehaviour
{
    public float size;

    public void OnDrawGizmos()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawSphere(transform.position, size);
    }
}
