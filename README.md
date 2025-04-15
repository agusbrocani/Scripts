# Scripts
### 0️⃣.0️⃣ Instalar PowerShell 7
### 0️⃣.1️⃣ Instalar NVM
### 1️⃣ Instalar `PnP.PowerShell`
Ejecuta el siguiente comando en PowerShell para instalar el módulo **PnP.PowerShell** en el ámbito del usuario actual:

```powershell
   Install-Module PnP.PowerShell -Scope CurrentUser
```

Cuando se te solicite, elige la opción [A] Sí a todo.
✅ Verificar instalación
Para confirmar que el módulo se ha instalado correctamente, ejecuta:

```powershell
   Get-Module -ListAvailable -Name PnP.PowerShell
```

2️⃣ Instalar Microsoft.Online.SharePoint.PowerShell
Ejecuta el siguiente comando para instalar la versión específica del módulo Microsoft.Online.SharePoint.

```powershell
   Install-Module -Name Microsoft.Online.SharePoint.PowerShell -RequiredVersion 16.0.24524.12000
```

Cuando se te solicite, elige la opción [A] Sí a todo.

✅ Verificar instalación

Para comprobar que el módulo se instaló correctamente, ejecuta:

```powershell
   Get-Module -ListAvailable -Name Microsoft.Online.SharePoint.PowerShell
```
