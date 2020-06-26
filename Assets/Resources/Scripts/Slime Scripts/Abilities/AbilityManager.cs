using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AbilityManager : MonoBehaviour
{
    #region Initializes AbilityManager on call
    private static AbilityManager instance;
    public static AbilityManager Instance
    {
        get
        {
            if (instance)
                return instance;
            else
                instance = CreateAbilityManager();

            return instance;
        }
    } 
    private static AbilityManager CreateAbilityManager()
    {
        GameObject newAM = new GameObject("Ability Manager");
        AbilityManager newAbilityManager = newAM.AddComponent<AbilityManager>();

        return newAbilityManager;
    }
    #endregion

    #region Pool Management and delegation
    #endregion
}
