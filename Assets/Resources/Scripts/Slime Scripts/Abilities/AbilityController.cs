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

    public Transform laneSpawn;
    public Transform coneSpawn;
    public Transform boundCircleSpawn;
    public Transform freeCircleSpawn;

    public List<AbilityForecast> abilityForecasts;//0 cone, 1 lane, 2 circle
    public AbilityForecast CurrentForcast { get; set; }
    public bool AbilityToggled { get; set; }

    private SlimeInputMap slimeInputMap;
    private FreeMoveAbility freeMoveAbility;
    private SlimeCombatCanvas canvas;
    private SlimeAnimator animator;

    private void Awake()
    {
        animator = GetComponent<SlimeAnimator>();
        slimeInputMap = GetComponent<SlimeInputMap>();
        SlimeData = GetComponent<Slime>();
        canvas = SlimeData.myCombatCanvas;
        freeMoveAbility = abilityForecasts[2].GetComponent<FreeMoveAbility>();

        for (int i = 0; i < abilityForecasts.Count; i++)
            abilityForecasts[i].Initialize();
    }
    private void AbilityUpdater()
    {
        SlimeData.BasicAttackTimer.UpdateMethod();
        for (int i = 0; i < SlimeData.AbilityTimers.Count; i++)
            SlimeData.AbilityTimers[i].UpdateMethod();
    }
    private void CheckRadialTimer(float _current, float _desired, float _max, int _index)
    {
        if(_current != _desired)
        {
            _current = _desired;
            canvas.SetAbilityFillMeter(_current, _max, _index);
        }

        if(SlimeData.AbilityTimers[_index].OnCooldown || SlimeData.AbilityTimers[_index].Timeout)
            canvas.SetAbilityMask(_index, true);
        else
            canvas.SetAbilityMask(_index, false);
    }
    private void AbilityCDVisuals()
    {
        CheckRadialTimer(canvas.AbilityTimer01, SlimeData.AbilityTimers[0].CooldownTimer, SlimeData.AbilityTimers[0].GlobalCD, 0);
        CheckRadialTimer(canvas.AbilityTimer02, SlimeData.AbilityTimers[1].CooldownTimer, SlimeData.AbilityTimers[1].GlobalCD, 1);
        CheckRadialTimer(canvas.AbilityTimer03, SlimeData.AbilityTimers[2].CooldownTimer, SlimeData.AbilityTimers[2].GlobalCD, 2);
    }
    void Update()
    {
        AbilityUpdater();
        AbilityCDVisuals();
        SlimeData.PassiveEnergyRegen();
        AbilityInputsCheck();
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
        {
            CurrentForcast = abilityForecasts[2];
            freeMoveAbility.Reach = _ability.freeCircleReach;
        }
        else if (_ability.forecast == BaseAbility.Forecast.BoundCircle)
            CurrentForcast = abilityForecasts[3];

        AbilityToggled = true;
        return true;
    }
    private void CheckAbilityInput(bool _input, int _index)
    {
        if(_input && !SlimeData.AbilityTimers[_index].OnCooldown)
        {
            if (SlimeData.CurrentEnergy < SlimeData.abilities[_index].abilityCost)
                return;//checks to make sure we have enough energy for ability to be toggled.

            CurrentIndex = _index;
            
            if (GetForecast(SlimeData.abilities[_index]))
            {
                //uses projection before cast
                CurrentForcast.EnableVisual(true, SlimeData.abilities[_index].forecastScaler);
            }
            else
            {                
                if(SlimeData.AbilityTimers[_index].ActivationCheck())
                {//instant cast
                    SlimeData.abilities[_index].AbilityActivated();//drain energy too!!!
                    SlimeData.DrainEnergy(SlimeData.abilities[_index].abilityCost);
                    CurrentIndex = -1;
                    SlimeData.BasicAttackTimer.Timeout = true;
                }
            }
        }
    }
    private Transform AssignCastPoint(BaseAbility _ability)
    {
        if (_ability.forecast == BaseAbility.Forecast.Lane)
            return laneSpawn;
        else if (_ability.forecast == BaseAbility.Forecast.Cone)
            return coneSpawn;
        else if (_ability.forecast == BaseAbility.Forecast.FreeCircle)
            return freeCircleSpawn;
        else if (_ability.forecast == BaseAbility.Forecast.BoundCircle || _ability.forecast == BaseAbility.Forecast.Instant)
            return boundCircleSpawn;

        return transform;
    }
    private void AbilityInputsCheck()
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
            {//cast ability | Read->(l-click/r-trigger hit)
                SlimeData.abilities[currentIndex].AbilityActivated(AssignCastPoint(SlimeData.abilities[currentIndex]), SlimeData);//drain energy too!!!
                SlimeData.DrainEnergy(SlimeData.abilities[currentIndex].abilityCost);
                CurrentIndex = -1;
                CurrentForcast.EnableVisual(false);
                SlimeData.BasicAttackTimer.Timeout = true;
            }
            else
            {//basic attack
                if(SlimeData.BasicAttackTimer.ActivationCheck())
                {
                    SlimeData.basicAttack.AbilityActivated(laneSpawn, SlimeData);
                    animator.PlayAnimEvent("Ranged Attack Basic");//temp
                    //animator.PlayAnimEvent("Melee Basic Attack");//temp
                }
            }
        }
        if (slimeInputMap.OnCancelHit > 0.35f)
        {
            if(AbilityToggled)
            {//cancel ability | Read->(r-click/l-trigger hit)
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
