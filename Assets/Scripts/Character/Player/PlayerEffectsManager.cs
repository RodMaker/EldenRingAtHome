using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class PlayerEffectsManager : CharacterEffectsManager
    {
        [Header("Debug Delete Later")]
        [SerializeField] InstantCharacterEffect effectToTest;
        [SerializeField] bool processEffect = false;

        private void Update()
        {
            if (processEffect)
            {
                processEffect = false;
                
                // Example
                // When we instantiate it, the original is not effected
                //TakeStaminaDamageEffect effect = Instantiate(effectToTest) as TakeStaminaDamageEffect;
                //effect.staminaDamage = 55;

                // When we dont instantiate it, the original is changed (you do not want this in most cases)
                //effectToTest.staminaDamage = 55;

                InstantCharacterEffect effect = Instantiate(effectToTest);
                ProcessInstantEffect(effect);
            }
        }
    }
}
