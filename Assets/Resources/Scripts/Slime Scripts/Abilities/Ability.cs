using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//[System.Serializable]
//public class Ability
//{
//    public BaseAbility baseAbility;

//    public bool OnCooldown { get; set; }
//    private float cooldownTimer;

//    public void OnActivation()
//    {
//        if (OnCooldown)
//            return;

//        Debug.LogError("Used Ability");
//        OnCooldown = true;
//        baseAbility.RequestActivation();
//    }
//    public void AbilityUpdateMethod()
//    {
//        if(OnCooldown)
//        {
//            cooldownTimer += Time.deltaTime;

//            if(cooldownTimer <= baseAbility.globalCD)
//            {
//                OnCooldown = false;
//                cooldownTimer = 0;
//            }
//        }
//    }
//}
