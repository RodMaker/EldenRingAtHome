using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class WeaponItem : Item
    {
        // Animator controller override (change attack animations based on weapon you are currently using)

        [Header("Weapon Model")]
        public GameObject weaponModel;

        [Header("Weapon Requirements")]
        public int strengthREQ = 0;
        public int dexREQ = 0;
        public int intREQ = 0;
        public int faithREQ = 0;

        [Header("Weapon Base Damage")]
        public int physicalDamage = 0;
        public int magicDamage = 0;
        public int fireDamage = 0;
        public int holyDamage = 0;
        public int lightningDamage = 0;

        // Weapon guard absorptions (blocking power)

        [Header("Weapon Poise")]
        public float poiseDamage = 10;
        // Offensive poise bonus when attacking

        // Weapon modifiers
        // Light attack modifier
        // Heavy attack modifier
        // Critical damage modifier etc

        [Header("Stamina Costs")]
        public int baseStaminaCost = 20;
        // Running attack stamina cost modifier
        // Light attack stamina cost modifier
        // Heavy attack stamina cost modifier etc

        // Item based actions (RB, RT, LB, LT)

        // Ash of war

        // Blocking sounds
    }
}
