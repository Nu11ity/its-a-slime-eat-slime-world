using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CaptureBehavior : MonoBehaviour
{
    public GameObject defeatVFX;
    public GameObject visualObj;
    public BaseSlime slimeData;
    public Slime MySlime { get; set; }

    void Awake()
    {
        MySlime = GetComponent<Slime>();
    }
    public void FeedSlimeData(BaseSlime _root)
    {//called from slime challenged to combat when loading in combat scene
        MySlime.data.archetype = _root.data.archetype;
        MySlime.data.levelMapping.level = _root.data.levelMapping.level;
        MySlime.data.statMapping.genMap.gen = _root.data.statMapping.genMap.gen;
        MySlime.OnSpawnToWorld();
    }
    public void RemoveFromCombat()
    {
        defeatVFX.SetActive(true);
        visualObj.SetActive(false);
    }
}
