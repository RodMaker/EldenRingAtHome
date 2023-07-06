using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Unity.Netcode;
using UnityEngine.UI;

namespace RM
{
    public class TitleScreenManager : MonoBehaviour
    {
        public static TitleScreenManager instance;

        [Header("Menus")]
        [SerializeField] GameObject titleScreenMainMenu;
        [SerializeField] GameObject titleScreenLoadMenu;

        [Header("Buttons")]
        [SerializeField] Button loadMenuReturnButton;
        [SerializeField] Button mainMenuLoadGameButton;
        [SerializeField] Button mainMenuNewGameButton;

        [Header("Pop Ups")]
        [SerializeField] GameObject noCharacterSlotsPopUp;
        [SerializeField] Button noCharacterSlotsOkayButton;

        private void Awake()
        {
            if (instance == null)
            {
                instance = this;
            }
            else
            {
                Destroy(gameObject);
            }
        }

        // Starts the network as a host
        public void StartNetworkAsHost()
        {
            NetworkManager.Singleton.StartHost();
        }

        public void StartNewGame()
        {
            WorldSaveGameManager.instance.AttemptToCreateNewGame();
        }

        public void OpenLoadGameMenu()
        {
            // Close main menu
            titleScreenMainMenu.SetActive(false);

            // Open load menu
            titleScreenLoadMenu.SetActive(true);

            // Select the return button first
            loadMenuReturnButton.Select();
        }

        public void CloseLoadGameMenu()
        {
            // Close load menu
            titleScreenLoadMenu.SetActive(false);

            // Open main menu
            titleScreenMainMenu.SetActive(true);

            // Select the load game button first
            mainMenuLoadGameButton.Select();
        }

        public void DisplayNoFreeCharacterSlotsPopUp()
        {
            noCharacterSlotsPopUp.SetActive(true);
            noCharacterSlotsOkayButton.Select();
        }

        public void CloseNoFreeCharacterSlotsPopUp()
        {
            noCharacterSlotsPopUp.SetActive(false);
            mainMenuNewGameButton.Select();
        }
    }

}
