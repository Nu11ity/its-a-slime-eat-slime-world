using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestInteractable : MonoBehaviour, IInteractable
{
    public void OnHoverEnter()
    {
        Debug.Log("OnHoverEnter thru -> " + transform.name);
    }
    public void OnHoverExit()
    {
        Debug.Log("OnHoverExit thru -> " + transform.name);
    }
    public void Interact()
    {

    }
}
