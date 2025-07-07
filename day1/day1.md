# intro to linux
## what is linux
* linux is a type of kernel
* `kernel` is the core part of an OS that manages hardware resources (CPU , memoery devices) and connect hardware with the software (linux kernel , unix kernel)
* `os` is the combination of a kernel + tools + libraries + software (ubuntu , fedora , window
* `userland` all programs/tools that run above the kernel (bash, GNU tools)
* `shell` CLI to interact with OS
* `init system` manages the boot process and background processes(daemons) (systemd, systemctl)
* `package manager` software that install updates and manages packages (apt, yum, pacman)
* `desktop enviromnemt` GUI intereface for users (GNOME ,KDE ,XFCE)
* `display server` bridges OS and graphical apps (X11, wayland)
* `application` user-installed software (firefox, VLC, python3)

## file system 
* organises data into file and directory
* `/` is the main root admin directory of the OS, Owned by the root (admin) user.
* `/home` is the home directory where our users are stored , Contains personal directories for each normal (non-root) user.
* `/home/peter ` is the user directory , Each user gets a unique subdirectory in /home.
* `/bin` - Stands for binary.
    * Contains essential command-line programs needed for the system to start and run in single-user mode.
    * Examples: ls, cp, mv, rm, cat
* `/etc` – Configuration Files
    * Stores system-wide configuration files.
    * Includes settings for system services, network, users, etc.
    * Example: /etc/passwd (user account information)
* `/dev` -  Device Files
    * Contains files that represent hardware devices (e.g., hard drives, USBs, terminals).
    * Examples:
      * /dev/sda – primary hard disk
      * /dev/tty – terminal interface
* `/sbin` -System Binaries
      * Similar to /bin, but contains system-level utilities used mostly by the root user.
      * Examples: ifconfig, reboot, iptables, mount
* `/tmp` - Temporary Files
    * Used to store temporary files created by system or users.
    * Cleared on reboot.
* `/var` - Variable Data
    * Contains data that changes frequently:
    * Logs (/var/log)
    * Mail (/var/mail)
    * Spool directories for printers, etc.
* `/usr` - User Programs and Data
    * Stores user-installed software, libraries, documentation.
    * Subdirectories:
    * /usr/bin – non-essential binaries
    * /usr/lib – libraries for programs
    * /usr/share – shared files and docs
* `/local`- Locally Installed Software
    * For software manually installed by the user or admin, not managed by the system's package manager.
    * Keeps custom programs separate from system programs.
