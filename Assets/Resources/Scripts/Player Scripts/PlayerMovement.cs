using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(PlayerInputMap))]
[RequireComponent(typeof(CharacterController))]

public class PlayerMovement : MonoBehaviour
{
    public float speed;
    [Range(20f, 50f)]
    public float acceleration = 0.25f;
    public float gravity;
    public float jumpHeight;

    private bool _canMove;
    private bool _isGrounded;
    private PlayerInputMap _input;
    private CharacterController _myController;
    public Vector3 _moveDir;

    public bool CanMove
    {
        get { return _canMove; }
        set { _canMove = value; }
    }

    // Start is called before the first frame update
    void Start()
    {
        _input = GetComponent<PlayerInputMap>();
        _myController = GetComponent<CharacterController>();
        _canMove = true;
    }

    // Update is called once per frame
    void Update()
    {
        if (CanMove)
        {
            calculateMove();
            _myController.Move(_moveDir);
        }
    }

    private void calculateMove()
    {
        //Ground movemnt Calc
        _moveDir.x = Mathf.Lerp(_moveDir.x, _input.MoveData.x * speed * Time.deltaTime, acceleration * Time.deltaTime);
        _moveDir.z = Mathf.Lerp(_moveDir.z, _input.MoveData.y * speed * Time.deltaTime, acceleration * Time.deltaTime);

        //Gravity Calc
        _isGrounded = groundCheck();
        if (!_isGrounded)
            _moveDir.y -= gravity;
        else if (_input.Jump)
            _moveDir.y = jumpHeight;
    }
    private bool groundCheck()
    {
        return true;
    }
}
