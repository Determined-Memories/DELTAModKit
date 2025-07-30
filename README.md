> [!IMPORTANT]
> DELTAModKit is in **active development.** There are many known visual bugs present and I'm aware of certain things (such as the main characters' attack, defense and magic values not being accurate to the real game's chapters). If you find any issues, you can help out by creating an issue or opening a pull request.
> * Like what I'm doing :3/ - Memories.

# DELTAModKit
The most robust, feature-complete DELTARUNE GameMaker Studio 2 decompilation / port, Slightly enhanced with a multitude of tweaks designed to make the game easier to mod.

> [!CAUTION]
> This project does NOT allow for piracy of DELTARUNE Chapter 3 and 4. It is simply a base from which you can start building your own DELTARUNE chapter/fangame. Most assets which have been included in the project can be found in the free Steam demo for Chapter 1 and 2.

## Usage
To start playing around with DELTAModKit, you have to download [GameMaker Beta](https://gamemaker.io/en/download/windows/beta/GameMaker.exe). The project uses the latest **BETA** version `Beta v2024.1400.0.838`. It will not work on non-Beta/LTS versions.

> [!CAUTION]
> Due to LTS not having some functions included in **[BETA]**, eventually there is a chance that after constant updates you will have to Manually undo changes for **[LTS]**, Though at the current point in time as of writing this, It is **fine**.

1. Clone the repository onto your PC.
2. Open the project in GameMaker.

> [!WARNING]
> Music will only play if you copy the music files related to said music over to the **[Mus]** Folder Stored in your **[Datafiles]** Folder, Though I'm not including that as a step since I changed the correct GMS2 flag so it doesn't crash

## Adding / Changing Modular Stuff
The hearts of MC's modular reimplementations of the character, item, spell and equipment systems all live in the folder `Custom > Scripts > Configs`. MC tried naming everything in an easy-to-understand way, but feel free to reach out if you encounter any issues. Provided in the `Custom > Objects` folder is an example cutscene for working with the Cutscene System and some helper markers to assist with character placement in cutscenes

## My Modular Stuff >:3
Made NPCs More Modular (Though you can still use Original Systems)
Made Facing Sprite System more easily editable via replacing it with a version that allows for Changing many Things <  You can revert this system Via setting **global.useoldactorspritesystem** to true inside of **scr_set_facing_sprites**>
Made Chests SLIGHTLY more Modular (Though they're basically the Exact Same)
Made Savepoints SLIGHTLY more Modular (Although the new system is less Stable)


## Attribution
99.999% of sprites and most code contained in this repository was created by Toby Fox, Gaster, Royal Sciences LLC, And The Goners.
