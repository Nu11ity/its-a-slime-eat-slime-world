using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StatusController : MonoBehaviour
{
    public enum ControlType { Player, AI }
    public ControlType controlType;

    public BaseLocomotion SlimeLocomotion { get; set; }
    public BaseAbilityController SlimeController { get; set; }

    public float maxStunDuration;
    private bool applyStun;
    private float stunDuration;
    public float StunDuration
    {
        get { return stunDuration; }
        set
        {
            stunDuration = value;
            if (stunDuration > 0)
            {
                SlimeController.CancelToggledAbility();
                SlimeController.RestrictCasting = true;
                SlimeLocomotion.enableMovement = false;
                applyStun = true;
            }
            if (stunDuration <= 0)
            {
                if(!applyRoot)
                    SlimeLocomotion.enableMovement = true;
                SlimeController.RestrictCasting = false;
                applyStun = false;
            }

            stunDuration = Mathf.Clamp(stunDuration, 0, maxStunDuration);
        }
    }

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
                applyRoot = true;
            }
            if (rootDuration <= 0)
            {
                if(!applyStun)
                    SlimeLocomotion.enableMovement = true;
                applyRoot = false;
            }

        }
    }

    void Awake()
    {
        SlimeLocomotion = GetComponent<BaseLocomotion>();
        SlimeController = GetComponent<BaseAbilityController>();
    }  
    void Update()
    {
        RootTimer();
        StunTimer();
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
    private void RootTimer()
    {
        if (applyRoot)
            RootDuration -= Time.deltaTime;
    }
    public void SetRootDuration(float _duration)
    {
        RootDuration += _duration;
    }
    public void RequestImpact(Vector3 _dir, float _force)
    {
        SlimeLocomotion.AddImpact(_dir, _force);
    }
    public void StopController()
    {
        SlimeLocomotion.Stop();
    }
}
