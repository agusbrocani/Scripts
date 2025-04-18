# Levantar proyecto local en TypeScript usando TypeScript Compiler y Node.js LTS.
## 📝 Requisitos previos
### 1️⃣ Instalar VS Code
[Descargar VS Code.](https://code.visualstudio.com/download)  
### 2️⃣ Instalar NVM
[Descargar NVM.](https://github.com/coreybutler/nvm-windows?tab=readme-ov-file)
### 3️⃣ Instalar PowerShell 7
[Descargar PowerShell 7.](https://learn.microsoft.com/es-es/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5)  
## ⚡ Ejecutar script
### 4️⃣ Pasos a seguir 
4️⃣.1️⃣ Abra la terminal de **PowerShell**.  
4️⃣.2️⃣ Posicionesé en el directorio donde está el script (desde la terminar de **PowerShell**).
```powershell
#ejemplo
cd "C:\User\PC\Desktop\"
```
⚠️ **Tenga en cuenta:**  
Use el **path** que corresponda, ese comando está a modo de ejemplo.  

4️⃣.3️⃣ Ejecute el script.
```powershell
#ejemplo
./iniciar-proyecto-NodeJS-TypeScript.ps1 -pathCreacionArchivo "C:\User\PC\Desktop\" -nombreProyecto "prueba"
```
⚠️ **Tenga en cuenta:**  
Use el **path** y el **nombre del proyecto** que corresponda, ese comando está a modo de ejemplo.

## 💻 Estructura del proyecto generado:
```bash
[NombreDelProyecto]
├── dist\          # Archivos JavaScript compilados
├── src\           # Archivos fuente en TypeScript
│   └── index.ts   # Archivo principal con "Hello World"
├── node_modules\  # Dependencias de Node.js
├── package.json   # Configuracion de dependencias
├── tsconfig.json  # Configuracion de TypeScript
```
**Escrito por** [Agustín Brocani](https://www.linkedin.com/in/agusbrocani/).    
📅 **2025**  
