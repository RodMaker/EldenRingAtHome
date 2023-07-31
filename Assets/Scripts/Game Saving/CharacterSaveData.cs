using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    [System.Serializable]
    // Since we want to reference this data for every save file, this script is not a monobehaviour and is instead serializable
    public class CharacterSaveData
    {
        [Header("Character Name")]
        public string characterName = "Character";

        [Header("Time Played")]
        public float secondsPlayed;

        // Question: Why not use a vector3 ?
        // Answer: We can only save data from basic variable types (float, int, string, bool)
        [Header("World Coordinates")]
        public float xPosition;
        public float yPosition;
        public float zPosition;

        [Header("Resources")]
        public int currentHealth;
        public float currentStamina;

        [Header("Stats")]
        public int vitality;
        public int endurance;
    }
}
