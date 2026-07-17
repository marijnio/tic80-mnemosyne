# The Diamond of Mnemosyne 💎

An interactive retro trainer for the Ancient Greek alphabet, designed and built for the **TIC-80 Tiny Computer**.

Learn pronunciation, letters, and how to triage "False Friends" (look-alike Greek and Latin letters) with arcade-style mechanics, smooth scaling 5x5 pixel fonts, and dynamic animations.

---

## 🎮 How to Play

### 💻 System Requirements
- [TIC-80 Tiny Computer](https://tic80.com/) (Pro or Free version)

### 🚀 Running the Game
1. Open TIC-80.
2. Load the cartridge or the Lua source:
   ```bash
   load mnemosyne.tic
   # or load the text script directly
   load mnemosyne.lua
   ```
3. Type `run` and press Enter!

---

## 🏛️ Game Modes

1. **Shrine of Mnemosyne (Study Mode)**
   - Browse the 24 letters of the Ancient Greek alphabet in both Uppercase and Lowercase.
   - Shows letter shapes, pronunciation sounds (phonetic/IPA), and helpful mnemonic explanations.

2. **Battle Mode (Quiz)**
   - Face off against an animated Cyclops!
   - Identify the correct sound of the Greek letter glowing on the monster's shield.
   - Select your choice using the D-Pad. The answers are shuffled and randomly distributed among the four directions.

3. **False Friend Triage**
   - Identify look-alike letters!
   - Determine if the letter shown is a **Greek** letter or a **Latin/English** letter before the timer runs out.
   - Use D-Pad Left for **GREEK** and D-Pad Right for **LATIN/ENGLISH**.

---

## 🕹️ Controls

- **D-PAD (Arrows)**: Navigate study screens, select quiz options, and triage letters.
- **Button A (Z / C)**: Proceed, enter battle, confirm choices.
- **Button B (X / V)**: Exit back to the main menu.

---

## 📁 Project Structure

- `mnemosyne.lua`: The main game source code written in Lua. Contains the procedural rendering systems, game loop, star and particle systems, and the pixel-art font tables.
- `mnemosyne.tic`: The TIC-80 cartridge file containing bundled assets (like sprites, map layout, sound effects, and music).

---

## 🎨 Asset & Font Details
This project uses a custom, highly optimized **5x5 pixel-art Greek font** extracted from the community *Tiny 5* format. Letters with top/bottom diacritics or descenders (like `β`, `δ`, `η`, `ξ`) use specialized offset tables to render fully and cleanly on TIC-80.
