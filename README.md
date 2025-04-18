# Crear proyecto local en TypeScript usando TypeScript Compiler y Node.js LTS.
## 🚀 Clonar este repositorio  
```bash
    git clone -b main "https://github.com/agusbrocani/Scripts"
```
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

4️⃣.3️⃣ Ejecute el script: pathCreacionArchivo debe ser en donde quiere crear el proyecto.
```powershell
#ejemplo
./iniciar-proyecto-NodeJS-TypeScript.ps1 -pathCreacionArchivo "C:\User\PC\Desktop\" -nombreProyecto "prueba"
```
⚠️ **Tenga en cuenta:**  
Use el **pathCreacionArchivo** y el **nombreProyecto** que corresponda, ese comando está a modo de ejemplo.

4️⃣.4️⃣ Ejecute el siguiente comando en la consola del VS Code.
```npm
    npm run dev
```
✅ **Creación del proyecto realizada con éxito**

## 💻 Estructura del proyecto generado
```bash
[NombreDelProyecto]
├── dist\          # Archivos JavaScript compilados
├── src\           # Archivos fuente en TypeScript
│   └── index.ts   # Archivo principal con "Hello World"
├── node_modules\  # Dependencias de Node.js
├── package.json   # Configuracion de dependencias
├── tsconfig.json  # Configuracion de TypeScript
```
## 🧪 [OPCIONAL] Agregar Jest
### 5️⃣ Pasos a seguir
5️⃣.1️⃣ Abra la terminal de **PowerShell**.  
5️⃣.2️⃣ Posicionesé en el directorio donde está el script (desde la terminar de **PowerShell**).
```powershell
#ejemplo
cd "C:\User\PC\Desktop\"
```
⚠️ **Tenga en cuenta:**  
Use el **path** que corresponda, ese comando está a modo de ejemplo.  

5️⃣.3️⃣ Ejecute el script: pathProyecto debe ser en donde está el proyecto creado previamente.
```powershell
#ejemplo
./agregarJest.ps1 -pathProyecto "C:\User\PC\Desktop\NombreDelProyecto"
```
⚠️ **Tenga en cuenta:**  
Use el **pathProyecto** que corresponda, ese comando está a modo de ejemplo.

5️⃣.4️⃣ Ejecute el siguiente comando en la consola del VS Code.
```npm
    npm run test
```

✅ **Añadió Jest al proyecto con éxito**

## 💻 Estructura del proyecto generado + Jest
```bash
[NombreDelProyecto]
├── dist\               # Archivos JavaScript compilados
├── node_modules\       # Dependencias de Node.js
├── src\                # Archivos fuente en TypeScript
│   ├── index.ts        # Archivo principal con "Hello World"
│   └── suma.ts         # Archivo con función suma de prueba
├── test\               # Archivos de testing
│   └── suma.test.ts    # Pruebas unitarias para el modulo 'suma.ts' usando Jest
├── jest.config.ts      # Configuracion de Jest para testing en TypeScript
├── package.json        # Configuracion de dependencias
├── tsconfig.json       # Configuracion de TypeScript
```

**Escrito por** [Agustín Brocani](https://www.linkedin.com/in/agusbrocani/).    
📅 **2025**  
