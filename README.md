# 🐟 fish-flowmodoro

**Stay focused and balanced — a Fish Shell productivity timer with audio cues and progress summaries.**

![Demo of Flowmodoro](demo.gif)

This project was mainly created with the help of  [DeepSeek](chat.deepseek.com) , and all audio cues were AI-generated using  [Synthesys](https://app.synthesys.live).

---

## 🔧 Requirements (Arch Linux)

Before using Flowmodoro, ensure the following are installed:

### 1. **Fish Shell**
```bash
sudo pacman -S fish
````

### 2. **MPV** (for audio playback)

```bash
sudo pacman -S mpv
```

### 3. **timer-bin** 

```bash
yay -S timer-bin
```

### 4. **Start a new Fish shell session in your terminal**

```bash
fish
```
**Optional: Make Fish your default shell**

```bash
chsh -s (which fish)
```

---

## ⚙️ Setup Instructions

### 1️⃣ To get started, clone this repository and append the content of the script to the  main configuration file:

```bash
git clone https://github.com/mohsince-04/fish-flowmodoro.git && cd fish-flowmodoro
```

```bash
cat flowmodoro.fish >> ~/.config/fish/config.fish
```

### 2️⃣ Create the audio directory and add your sound files

```bash
mkdir ~/Music/
```

Add the following `.wav` files to `~/Music/`:

* `startwork.wav`
* `workstatus.wav`
* `startbreak.wav`
* `breakstatus.wav`
* `focus.wav`
* `welltried.wav`
* `didgreat.wav`

  ```bash
  cd sounds
  ```

  ```bash
  cp  * ~/Music

### 3️⃣ Reload Fish configuration

```bash
source ~/.config/fish/config.fish
```
# Or restart your terminal

---

## 🚀 Usage

Run Flowmodoro from your terminal:

```bash
flow
```
# or
```bash
flowmodoro
```

Follow the prompts to start work sessions, take breaks, and track progress.
Audio cues and summaries will guide your productivity.

---


This project was inspired by the terminal productivity workflows shown in this  [video](https://youtu.be/GfQjJBtO-8Y?si=j3YaV0F1K6qyR5LK) and their amazing [`.zshrc`](https://gist.github.com/bashbunni/3880e4194e3f800c4c494de286ebc1d7). I decided to make my own version with some new ideas and custom touches!
