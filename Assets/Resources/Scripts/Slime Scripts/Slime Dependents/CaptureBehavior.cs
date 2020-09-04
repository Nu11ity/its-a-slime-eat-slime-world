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
        MySlime.archetype = _root.archetype;
        MySlime.levelMapping.level = _root.levelMapping.level;
        MySlime.statMapping.genMap.generation = _root.statMapping.genMap.generation;
        MySlime.OnSpawnToWorld();
    }
    public void RemoveFromCombat()
    {
        defeatVFX.SetActive(true);
        visualObj.SetActive(false);
    }
}
