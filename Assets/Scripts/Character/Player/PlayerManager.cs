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

            // If we do not own this gameobject, we do not control or edit it
            if (!IsOwner)
                return;

            // Handle movement
            playerLocomotionManager.HandleAllMovement();
        }
    }

}
