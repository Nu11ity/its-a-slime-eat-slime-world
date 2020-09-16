using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CaptureBehavior : MonoBehaviour
{
    public GameObject defeatVFX;
    public GameObject visualObj;    
    
    public void RemoveFromCombat()
    {        
        defeatVFX.SetActive(true);
        visualObj.SetActive(false);
    }
}
