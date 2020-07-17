using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ability", menuName = "Abilities/WaterType/Ocean Torrent")]
public class OceanTorrent : BaseAbility
{
    public override void AbilityActivated()
    {
        Debug.Log("Used Ocean Torrent");
        //pool at slime position, keeps pulling enemy slimes to center while dealing continuous damage
    }
}
