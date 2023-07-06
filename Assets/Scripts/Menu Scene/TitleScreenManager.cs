using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Unity.Netcode;
using UnityEngine.UI;

namespace RM
{
    public class TitleScreenManager : MonoBehaviour
    {
        [Header("Menus")]
        [SerializeField] GameObject titleScreenMainMenu;
        [SerializeField] GameObject titleScreenLoadMenu;

        [Header("Buttons")]
        [SerializeField] Button loadMenuReturnButton;
        [SerializeField] Button mainMenuLoadGameButton;

        // Starts the network as a host
        public void StartNetworkAsHost()
        {
            NetworkManager.Singleton.StartHost();
        }

        public void StartNewGame()
        {
            WorldSaveGameManager.instance.CreateNewGame();
            StartCoroutine(WorldSaveGameManager.instance.LoadWorldScene());
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

            // Select the return button first
            mainMenuLoadGameButton.Select();
        }
    }

}
