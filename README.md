# Alias Batch Program

```
 ▄▄▄· ▄▄▌  ▪   ▄▄▄· .▄▄ ·         ▄▄▄▄·  ▄· ▄▌    .▄▄ · ▄• ▄▌▄▄▌  ·▄▄▄
▐█ ▀█ ██•  ██ ▐█ ▀█ ▐█ ▀.         ▐█ ▀█▪▐█▪██▌    ▐█ ▀. █▪██▌██•  ▐▄▄·
▄█▀▀█ ██▪  ▐█·▄█▀▀█ ▄▀▀▀█▄        ▐█▀▀█▄▐█▌▐█▪    ▄▀▀▀█▄█▌▐█▌██▪  ██▪ 
▐█ ▪▐▌▐█▌▐▌▐█▌▐█ ▪▐▌▐█▄▪▐█        ██▄▪▐█ ▐█▀·.    ▐█▄▪▐█▐█▄█▌▐█▌▐▌██▌.
 ▀  ▀ .▀▀▀ ▀▀▀ ▀  ▀  ▀▀▀▀         ·▀▀▀▀   ▀ •      ▀▀▀▀  ▀▀▀ .▀▀▀ ▀▀▀ 
```

## Description
This program consists of a series of batch scripts designed to manage aliases or automate specific processes through `.bat` files. The main files included in the system are:

- **add.bat**: Script for adding aliases with a description to the main file.
- **alias.bat**: Core file defining the aliases.
- **help.bat**: Provides a list of available aliases and instructions for their use.
- **restart.bat**: Restarts the system while retaining alias settings.
- **StartMe.bat**: Configures the system to automatically use aliases in the command prompt.
- **testfile.bat**: A test script for centering text on the console.

## System Requirements
- Operating System: Windows
- Command Prompt or PowerShell
- Execution permissions for batch files

## Installation
1. Download and extract the contents of the ZIP file into a directory of your choice.
2. Ensure all extracted files are located in the same directory.

## Execution
1. Run the main `StartMe.bat` file to configure the system:
   ```
   StartMe.bat
   ```
2. After configuration, use the aliases defined in `alias.bat` directly in the prompt.

## File Details
### **add.bat**
Interactive script for adding new aliases.
```
alias-new
```

### **alias.bat**
Contains all aliases defined using the `doskey` command. Each alias can be customized by editing this file.

### **help.bat**
Displays a list of available aliases with descriptions. Can be executed with:
```
alias-help
```

### **restart.bat**
Restarts the Command Prompt with the aliases loaded:
```
restart
```

### **StartMe.bat**
Configures the system to automatically load aliases when the prompt opens. Adds an entry to the Windows registry.

### **testfile.bat**
An example script that centers text on the console. Run it to see a practical implementation:
```
testfile.bat
```

## Notes
- Modify the `.bat` files only if necessary.
- Use `help.bat` for a quick guide on aliases.

## Support
For issues or questions, run `help.bat` or contact support.
