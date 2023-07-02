using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class CharacterAnimatorManager : MonoBehaviour
    {
        CharacterManager character;

        float horizontal;
        float vertical;

        protected virtual void Awake()
        {
            character = GetComponent<CharacterManager>();
        }

        public void UpdateAnimatorMovementParameters(float horizontalMovement, float verticalMovement)
        {
            character.animator.SetFloat("Horizontal", horizontalMovement, 0.1f, Time.deltaTime);
            character.animator.SetFloat("Vertical", verticalMovement, 0.1f, Time.deltaTime);
        }
    }

}
