using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using UnityEngine;

namespace RM
{
    public class CharacterStatsManager : MonoBehaviour
    {
        CharacterManager character;

        [Header("Stamina Regeneration")]
        [SerializeField] float staminaRegenerationAmount = 2;
        private float staminaRegenerationTimer = 0;
        private float staminaTickTimer = 0;
        [SerializeField] float staminaRegenerationDelay = 2;

        protected virtual void Awake() 
        { 
            character = GetComponent<CharacterManager>();
        }

        protected virtual void Start()
        {

        }

        public int CalculateHealthBasedOnVitalityLevel(int vitality)
        {
            float health = 0;

            // Create an equation for how you want your health to be calculated
            health = vitality * 15;

            return Mathf.RoundToInt(health);
        }

        public int CalculateStaminaBasedOnEnduranceLevel(int endurance)
        {
            float stamina = 0;

            // Create an equation for how you want your stamina to be calculated
            stamina = endurance * 10;

            return Mathf.RoundToInt(stamina);
        }

        public virtual void RegenerateStamina()
        {
            // Only owners can edit their network variables
            if (!character.IsOwner)
                return;

            // We do not want to regenerate stamina if we are using it
            if (character.characterNetworkManager.isSprinting.Value)
                return;

            if (character.isPerformingAction)
                return;

            staminaRegenerationTimer += Time.deltaTime;

            if (staminaRegenerationTimer >= staminaRegenerationDelay)
            {
                if (character.characterNetworkManager.currentStamina.Value < character.characterNetworkManager.maxStamina.Value)
                {
                    staminaTickTimer += Time.deltaTime;

                    if (staminaTickTimer >= 0.1)
                    {
                        staminaTickTimer = 0;
                        character.characterNetworkManager.currentStamina.Value += staminaRegenerationAmount;
                    }
                }
            }
        }

        public virtual void ResetStaminaRegenTimer(float previousStaminaAmount, float currentStaminaAmount)
        {
            // We only want to reset the regeneration if the action used stamina
            // We dont want to reset the regeneration if we are already regenerating stamina
            if (currentStaminaAmount < previousStaminaAmount)
            {
                staminaRegenerationTimer = 0;
            }
        }
    }
}
