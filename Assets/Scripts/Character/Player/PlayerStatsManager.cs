using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class PlayerStatsManager : CharacterStatsManager
    {
        PlayerManager player;

        protected override void Awake()
        {
            base.Awake();

            player = GetComponent<PlayerManager>();
        }

        protected override void Start()
        {
            base.Start();

            // Why calculate these here ?
            // When we make a character creation menu, and set the stats depending on the class, this will be calculated there
            // Until then however, stats are never calculated, so we do it here on start, if a save file exists they will be over written when loading into a scene
            CalculateHealthBasedOnVitalityLevel(player.playerNetworkManager.vitality.Value);
            CalculateStaminaBasedOnEnduranceLevel(player.playerNetworkManager.endurance.Value);
        }
    }
}
