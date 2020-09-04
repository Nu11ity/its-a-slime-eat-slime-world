using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIAbilityController : BaseAbilityController
{
    public AILocomotion Locomotion { get; set; }
    public bool AbilityToggled { get; set; }

    public bool Tracker { get; set; }

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
    public bool IsAliveBehavior
    {
        get
        {//Read only
            if(!SlimeData.IsAlive)
            {
                Locomotion.DisableBehavior = true;
                CancelToggledAbility();
                SlimeData.MyCombatCanvas.ClearDefeatedSlimeData();
                return false;
            }
            return true;
        }
    }
    private void Awake()
    {
        animator = GetComponent<SlimeAnimator>();
        SlimeData = GetComponent<Slime>();
        canvas = SlimeData.MyCombatCanvas;//maybe need?
        Locomotion = GetComponent<AILocomotion>();
    }
    private void AbilityUpdater()
    {
        Tracker = Locomotion.EnemyActive;

        if (!Locomotion.EnemyActive)
        {
            Locomotion.controlledState = AILocomotion.ControlledState.Waiting;
        }
        else if(Locomotion.EnemyActive)
        {
            if (SlimeData.CurrentHealth <= SlimeData.MaxHealth / 2)
                Locomotion.controlledState = AILocomotion.ControlledState.Defensive;
            else//need to add stragegic as well.....
                Locomotion.controlledState = AILocomotion.ControlledState.Aggressive;
        }        

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
        if (!IsAliveBehavior)
            return;

        AbilityUpdater();
        AbilityCDVisuals();
        SlimeData.PassiveEnergyRegen();
        AbilityInputsCheck();
    }

    private void CheckAbilityInput(bool _decision, int _index)
    {
        if (_decision && !SlimeData.AbilityTimers[_index].OnCooldown)
        {
            if (SlimeData.CurrentEnergy < SlimeData.abilities[_index].abilityCost)
                return;

            CurrentIndex = _index;
            AbilityToggled = true;
        }
    }
    private Transform AssignCastPoint(BaseAbility _ability)
    {
        if (_ability.abilityModuleData.projection == AbilityModulesData.Projection.Lane)
            return laneSpawn;
        else if (_ability.abilityModuleData.projection == AbilityModulesData.Projection.Cone)
            return coneSpawn;
        else if (_ability.abilityModuleData.projection == AbilityModulesData.Projection.Free)
        {//spawn effect on player
            freeCircleSpawn.position = new Vector3(Locomotion.TargetSlime.transform.position.x, 
                freeCircleSpawn.position.y, Locomotion.TargetSlime.transform.position.z);
            return freeCircleSpawn;
        }
        else if (_ability.abilityModuleData.projection == AbilityModulesData.Projection.Bound ||
            _ability.abilityModuleData.projection == AbilityModulesData.Projection.Instant)
            return boundCircleSpawn;

        return transform;
    }
    private bool AbilityInputDecision(int _index)
    {
        if(SlimeData.abilities[_index].abilityModuleData.projection == AbilityModulesData.Projection.Free)
        {
            if (Locomotion.Distance <= SlimeData.abilities[_index].abilityModuleData.moduleData[0].modifier)
                return true;

            return false;
        }
        else if(SlimeData.abilities[_index].abilityModuleData.projection == AbilityModulesData.Projection.Bound)
        {//more data 
            bool healthFull = (SlimeData.CurrentHealth >= SlimeData.MaxHealth);

            if (!healthFull && SlimeData.abilities[_index].abilityFunctions.Contains(BaseAbility.AbilityFunction.Heal))
                return true;
            if (Locomotion.Distance <= SlimeData.abilities[_index].abilityModuleData.moduleData[0].modifier)
                return true;

            return false;
        }
        else if(SlimeData.abilities[_index].abilityModuleData.projection == AbilityModulesData.Projection.Lane)
        {
            if(Locomotion.Distance <= SlimeData.abilities[_index].abilityModuleData.moduleData[0].modifier)
            {
                Locomotion.LeadSpeed = SlimeData.abilities[_index].abilityModuleData.moduleData[1].modifier;
                return true;
            }
            return false; 
        }
        else if (SlimeData.abilities[_index].abilityModuleData.projection == AbilityModulesData.Projection.Cone)
        {
            if (Locomotion.Distance <= SlimeData.abilities[_index].abilityModuleData.moduleData[0].modifier)
                return true;

            return false;
        }
        else if(SlimeData.abilities[_index].abilityModuleData.projection == AbilityModulesData.Projection.Instant)
        {
            bool healthFull = (SlimeData.CurrentHealth >= SlimeData.MaxHealth);
            if (!healthFull && SlimeData.abilities[_index].abilityFunctions.Contains(BaseAbility.AbilityFunction.Heal))
                return true;
            //check if cast heals, do it!
            //check if provides protection, do it!
            //etc....etc...
        }

        return false;
        //slime needs to judge it's actions
        //if in range do damage skill
        //if low on health, do healing skill
        //if inside combat range(or health drops), pop buff skill
    }
    private void AbilityInputsCheck()
    {
        if (RestrictCasting || !Locomotion.EnemyActive)
            return;

        if (!AbilityToggled)
        {
            CheckAbilityInput(AbilityInputDecision(0), 0);
            CheckAbilityInput(AbilityInputDecision(1), 1);
            CheckAbilityInput(AbilityInputDecision(2), 2);
        }

        if (AbilityToggled && SlimeData.AbilityTimers[currentIndex].ActivationCheck())
        {//cast ability
            //SlimeData.MyStatusControls.SetSlowDuration(1, .25f);
            SlimeData.abilities[currentIndex].AbilityActivated(AssignCastPoint(SlimeData.abilities[currentIndex]), SlimeData);
            SlimeData.DrainEnergy(SlimeData.abilities[currentIndex].abilityCost);
            CurrentIndex = -1;
            SlimeData.BasicAttackTimer.Timeout = true;
        }
        else
        {//basic attack
            if (SlimeData.BasicAttackTimer.ActivationCheck() && Locomotion.Distance <= SlimeData.basicAttack.abilityModuleData.moduleData[0].modifier)
            {
                SlimeData.MyStatusControls.SetSlowDuration(SlimeData.basicAttack.globalCD, .25f);
                Locomotion.LeadSpeed = SlimeData.basicAttack.abilityModuleData.moduleData[1].modifier;
                SlimeData.basicAttack.AbilityActivated(laneSpawn, SlimeData);
                animator.PlayAnimEvent("Ranged Attack Basic");
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
