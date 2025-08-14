# RIL (Rename in Linux)

RIL is a simple command-line tool for Linux that allows you to rename files and directories easily using a single command. Made for windows guys who apparently can't remember mv.

## Installation

**Clone the repo:**

```git clone https://github.com/execRooted/RIL.git```

```cd RIL ```

**Run the installer:**

``` chmod +x installer.sh ```

``` sudo ./installer.sh ```

*This will:*

- Publish the app

- Copy the executable to /usr/local/bin/RIL/ren

- Create a symlink ren so you can run the command from anywhere


*Now you can run ren from anyware in your Linux system.*

---

## Uninstallation

``` chmod +x uninstaller.sh ```

``` sudo ./uninstaller.sh ```

*This will remove the program from /usr/local/bin/RIL/ren*

---

## Usage

  ren originalName newName   Rename a file or folder
  ren -h | --help                            Show this help message

**Examples:**
  ren oldfile.txt newfile.txt
  ren oldFolder newFolder

---

***Made by execRooted***
(*You can take and modify the code, but give me credit for it*)

