﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(PlayerInputMap))]
[RequireComponent(typeof(CharacterController))]

public class PlayerMovement : MonoBehaviour
{
    [Space(10), Header("Look Stats")]
    public Camera playerCam;
    public float sensitivity;

    [Space(10),Header("Move Stats")]
    public float speed;
    public float acceleration;
    public float gravity;
    public float jumpHeight;

    private bool _canMove;
    private bool _isGrounded;
    private PlayerInputMap _input;
    private CharacterController _myController;

    public bool CanMove
    {
        get { return _canMove; }
        set { _canMove = value; }
    }

    private void Start()
    {
        _input = GetComponent<PlayerInputMap>();
        _myController = GetComponent<CharacterController>();
        _canMove = true;

        Cursor.lockState = CursorLockMode.Locked;
    }
    private void Update()
    {
        if (CanMove)
        {
            calculateLookDir();
            calculateMove();
            _myController.Move(_moveDir);
        }
    }

    private float _xRot;
    private float _yRot;
    private void calculateLookDir()
    {
        _xRot -= _input.LookData.y * sensitivity * Time.deltaTime;
        _xRot = Mathf.Clamp(_xRot, -60f, 60f);
        _yRot = _input.LookData.x * sensitivity * Time.deltaTime;

        playerCam.transform.localRotation = Quaternion.Euler(_xRot, 0f, 0f);
        transform.Rotate(Vector3.up * _yRot);
    }

    private float _targetXDir;
    private float _targetZDir;
    private Vector3 _moveDir;
    private void calculateMove()
    {
        _isGrounded = groundCheck();

        if (_isGrounded)
        {
            //Ground input
            _targetXDir = Mathf.Lerp(_targetXDir, _input.MoveData.x, acceleration * Time.deltaTime);
            _targetZDir = Mathf.Lerp(_targetZDir, _input.MoveData.y, acceleration * Time.deltaTime);
        }
        else
        {
            //Air input
            _targetXDir = Mathf.Lerp(_targetXDir, _input.MoveData.x, acceleration/7 * Time.deltaTime);
            _targetZDir = Mathf.Lerp(_targetZDir, _input.MoveData.y, acceleration/7 * Time.deltaTime);
        }

        if (Mathf.Abs(_targetXDir) < 0.001f)
            _targetXDir = 0;
        if (Mathf.Abs(_targetZDir) < 0.001f)
            _targetZDir = 0;

        _moveDir.x = _targetXDir * speed * Time.deltaTime;
        _moveDir.z = _targetZDir * speed * Time.deltaTime;
        _moveDir = transform.TransformDirection(_moveDir);

        //Gravity Calc
        if (!_isGrounded)
            _moveDir.y -= gravity * Time.deltaTime;
        else if (_input.Jump)
            _moveDir.y = jumpHeight * 0.05f;
        else
            _moveDir.y = 0;
    }

    private bool groundCheck()
    {
        //Redo this function so that it acounts for width of character
        return Physics.Raycast(transform.position, Vector3.down, 1.01f);
    }
}