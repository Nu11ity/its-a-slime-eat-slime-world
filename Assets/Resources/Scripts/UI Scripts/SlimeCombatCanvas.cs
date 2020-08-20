using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class SlimeCombatCanvas : MonoBehaviour
{
    [Header("Health/Energy")]
    public Image healthBarMeter;
    public Image energyBarMeter;

    [Header("Ability Icons")]
    public List<Image> abilityIcons;
    public List<Image> abilityMeters;
    public List<GameObject> abilityMasks;

    public float AbilityTimer01 { get; set; }
    public float AbilityTimer02 { get; set; }
    public float AbilityTimer03 { get; set; }

    [Header("Slime Portrais/abilities")]
    public List<Slime> slimes = new List<Slime>();
    public List<Image> portraits = new List<Image>();

    public void SetLineup(Slime _requester)
    {
        if (!slimes.Contains(_requester))
        {
            slimes.Add(_requester);
        }
    }
    public void SetPortraits()
    {
        for (int i = 0; i < slimes.Count; i++)
        {
            portraits[i].sprite = slimes[i].MyPortrait;
        }
    }

    // Ability Icon Set Methods
    public void SetAbilityFillMeter(float _value, float _max, int _index)
    {
        abilityMeters[_index].fillAmount = (_value / _max);
    }
    public void SetAbilityMask(int _index, bool _state)
    {
        abilityMasks[_index].SetActive(_state);
    }
    public void SetAbilityIcon(int _index, Sprite _sprite)
    {
        abilityIcons[_index].sprite = _sprite;
    }
    //Health/ Energy Set Methods
    public void SetHealthFillMeter(float _value, float _max)
    {
        healthBarMeter.fillAmount = (_value / _max);
    }
    public void SetEnergyFillMeter(float _value, float _max)
    {
        energyBarMeter.fillAmount = (_value / _max);
    }
}
