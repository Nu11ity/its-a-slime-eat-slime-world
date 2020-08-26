using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIAbilityController : BaseAbilityController
{
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
    public override bool RestrictCasting
    {
        get { return restrictCasting; }
        set
        {
            restrictCasting = value;
            SlimeData.MyCombatCanvas.SilenceAll(value);
        }
    }

    public bool AbilityToggled { get; set; }

    private void Awake()
    {
        animator = GetComponent<SlimeAnimator>();
        SlimeData = GetComponent<Slime>();
        canvas = SlimeData.MyCombatCanvas;//maybe need?
    }
    private void AbilityUpdater()
    {
        SlimeData.BasicAttackTimer.UpdateMethod();
        for (int i = 0; i < SlimeData.AbilityTimers.Count; i++)
            SlimeData.AbilityTimers[i].UpdateMethod();
    }
    private void CheckRadialTimer(float _current, float _desired, float _max, int _index)
    {
        if (_current != _desired)
        {
            _current = _desired;
            canvas.SetAbilityFillMeter(_current, _max, _index);
        }

        if (SlimeData.AbilityTimers[_index].OnCooldown || SlimeData.AbilityTimers[_index].Timeout)
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
        if (_ability.forecast == BaseAbility.Forecast.Instant)
            return false;

        AbilityToggled = true;
        return true;
    }
    private void CheckAbilityInput(bool _inRange, int _index)
    {
        if (_inRange && !SlimeData.AbilityTimers[_index].OnCooldown)
        {
            if (SlimeData.CurrentEnergy < SlimeData.abilities[_index].abilityCost)
                return;//checks to make sure we have enough energy for ability to be toggled.

            CurrentIndex = _index;

            if (GetForecast(SlimeData.abilities[_index]))
            {
                //don't use forcasts as ai
                //CurrentForcast.EnableVisual(true, SlimeData.abilities[_index].forecastScaler);
            }
            else
            {
                if (SlimeData.AbilityTimers[_index].ActivationCheck())
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
    private bool AbilityInputDecision(int _index)
    {
        return false;
        //slime needs to judge it's actions
        //if in range do damage skill
        //if low on health, do healing skill
        //if inside combat range(or health drops), pop buff skill
        //
    }
    private void AbilityInputsCheck()
    {
        if (RestrictCasting)
            return;

        if (!AbilityToggled)
        {
            CheckAbilityInput(AbilityInputDecision(0), 0);
            CheckAbilityInput(AbilityInputDecision(1), 1);
            CheckAbilityInput(AbilityInputDecision(2), 2);
        }

        if (AbilityToggled && SlimeData.AbilityTimers[currentIndex].ActivationCheck())
        {//cast ability | Read->(l-click/r-trigger hit)
            SlimeData.abilities[currentIndex].AbilityActivated(AssignCastPoint(SlimeData.abilities[currentIndex]), SlimeData);//drain energy too!!!
            SlimeData.DrainEnergy(SlimeData.abilities[currentIndex].abilityCost);
            CurrentIndex = -1;
            //CurrentForcast.EnableVisual(false);
            SlimeData.BasicAttackTimer.Timeout = true;
        }
        else
        {//basic attack
            if (SlimeData.BasicAttackTimer.ActivationCheck())
            {
                SlimeData.basicAttack.AbilityActivated(laneSpawn, SlimeData);
                animator.PlayAnimEvent("Ranged Attack Basic");//temp
                //animator.PlayAnimEvent("Melee Basic Attack");//temp
            }
        }

        if (!AbilityToggled)
            return;

        CancelToggledAbility();
    }
    public override void CancelToggledAbility()
    {
        if (AbilityToggled)
        {//cancel ability | Read->(r-click/l-trigger hit)
            CurrentIndex = -1;
            //CurrentForcast.EnableVisual(false);
        }
    }
}
