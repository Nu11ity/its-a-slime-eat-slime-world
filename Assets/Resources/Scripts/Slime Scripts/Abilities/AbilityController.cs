using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AbilityController : MonoBehaviour
{
    public BaseAbility basicAttack;
    public List<BaseAbility> myAbilities = new List<BaseAbility>();

    private BaseAbility currentAbility;
    public BaseAbility CurrentAbility
    {
        get { return currentAbility; }
        set
        {
            if (value == null)
                AbilityToggled = false;
            else
                currentAbility = value;
        }
    }

    public List<AbilityForecast> abilityForecasts;//0 cone, 1 lane, 2 circle
    public AbilityForecast CurrentForcast { get; set; }
    public bool AbilityToggled { get; set; }

    private SlimeInputMap slimeInputMap;


    private void Awake()
    {
        slimeInputMap = GetComponent<SlimeInputMap>();

        for (int i = 0; i < abilityForecasts.Count; i++)
            abilityForecasts[i].Initialize();
    }
    private void AbilityUpdater()
    {
        basicAttack.AbilityUpdateMethod();
        for (int i = 0; i < myAbilities.Count; i++)
            myAbilities[i].AbilityUpdateMethod();
    }
    void Update()
    {
        AbilityUpdater();
        //
        TempInputCalls();
    }
     
    private bool GetForecast(BaseAbility _ability)
    {
        if(_ability.forecast == BaseAbility.Forecast.Instant)
        {
            CurrentForcast = null;
            return false;
        }

        if(_ability.forecast == BaseAbility.Forecast.Cone)
            CurrentForcast = abilityForecasts[0];
        else if (_ability.forecast == BaseAbility.Forecast.Lane)
            CurrentForcast = abilityForecasts[1];
        else if (_ability.forecast == BaseAbility.Forecast.FreeCircle)
            CurrentForcast = abilityForecasts[2];
        else if (_ability.forecast == BaseAbility.Forecast.BoundCircle)
            CurrentForcast = abilityForecasts[3];

        AbilityToggled = true;
        return true;
    }
    private void CheckAbilityInput(bool _input, BaseAbility _ability)
    {
        if(_input && !_ability.OnCooldown)
        {
            CurrentAbility = _ability;

            if (GetForecast(_ability))
            {
                //uses projection before cast
                CurrentForcast.EnableVisual(true, _ability.forecastScaler);
            }
            else
            {
                //instant cast
                CurrentAbility.AbilityActivated();
                CurrentAbility = null;
                //activate global cd
            }
        }
    }
    private void TempInputCalls()
    {
        if(!AbilityToggled)
        {
            CheckAbilityInput(slimeInputMap.Ability01Hit, myAbilities[0]);
            CheckAbilityInput(slimeInputMap.Ability02Hit, myAbilities[1]);
            CheckAbilityInput(slimeInputMap.Ability03Hit, myAbilities[2]);
        }     

        if (slimeInputMap.OnActionHit > 0.35f)
        {
            if(AbilityToggled)
            {//use ability | Read->(l-click/r-trigger hit)
                CurrentAbility.AbilityActivated();
                CurrentAbility = null;
                CurrentForcast.EnableVisual(false);
            }
            else
            {//basic attack
                basicAttack.AbilityActivated();
            }
        }
        if (slimeInputMap.OnCancelHit > 0.35f)
        {
            if(AbilityToggled)
            {//cancel abil | Read->(r-click/l-trigger hit)
                CurrentAbility = null;
                CurrentForcast.EnableVisual(false);
            }          
            else
            {
                return;
            }
        }
    }
}
