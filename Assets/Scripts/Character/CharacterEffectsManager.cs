using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class CharacterEffectsManager : MonoBehaviour
    {
        // Process instant effects (take damage, heal)

        // Process timed effects (poison, build ups)

        // Process static effects (adding/removing buffs from talismans)

        CharacterManager character;

        protected virtual void Awake()
        {
            character = GetComponent<CharacterManager>();
        }

        public void ProcessInstantEffect(InstantCharacterEffect effect)
        {
            // Take in an effect
            // Process it
            effect.ProcessEffect(character);
        }
    }
}
