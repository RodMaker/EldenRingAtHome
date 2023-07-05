using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.IO;

namespace RM
{
    public class SaveFileDataWriter
    {
        public string saveDataDirectoryPath = "";
        public string saveFileName = "";

        // Before we create a new save file, we must check to see if one of this character slot already exists (max 10 character slots)
        public bool CheckToSeeIfFileExists()
        {
            if (File.Exists(Path.Combine(saveDataDirectoryPath, saveFileName)))
            {
                return true;
            }
            else
            { 
                return false; 
            }
        }

        // Used to delete character save files
        public void DeleteSaveFile()
        {
            File.Delete(Path.Combine(saveDataDirectoryPath, saveFileName));
        }

        // Used to create a save file upon starting a new game
        public void CreateNewCharacterSaveFile(CharacterSaveData characterData)
        {
            // Make a path to save the file (a location on the machine)
            string savePath = Path.Combine(saveDataDirectoryPath, saveFileName);

            try
            {
                // Create the directory the file will be written to, if it does not already exist
                Directory.CreateDirectory(Path.GetDirectoryName(savePath));
                Debug.Log("CREATING SAVE FILE, AT SAVE PATH: " + savePath);

                // Serialize the c# game data object into json
                string dataToStore = JsonUtility.ToJson(characterData, true);

                // Write the file to our system
                using (FileStream stream = new FileStream(savePath, FileMode.Create))
                {
                    using (StreamWriter fileWriter = new StreamWriter(stream)) 
                    { 
                        fileWriter.Write(dataToStore);
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.LogError("ERROR WHILST TRYING TO SAVE CHARACTER DATA, GAME NOT SAVED" + savePath + "\n" + ex);
            }
        }

        // Used to load a save file upon loading a previous game
        public CharacterSaveData LoadSaveFile()
        {
            CharacterSaveData characterData = null;

            // Make a path to load the file (a location on the machine)
            string loadPath = Path.Combine(saveDataDirectoryPath, saveFileName);

            if (File.Exists(loadPath))
            {
                try
                {
                    string dataToLoad = "";

                    using (FileStream stream = new FileStream(loadPath, FileMode.Open))
                    {
                        using (StreamReader reader = new StreamReader(stream))
                        {
                            dataToLoad = reader.ReadToEnd();
                        }
                    }

                    // Deserialize the data from json back to unity
                    characterData = JsonUtility.FromJson<CharacterSaveData>(dataToLoad);
                }
                catch (Exception ex)
                {

                }
            }

            return characterData;
        }
    }
}
