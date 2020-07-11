using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AbilityController : MonoBehaviour
{
    // Input scriptable object for platforms, or other solution
    // baseability slots
    // ref abilitymanager

    private SlimeInputMap slimeInputMap;

    void Awake()
    {
        slimeInputMap = GetComponent<SlimeInputMap>();
    }
    void Update()
    {
        TempInputCalls();
    }
    private void TempInputCalls()
    {
        if(slimeInputMap.Ability01Hit)
            Debug.Log("Read ability 01(q/x/square) toggled");
        if (slimeInputMap.Ability02Hit)
            Debug.Log("Read ability 02(e/y/triangle) toggled");
        if (slimeInputMap.Ability03Hit)
            Debug.Log("Read ability 03(r/b/circle) toggled");

        if (slimeInputMap.OnActionHit > 0.35f)
            Debug.Log("Read l-click/r-trigger hit");
        if (slimeInputMap.OnCancelHit > 0.35f)
            Debug.Log("Read r-click/l-trigger hit");
    }
}
