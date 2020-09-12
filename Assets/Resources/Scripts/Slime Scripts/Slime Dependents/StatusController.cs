﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StatusController : MonoBehaviour
{
    public enum ControlType { Player, AI }
    public ControlType controlType;

    public BaseLocomotion SlimeLocomotion { get; set; }
    public BaseAbilityController SlimeController { get; set; }
    public Slime MySlime { get; set; }

    #region Silence Methods
    [Header("Silence data")]
    public float maxSilencedDuration;
    private bool applySilence;
    private float silenceDuration;
    public float SilenceDuration
    {
        get { return silenceDuration; }
        set
        {
            silenceDuration = value;
            if(silenceDuration > 0)
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
    [Header("Stun data")]
    public float maxStunDuration;
    private bool applyStun;
    private float stunDuration;
    public float StunDuration
    {
        get { return stunDuration; }
        set
        {
            stunDuration = value;
            stunDuration = Mathf.Clamp(stunDuration, 0, maxStunDuration);

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
    [Header("Root data")]
    public float maxRootDuration;
    private bool applyRoot;
    private float rootDuration;
    public float RootDuration
    {
        get { return rootDuration; }
        set
        {
            rootDuration = value;
            rootDuration = Mathf.Clamp(rootDuration, 0f, maxRootDuration);

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
    [Header("Slow data")]
    public float maxSlowDuration;
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
            slowDuration = Mathf.Clamp(slowDuration, 0f, maxSlowDuration);

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
        SilenceTimer();
        StunTimer();
        RootTimer();
        SlowTimer();
    }
    public void RequestImpact(Vector3 _dir, float _force)
    {
        SlimeLocomotion.AddImpact(_dir, _force);
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