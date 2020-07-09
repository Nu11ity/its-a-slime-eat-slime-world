// GENERATED AUTOMATICALLY FROM 'Assets/Resources/Scripts/Input Management/Input Actions/SlimeInputs.inputactions'

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

public class @SlimeInputs : IInputActionCollection, IDisposable
{
    public InputActionAsset asset { get; }
    public @SlimeInputs()
    {
        asset = InputActionAsset.FromJson(@"{
    ""name"": ""SlimeInputs"",
    ""maps"": [
        {
            ""name"": ""locomotion"",
            ""id"": ""9d720a01-74cf-4b2f-95fc-e38c350b6f6a"",
            ""actions"": [
                {
                    ""name"": ""move"",
                    ""type"": ""Value"",
                    ""id"": ""55724fe9-4046-43d9-80a0-9274f344ac6d"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""look"",
                    ""type"": ""Value"",
                    ""id"": ""de647cea-d0dc-4c14-98a9-ceaf71583011"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""jump"",
                    ""type"": ""Button"",
                    ""id"": ""e6a0c1a1-5281-463d-af45-58e3eeeefee2"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                }
            ],
            ""bindings"": [
                {
                    ""name"": """",
                    ""id"": ""7d51239e-d1a3-4ae9-a39b-6e5395c9864d"",
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
                    ""id"": ""7f4a9166-e859-4ac4-a48c-e56ad3d5c5a3"",
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
                    ""id"": ""d7599baa-2b29-4dd6-acd7-74d07b36c96b"",
                    ""path"": ""<Keyboard>/w"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""down"",
                    ""id"": ""47405688-3778-4021-8136-e0fc8711dfc4"",
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
                    ""id"": ""92888488-cd1f-4801-bd6a-bc2797919e16"",
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
                    ""id"": ""3d0d5b98-036f-4883-8b91-31dd363b07d7"",
                    ""path"": ""<Keyboard>/d"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""arrowKeys"",
                    ""id"": ""9a81c598-3930-4a50-8da1-e1319a2a9417"",
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
                    ""id"": ""bf83a077-c854-4c9c-8039-70b624fa1665"",
                    ""path"": ""<Keyboard>/upArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""down"",
                    ""id"": ""301c038e-e63b-40ec-aa6c-a90cdfd47810"",
                    ""path"": ""<Keyboard>/downArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""left"",
                    ""id"": ""b929c516-018c-4266-a59f-c023f36b2669"",
                    ""path"": ""<Keyboard>/leftArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""right"",
                    ""id"": ""11d9831c-4f01-488b-ba91-eeee462a9010"",
                    ""path"": ""<Keyboard>/rightArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": """",
                    ""id"": ""6d8fc2a5-949a-4117-af12-4434d99d3aa3"",
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
                    ""id"": ""b264c69d-a96f-4df9-8774-4716b7e2da02"",
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
                    ""id"": ""5a10cf5a-8ebf-42bf-b5bd-91e3b7660d37"",
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
                    ""id"": ""0378d302-9e63-4176-baa2-1e5dd2f881e6"",
                    ""path"": ""<Keyboard>/space"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""jump"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        },
        {
            ""name"": ""combat"",
            ""id"": ""8411ebb5-5642-404b-b029-055237f8744f"",
            ""actions"": [
                {
                    ""name"": ""action"",
                    ""type"": ""Value"",
                    ""id"": ""6f03ceb5-fcfc-4ad7-991d-156f1f0cd2af"",
                    ""expectedControlType"": ""Axis"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""cancel"",
                    ""type"": ""Button"",
                    ""id"": ""f3789e39-a0e6-40f7-8e79-fe9b325a48fa"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""ability01"",
                    ""type"": ""Button"",
                    ""id"": ""3c9fb02e-2425-4039-a52f-4680f7e2fbbe"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""ability02"",
                    ""type"": ""Button"",
                    ""id"": ""943e2836-9566-4e58-9575-1a9ff4a7d019"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""ability03"",
                    ""type"": ""Button"",
                    ""id"": ""4684b32b-a451-47f4-b7c5-bd71cc7d7060"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """"
                }
            ],
            ""bindings"": [
                {
                    ""name"": """",
                    ""id"": ""5381baf4-4099-4f6f-815b-02ffcf5d55a9"",
                    ""path"": ""<Mouse>/leftButton"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""action"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""0dc5b7db-0524-4ebe-a42e-47a54ca8350d"",
                    ""path"": ""<Gamepad>/rightTrigger"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""action"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""3d7d7f6a-a305-40e6-abe8-4e617b2b612a"",
                    ""path"": ""<Mouse>/rightButton"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""cancel"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""76e1086f-2ec9-4364-b33a-95a5a648d8f7"",
                    ""path"": ""<Gamepad>/leftTrigger"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""cancel"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""0c5e93ad-d65f-4fa4-8589-6aafe10a78d0"",
                    ""path"": ""<Keyboard>/q"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""ability01"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""8c8b8c12-4f58-42b8-b4a7-a8b6c7853a3c"",
                    ""path"": ""<Gamepad>/buttonWest"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""ability01"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""1001ff60-87e1-41f3-bd7b-5d8da0c2c0b8"",
                    ""path"": ""<Keyboard>/e"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""ability02"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""120aa4a5-c376-4df7-9dd9-c5d172e0d8e5"",
                    ""path"": ""<Gamepad>/buttonNorth"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""ability02"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""9cd8020d-0c03-46da-9e87-2f4ac2b558b1"",
                    ""path"": ""<Keyboard>/r"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""ability03"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""fa600660-5d0c-4c28-8bd0-6b8c9a7a3bc0"",
                    ""path"": ""<Gamepad>/buttonEast"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""ability03"",
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
        // combat
        m_combat = asset.FindActionMap("combat", throwIfNotFound: true);
        m_combat_action = m_combat.FindAction("action", throwIfNotFound: true);
        m_combat_cancel = m_combat.FindAction("cancel", throwIfNotFound: true);
        m_combat_ability01 = m_combat.FindAction("ability01", throwIfNotFound: true);
        m_combat_ability02 = m_combat.FindAction("ability02", throwIfNotFound: true);
        m_combat_ability03 = m_combat.FindAction("ability03", throwIfNotFound: true);
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
    public struct LocomotionActions
    {
        private @SlimeInputs m_Wrapper;
        public LocomotionActions(@SlimeInputs wrapper) { m_Wrapper = wrapper; }
        public InputAction @move => m_Wrapper.m_locomotion_move;
        public InputAction @look => m_Wrapper.m_locomotion_look;
        public InputAction @jump => m_Wrapper.m_locomotion_jump;
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
            }
        }
    }
    public LocomotionActions @locomotion => new LocomotionActions(this);

    // combat
    private readonly InputActionMap m_combat;
    private ICombatActions m_CombatActionsCallbackInterface;
    private readonly InputAction m_combat_action;
    private readonly InputAction m_combat_cancel;
    private readonly InputAction m_combat_ability01;
    private readonly InputAction m_combat_ability02;
    private readonly InputAction m_combat_ability03;
    public struct CombatActions
    {
        private @SlimeInputs m_Wrapper;
        public CombatActions(@SlimeInputs wrapper) { m_Wrapper = wrapper; }
        public InputAction @action => m_Wrapper.m_combat_action;
        public InputAction @cancel => m_Wrapper.m_combat_cancel;
        public InputAction @ability01 => m_Wrapper.m_combat_ability01;
        public InputAction @ability02 => m_Wrapper.m_combat_ability02;
        public InputAction @ability03 => m_Wrapper.m_combat_ability03;
        public InputActionMap Get() { return m_Wrapper.m_combat; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(CombatActions set) { return set.Get(); }
        public void SetCallbacks(ICombatActions instance)
        {
            if (m_Wrapper.m_CombatActionsCallbackInterface != null)
            {
                @action.started -= m_Wrapper.m_CombatActionsCallbackInterface.OnAction;
                @action.performed -= m_Wrapper.m_CombatActionsCallbackInterface.OnAction;
                @action.canceled -= m_Wrapper.m_CombatActionsCallbackInterface.OnAction;
                @cancel.started -= m_Wrapper.m_CombatActionsCallbackInterface.OnCancel;
                @cancel.performed -= m_Wrapper.m_CombatActionsCallbackInterface.OnCancel;
                @cancel.canceled -= m_Wrapper.m_CombatActionsCallbackInterface.OnCancel;
                @ability01.started -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility01;
                @ability01.performed -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility01;
                @ability01.canceled -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility01;
                @ability02.started -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility02;
                @ability02.performed -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility02;
                @ability02.canceled -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility02;
                @ability03.started -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility03;
                @ability03.performed -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility03;
                @ability03.canceled -= m_Wrapper.m_CombatActionsCallbackInterface.OnAbility03;
            }
            m_Wrapper.m_CombatActionsCallbackInterface = instance;
            if (instance != null)
            {
                @action.started += instance.OnAction;
                @action.performed += instance.OnAction;
                @action.canceled += instance.OnAction;
                @cancel.started += instance.OnCancel;
                @cancel.performed += instance.OnCancel;
                @cancel.canceled += instance.OnCancel;
                @ability01.started += instance.OnAbility01;
                @ability01.performed += instance.OnAbility01;
                @ability01.canceled += instance.OnAbility01;
                @ability02.started += instance.OnAbility02;
                @ability02.performed += instance.OnAbility02;
                @ability02.canceled += instance.OnAbility02;
                @ability03.started += instance.OnAbility03;
                @ability03.performed += instance.OnAbility03;
                @ability03.canceled += instance.OnAbility03;
            }
        }
    }
    public CombatActions @combat => new CombatActions(this);
    public interface ILocomotionActions
    {
        void OnMove(InputAction.CallbackContext context);
        void OnLook(InputAction.CallbackContext context);
        void OnJump(InputAction.CallbackContext context);
    }
    public interface ICombatActions
    {
        void OnAction(InputAction.CallbackContext context);
        void OnCancel(InputAction.CallbackContext context);
        void OnAbility01(InputAction.CallbackContext context);
        void OnAbility02(InputAction.CallbackContext context);
        void OnAbility03(InputAction.CallbackContext context);
    }
}
