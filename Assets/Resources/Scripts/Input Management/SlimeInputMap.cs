using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SlimeInputMap : MonoBehaviour
{
    public SlimeInputs SlimeInput { get; set; }

    public Vector2 MoveData { get; set; }
    public Vector2 LookData { get; set; }
    public bool Jump { get; set; }

    public bool Ability01Hit { get; set; }
    public bool Ability02Hit { get; set; }
    public bool Ability03Hit { get; set; }

    public float OnActionHit { get; set; }
    public float OnCancelHit { get; set; }

    void Awake()
    {
        SlimeInput = new SlimeInputs();
    }
    void OnEnable()
    {
        SlimeInput.Enable();
    }
    void OnDisable()
    {
        SlimeInput.Disable();
    }
    void Update()
    {
        //movement and camera involved
        LookData = SlimeInput.locomotion.look.ReadValue<Vector2>();
        MoveData = SlimeInput.locomotion.move.ReadValue<Vector2>();
        Jump = SlimeInput.locomotion.jump.triggered;

        //combat involved
        Ability01Hit = SlimeInput.combat.ability01.triggered;
        Ability02Hit = SlimeInput.combat.ability02.triggered;
        Ability03Hit = SlimeInput.combat.ability03.triggered;

        OnActionHit = SlimeInput.combat.action.ReadValue<float>();
        OnCancelHit = SlimeInput.combat.cancel.ReadValue<float>();
    }
}
