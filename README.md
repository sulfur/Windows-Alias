
Alias Batch Program

▄▄▄· ▄▄▌  ▪   ▄▄▄· .▄▄ ·         ▄▄▄▄·  ▄· ▄▌    .▄▄ · ▄• ▄▌▄▄▌  ·▄▄▄  
▐█ ▀█ ██•  ██ ▐█ ▀█ ▐█ ▀.         ▐█ ▀█▪▐█▪██▌    ▐█ ▀. █▪██▌██•  ▐▄▄·  
▄█▀▀█ ██▪  ▐█·▄█▀▀█ ▄▀▀▀█▄        ▐█▀▀█▄▐█▌▐█▪    ▄▀▀▀█▄█▌▐█▌██▪  ██▪  
▐█ ▪▐▌▐█▌▐▌▐█▌▐█ ▪▐▌▐█▄▪▐█        ██▄▪▐█ ▐█▀·.    ▐█▄▪▐█▐█▄█▌▐█▌▐▌██▌.  
 ▀  ▀ .▀▀▀ ▀▀▀ ▀  ▀  ▀▀▀▀         ·▀▀▀▀   ▀ •      ▀▀▀▀  ▀▀▀ .▀▀▀ ▀▀▀  

## Description
This program consists of a series of batch scripts designed to manage aliases or automate specific processes through .bat files. The main files included in the system are:

- **add.bat**: Script for adding aliases with a description to the main file.
- **alias.bat**: Core file defining the aliases.
- **help.bat**: Provides a list of available aliases and instructions for their use.
- **restart.bat**: Restarts the system while retaining alias settings.
- **StartMe.bat**: Configures the system to automatically use aliases in the command prompt.
- **testfile.bat**: A test script for centering text on the console.

## System Requirements
- Operating System: Windows
- Command Prompt
- Execution permissions for batch files

## Installation
1. Clone the repo
   ```bash
   git clone https://github.com/sulfur/Windows-Alias.git
   ```

2. Ensure all extracted files are located in the same directory.

3. Run the main **StartMe.bat** file to configure the system:
   
   **StartMe.bat** - Adds a registry key to `Computer\HKEY_CURRENT_USER\Software\Microsoft\` for autorun.

## Default Aliases
### **restart.bat**
Restarts the Command Prompt with the aliases loaded:
```bash
restart
```

---


### **alias-remove**
Removes an existing alias. This command allows you to delete a defined alias by specifying its name.

**Usage Example**:
```bash
alias-remove myAlias
```
- This will remove the alias `myAlias` from the `alias.bat` file.

### **alias-new**
Adds a new alias to the system with a specific command. This command allows you to define a new alias along with the command it should run when called.

**Usage Example**:
```bash
alias-new greet echo Hello!
```
- This will create a new alias `greet` that executes the command `echo Hello!` when run in the Command Prompt.

---
### **alias-help**
Provides a list of available aliases and instructions for their use.

**Usage Example**:
```bash
alias-help
```


---

## Notes
- Modify the .bat files only if necessary.
- Use **help.bat** for a quick guide on aliases.
- Protection for Default aliases.

