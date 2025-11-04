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

## 🔧 Requirements (Linux)

Before using Flowmodoro, ensure the following are installed:

### 1. **Fish Shell**
**Arch**
```bash
sudo pacman -S fish
````
**Debian/Ubuntu**

To get the latest release, we need to add the Fish shell PPA:
```bash
sudo apt-add-repository ppa:fish-shell/release-<X> #(currently <X> is 4. Check the latest version below)
```
[Latest version: releases](https://github.com/fish-shell/fish-shell/releases)

Next, update your package list:
```bash
sudo apt update
```
You can now install fish:
```bash
sudo apt install fish
```
**Fedora**
```bash
sudo dnf install fish
```
### 2. **MPV** (for audio playback)
**Arch**
```bash
sudo pacman -S mpv
```
**Debian/Ubuntu**

To get the latest release, we need to ensure the Flathub repository is enabled on our system and to add it if it’s not already present.
```bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
Now install the package
```bash
flatpak install flathub io.mpv.Mpv -y
```
**Fedora**
```bash
sudo dnf install mpv
```
### 3. **timer-bin** 
**Arch**

First install [yay](https://github.com/Jguer/yay)  /  [paru](https://github.com/Morganamilo/paru).  
Then, install the package using: 
```bash
yay -S timer-bin
```
OR
```bash
paru -S timer-bin
```
Alternatively, clone the package manually from the AUR  [timer-bin](https://aur.archlinux.org/packages/timer-bin) and install it.

**Debian/Ubuntu**

First add the caarlos0 APT repository to your system
```bash
echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
```
Next, update your package list
```bash
sudo apt update
```
Now, install the package
```bash
sudo apt install timer
```

**Fedora**

Installation depends on your system architecture—use an RPM package for your CPU type (e.g., x86_64, aarch64).
Download latest <pakage>.rpm from the  [releases page](https://github.com/caarlos0/timer/releases).
Now, install the package
```bash
sudo dnf install ./<package>.rpm
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
