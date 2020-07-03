using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DummyLeveling : MonoBehaviour
{
    public Slime testSlime;
    public Slider expBar;
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            testSlime.levelMapping.GainXP(10);
            testSlime.levelMapping.SetExperienceVisuals(expBar);
        }
    }
}
