# Ejecutar el siguiente comando en el ámbito donde esta el script almacenado:
# ./iniciar-proyecto-NodeJS-TypeScript.ps1 -pathCreacionArchivo "C:\Users\PC\Desktop\" -nombreProyecto "reserva"
param (
    # [Parameter(Mandatory=$true)]
    # [string]$pathCreacionArchivo,
    [Parameter(Mandatory=$true)]
    [string]$nombreProyecto
)

$pathCreacionArchivo = "C:\Users\PC\Desktop\"   # descomentar parametro si se considera necesario, esta hecho asi para ejecutarse mas rapido
Set-Location $pathCreacionArchivo   # crea el proyecto en el path determinado en la variable $pathCreacionArchivo, SI NO HAGO ESTO, siempre va a ser donde ejecute el script

try {
    Write-Host "Inicio de la ejecucion del script." -f Cyan
    if (-not (Test-Path $pathCreacionArchivo)) {
        throw "El path '$($pathCreacionArchivo)' no existe."
    }
    if (-not (Test-Path $nombreProyecto)) {
        Write-Host "Creando directorio '$nombreProyecto'." -f Cyan
        mkdir $nombreProyecto
    } else {
        Write-Host "El directorio '$nombreProyecto' ya existe." -f Yellow
    }
  
    Set-Location $nombreProyecto

    if (-not (Test-Path "dist")) {
        Write-Host "Creando directorio 'dist'." -f Cyan
        mkdir "dist"
    } else {
        Write-Host "El directorio 'dist' ya existe." -f Yellow
    }

    if (-not (Test-Path "src")) {
        Write-Host "Creando directorio 'src'." -f Cyan
        mkdir "src"
    } else {
        Write-Host "El directorio 'src' ya existe." -f Yellow;
    }
    Set-Location src

    if (-not (Test-Path "index.ts")) {
        Write-Host "Creando archivo 'index.ts'." -f Cyan
        $indexts=@"
        console.log("Hello World!");
        console.log("Proyecto generado por el script de Agustin Brocani.");
"@
        $indexts | Set-Content -Path "index.ts" -Force
    } else {
        Write-Host "El archivo 'index.ts' ya existe." -f Yellow
    }

    Set-Location ..

    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "nvm", "install", "lts"
    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "nvm", "use", "lts"
    Write-Host "Version de NodeJS instalada y seleccionada con NVM:" -f Magenta
    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "nvm", "list"
    Write-Host "Version del Node Package Module(npm):" -f Magenta
    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "npm", "-v"

    if (-not (Test-Path "package.json")) {
        Write-Host "Creando archivo 'package.json'." -f Cyan
        Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "npm", "init", "-y"
        & npm pkg set main="dist/index.js" scripts.build="tsc" scripts.start="node dist/index.js" scripts.dev="ts-node src/index.ts"
    } else {
        Write-Host "El archivo 'package.json' ya existe." -f Yellow
    }
    
    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "npm", "install", "typescript", "--save-dev"
    
    if (-not (Test-Path "tsconfig.json")) {
        Write-Host "Creando archivo 'tsconfig.json'." -f Cyan
        $tsconfig = @'
        {
          "compilerOptions": {
            "target": "ES6",
            "module": "commonjs",
            "outDir": "./dist",
            "rootDir": "./src",
            "esModuleInterop": true,
            "strict": true,
            "skipLibCheck": true,
            "forceConsistentCasingInFileNames": true
          },
          "include": [
            "src/**/*.ts"
          ]
        }
'@
    
        $tsconfig | Set-Content -Path "tsconfig.json" -Force
    } else {
        Write-Host "El archivo 'tsconfig.json' ya existe." -f Yellow
    }
    
    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "npm", "install", "@types/node", "--save-dev"

    Write-Host "Version del compilador de TypeScript:" -f Magenta
    Start-Process -NoNewWindow -Wait -FilePath "cmd" -ArgumentList "/c", "npx", "tsc", "--version"

    Set-Location "node_modules\"
    if (Test-Path ".package-lock.json") {
        Write-Host "Eliminando archivo '.package-lock.json'." -f Cyan
        Remove-Item ".package-lock.json" -Force -ErrorAction SilentlyContinue    
    }
    Set-Location ..

    Start-Process "code" -ArgumentList "." -WindowStyle Hidden

    Write-Host "Ejecución del script exitosa." -f Green
    
}
catch {
    Write-Host "¡Error! $($_.Exception.Message)" -f Red
}
finally {
    Write-Host "Cerrando terminal de PS..." -f Magenta
    Start-Sleep -Seconds 5
    
    $nombreProcesoPS = (Get-Process -Id $PID).Name
    Stop-Process -Name $nombreProcesoPS -Force
}