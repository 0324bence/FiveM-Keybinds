# Keybind resource for FiveM #

## Creating custom keybinds for fivem made easy.

---

This resource allows you to create dynamic keybinds that users can customize for their own tastes.   
   
This is able because of the relatively new `RegisterKeyMapping` feature in fivem which allows us to bind commands to certain keys.  
  
These keys will show up under the keybind settings in the native GTAV settings menu.


## Using the resource ##
----
This resource uses exports to handle the registering of keybinds.   
All examples below will be in `LUA` but they can be used in `JavaScript` as well.

### **Creating a simple keybind:**
```LUA
    exports.keybinds:RegisterKeybind(name, description, key, func)
```
* Name: The name of the keybind, later needed to toggle it on/off
* description: The description of the keybind. This will show up in the settings.
* key: A key to be used as default. You can get the key ids from this website: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
* func: This is the function that will be played on the press of the keybind

### **Creating a keybind that needs to be held down:**
```LUA
    exports.keybinds:RegisterHoldKeybind(name, description, key, func, delay)
```
* Name: The name of the keybind, later needed to toggle it on/off
* description: The description of the keybind. This will show up in the settings.
* key: A key to be used as default. You can get the key ids from this website: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
* func: This is the function that will be played when the keybind is held down
* delay: This sets the frequency of the function playing while the keybind is held down (miliseconds)

> **Note:** The function always plays first, so when you press the keybind once, the function still plays

### **Creating a two way keybind:**
```LUA
    exports.keybinds:RegisterTwoWayKeybind(name, description, key, func1, func2)
```
* Name: The name of the keybind, later needed to toggle it on/off
* description: The description of the keybind. This will show up in the settings.
* key: A key to be used as default. You can get the key ids from this website: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
* func1: This is the function that will be played when the keybind is pressed
* func2: This is the function that will be played when the keybind is released

### **Toggling the keybinds:**
```LUA
    exports.keybinds:ToggleKeybind(name, state)
```
* Name: The name of the keybind that you want to toggle
* State: `true` means the keybind doesn't do anything, `false` means the keybind is active
