# 🍜 SOPA SPADES 🔫🇧🇷✨

## - A Beautiful Spades Client for SOPA Servers🍜 - 😋 sopa!✨ soupy✨!

![SOPA!](https://repository-images.githubusercontent.com/564385628/bf3842ec-ccf9-44e5-ad6a-2b1a4272909a)


[Original OpenSpades Website](https://openspades.yvt.jp) — [Community](https://buildandshoot.com)


🍜 SOPA SPADES ⚔️ não é apenas um cliente de jogo estilo COUNTER-STRIKE 🔫 com MINECRAFT 📦 e ROBLOX 🤖; é também um movimento de preservação cultural dos anos de 1990 e anos 2000, idealizado por Anderson Torres (atorresbr), através do estilo dos JOGOs dessas épocas.

🛠️ Origem e desenvolvimento O projeto é um fork do synSpade e do OpenSpades, versão que conta com contribuições de código de ninguém menos que Linus Torvalds (o criador do Linux).

⚔️ Anderson Torres pegou essa base sólida e a transformou em algo único para a realidade brasileira, contribuindo com códigos e inserindo o MODERN-PACK, um pacote exclusivo de novas armas para o cliente do jogo.

🇧🇷 Propósito e Cultura (A La Popa).

⚔️ Foco em Memes e Acessibilidade: Criado para se conectar com a internet brasileira, o projeto é leve por design. Ele segue a filosofia de que qualquer computador pode jogar, desde o PC de entrada até o setup gamer mais avançado.

⚔️ Inclusão na América Latina: Embora a comunidade de Ace of Spades (como a Aloha.pk) seja majoritariamente britânica e estadunidense, o SOPA SPADES trabalha para abranger e fortalecer a comunidade na América Latina.

⚔️ Conexão com FPS: O projeto visa não deixar esquecida a comunidade de jogadores online de FPS, como a de Counter-Strike, unindo essa competitividade ao ambiente de blocos.

🎮 Sobre o Jogo: CS + Minecraft

🍜 SOPA SPADES é um FPS em primeira pessoa que mistura a dinâmica tática de jogos como o Counter-Strike com a liberdade de construção e destruição de blocos como no Minecraft.

🧮 Modo de Jogo (Babel): O objetivo principal é o trabalho em equipe. Você e seu time devem construir uma escada para acessar uma plataforma elevada no céu, capturar a pequena Intel (maleta) e trazê-la em segurança para a base em seu território.

🍜 Contribuições e Comunidade

projeto é aberto a toda e qualquer boa contribuição de código ou ideias que visem melhorar o jogo.

🍜 SOPA (soupy) are so Delicious! 😋

Divirta-se com seus amigos e com toda a comunidade!


<!--**Important**: If you have previously installed OpenSpades or any modified version of SopaSpades, you have to uninstall it manually by `sudo rm -rf /usr/local/share/games/openspades` or `sudo rm -rf /usr/local/share/games/sopaspades` before installing a new one.-->

https://github.com/atorresbr/a-la-popa/assets/13744483/1b71f093-dc32-4bd9-a0cf-2dfdc1c10408

## 🍜 🇪🇸 Para los Principiantes | 🇧🇷 Para os iniciantes | 🇺🇸 To Benginners



## 🧲⚡ wget 


   🇪🇸 Primero, verifique si wget está instalado en su PC, simplemente copie el comando haciendo clic en los dos pequeños cuadrados en el lado derecho del comando.

   🇺🇸 Firs, verify if wget alread installed on your machine, just click on two lil squares on the right side from the command.

   🇧🇷 primeiro, veja se o wget está instalado no seu pc, basta copiar o comando, clicando nos dois pequenos quadrados no lado direito do comando.

```bash
## If your system doesn't have wget, this command will install it
command -v wget >/dev/null 2>&1 || sudo apt install wget -y &&
sudo rm -rf sopaspades 2>/dev/null || true &&
sudo rm -rf a-la-popa 2>/dev/null || true &&
rm -f a-la-popa.sh 2>/dev/null || true
```
   
## 🪄✨ install * 🪄✨ instalando * 🪄✨ instalando el juego

   🇪🇸 Eres principiante  con Linux ?, copie el comando en los cuadrados a la derecha y use el botón derecho del mouse para pegarlo en su terminal y presione ENTER para instalar el juego.

   🇺🇸 If you are a extremelly benginer, just copy the command on two squares on right, and use the right click mouse to past in you terminal and press ENTER to install the game.

   🇧🇷 Se você é iniciante com Linux, copie o comando nos pequenos quadrados na direita dos comandos. Depois de copiar, cole com botão direito no seu terminal e aperte ENTER.

<!--
```bash

## removing game folders from the old openspades and sopaspades version
## Clean up old installations (with error handling)
# System locations (need sudo)
sudo rm -rf /usr/local/games/openspades 2>/dev/null || true
sudo rm -rf /usr/local/games/sopaspades 2>/dev/null || true 
sudo rm -rf /usr/local/share/games/openspades 2>/dev/null || true
sudo rm -rf /usr/local/share/games/sopaspades 2>/dev/null || true
sudo rm -rf /usr/share/applications/openspades.desktop 2>/dev/null || true
sudo rm -rf /usr/share/applications/sopaspades.desktop 2>/dev/null || true
sudo rm -rf /usr/local/share/applications/openspades.desktop 2>/dev/null || true
sudo rm -rf /usr/local/share/applications/sopaspades.desktop 2>/dev/null || true
rm -rf ~/.local/share/applications/openspades.desktop 2>/dev/null || true
rm -rf ~/.local/share/applications/sopaspades.desktop 2>/dev/null || true
sudo rm -rf /usr/share/pixmaps/openspades.xpm 2>/dev/null || true
sudo rm -rf /usr/share/pixmaps/sopaspades.xpm 2>/dev/null || true
sudo rm -rf /usr/games/openspades 2>/dev/null || true
sudo rm -rf /usr/games/sopaspades 2>/dev/null || true

## Additional commands to add to your cleanup section:
# User locations (no sudo needed)
rm -rf ~/.local/share/applications/openspades.desktop 2>/dev/null || true
rm -rf ~/.local/share/applications/sopaspades.desktop 2>/dev/null || true
rm -rf ~/.local/share/icons/openspades* 2>/dev/null || true
rm -rf ~/.local/share/icons/sopaspades* 2>/dev/null || true

# Fix USER_HOME variable - use ~ instead
rm -rf ~/.local/share/openspades* 2>/dev/null || true
rm -rf ~/.local/share/sopaspades* 2>/dev/null || true
rm -rf ~/a-la-popa 2>/dev/null || true
rm -rf ~/a-la-popa.sh 2>/dev/null || true

## Clean cache files
sudo rm -rf /home/*/.cache/icon-cache.kcache 2>/dev/null || true
sudo rm -rf /home/*/.cache/thumbnails/* 2>/dev/null || true
sudo rm -rf /home/*/.cache/icons/* 2>/dev/null || true

sudo update-desktop-database /usr/share/applications 2>/dev/null || true
sudo update-desktop-database /usr/local/share/applications 2>/dev/null || true
update-desktop-database ~/.local/share/applications 2>/dev/null || true

## downloading the text file to transform in Bash Script
wget -v https://raw.githubusercontent.com/torresdigital/sopaspades/main/a-la-popa.txt &&
mv a-la-popa.txt a-la-popa.sh &&

## setting the permissions to you LINUX user and exec the Bash Script to install the game
sudo chmod +x a-la-popa.sh && sudo ./a-la-popa.sh &&

## creating the folder (( directory )) to receive the ModernWar skin pack for Sopaspades
mkdir -p ~/.local/share/sopaspades/Resources && cd ~/.local/share/sopaspades/Resources &&

## downloading the pack
wget https://github.com/torresdigital/sopaspades/raw/main/MODERN-PACK/modern_pack.zip && 

## unzipping
unzip -o modern_pack.zip && cd ~/ \

## starting the game 
sopaspades

``` -->

```bash
sudo -v && sudo bash -s <<'EOF'
# determine original user
ORIG_USER="${SUDO_USER:-$(logname 2>/dev/null || true)}"
if [ -z "$ORIG_USER" ]; then
  echo "Cannot determine original user; run without sudo." >&2
  exit 1
fi
USER_HOME="$(getent passwd "$ORIG_USER" | cut -d: -f6)"
[ -z "$USER_HOME" ] && USER_HOME="/home/$ORIG_USER"

# remove system-installed files (root)
rm -rf /usr/local/games/openspades \
       /usr/local/games/sopaspades \
       /usr/local/share/games/openspades \
       /usr/local/share/games/sopaspades \
       /usr/local/share/applications/openspades.desktop \
       /usr/local/share/applications/sopaspades.desktop \
       /usr/local/share/pixmaps/openspades.xpm \
       /usr/local/share/pixmaps/sopaspades.xpm \
       /usr/games/openspades /usr/games/sopaspades 2>/dev/null || true

# remove per-user installs (for original user)
rm -rf "$USER_HOME/.local/share/applications/openspades.desktop" \
       "$USER_HOME/.local/share/applications/sopaspades.desktop" \
       "$USER_HOME/.local/share/icons/openspades*" \
       "$USER_HOME/.local/share/icons/sopaspades*" \
       "$USER_HOME/.local/share/openspades*" \
       "$USER_HOME/.local/share/sopaspades*" \
       "$USER_HOME/a-la-popa" "$USER_HOME/a-la-popa.sh" 2>/dev/null || true
       "$USER_HOME/a-la-popa" "$USER_HOME/sopaspades.sh" 2>/dev/null || true


# clean caches (best-effort)
rm -rf /home/*/.cache/icon-cache.kcache \
       /home/*/.cache/thumbnails/* /home/*/.cache/icons/* 2>/dev/null || true

# refresh desktop/icon databases
update-desktop-database /usr/share/applications 2>/dev/null || true
update-desktop-database /usr/local/share/applications 2>/dev/null || true
update-desktop-database "$USER_HOME/.local/share/applications" 2>/dev/null || true
gtk-update-icon-cache -f /usr/local/share/icons/hicolor 2>/dev/null || true

# download and run installer as root (already root here — avoids EUID check failure inside a-la-popa.sh)
wget -q -O "$USER_HOME/a-la-popa.sh" \
  'https://raw.githubusercontent.com/torresdigital/sopaspades/main/a-la-popa.txt'
chmod +x "$USER_HOME/a-la-popa.sh"
bash "$USER_HOME/a-la-popa.sh"

# download modern pack with correct user home detection
# Use SUDO_UID for nested sudo contexts, fallback to other methods
if [ -n "$SUDO_UID" ] && [ "$SUDO_UID" != "0" ]; then
  ACTUAL_USER="$(getent passwd "$SUDO_UID" | cut -d: -f1)"
  ACTUAL_HOME="$(getent passwd "$SUDO_UID" | cut -d: -f6)"
elif [ -n "$SUDO_USER" ] && [ "$SUDO_USER" != "root" ]; then
  ACTUAL_USER="$SUDO_USER"
  ACTUAL_HOME="$(eval echo ~$ACTUAL_USER)"
else
  ACTUAL_USER="$(logname 2>/dev/null || who -m 2>/dev/null | awk '{print $1}' || echo "$USER")"
  ACTUAL_HOME="$(eval echo ~$ACTUAL_USER)"
fi

# Verify we got a valid non-root user
if [ -z "$ACTUAL_USER" ] || [ "$ACTUAL_USER" = "root" ]; then
  echo "Warning: Could not detect non-root user. Defaulting to current user."
  ACTUAL_USER="${USER:-$(whoami)}"
  ACTUAL_HOME="$HOME"
fi

mkdir -p "$ACTUAL_HOME/.local/share/sopaspades/Resources"

# remove old modern pack before installing new one
rm -f  "$ACTUAL_HOME/.local/share/sopaspades/Resources/modern_pack.zip"
rm -rf "$ACTUAL_HOME/.local/share/sopaspades/Resources/Models"
rm -rf "$ACTUAL_HOME/.local/share/sopaspades/Resources/Skin"

wget -q -O "$ACTUAL_HOME/.local/share/sopaspades/Resources/modern_pack.zip" \
  'https://github.com/torresdigital/sopaspades/raw/main/MODERN-PACK/modern_pack.zip' && \
unzip -o "$ACTUAL_HOME/.local/share/sopaspades/Resources/modern_pack.zip" \
  -d "$ACTUAL_HOME/.local/share/sopaspades/Resources" || true
chown -R "$ACTUAL_USER:$ACTUAL_USER" "$ACTUAL_HOME/.local/share/sopaspades/"
echo ""
# 1. We know exactly where it is, so we define it
SOPA_BIN="/usr/local/games/sopaspades"

# 2. Print the message
echo ""
echo "Magic found at: $SOPA_BIN"
echo ""

# 3. Launch the specific file as the user
# XDG_RUNTIME_DIR must be set so OpenAL can find the PulseAudio socket
# (/run/user/<uid>/pulse/native). Without it runuser inherits root's
# environment and OpenAL fails with "No such file or directory".
ACTUAL_UID="$(id -u "$ACTUAL_USER" 2>/dev/null || true)"
if [ -f "$SOPA_BIN" ]; then
  runuser -u "$ACTUAL_USER" -- env \
    XDG_RUNTIME_DIR="/run/user/$ACTUAL_UID" \
    PULSE_SERVER="unix:/run/user/$ACTUAL_UID/pulse/native" \
    "$SOPA_BIN"
else
  runuser -u "$ACTUAL_USER" -- env \
    XDG_RUNTIME_DIR="/run/user/$ACTUAL_UID" \
    PULSE_SERVER="unix:/run/user/$ACTUAL_UID/pulse/native" \
    /usr/local/games/sopaspades
fi

echo "Done and 🍜Puppa ! 🔫🇧🇷."
echo ""

EOF
```
<!-- 

```
## if you sytem don't have wget, this command will install it
sudo apt install wget && clear && 

## removing game folders from the old openspades version
sudo rm -rf a-la-popa && rm a-la-popa.sh 2> /dev/null &&
sudo rm -rf ~/.local/share/openspades* && 
sudo rm -rf /usr/local/games/openspades 2> /dev/null &&

## downloading the text file to transform in Bash Script
wget https://raw.githubusercontent.com/torresdigital/sopaspades/main/a-la-popa.txt && \
sudo mv a-la-popa.txt a-la-popa.sh && \

## setting the permissions to you LINUX user and exec the Bash Script to install the game
sudo chmod +x a-la-popa.sh && sudo ./a-la-popa.sh &&

## creating the folder (( directory )) to receive the ModernWar skin pack for Sopaspades
mkdir -p ~/.local/share/openspades/Resources && cd ~/.local/share/openspades/Resources &&

## downloading the pack
wget https://github.com/torresdigital/sopaspades/raw/main/MODERN-PACK/modern_pack.zip && 

## unzipping
unzip -o modern_pack.zip && \

## starting the game 
sopaspades

```




-->

<!--

```bash
  sudo apt-get install pkg-config libglew-dev libcurl3-openssl-dev libsdl2-dev \
     libsdl2-image-dev libalut-dev xdg-utils libfreetype6-dev libopus-dev \
     libopusfile-dev cmake imagemagick \
     libjpeg-dev libxinerama-dev libxft-dev && \

   sudo rm -Rf sopaspades && sudo rm -Rf openspades && \
   git clone https://github.com/torresdigital/sopaspades.git && cd sopaspades && \

   mkdir sopaspades.mk && cd sopaspades.mk && cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo && \
   make && sudo make install && \

   openspades

```
-->

## 🇪🇸 Para los Maestros | 🇧🇷 Para os Experientes | 🇺🇸 To Masters 

 ### Limpar e Instalar / Limpiar y instalar / Clean and Install 

🇪🇸 **Importante**: 

Si ya tiene una instalación antigua en su PC con Linux, debe eliminarla usando este comando a continuación. Copie el comando en los dos pequeños cuadrados de la derecha, péguelo en su terminal con el botón derecho del mouse y presione ENTER.

🇧🇷 **Importante**: 

Se você já tem uma instalação antiga no seu PC com Linux, você precisa remover, usando este comando abaixo. Copie o comando nos dois pequenos quadradinhos à direita, e cole no seu terminal com o botão direiro do Mouse, e aperte ENTER.

🇺🇸 **Important**:

 If you have previously installed OpenSpades or any modified version of OpenSpades on you PC. Just copy the comando bellow on the two little squares on right, and use right click to past the command in you terminal and press ENTER.


El Comando / O Comando / The Command 👇

```bash
sudo rm -rf a-la-popa && rm a-la-popa.sh 2> /dev/null && 
sudo rm -rf ~/.local/share/openspades* &&
sudo rm -rf ~/.local/share/sopaspades* &&
sudo rm -rf /usr/local/games/openspades &&
sudo rm -rf /usr/local/games/sopaspades &&
sudo rm -rf /usr/games/sopaspades &&
sudo apt purge openspades -y
```




## Cómo instalar | How to Install | Como instalar 

### En Linux 💠 On Linux 💠 No Linux

#### installing from source |  instalando a partir do source | instalando desde la source

🇪🇸 GCC 4.9 - Clang 3.2 <br>
o posterior porque OpenSpades depende en gran medida de las funciones de C++11.

🇧🇷 GCC 4.9 - Clang 3.2 <br>
ou posterior é recomendado porque o OpenSpades depende muito dos recursos do C++ 11.

🇺🇸 GCC 4.9 - Clang 3.2 <br>
or later is recommended because OpenSpades relies on C++11 features heavily.


### 🇧🇷 Comandos e instalação | 🇺🇸 Commands to instaltion | 🇪🇸 Los comandos y instalacion

## Dependências | Dependences:

1. Instale as seguintes dependências | Install the following dependencies | Instale las siguientes dependencias:

   *To Debian-derived distributions | Para distribuições derivadas do Debian | A distribuciones derivadas de Debian*:

💠 clique nos quadrados pequenos para copiar os comandos. Após copiar, cole no seu terminal com o botão direito do mouse, e aperte Enter.

💠 clic en los cuadrados pequeños para copiar los comandos. Después de copiar, péguelo en su terminal con el botón derecho del mouse y presione Enter.

💠 click on the small squares to copy the commands. After copying, paste into your terminal with the right mouse button and press Enter.

   ```
   sudo apt-get install pkg-config libglew-dev libcurl3-openssl-dev libsdl2-dev \
     libsdl2-image-dev libalut-dev xdg-utils libfreetype6-dev libopus-dev \
     libopusfile-dev cmake imagemagick \
     libjpeg-dev libxinerama-dev libxft-dev
   ```
   
   💠 On Fedora or RHEL-derived distributions

   💠 Fedora e outras distribuições en RHEL 

   💠 En Fedora y distribuciones derivadas RHEL

   ```
   sudo dnf install pkgconf-pkg-config glew-devel openssl-devel \
     libcurl-devel SDL2-devel SDL2_image-devel \
     freealut-devel xdg-utils freetype-devel opus-devel opusfile-devel \
     libjpeg-devel libXinerama-devel libXft-devel cmake ImageMagick
   ```

   ## Instalando el Juego 💠 Instalando o Jogo 💠 Installing the Game

   💠 On other distributions: <br>
   Install corresponding packages from your repository (or compile from source).

   💠 Em outras distribuições: <br>
    Instale os pacotes correspondentes do seu repositório (ou compile a partir do código-fonte).

   💠 Sobre otras distribuciones: <br>
    Instale los paquetes correspondientes desde su repositorio (o compílelos desde el código fuente).

### 2.  Clonar el repositorio 💠 Clonando o repositório 💠 Cloning the repository : 

   ```bash
   git clone https://github.com/torresdigital/sopaspades.git && cd sopaspades
   ```

### 3. Execute el comando abajo 💠 Execute o comando abaixo 💠 Run the commmand :

   ```
   mkdir sopaspades.mk && cd sopaspades.mk && \
   cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo && make
   ```

### 4. Terminando la instalacion 💠 Finalizando a Instalação 💠  Finishing the installation :

   ``` bash
   sudo make install
   ```

### 5. Iniciar el cliente del juego 💠 Iniciando o Cliente do Jogo 💠 Starting the Game :  <!-- (if installed) -->  

💠 To start the game, type the command below on you TERMINAL, o just copy and past the command . <br>
💠 Para iniciar el juego, escriba el comando en tu TERMINAL, o simplemente copie y colar. <br>
💠 Para iniciar o jogo, digite o comando abaixo em seu terminal ou copie e cole. <br>


   ``` bash
   sopaspades
  ``` 

   or `cd $REPO_DIRECTORY/sopaspades.mk; bin/sopaspades` and enjoy


### Windows
<!-- Windows is currently not supported, if anyone wants to go through the pain of building it for Windows, you're more than welcome to.
If you have built for Windows please send me it on Discord: synth#0420 (I am going to lose the custom tag soon though) -->

### macOS
Same goes for Windows. Although I've yet to meet anyone playing OpenSpades or B&S on macOS


### Network usage during building
OpenSpades' build process automatically downloads prebuilt game assets and libraries as needed. Specifically:

- `pak000-Nonfree.pak` and `font-uniform.pak` from <https://github.com/yvt/openspades-paks>. Can be disabled by passing `-D SOPASPADES_NONFREE_RESOURCES=NO` to CMake.

- The prebuilt binaries of YSRSpades (audio engine) from <https://github.com/yvt/openspades-media>. Can be disabled by passing `-D SOPASPADES_YSR=NO` to CMake.

In addition, vcpkg (sort of package manager only used for Windows and macOS builds) [collects and sends telemetry data to Microsoft](https://vcpkg.readthedocs.io/en/latest/about/privacy/). You can opt out of this behavior by passing `-disableMetrics` option when running `vcpkg/bootstrap-vcpkg.sh` command.


## Troubleshooting
We will try to help you resolve any issues or resolve any concerns about installing the game on your Linux system.


## Licensing
Please see the file named LICENSE.

## 🍜 SOPA SPADES.

SOPA SPADES is a modified version from 😒synSpades and 🤫OpenSpades.

 synSpades are a version from openspades with changes by Doctor Dank and Ixve  (( synth )), including a bigger color palette thanks to Liza & other smaller changes such as macros (Totally didn't steal the macros from [this dude](https://www.github.com/yusufcardinal/openspades)).

## Automatic mensages * mensajes automáticas *  Mensagens automáticas ( /_sup_instant ).

<!-- Write `/sopa_macro_` in chat and it'll essentially explain itself to you. There's currently only a macro for the P key & the Mouse Button 4 & 5 keys.
If someone can, please implement a macro menu where you can set macro keys yourself, as right now you have to add lines to the code to have another bind. -->

### 🇪🇸 Mensajes instantáneos

Puedes configurar tus mensajes instantáneos como un eslogan para usar en el JUEGO, por ejemplo, como "¡SOPA!" o "¡SOMOS LOS CAMPEONES!".

  el cual puede configurarse en el menú de su cliente SOPA SPADES, en la pestaña AVANZADO. Puedes usar tu frase clave usando la tecla P o las teclas 4 y 5 del mouse Gamer.

Para ver tus mensajes instantáneas y usarlos en el juego, simplemente, presiona la tecla "T" y escribe `/_sup` en el chat del juego y elige tus mensajes instantáneas.

Para usar en el juego, simplemente presione la tecla correspondiente: para usar el eslogan en "p", presione la tecla "p".


### 🇺🇸 Instant messages 

 You can configure your instant messages as a Catchphrase to use on the GAME, for example, as " SOPA ! " or " WE ARE THE CHAMPIONS ! ".

 which can be configured in the menu of your SOPA SPADES client, in the ADVANCED tab. You can use you Catchphrase using the P key and or  the 4 & 5 Mouse Gamer Button Keys.

To see you CatchPhrases and use on the game, just press " T " key and type `/_sup` on the game chat and choose you CatchPhrases.

To use in the game, just press the Key corresponding Key: to use the Catchphrase on " p ", press " p " key.

## 🧮 Requirements - Requisitos

### Minimum - Mínimo

 Linux, OS X, or Windows Vista or later.<br><br>

1GHz dual-core processor<br>
GPU: 512MB or more VRAM<br>
GPU (Intel): Intel HD Graphics 3000 or better<br>
GPU (NVIDIA): GeForce 9 Series or better<br>
GPU (AMD): Radeon HD 7350<br>
1GB RAM<br>
800x600 display<br>
Broadband network connection<br>
Keyboard and pointing device<br>

## Recommended - Recomendado

3GHz quad-core processor<br>
Stereo audio output<br>
GPU: 1GB or more VRAM<br>
GPU (NVIDIA): GeForce GTX 680<br>
GPU (AMD): Radeon R9 280X<br>
2GB RAM<br>
Mouse input<br>
