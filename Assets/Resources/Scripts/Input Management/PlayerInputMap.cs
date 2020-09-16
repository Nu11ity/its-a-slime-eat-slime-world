using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInputMap : MonoBehaviour
{
    private RobotInputs playerInput;
    public RobotInputs PlayerInput
    {
        get
        {
            if(playerInput == null)
                playerInput = new RobotInputs();

            return playerInput;
        }
    }

    public Vector2 LookData { get; set; }
    public Vector2 MoveData { get; set; }

    public bool Jump { get; set; }
    public bool Sprint { get; set; }

    public bool Interact
    {
        get
        {
            return PlayerInput.interaction.Interact.triggered;
        }
    }

    void OnEnable()
    {
        PlayerInput.Enable();
    }
    void OnDisable()
    {
        PlayerInput.Disable();
    }
    void Update()
    {
        LookData = PlayerInput.locomotion.look.ReadValue<Vector2>();
        MoveData = PlayerInput.locomotion.move.ReadValue<Vector2>();

        Jump = PlayerInput.locomotion.jump.triggered;
        Sprint = PlayerInput.locomotion.sprint.triggered;
    }
}
