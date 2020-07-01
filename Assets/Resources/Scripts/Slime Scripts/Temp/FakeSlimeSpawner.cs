using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FakeSlimeSpawner : MonoBehaviour
{
    public List<Slime> mySlimes;
    public List<Transform> spawnNodes;

    public int minLevelHere;
    public int maxLevelHere;

    public float rareSpawnChance;
    public List<GenerationMapping.Generation> commonGensInArea;
    public List<GenerationMapping.Generation> rareGensInArea;

    public List<Slime.Archetype> commonTypesInArea;
    public List<Slime.Archetype> rareTypesInArea;


    void Start()
    {
        for (int i = 0; i < mySlimes.Count; i++)
            SlimeSetup(mySlimes[i]);
    }

    private void SlimeSetup(Slime _slime)
    {
        int spawnNode = Random.Range(0, spawnNodes.Count);

        _slime.transform.parent = spawnNodes[spawnNode];
        _slime.transform.position = spawnNodes[spawnNode].position;
        _slime.transform.rotation = spawnNodes[spawnNode].rotation;


        float typeChance = Random.value;

        if (typeChance <= rareSpawnChance)
        {//rare spawn
            _slime.levelMapping.level = Random.Range(maxLevelHere, maxLevelHere += 11);

            for (int i = 0; i < rareTypesInArea.Count; i++)
                _slime.archetype = rareTypesInArea[Random.Range(0, rareTypesInArea.Count)];

            for (int i = 0; i < rareGensInArea.Count; i++)
                _slime.statMapping.genMap.generation = rareGensInArea[Random.Range(0, rareGensInArea.Count)];
        }
        else
        {//normal Spawn
            _slime.levelMapping.level = Random.Range(minLevelHere, maxLevelHere++);

            for (int i = 0; i < commonTypesInArea.Count; i++)
                _slime.archetype = commonTypesInArea[Random.Range(0, commonTypesInArea.Count)];

            for (int i = 0; i < commonGensInArea.Count; i++)
                _slime.statMapping.genMap.generation = commonGensInArea[Random.Range(0, commonGensInArea.Count)];
        }

        _slime.OnSpawnedToWorld();
    }
}
