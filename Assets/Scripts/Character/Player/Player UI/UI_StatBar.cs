using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace RM
{
    public class UI_StatBar : MonoBehaviour
    {
        private Slider slider;
        private RectTransform rectTransform;

        // Variable to scale bar size depending on stat (higher stat = longer bar across screen)
        [Header("Bar Options")]
        [SerializeField] protected bool scaleBarLengthWithStats = true;
        [SerializeField] protected float widthScaleMultiplier = 1;

        // Secondary bar behind may bar for polish effect (yellow bar that shows how much an action/damage takes away from current stat)

        protected virtual void Awake()
        {
            slider = GetComponent<Slider>();
            rectTransform = GetComponent<RectTransform>();
        }

        public virtual void SetStat(int newValue)
        {
            slider.value = newValue;
        }

        public virtual void SetMaxStat(int maxValue) 
        { 
            slider.maxValue = maxValue;
            slider.value = maxValue;

            if (scaleBarLengthWithStats )
            {
                // Scale the transform of this object
                rectTransform.sizeDelta = new Vector2(maxValue * widthScaleMultiplier, rectTransform.sizeDelta.y);

                // Resets the position of the bars based on their layout groups's settings
                PlayerUIManager.instance.playerUIHudManager.RefreshHUD();
            }
        }
    }
}
