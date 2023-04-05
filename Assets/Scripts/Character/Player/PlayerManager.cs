using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class PlayerManager : CharacterManager
    {
        PlayerLocomotionManager playerLocomotionManager;

        protected override void Awake()
        {
            base.Awake();

            // Do more stuff, only for the player

            playerLocomotionManager = GetComponent<PlayerLocomotionManager>();
        }

        protected override void Update()
        {
            base.Update();

            // Handle movement
            playerLocomotionManager.HandleAllMovement();
        }
    }

}
