param(
    [string]$pathProyecto
)

try {
    Write-Host "Inicio de la ejecucion del script." -f Cyan

    if (-not $pathProyecto) {
        throw "No existe pathProyecto. `nEjemplo de ingreso valido: .\agregarJest.ps1 -pathProyecto 'C:\User\PC\Desktop\NombreDelProyecto'"
    }

    Set-Location $pathProyecto

    $comandosAEjecutar = @(
        'npm install jest --global',
        'npm install --save-dev ts-jest @types/jest typescript',
        'npm install --save-dev ts-node',
        'npm install --save-dev ts-jest @types/jest typescript'
    )

    Write-Host "Ejecutando comandos npm..." -f Cyan
    foreach ($cmd in $comandosAEjecutar) {
        Write-Host "> $cmd" -f Yellow
        Invoke-Expression $cmd
    }

    New-Item -Path "$pathProyecto\src" -ItemType Directory -Force | Out-Null
    New-Item -Path "$pathProyecto\test" -ItemType Directory -Force | Out-Null

$archivos = @{
    "$pathProyecto\src\suma.ts" = @"
export const suma = (a: number, b: number): number => a + b;
"@

    "$pathProyecto\test\suma.test.ts" = @"
import {describe, expect, test} from '@jest/globals';
import {suma} from '../src/suma';

describe('Funcion de suma', () => {
  test('Sumar 1 + 2 da 3', () => {
    expect(suma(1, 2)).toBe(3);
  });
});
"@

    "$pathProyecto\jest.config.ts" = @"
import type { Config } from 'jest';

const config: Config = {
  preset: 'ts-jest',
  testEnvironment: 'node',
};

export default config;
"@
}

    Write-Host "Creando archivos..." -f Cyan
    foreach ($archivo in $archivos.Keys) {
        $contenido = $archivos[$archivo]
        $directorio = Split-Path $archivo -Parent
        if (!(Test-Path $directorio)) {
            New-Item -Path $directorio -ItemType Directory -Force | Out-Null
        }
        Set-Content -Path $archivo -Value $contenido -Encoding UTF8
        Write-Host "Archivo creado: $archivo" -f Green
    }

    Write-Host "`nJest agregado con exito al proyecto." -f Green
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
