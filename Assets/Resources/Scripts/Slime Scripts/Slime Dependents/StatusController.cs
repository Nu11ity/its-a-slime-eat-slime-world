using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StatusController : MonoBehaviour
{
    public enum ControlType { Player, AI }
    public ControlType controlType;

    public BaseLocomotion SlimeLocomotion { get; set; }
    public BaseAbilityController SlimeController { get; set; }
    public Slime MySlime { get; set; }
    private float maxDuration = 10f;

    //Abilities in world will reference slime's status controls thru the myslime property set when ability is initialized.
    //Ability checks if ApplyPower is set to true/false, and fixes it's damage value based off this information. 
    //Percentage value should follow the protections value percentage.
    #region Power Methods
    public bool ApplyPower { get; set; }
    private float powerDuration;
    public float PowerDuration
    {
        get { return powerDuration; }
        set
        {
            powerDuration = value;
            powerDuration = Mathf.Clamp(powerDuration, 0, maxDuration);

            if (powerDuration > 0)
            {
                SetStatusUI(MySlime.MyCombatCanvas.powerStatusUI, 1);
                ApplyPower = true;
            }
            if(powerDuration <= 0)
            {
                MySlime.MyCombatCanvas.powerStatusUI.Reset();
                ApplyPower = false;
            }
        }
    }
    private void PowerTimer()
    {
        if (ApplyPower)
            PowerDuration -= Time.deltaTime;
    }
    public void SetPowerDuration(float _duration)
    {
        PowerDuration += _duration;
    }
    #endregion

    #region Protections Methods
    public bool ApplyProtection { get; set; }
    private float protectionDuration;
    public float ProtectionDuration
    {
        get { return protectionDuration; }
        set
        {
            protectionDuration = value;
            protectionDuration = Mathf.Clamp(protectionDuration, 0, maxDuration);

            if (protectionDuration > 0)
            {
                SetStatusUI(MySlime.MyCombatCanvas.protectionStatusUI, 1);
                ApplyProtection = true;
            }
            if (protectionDuration <= 0)
            {
                MySlime.MyCombatCanvas.protectionStatusUI.Reset();
                ApplyProtection = false;
            }
        }
    }
    private void ProtectionTimer()
    {
        if (ApplyProtection)
            ProtectionDuration -= Time.deltaTime;
    }
    public void SetProtectionDuration(float _duration)
    {
        ProtectionDuration += _duration;
    }
    #endregion

    #region Channeling Methods 
    private bool applyChannel;
    private float channelDuration;
    public float ChannelDuration
    {
        get { return channelDuration; }
        set
        {
            channelDuration = value;
            channelDuration = Mathf.Clamp(channelDuration, 0, maxDuration);

            if (channelDuration > 0)
            {
                SlimeController.RestrictCasting = true;
                applyChannel = true;
            }
            if(channelDuration <= 0)
            {
                SlimeController.RestrictCasting = false;
                applyChannel = false;
            }
        }
    }
    private void ChannelTimer()
    {
        if (applyChannel)
            ChannelDuration -= Time.deltaTime;
    }
    public void SetChannelDuration(float _duration)
    {
        ChannelDuration += _duration;
    }
    #endregion

    #region Silence Methods
    private bool applySilence;
    private float silenceDuration;
    public float SilenceDuration
    {
        get { return silenceDuration; }
        set
        {
            silenceDuration = value;
            silenceDuration = Mathf.Clamp(silenceDuration, 0, maxDuration);

            if (silenceDuration > 0)
            {
                SlimeController.CancelToggledAbility();
                SlimeController.RestrictCasting = true;
                applySilence = true;
            }
            if (silenceDuration <= 0)
            {
                SlimeController.RestrictCasting = false;
                applySilence = false;
            }
        }
    }
    private void SilenceTimer()
    {
        if (applySilence)
            SilenceDuration -= Time.deltaTime;
    }
    public void SetSilenceDuration(float _duration)
    {
        SilenceDuration += _duration;
    }
    #endregion

    #region Stun Methods
    private bool applyStun;
    private float stunDuration;
    public float StunDuration
    {
        get { return stunDuration; }
        set
        {
            stunDuration = value;
            stunDuration = Mathf.Clamp(stunDuration, 0, maxDuration);

            if (stunDuration > 0)
            {
                SlimeController.CancelToggledAbility();
                SlimeController.RestrictCasting = true;
                SlimeLocomotion.enableMovement = false;
                SetStatusUI(MySlime.MyCombatCanvas.stunStatusUI, -1);
                applyStun = true;
            }
            if (stunDuration <= 0)
            {
                if(!applyRoot)
                    SlimeLocomotion.enableMovement = true;
                MySlime.MyCombatCanvas.stunStatusUI.Reset();
                SlimeController.RestrictCasting = false;
                applyStun = false;
            }
        }
    }
    private void StunTimer()
    {
        if (applyStun)
            StunDuration -= Time.deltaTime;
    }
    public void SetStunDuration(float _duration)
    {
        StunDuration += _duration;
    }
    #endregion

    #region Rooted Methods
    private bool applyRoot;
    private float rootDuration;
    public float RootDuration
    {
        get { return rootDuration; }
        set
        {
            rootDuration = value;
            rootDuration = Mathf.Clamp(rootDuration, 0f, maxDuration);

            if (rootDuration > 0)
            {
                SlimeLocomotion.enableMovement = false;
                SetStatusUI(MySlime.MyCombatCanvas.rootStatusUI, -1);
                applyRoot = true;
            }
            if (rootDuration <= 0)
            {
                if(!applyStun)
                    SlimeLocomotion.enableMovement = true;
                MySlime.MyCombatCanvas.rootStatusUI.Reset();
                applyRoot = false;
            }

        }
    }
    private void RootTimer()
    {
        if (applyRoot)
            RootDuration -= Time.deltaTime;
    }
    public void SetRootDuration(float _duration)
    {
        RootDuration += _duration;
    }
    #endregion

    #region Slow Methods
    public float DefaultSpeed { get; set; }
    public float SlowIntensity { get; set; }
    private bool applySlow;
    private float slowDuration;
    public float SlowDuration
    {
        get { return slowDuration; }
        set
        {
            slowDuration = value;
            slowDuration = Mathf.Clamp(slowDuration, 0f, maxDuration);

            if (slowDuration > 0)
            {
                SetStatusUI(MySlime.MyCombatCanvas.speedStatusUI, -1);
                SlimeLocomotion.acceleration = SlowIntensity;
                applySlow = true;
            }
            if (slowDuration <= 0)
            {
                MySlime.MyCombatCanvas.speedStatusUI.Reset();
                SlimeLocomotion.acceleration = DefaultSpeed;
                applySlow = false;
            }

        }
    }
    private void SlowTimer()
    {
        if (applySlow)
            SlowDuration -= Time.deltaTime;
    }
    public void SetSlowDuration(float _duration, float _intensity)
    {
        if(slowDuration > 0)
            SlowDuration += _duration - slowDuration;
        else//Done so durations don't impede one another
            SlowDuration += _duration;

        if (_intensity > SlowIntensity)
            SlowIntensity = _intensity;
    }
    #endregion

    void Awake()
    {
        MySlime = GetComponent<Slime>();
        SlimeLocomotion = GetComponent<BaseLocomotion>();
        SlimeController = GetComponent<BaseAbilityController>();
        DefaultSpeed = SlimeLocomotion.acceleration;
    }  
    void Update()
    {
        PowerTimer();
        ProtectionTimer();
        ChannelTimer();
        SilenceTimer();
        StunTimer();
        RootTimer();
        SlowTimer();
    }
    public void RequestImpact(Vector3 _dir, float _force)
    {
        SlimeLocomotion.AddImpact(_dir, _force);
    }
    public void RequestContinousForce(Vector3 _dir, float _force)
    {
        SlimeLocomotion.ContinuousForce(_dir, _force);
    }
    public void StopController()
    {
        SlimeLocomotion.Stop();
    }
    public void SetStatusUI(StatusEffectUI _ui, int _value)
    {
        if (MySlime.CurrentHealth <= 0)
            return;

        _ui.SetState(_value);
        _ui.root.SetActive(true);     
    }
}
