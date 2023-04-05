using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RM
{
    public class CharacterManager : MonoBehaviour
    {
        protected virtual void Awake()
        {
            DontDestroyOnLoad(this);
        }

        protected virtual void Update()
        {

        }
    }

}
