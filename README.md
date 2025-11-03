# 🐟 fish-flowmodoro

**Stay focused and balanced — a Fish Shell productivity timer with audio cues and progress summaries.**

![Image](https://github.com/user-attachments/assets/8224d498-03f3-4fd1-adc1-5de6a24c21c3)

**Flowmodoro (An enhanced version of Pomodoro technique)**


| Feature        | Pomodoro Technique                                              | Flowmodoro (Flowtime) Technique                                           |
| -------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------- |
| Work Intervals | Fixed 25-minute sessions.                                       | Flexible; you work as long as you're focused.                             |
| Breaks         | Fixed 5-minute short breaks and 15–30 minute long breaks.       | Breaks when focus declines; break length often proportional to work time. |
| Flexibility    | Rigid and structured.                                           | Highly flexible and personalized.                                         |
| Best For       | Structured tasks, overcoming procrastination, and shallow work. | Complex, creative tasks, and deep work requiring sustained focus.         |

  In short, Pomodoro is a structured system for managing time, while Flowmodoro is a more organic method that adapts to your natural workflow and energy levels to help you get into a
  "flow state."

Smart Break Calculation: 20% of work time (minimum 12s, maximum 30m)

**This project was mainly created with the help of  [DeepSeek](https://chat.deepseek.com) , and all audio cues were AI-generated using  [Synthesys](https://app.synthesys.live).**

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

First install [yay](https://github.com/Jguer/yay)  /  [paru](https://github.com/Morganamilo/paru)  

```bash
yay -S timer-bin
```
OR

```bash
paru -S timer-bin
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

**This project was inspired by the terminal productivity workflows shown in this  [video](https://youtu.be/GfQjJBtO-8Y?si=j3YaV0F1K6qyR5LK) and their amazing [`.zshrc`](https://gist.github.com/bashbunni/3880e4194e3f800c4c494de286ebc1d7). I decided to make my own version with some new ideas and custom touches!**
