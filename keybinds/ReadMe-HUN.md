# Keybind resource a Fivem-hez #

## Billentyűparancsok készítése leegyszerűsítve

---

Ezzel a resource-al képes vagy olyan billentyűparancsokat létrehozni amelyet a felhasználók könnyedén tudnak változtatni saját izlésük szerint
   
Ez a viszonylag új `RegisterKeyMapping` function miatt jöhetett létre, amely képes parancsokhoz billentyűparancsot rendelni.  
  
Az összes billentyűparancs amit ezzel készítesz a GTAV-s beállításokon belül megtalálható és állítható lesz.


## Using the resource ##
----
Ez a resource exportokat használ a billentyűparancsok létrehozására   
A lenti pélák mind `LUA` nyelven vannak feltüntetve, viszont `JavaScript`-ben is müködnek.

### **Egyszerű billentyűparancs készítése:**
```LUA
    exports.keybinds:RegisterKeybind(name, description, key, func)
```
* Name: A billentyűparancs neve. Késöbb a kikapcsolásához fog kelleni.
* description: A billentyűparancs leírása. Ez fog megjelenni a beállításokban is.
* key: Az alapértelmezett billenytű. A következő weboldalon megtalálod az összes lehetőséget: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
* func: A kód ami le fog játszódni amikor lenyomják a billentyűparancs-ot. (Egy function)

### **Lenyomva tartható billentyűparancs készítése:**
```LUA
    exports.keybinds:RegisterHoldKeybind(name, description, key, func, delay)
```
* Name: A billentyűparancs neve. Késöbb a kikapcsolásához fog kelleni.
* description: A billentyűparancs leírása. Ez fog megjelenni a beállításokban is.
* key: Az alapértelmezett billenytű. A következő weboldalon megtalálod az összes lehetőséget: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
* func: A kód ami le fog játszódni amikor lenyomják a billentyűparancs-ot. (Egy function)
* delay: Mennyi idő teljen el kettő lejátszott kódsor között (milisec)

> **Note:** A function mindig először játszódik le, és utána várokozik, így elég ha a felhasználó egyszer lenyomja, akkor is lejátszódik.

### **Kétirányú billentyűparancs készítése:**
```LUA
    exports.keybinds:RegisterTwoWayKeybind(name, description, key, func1, func2)
```
* Name: A billentyűparancs neve. Késöbb a kikapcsolásához fog kelleni.
* description: A billentyűparancs leírása. Ez fog megjelenni a beállításokban is.
* key: Az alapértelmezett billenytű. A következő weboldalon megtalálod az összes lehetőséget: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
* func1: Kód amely lejátszódik amikor lenyomja a felhasználó a billentyűt
* func2: Kód amely lejátszódik amikor felengedi a felhasználó a billentyűt

### **Billentyűparancsok kapcsolása:**
```LUA
    exports.keybinds:ToggleKeybind(name, state)
```
* Name: A billentyűparancs neve amelyet kapcsolni szeretnél
* State: `true` azt jelenti hogy a billentyűparancs nem csinál semmit, `false` azt jelenti hogy a billentyűparancs aktív
