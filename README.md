# FFRK-auto-Lab
Edición full automatica del codigo de Rolen47

Codigo original en: https://github.com/Rolen47/FFRK

Esta secuencia de comandos de Autohotkey atraviesa el Labyrinth en FFRK en modo automatico. 

Requisitos:

  - Autohotkey instalado en tu PC
  - Tu emulador favorito de Android (LDplayer y Nox fueron usados en las pruebas, con una resolucion de 540x960)
  - Las opciones graficas deben estar en "Simplified Display" para que el ImageSearch funcione bien
  - Tu equipo debe ser capaz de vencer incluso el jefe final con 10 puntos de fatiga (se recomienda un equipo Sacro Magico)

  - Para que el script funcione bien, debes remplazar las imagenes de la carpeta /images con imagenes tuyas. Recomiendo la herramienta de windows "Windows Snipping Tool" (Windows+Shift+s)
  - Las imagenes deberian ser lo mas pequeñas posibles. Una vez todas las imagenes han sido remplazadas con las tuyas, presiona F1 para iniciar/pausar el Script. Puedes presionar F2 en cualquier momento para cerrar el script.

Puedes hacer cambios en el script, editando FFRK Labyrinth.ahk con el block de notas.

Notas de esta version. Esto esta en full auto, lo que significa que, una vez esten todas las imagenes, esto volvera a entrar en el mismo laberinto una vez finalizado. Cuando encuentre un tesoro, abrira en orden la cantidad de cofres que tu elijas por codigo.

En las lineas 30 y 31, encontraran lo siguiente:

OpenSealedDoor=yes

OpenChests=1

El primero, es para abrir Sealed Doors. Si lo dejan en Yes, abrira todas las puertas en su camino. Si buscas avanzar rapido, y evitar combates innecesarios (tienen supuestamente un 25% de chance de HE), ponen No

El segundo, OpenChests, elige la cantidad de cofres que van a abrir. 1 por defecto, pero pueden dejarlo en 0 para que suene una alarma (y desactive el full auto, no lo recomiendo), tambien 2 y 3. Para que abra mas cofres. Mientras mas abra, mas llaves consumira.


En la seccion del codigo ";Painting Priorities" puedes cambiar que pinturas vaya a elegir.

Por defecto, estan asi:

Priority1=painting_treasure

Priority2=painting_exploration

Priority3=painting_combatred

Priority4=painting_combatorange

Priority5=painting_combatgreen

Priority6=painting_onslaught

Priority7=painting_restoration

Priority8=painting_portal

Priority9=painting_portal2

Priority0=painting_boss

Priority10=painting_boss2

Al cambiar el orden de estas, cambiaremos cuales seran los cuadros que abriremos. Por ejemplo, si buscamos terminar rapido el laberinto, por puntos u otra cosa, ponemos como prioridad alta (2 o 3) el paintint_portal y el painting_boss, asi cuando aparezca esa pintura, la vaya a elegir y avanzaremos mas rapido en el tema.

Con la configuracion actual, y un equipo que logre derrotar a los jefes en menos de 3 minutos (tiempo real), este script logra pasar el laberinto de 20 niveles en aproximadamente 5 horas. Tomando la ruta mas larga, peleando la mayor cantidad de veces y abriendo todas las pinturas de exploracion.

FFRK Shadow es un script, diseñado para el farmeo de jefes Trascendentales. No hace nada mas que abrirlos, e iniciar la batalla, y hacerle skip al resultado, para luego reiniciar todo el tema. Es util para farmear Giles, en caso de que te hagan falta.
