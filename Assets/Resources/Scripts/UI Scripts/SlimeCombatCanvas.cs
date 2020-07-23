using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SlimeCombatCanvas : MonoBehaviour
{
    public Image healthBarMeter;
    public Image energyBarMeter;

    public List<Image> abilityIcons;
    public List<Image> abilityMeters;
    public List<GameObject> abilityMasks;

    public float AbilityTimer01 { get; set; }
    public float AbilityTimer02 { get; set; }
    public float AbilityTimer03 { get; set; }

    public void SetAbilityFillMeter(int _value, int _max, int _index)
    {
        abilityMeters[_index].fillAmount = (_value / _max);
    }
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

    public void SetHealthFillMeter(int _value, int _max)
    {
        healthBarMeter.fillAmount = (_value / _max);
    }
    public void SetEnergyFillMeter(float _value, float _max)
    {
        energyBarMeter.fillAmount = (_value / _max);
    }
}
