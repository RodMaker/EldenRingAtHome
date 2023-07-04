using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace RM
{
    public class PlayerInputManager : MonoBehaviour
    {
        // Think about goals in steps
        // 1. Find a way to read the values of a gamepad
        // 2. Move character based on those values

        public static PlayerInputManager instance;
        public PlayerManager player;

        PlayerControls playerControls;

        [Header("CAMERA MOVEMENT INPUT")]
        [SerializeField] Vector2 cameraInput;
        public float cameraVerticalInput;
        public float cameraHorizontalInput;

        [Header("PLAYER MOVEMENT INPUT")]
        [SerializeField] Vector2 movementInput;
        public float verticalInput;
        public float horizontalInput;
        public float moveAmount;

        [Header("PLAYER ACTION INPUT")]
        [SerializeField] bool dodgeInput = false;
        [SerializeField] bool sprintInput = false;

        private void Awake()
        {
            if (instance == null)
            {
                instance = this;
            }
            else
            {
                Destroy(gameObject);
            }
        }

        private void Start()
        {
            DontDestroyOnLoad(gameObject);
            
            // When the scene changes, run this logic
            SceneManager.activeSceneChanged += OnSceneChange;
            
            instance.enabled = false;
        }

        private void OnSceneChange(Scene oldScene, Scene newScene)
        {
            // If we are loading into our world scene, enable our player controls
            if (newScene.buildIndex == WorldSaveGameManager.instance.GetWorldSceneIndex())
            {
                instance.enabled = true;
            }
            // Otherwise we must be at the main menu, disable our player controls
            // This is so our player can't move around if we enter things like a character creation menu, etc
            else
            {
                instance.enabled = false;
            }
        }

        private void OnEnable()
        {
            if (playerControls == null)
            {
                playerControls = new PlayerControls();

                playerControls.PlayerMovement.Movement.performed += i => movementInput = i.ReadValue<Vector2>();
                playerControls.PlayerCamera.Movement.performed += i => cameraInput = i.ReadValue<Vector2>();
                playerControls.PlayerActions.Dodge.performed += i => dodgeInput = true;

                // Holding the input, sets the bool to true
                playerControls.PlayerActions.Sprint.performed += i => sprintInput = true;
                // Releasing the input, sets the bool to false
                playerControls.PlayerActions.Sprint.canceled += i => sprintInput = false;
            }

            playerControls.Enable();
        }

        private void OnDestroy()
        {
            // If we destroy this object, unsubscribe from this event
            SceneManager.activeSceneChanged -= OnSceneChange;
        }

        // If we minimize or lower the window, stop adjusting inputs
        private void OnApplicationFocus(bool focus)
        {
            if (enabled) 
            {
                if (focus)
                {
                    playerControls.Enable();
                }
                else
                { 
                    playerControls.Disable();
                }
            }
        }

        private void Update()
        {
            HandleAllInputs();
        }

        private void HandleAllInputs()
        {
            HandlePlayerMovementInput();
            HandleCameraMovementInput();
            HandleDodgeInput();
            HandleSprinting();
        }

        // Movement

        private void HandlePlayerMovementInput()
        {
            verticalInput = movementInput.y;
            horizontalInput = movementInput.x;

            // Returns the absolute number, (meaning number without the negative sign, so it's always positive)
            moveAmount = Mathf.Clamp01(Mathf.Abs(verticalInput) + Mathf.Abs(horizontalInput));

            // We clamp the values, so they are 0, 0.5 or 1
            if (moveAmount <= 0.5 && moveAmount > 0)
            {
                moveAmount = 0.5f;
            }
            else if (moveAmount > 0.5 && moveAmount <= 1)
            {
                moveAmount = 1;
            }

            // Why do we pass 0 on the horizontal? Because we only want non-strafing movement
            // We use the horizontal when we are strafing or locked on

            if (player == null)
                return;

            // If we are not locked on, only use the move amount
            player.playerAnimatorManager.UpdateAnimatorMovementParameters(0, moveAmount, player.playerNetworkManager.isSprinting.Value);

            // If we are locked on pass the horizontal movement as well
        }

        private void HandleCameraMovementInput()
        {
            cameraVerticalInput = cameraInput.y;
            cameraHorizontalInput = cameraInput.x;
        }

        // Action

        private void HandleDodgeInput()
        {
            if (dodgeInput)
            {
                dodgeInput = false;

                // Future note: Return (do nothing) if menu or ui window is open

                // Perform a dodge
                player.playerLocomotionManager.AttemptToPerformDodge();
            }
        }

        private void HandleSprinting()
        {
            if (sprintInput)
            {
                // Handle sprinting
                player.playerLocomotionManager.HandleSprinting();
            }
            else
            {
                player.playerNetworkManager.isSprinting.Value = false;
            }
        }
    }

}
