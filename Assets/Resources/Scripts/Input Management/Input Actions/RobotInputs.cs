// GENERATED AUTOMATICALLY FROM 'Assets/Resources/Scripts/Input Management/Input Actions/RobotInputs.inputactions'

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

public class @RobotInputs : IInputActionCollection, IDisposable
{
    public InputActionAsset asset { get; }
    public @RobotInputs()
    {
        asset = InputActionAsset.FromJson(@"{
    ""name"": ""RobotInputs"",
    ""maps"": [
        {
            ""name"": ""locomotion"",
            ""id"": ""a6a04704-e35f-4843-be1f-e4ae61de4dd6"",
            ""actions"": [
                {
                    ""name"": ""move"",
                    ""type"": ""Value"",
                    ""id"": ""0d929231-7db4-41dd-8a3d-a0fc2100a45a"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""look"",
                    ""type"": ""Value"",
                    ""id"": ""568ff644-9968-4988-8731-ed80132cccb4"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""jump"",
                    ""type"": ""Button"",
                    ""id"": ""bb3bb77b-064d-443b-b5d4-138a6295e555"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""sprint"",
                    ""type"": ""Button"",
                    ""id"": ""e7c35173-0fbd-4009-85e8-6cdc02a97cd3"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                }
            ],
            ""bindings"": [
                {
                    ""name"": """",
                    ""id"": ""440a1d6d-4463-4003-bb5b-960d20ac7bd7"",
                    ""path"": ""<Gamepad>/leftStick"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""Dpad"",
                    ""id"": ""f3667dd3-eb49-44b0-b1cd-364bc284c02c"",
                    ""path"": ""2DVector"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": true,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""up"",
                    ""id"": ""8afff8e6-4cc5-4151-a6cb-06d54dbf7cad"",
                    ""path"": ""<Keyboard>/w"",
                    ""interactions"": """",
                    ""processors"": ""Scale(factor=0)"",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""down"",
                    ""id"": ""7a6d4f37-9b42-48ed-8dae-847aee539b35"",
                    ""path"": ""<Keyboard>/s"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""left"",
                    ""id"": ""ba2342fa-a6a5-4d5d-ac2c-19449abe0cc3"",
                    ""path"": ""<Keyboard>/a"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""right"",
                    ""id"": ""91607d58-6dfb-4705-aaf4-b57c794e0693"",
                    ""path"": ""<Keyboard>/d"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": """",
                    ""id"": ""ce714f3c-5a04-40b1-85ad-56d8e43e832a"",
                    ""path"": ""<Gamepad>/rightStick"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""look"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""7b8b63af-9498-41a9-948a-0a19530ac3b8"",
                    ""path"": ""<Pointer>/delta"",
                    ""interactions"": """",
                    ""processors"": ""ScaleVector2(x=0.1,y=0.1)"",
                    ""groups"": """",
                    ""action"": ""look"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""8e696712-353d-4d8d-8a65-a8c34ca4a202"",
                    ""path"": ""<Gamepad>/buttonSouth"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""jump"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""09387216-6ff7-4840-b6c3-ca7d999137c3"",
                    ""path"": ""<Keyboard>/space"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""jump"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""dba1b317-7176-41c3-9e10-d80a6ac9f78f"",
                    ""path"": ""<Keyboard>/leftShift"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""sprint"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""7823ec1a-0fd4-483c-89c3-374e61b5f863"",
                    ""path"": ""<Gamepad>/leftStickPress"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""sprint"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        },
        {
            ""name"": ""interaction"",
            ""id"": ""c26748bc-a5cb-4911-b7e7-ff68b03bf30d"",
            ""actions"": [
                {
                    ""name"": ""action"",
                    ""type"": ""Value"",
                    ""id"": ""b1f5554b-07bd-42cc-a1e1-25e67ed7993a"",
                    ""expectedControlType"": ""Axis"",
                    ""processors"": """",
                    ""interactions"": """"
                }
            ],
            ""bindings"": [
                {
                    ""name"": """",
                    ""id"": ""507026a1-b6f0-4225-a1ee-abf6757943d1"",
                    ""path"": """",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""action"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        }
    ],
    ""controlSchemes"": []
}");
        // locomotion
        m_locomotion = asset.FindActionMap("locomotion", throwIfNotFound: true);
        m_locomotion_move = m_locomotion.FindAction("move", throwIfNotFound: true);
        m_locomotion_look = m_locomotion.FindAction("look", throwIfNotFound: true);
        m_locomotion_jump = m_locomotion.FindAction("jump", throwIfNotFound: true);
        m_locomotion_sprint = m_locomotion.FindAction("sprint", throwIfNotFound: true);
        // interaction
        m_interaction = asset.FindActionMap("interaction", throwIfNotFound: true);
        m_interaction_action = m_interaction.FindAction("action", throwIfNotFound: true);
    }

    public void Dispose()
    {
        UnityEngine.Object.Destroy(asset);
    }

    public InputBinding? bindingMask
    {
        get => asset.bindingMask;
        set => asset.bindingMask = value;
    }

    public ReadOnlyArray<InputDevice>? devices
    {
        get => asset.devices;
        set => asset.devices = value;
    }

    public ReadOnlyArray<InputControlScheme> controlSchemes => asset.controlSchemes;

    public bool Contains(InputAction action)
    {
        return asset.Contains(action);
    }

    public IEnumerator<InputAction> GetEnumerator()
    {
        return asset.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }

    public void Enable()
    {
        asset.Enable();
    }

    public void Disable()
    {
        asset.Disable();
    }

    // locomotion
    private readonly InputActionMap m_locomotion;
    private ILocomotionActions m_LocomotionActionsCallbackInterface;
    private readonly InputAction m_locomotion_move;
    private readonly InputAction m_locomotion_look;
    private readonly InputAction m_locomotion_jump;
    private readonly InputAction m_locomotion_sprint;
    public struct LocomotionActions
    {
        private @RobotInputs m_Wrapper;
        public LocomotionActions(@RobotInputs wrapper) { m_Wrapper = wrapper; }
        public InputAction @move => m_Wrapper.m_locomotion_move;
        public InputAction @look => m_Wrapper.m_locomotion_look;
        public InputAction @jump => m_Wrapper.m_locomotion_jump;
        public InputAction @sprint => m_Wrapper.m_locomotion_sprint;
        public InputActionMap Get() { return m_Wrapper.m_locomotion; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(LocomotionActions set) { return set.Get(); }
        public void SetCallbacks(ILocomotionActions instance)
        {
            if (m_Wrapper.m_LocomotionActionsCallbackInterface != null)
            {
                @move.started -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnMove;
                @move.performed -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnMove;
                @move.canceled -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnMove;
                @look.started -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnLook;
                @look.performed -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnLook;
                @look.canceled -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnLook;
                @jump.started -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnJump;
                @jump.performed -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnJump;
                @jump.canceled -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnJump;
                @sprint.started -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnSprint;
                @sprint.performed -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnSprint;
                @sprint.canceled -= m_Wrapper.m_LocomotionActionsCallbackInterface.OnSprint;
            }
            m_Wrapper.m_LocomotionActionsCallbackInterface = instance;
            if (instance != null)
            {
                @move.started += instance.OnMove;
                @move.performed += instance.OnMove;
                @move.canceled += instance.OnMove;
                @look.started += instance.OnLook;
                @look.performed += instance.OnLook;
                @look.canceled += instance.OnLook;
                @jump.started += instance.OnJump;
                @jump.performed += instance.OnJump;
                @jump.canceled += instance.OnJump;
                @sprint.started += instance.OnSprint;
                @sprint.performed += instance.OnSprint;
                @sprint.canceled += instance.OnSprint;
            }
        }
    }
    public LocomotionActions @locomotion => new LocomotionActions(this);

    // interaction
    private readonly InputActionMap m_interaction;
    private IInteractionActions m_InteractionActionsCallbackInterface;
    private readonly InputAction m_interaction_action;
    public struct InteractionActions
    {
        private @RobotInputs m_Wrapper;
        public InteractionActions(@RobotInputs wrapper) { m_Wrapper = wrapper; }
        public InputAction @action => m_Wrapper.m_interaction_action;
        public InputActionMap Get() { return m_Wrapper.m_interaction; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(InteractionActions set) { return set.Get(); }
        public void SetCallbacks(IInteractionActions instance)
        {
            if (m_Wrapper.m_InteractionActionsCallbackInterface != null)
            {
                @action.started -= m_Wrapper.m_InteractionActionsCallbackInterface.OnAction;
                @action.performed -= m_Wrapper.m_InteractionActionsCallbackInterface.OnAction;
                @action.canceled -= m_Wrapper.m_InteractionActionsCallbackInterface.OnAction;
            }
            m_Wrapper.m_InteractionActionsCallbackInterface = instance;
            if (instance != null)
            {
                @action.started += instance.OnAction;
                @action.performed += instance.OnAction;
                @action.canceled += instance.OnAction;
            }
        }
    }
    public InteractionActions @interaction => new InteractionActions(this);
    public interface ILocomotionActions
    {
        void OnMove(InputAction.CallbackContext context);
        void OnLook(InputAction.CallbackContext context);
        void OnJump(InputAction.CallbackContext context);
        void OnSprint(InputAction.CallbackContext context);
    }
    public interface IInteractionActions
    {
        void OnAction(InputAction.CallbackContext context);
    }
}
