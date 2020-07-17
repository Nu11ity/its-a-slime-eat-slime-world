using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AbilityController : MonoBehaviour
{
    public Slime SlimeData { get; set; }

    private int currentIndex;
    public int CurrentIndex
    {
        get { return currentIndex; }
        set
        {
            if (value < 0)
                AbilityToggled = false;
            else
                currentIndex = value;
        }
    }

    public List<AbilityForecast> abilityForecasts;//0 cone, 1 lane, 2 circle
    public AbilityForecast CurrentForcast { get; set; }
    public bool AbilityToggled { get; set; }

    private SlimeInputMap slimeInputMap;


    private void Awake()
    {
        slimeInputMap = GetComponent<SlimeInputMap>();
        SlimeData = GetComponent<Slime>();

        for (int i = 0; i < abilityForecasts.Count; i++)
            abilityForecasts[i].Initialize();
    }
    private void AbilityUpdater()
    {
        SlimeData.BasicAttackTimer.UpdateMethod();
        for (int i = 0; i < SlimeData.AbilityTimers.Count; i++)
            SlimeData.AbilityTimers[i].UpdateMethod();
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
    private void CheckAbilityInput(bool _input, int _index)
    {
        if(_input && !SlimeData.AbilityTimers[_index].OnCooldown)
        {
            CurrentIndex = _index;

            if (GetForecast(SlimeData.abilities[_index]))
            {
                //uses projection before cast
                CurrentForcast.EnableVisual(true, SlimeData.abilities[_index].forecastScaler);
            }
            else
            {
                //instant cast
                if(SlimeData.AbilityTimers[_index].ActivationCheck())
                {
                    SlimeData.abilities[_index].AbilityActivated();
                    CurrentIndex = -1;
                    SlimeData.BasicAttackTimer.Timeout = true;
                }
            }
        }
    }
    private void TempInputCalls()
    {
        if(!AbilityToggled)
        {
            CheckAbilityInput(slimeInputMap.Ability01Hit, 0);
            CheckAbilityInput(slimeInputMap.Ability02Hit, 1);
            CheckAbilityInput(slimeInputMap.Ability03Hit, 2);
        }     

        if (slimeInputMap.OnActionHit > 0.35f)
        {
            if(AbilityToggled && SlimeData.AbilityTimers[currentIndex].ActivationCheck())
            {//use ability | Read->(l-click/r-trigger hit)
                SlimeData.abilities[currentIndex].AbilityActivated();
                CurrentIndex = -1;
                CurrentForcast.EnableVisual(false);
                SlimeData.BasicAttackTimer.Timeout = true;
            }
            else
            {//basic attack
                if(SlimeData.BasicAttackTimer.ActivationCheck())
                {
                    SlimeData.basicAttack.AbilityActivated();
                }
            }
        }
        if (slimeInputMap.OnCancelHit > 0.35f)
        {
            if(AbilityToggled)
            {//cancel abil | Read->(r-click/l-trigger hit)
                CurrentIndex = -1;
                CurrentForcast.EnableVisual(false);
            }          
            else
            {
                return;
            }
        }
    }
}
