using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.Rendering;

namespace RM
{
    public class UI_Character_Save_Slot : MonoBehaviour
    {
        SaveFileDataWriter saveFileWriter;

        [Header("Game Slot")]
        public CharacterSlot characterSlot;

        [Header("Character Info")]
        public TextMeshProUGUI characterName;
        public TextMeshProUGUI timePlayed;

        private void OnEnable()
        {
            LoadSaveSlots();
        }

        private void LoadSaveSlots()
        {
            saveFileWriter = new SaveFileDataWriter();
            saveFileWriter.saveDataDirectoryPath = Application.persistentDataPath;

            // Save slot 01
            if (characterSlot == CharacterSlot.CharacterSlot_01)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot01.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 02
            else if (characterSlot == CharacterSlot.CharacterSlot_02)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot02.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 03
            else if (characterSlot == CharacterSlot.CharacterSlot_03)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot03.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 04
            else if (characterSlot == CharacterSlot.CharacterSlot_04)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot04.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 05
            else if (characterSlot == CharacterSlot.CharacterSlot_05)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot05.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 06
            else if (characterSlot == CharacterSlot.CharacterSlot_06)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot06.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 07
            else if (characterSlot == CharacterSlot.CharacterSlot_07)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot07.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 08
            else if (characterSlot == CharacterSlot.CharacterSlot_08)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot08.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 09
            else if (characterSlot == CharacterSlot.CharacterSlot_09)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot09.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
            // Save slot 10
            else if (characterSlot == CharacterSlot.CharacterSlot_10)
            {
                saveFileWriter.saveFileName = WorldSaveGameManager.instance.DecideCharacterFileNameBasedOnCharacterSlotBeingUsed(characterSlot);

                // If the file exists, get information from it
                if (saveFileWriter.CheckToSeeIfFileExists())
                {
                    characterName.text = WorldSaveGameManager.instance.characterSlot10.characterName;
                }
                // If it does not, disable this gameobject
                else
                {
                    gameObject.SetActive(false);
                }
            }
        }

        public void LoadGameFromCharacterSlot()
        {
            WorldSaveGameManager.instance.currentCharacterSlotBeingUsed = characterSlot;
            WorldSaveGameManager.instance.LoadGame();
        }
    }
}
