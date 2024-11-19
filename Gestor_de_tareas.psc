Algoritmo Gestor_de_Tareas
	//Variables para tareas
	Definir tarea_nro, tarea_fechaini, tarea_estado Como Entero //variables a vectorizar para tareas
	Definir tarea_nombre Como Caracter //variables de caracteres para tareas
	Definir cont_tareas como Entero// variables auxiliares para tareas
	
	//Variables para proyectos
	Definir proyecto_nro, ref_tarea_proyecto, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado Como Entero //variables a vectorizar para proyectos
	Definir proyecto_nombre, p_tarea_nombre Como Caracter //variables de caracteres para proyectos
	Definir cont_proyectos, cont_tareas_proy, cant_tareas_proy como Entero// variables auxiliares para proyectos
	
	//Variables auxiliares
	Definir min, max, i, j, k, n, m, eleccion, op, flag, dia, mes como Entero
	
	n<-20 // Cantidad de tareas individuales permitidas
	m<-20 // Cantidad de tareas totales de proyectos permitidas
	cont_tareas<-0 //inicializcion del contador de tareas
	cont_proyectos<-0 //inicializcion del contador de proyectos
	cont_tareas_proy<-0 //inicializcion del contador de tareas de proyectos
	min<-m+1
	max<-0
	
	Dimension tarea_nro[n], tarea_nombre[n], tarea_fechaini[n], tarea_estado[n] //Vectorizacion de variables de tareas
	Dimension proyecto_nro[m], ref_tarea_proyecto[m], p_tarea_nro[m], p_tarea_fechaini[m], p_tarea_duracion[m], p_tarea_estado[m], proyecto_nombre[m], p_tarea_nombre[m] //Vectorizacion de variables de proyectos
	
	Escribir "La presente version del programa admite hasta " n " tareas inividuales y " m " tareas pertenecientes a proyectos."
	PrecargarTareas(cont_tareas, tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre)
	PrecargarProyecto(ref_tarea_proyecto, proyecto_nro, proyecto_nombre, cont_proyectos, cont_tareas_proy, p_tarea_nro, p_tarea_fechaini, p_tarea_estado, p_tarea_nombre, p_tarea_duracion)
	PrecargarTareas(cont_tareas, tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre)
	PrecargarProyecto(ref_tarea_proyecto, proyecto_nro, proyecto_nombre, cont_proyectos, cont_tareas_proy, p_tarea_nro, p_tarea_fechaini, p_tarea_estado, p_tarea_nombre, p_tarea_duracion)
	PrecargarProyecto(ref_tarea_proyecto, proyecto_nro, proyecto_nombre, cont_proyectos, cont_tareas_proy, p_tarea_nro, p_tarea_fechaini, p_tarea_estado, p_tarea_nombre, p_tarea_duracion)
	Repetir
		Limpiar pantalla
		Escribir " ---------- Bienvenido al gestor de tareas y proyectos ---------- "
		Escribir "|                                                                |"
		Escribir "|                                                                |"
		Escribir "| Elija una opci�n del men�:                                     |"
		Escribir "|                                                                |"
		Escribir "|                                                                |"
		Escribir "| 1.Tareas (crear, modificar, eliminar, visualizar)              |"
		Escribir "|                                                                |"
		Escribir "| 2.Proyectos (crear, modificar, eliminar, visualizar)           |"
		Escribir "|                                                                |"
		Escribir "| 3.Calendario (consolidado de tareas)                           |"
		Escribir "|                                                                |"
		Escribir "| 4.Herramienta Hoja de calculo                                  |"
		Escribir "|                                                                |"
		Escribir "| 0.Finalizar programa                                           |"
		Escribir "|                                                                |"
		Escribir " ----------------------------------------------------------------"
		Escribir "Elija la opcion deseada: "
		Leer op
		Segun op Hacer
			1:
				Limpiar Pantalla
				menu_tareas(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, flag, dia, mes, n, eleccion)
			2:
				Limpiar Pantalla
				menu_proyectos(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j, flag, dia, mes, m, min, max, eleccion)
			3:
				Limpiar Pantalla
				Calendario(p_tarea_nro, p_tarea_fechaini, p_tarea_estado, p_tarea_nombre, tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, cont_tareas_proy, m, n)
			4:
				Limpiar Pantalla
				HojaDeCalculo()
			0:
				Escribir "Se finaliza el programa."
			Otro:
				Escribir "La opcion ingresada no esta en el men�."
				Limpiar Pantalla
		FinSegun
	Hasta que op = 0		
FinAlgoritmo

// FUNCIONES PARA TAREAS (Menu, crear, modificar, visualizar y eliminar)
Funcion menu_tareas(tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Referencia, i Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, n por valor, eleccion Por Referencia)
	Encabezado()
	Repetir
		Escribir "  ---------- MENU DE TAREAS ------------"
		Escribir " |                                      |"
		Escribir " |                                      |"
		Escribir " | Elija una opci�n del men�:           |"
		Escribir " |                                      |"
		Escribir " |                                      |"
		Escribir " | 1. Crear tareas                      |"
		Escribir " |                                      |"
		Escribir " | 2. Modificar tareas                  |"
		Escribir " |                                      |"
		Escribir " | 3. Visualizar tareas (Kanban)        |"
		Escribir " |                                      |"
		Escribir " | 4. Eliminar tareas                   |"
		Escribir " |                                      |"
		Escribir " | 0. Volver al menu principal          |"
		Escribir " |                                      |"
		Escribir "  --------------------------------------"
		Escribir "  Elija una opcion: "
		Leer eleccion
		Segun eleccion Hacer
			1:
				Si cont_tareas >= n Entonces
					Escribir "Se alcanz� el m�ximo nro de tareas disponibles en esta version (20). Elimine una tarea existente para liberar espacio."
				SiNo
					crear_tarea(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, flag, dia, mes)
				FinSi
			2:
				modificar_tarea(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, k, flag, dia, mes)
			3:
				KanbanTablero(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas)
			4:
				eliminar_tarea(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, j, k, flag, dia, mes)
			0:
				Escribir "Se retorna al menu principal"
			Otro:
				Escribir "La opcion no esta en el men�."
		FinSegun
	Hasta que eleccion = 0

Fin Funcion

Funcion crear_tarea (tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Referencia, i Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia)
	Encabezado()
	tarea_nro[cont_tareas] <- cont_tareas+1
	Escribir " | Ingrese la tarea N�" tarea_nro[cont_tareas] "                                           |"
	Escribir " | Nombre de la tarea:                                            |"
	Leer tarea_nombre[cont_tareas]
	Mientras (tarea_nombre[cont_tareas] = "") Hacer
		Escribir "| Nombre de la tarea:                                            |"
		Leer tarea_nombre[cont_tareas]
	FinMientras
	Escribir " | Fecha de ejecucion de la tarea - Ingrese dia (1 a 30):         |"
	Leer dia
	Mientras (dia < 1 o dia > 30)
		Escribir "| Dia fuera rango, ingrese el dia nuevamente (1 a 30):           |"
		leer dia
	FinMientras
	Escribir " | Fecha de ejecucion de la tarea - Ingrese mes (1 a 12):         |"
	Leer mes
	Mientras (mes < 1 o mes > 12)
		Escribir "| Mes fuera rango, ingrese el mes nuevamente (1 a 12):           |"
		leer mes
	FinMientras
	tarea_fechaini[cont_tareas] <- mes*100+dia
	Escribir " | Estado de la tarea (Ingrese un n� del 0 al 2):                 |"
	Escribir " | 0. No iniciada.                                                |"
	Escribir " | 1. En proceso.                                                 |"
	Escribir " | 2. Finalizada.                                                 |"
	Leer tarea_estado[cont_tareas]
	Mientras tarea_estado[cont_tareas] < 0 o tarea_estado[cont_tareas] > 2
		Escribir " | Estado de la tarea no valido. Ingrese un n� del 0 al 2:        |"
		Escribir " | 0. No iniciada.                                                |"
		Escribir " | 1. En proceso.                                                 |"
		Escribir " | 2. Finalizada.                                                 |"
		Leer tarea_estado[cont_tareas]
	FinMientras
	Escribir " ----------------------------------------------------------------"
	Escribir "Tarea creada con �xito." 
	cont_tareas <- cont_tareas+1
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinFuncion

Funcion modificar_tarea (tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Valor, i Por Referencia, k Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia)
	Encabezado()
	Escribir " ---------------------------------------------------------------- "
	Escribir "| Listado de tareas existentes                                   |"
	Escribir " ---------------------------------------------------------------- "
	Escribir "| N�       Tarea                     Fecha       Estado          |"
	Para k<-0 hasta cont_tareas-1 con paso 1 Hacer
		imprimir_tarea(tarea_nro, tarea_nombre, tarea_fechaini, tarea_estado, k)
	FinPara
	Escribir " ---------------------------------------------------------------- "
	Escribir "| Ingrese el Nro de la tarea que desea modificar:                |"
	Leer i
	Mientras i>cont_tareas O i< 1 Hacer
		Escribir "| La tarea no existe, ingrese el n� de tarea a modificar:        |"
		Leer i
	FinMientras
	i <- i-1
	Repetir
		Escribir "| �Qu� desea modificar de la tarea seleccionada?                 |"
		Escribir "| 1. Nombre                                                      |"
		Escribir "| 2. Fecha de ejecucion                                          |"
		Escribir "| 3. Estado                                                      |"
		Escribir "| 0. Volver al menu principal                                    |"
		Escribir "| Elija una opcion:                                              |"
		Leer flag
		Segun flag Hacer
			1:
				Escribir "| Nuevo nombre de la tarea:                                      |"
				Leer tarea_nombre[i]
			2:
				Escribir "| Nueva fecha de ejecucion de la tarea - Ingrese dia (1 a 30):       |"
				Leer dia
				Mientras (dia < 1 o dia > 30)
					Escribir "| Dia fuera rango, ingrese el dia nuevamente (1 a 30):           |"
					leer dia
				FinMientras
				Escribir "| Nueva fecha de ejecucion de la tarea - Ingrese mes (1 a 12):   |"
				Leer mes
				Mientras (mes < 1 o mes > 12)
					Escribir "| Mes fuera rango, ingrese el mes nuevamente (1 a 12):           |"
					leer mes
				FinMientras
				tarea_fechaini[i] <- mes*100+dia
			3:
				Escribir "| Estado de la tarea (Ingrese un n� del 0 al 2):                 |"
				Escribir "| 0. No iniciada.                                                |"
				Escribir "| 1. En proceso.                                                 |"
				Escribir "| 2. Finalizada.                                                 |"
				Leer tarea_estado[i]
				Mientras tarea_estado[i] < 0 o tarea_estado[i] > 2
					Escribir "| Estado de la tarea no valido. Ingrese un n� del 0 al 2:        |"
					Escribir "| 0. No iniciada.                                                |"
					Escribir "| 1. En proceso.                                                 |"
					Escribir "| 2. Finalizada.                                                 |"
					Leer tarea_estado[i]
				FinMientras
			0:
				Escribir "Se retorna al menu principal"
			Otro:
				Escribir "La opcion no esta en el men�."
		FinSegun
		Si flag>0 Y flag<=3 entonces
			Escribir "Tarea modificada con �xito."
			Repetir
				Escribir "Desea modificar otro campo de la tarea seleccionada?:"
				Escribir "0.No"
				Escribir "1.Si"
				leer flag
				Si flag < 0 o flag > 1 Entonces
					Escribir "Opcion incorrecta."
				FinSi
				Limpiar Pantalla
			Hasta Que flag = 0 O flag = 1
		FinSi
	Hasta que flag = 0
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
Fin Funcion

Funcion KanbanTablero(tarea_nro por referencia, tarea_fechaini por referencia, tarea_estado por referencia, tarea_nombre por referencia, cont_tareas por valor)
    Definir porHacerLista, enProgresLista, hechoLista Como Cadena
    Definir seleccion, tarea Como Cadena
    Definir i Como Entero
    Dimension porHacerLista[15]
    Dimension enProgresLista[15]
    Dimension hechoLista[15]
    
	
    Inicializar_Tablero(porHacerLista, enProgresLista, hechoLista)
    
    
    Para i <- 0 Hasta cont_tareas-1 Con Paso 1 Hacer
        Si tarea_estado[i] = 0 Entonces
            porHacerLista[i] <- tarea_nombre[i]
        Sino
            Si tarea_estado[i] = 1 Entonces
                enProgresLista[i] <- tarea_nombre[i]
            Sino
                Si tarea_estado[i] = 2 Entonces
                    hechoLista[i] <- tarea_nombre[i]
                FinSi
            FinSi
        FinSi
    FinPara
    
	

	Limpiar Pantalla
	Mostrar_Menu_Principal()
	Mostrar_Tablero_Completo(porHacerLista, enProgresLista, hechoLista)
	Mostrar_Estado_Tareas(porHacerLista, enProgresLista, hechoLista)
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla   
FinFuncion

// Funci�n para inicializar el tablero
Funcion Inicializar_Tablero(porHacerLista, enProgresLista, hechoLista)
    Definir i Como Entero
    Para i <- 0 Hasta 14 Con Paso 1 Hacer
        porHacerLista[i] <- ""
        enProgresLista[i] <- ""
        hechoLista[i] <- ""
    FinPara
FinFuncion

Funcion Mostrar_Menu_Principal
	Escribir "+-----------------------------------------------------------------------+"
	Escribir "|                           TABLERO KANBAN                              |"
	Escribir "+-----------------------------------------------------------------------+"
FinFuncion

Funcion Mostrar_Estado_Tareas(porHacerLista, enProgresLista, hechoLista)
    Definir i, porHacer, enProgreso, terminadas Como Entero
    porHacer <- 0
    enProgreso <- 0
    terminadas <- 0
    
    Para i <- 0 Hasta 14 Con Paso 1 Hacer
        Si porHacerLista[i] <> "" Entonces
            porHacer <- porHacer + 1
        FinSi
        Si enProgresLista[i] <> "" Entonces
            enProgreso <- enProgreso + 1
        FinSi
        Si hechoLista[i] <> "" Entonces
            terminadas <- terminadas + 1
        FinSi
    FinPara
    
    Escribir "Estado Actual del Tablero:"
    Escribir "Tareas No Iniciadas: ", porHacer
    Escribir "Tareas en Proceso: ", enProgreso
    Escribir "Tareas Finalizadas: ", terminadas
	Escribir ""
FinFuncion

Funcion Mostrar_Tablero_Completo(porHacerLista, enProgresLista, hechoLista)
    Definir i Como Entero
    Escribir "+-----------------------+-----------------------+-----------------------+"
    Escribir "|      NO INICIADA      |      EN PROGRESO       |       FINALIZADA     |"
    Escribir "+-----------------------+-----------------------+-----------------------+"
    
    Para i <- 0 Hasta 9 Con Paso 1 Hacer
        Escribir "| ", AjustarTexto(porHacerLista[i]), " | ", AjustarTexto(enProgresLista[i]), " | ", AjustarTexto(hechoLista[i]), " |"
        Escribir "+-----------------------+-----------------------+-----------------------+"
    FinPara
	Escribir ""
FinFuncion

Funcion text <- AjustarTexto(entrada)
    Definir text, espacios Como Cadena
    Definir i Como Entero
    Si Longitud(entrada) > 20 Entonces
        text <- Subcadena(entrada, 0, 20)
    Sino
        text <- entrada
        espacios <- ""
        Para i <- 0 Hasta 20 - Longitud(entrada) Con Paso 1 Hacer
            espacios <- Concatenar(espacios, " ")
        FinPara
        text <- Concatenar(text, espacios)
    FinSi
FinFuncion


Funcion eliminar_tarea (tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Referencia, i Por Referencia, j Por Referencia, k Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia)
	Encabezado()
	Escribir " ---------------------------------------------------------------- "
	Escribir "| Listado de tareas existentes                                   |"
	Escribir " ---------------------------------------------------------------- "
	Escribir "| N�       Tarea                     Fecha       Estado          |"
	Para i<-0 hasta cont_tareas-1 con paso 1 Hacer
		imprimir_tarea(tarea_nro, tarea_nombre, tarea_fechaini, tarea_estado, i)
	FinPara
	Escribir " --------------------------------------------------------------- "
	Escribir "| Ingrese el Nro de la tarea que desea eliminar:                 |"
	Leer i
	Mientras i>cont_tareas o i<=0 Hacer
		Escribir "| La tarea no existe, ingrese el n� de tarea a eliminar:         |"
		Leer i
	FinMientras
	i <- i-1
	Para j<-i hasta cont_tareas-2 con paso 1 Hacer
		tarea_nombre[j]<-tarea_nombre[j+1]
		tarea_fechaini[j]<-tarea_fechaini[j+1]
		tarea_estado[j]<-tarea_estado[j+1]
	FinPara
	tarea_nro[cont_tareas]<-0
	tarea_nombre[cont_tareas]<-"Tarea eliminada"
	tarea_fechaini[cont_tareas]<-0
	tarea_estado[cont_tareas]<-3
	cont_tareas<-cont_tareas - 1
	Escribir ""
	Escribir "Tarea eliminada con exito."
	Escribir ""
	Escribir " ---------------------------------------------------------------- "
	Escribir "| Nuevo listado de tareas                                        |"
	Escribir " ---------------------------------------------------------------- "
	Escribir "| N�       Tarea                     Fecha       Estado          |"
	Para i<-0 hasta cont_tareas-1 con paso 1 Hacer
		imprimir_tarea(tarea_nro, tarea_nombre, tarea_fechaini, tarea_estado, i)
	FinPara
	Escribir " ---------------------------------------------------------------- "
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinFuncion

Funcion imprimir_tarea (tarea_nro Por Referencia, tarea_nombre Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, k Por Valor)
	Escribir "| " tarea_nro[k] sin saltar
	Escribir "    " sin saltar
	Escribir tarea_nombre[k] sin saltar
	Para g<-0 hasta (30-Longitud(tarea_nombre[k])) con paso 1 hacer
		Escribir sin saltar " "
	FinPara
	Escribir tarea_fechaini[k] MOD 100 "/" sin saltar // desglosar el numero
	Escribir TRUNC(tarea_fechaini[k]/100) sin saltar // desglosar el numero
	Escribir "     " sin saltar
	Segun tarea_estado[k] hacer
		0:
			Escribir sin saltar "No iniciada"
		1:
			Escribir sin saltar "En proceso "
		2:
			Escribir sin saltar "Finalizada "
		3:
			Escribir sin saltar "Eliminada  "
	FinSegun
	Escribir "        |"
FinFuncion

// MENU PARA PROYECTOS (Menu, crear, modificar, visualizar y eliminar)
Funcion menu_proyectos(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, m por Valor, min por referencia, max por referencia, eleccion Por Referencia)
	Encabezado()
	Repetir
		Escribir "   -------- MENU DE PROYECTOS ---------  "
		Escribir " |                                      |"
		Escribir " |                                      |"
		Escribir " | Elija una opci�n del men�:           |"
		Escribir " |                                      |"
		Escribir " |                                      |"
		Escribir " | 1.Crear proyecto                     |"
		Escribir " |                                      |"
		Escribir " | 2.Modificar proyecto                 |"
		Escribir " |                                      |"
		Escribir " | 3.Visualizar proyecto (Gantt)        |"
		Escribir " |                                      |"
		Escribir " | 4.Eliminar proyecto                  |"
		Escribir " |                                      |"
		Escribir " | 0.Volver al menu principal           |"
		Escribir " |                                      |"
		Escribir "  --------------------------------------"
		Escribir "  Elija una opcion: "
		Leer eleccion
		Segun eleccion Hacer
			1:
				Si cont_proyectos>=m Entonces
					Escribir "Se alcanz� el m�ximo nro de proyectos en esta version (20). Elimine un proyecto existente para liberar espacio."
				SiNo
					Limpiar Pantalla
					crear_proyecto(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j, flag, dia, mes, m)
				FinSi
			2:
				Limpiar Pantalla
				modificar_proyecto(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, k, j, flag, dia, mes, min, max, m)
			3:
				Limpiar Pantalla
				Gantt(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, k, j, flag, dia, mes, min, max)
			4:
				Limpiar Pantalla
				eliminar_proyecto(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, k, j, flag, dia, mes, min, max)
			0:
				Limpiar Pantalla
				Escribir "Se retorna al menu principal"
			Otro:
				Limpiar Pantalla
				Escribir "La opcion no esta en el men�."
		FinSegun
	Hasta que eleccion = 0
Fin Funcion

Funcion crear_proyecto(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, m por valor)
	Encabezado()
	Escribir "| Ingrese la cantidad de tareas que componen su proyecto:        |"
	Leer cant_tareas_proy
	Si cant_tareas_proy > (m-cont_tareas_proy)
		Escribir "| Su proyecto requiere m�s tareas que las disponibles.           |"
	Sino
		proyecto_nro[cont_proyectos]<-cont_proyectos+1
		Escribir "| Ingrese el nombre del proyecto N� " proyecto_nro[cont_proyectos] ":                           |"
		Leer proyecto_nombre[cont_proyectos]
		Para i<-0 Hasta (cant_tareas_proy-1) Con Paso 1 Hacer
			p_tarea_nro[cont_tareas_proy] <- cont_tareas_proy+1
			Escribir "| Ingrese la tarea N� " cont_tareas_proy+1 "                                          |" 
			Escribir "| Nombre de la tarea:                                            |"
			Leer p_tarea_nombre[cont_tareas_proy]
			Escribir "| Fecha de inicio de la tarea - Ingrese dia (1 a 30):            |"
			Leer dia
			Mientras (dia < 1 o dia > 30)
				Escribir "| Dia fuera rango, ingrese el dia nuevamente (1 a 30):           |"
				leer dia
			FinMientras
			Escribir "| Fecha de inicio de la tarea - Ingrese mes (1 a 12):            |"
			Leer mes
			Mientras (mes < 1 o mes > 12)
				Escribir "| Mes fuera rango, ingrese el mes nuevamente (1 a 12):           |"
				leer mes
			FinMientras
			p_tarea_fechaini[cont_tareas_proy] <- mes*100+dia
			Escribir "| Ingrese la cantidad de dias que dura la tarea:                 |"
			Leer dia
			p_tarea_duracion[cont_tareas_proy] <- dia
			Escribir "| Estado de la tarea:                                            |"
			Escribir "| 0. No iniciada.                                                |"
			Escribir "| 1. En proceso.                                                 |"
			Escribir "| 2. Finalizada.                                                 |"
			Leer p_tarea_estado[cont_tareas_proy]
			Mientras p_tarea_estado[cont_tareas_proy] < 0 o p_tarea_estado[cont_tareas_proy] > 2
				Escribir "| Estado de la tarea no valido, ingrese nuevamente:              |"
				Escribir "| 0. No iniciada.                                                |"
				Escribir "| 1. En proceso.                                                 |"
				Escribir "| 2. Finalizada.                                                 |"
				Leer p_tarea_estado[cont_tareas_proy]
			FinMientras
			ref_tarea_proyecto[cont_tareas_proy]<-cont_proyectos+1 //asocia las tareas al nro de proyecto para luego poder modificar, imprimir o eliminar un proyecto entero
			cont_tareas_proy<-cont_tareas_proy+1
			Escribir "Tarea creada con �xito."
		FinPara
		cont_proyectos <- cont_proyectos+1
		Escribir ""
		Escribir "Presione Enter para continuar..."
		Esperar Tecla
		Limpiar Pantalla
	Finsi
Fin Funcion

Funcion modificar_proyecto(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, k por referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, min por referencia, max por referencia, m por valor)
	Encabezado()
	Si cont_proyectos=0 Entonces
		Escribir "No hay ningun proyecto vigente para modificar"
	SiNo
		Para i<-0 hasta cont_proyectos-1 con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
		Escribir ""
		Escribir "| Ingrese el Nro del proyecto que desea modificar.                |"
		Leer i
		Mientras i<=0 o i>cont_proyectos Hacer
			Escribir "| El proyecto indicado no existe                                  |"
			Escribir "| Ingrese el proyecto nuevamente:                                 |"
			Leer i
		FinMientras
		i<-i-1
		Limpiar Pantalla
		Escribir ""
		Escribir "| Proyecto seleccionado:                                          |"
		imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		min<-m+1
		max<-0
		Para j<-0 hasta cont_tareas_proy-1 con paso 1 hacer 
			Si ref_tarea_proyecto[j] = i+1 entonces
				si p_tarea_nro[j] < min entonces
					min<-p_tarea_nro[j]
				FinSi
				si p_tarea_nro[j] > max entonces
					max<-p_tarea_nro[j]
				FinSi
			FinSi
		FinPara	
		Escribir ""
		Escribir "| Seleccione la tarea que desea modificar:                        |"
		Leer j
		Mientras j<min O j>max Hacer
			Escribir "| La tarea indicada no pertenece a este proyecto                  |"
			Escribir "| Ingrese la tarea nuevamente:                                    |"
			Leer j
		FinMientras
		j<-j-1
		
		Repetir
			Escribir "| �Qu� desea modificar de la tarea seleccionada?                  |"
			Escribir "| 1.Nombre                                                        |"
			Escribir "| 2.Fecha de inicio                                               |"
			Escribir "| 3.Fecha de finalizacion                                         |"
			Escribir "| 4.Estado                                                        |"
			Escribir "| 0.Volver al menu principal                                      |"
			Escribir "| Elija una opcion:                                               |"
			Leer flag
			Segun flag Hacer
				1:
					Escribir "| Nuevo nombre de la tarea:                                       |"
					Leer p_tarea_nombre[j]
				2:
					Escribir "| Nueva fecha de inicio de la tarea - Ingrese dia (1 a 30):       |"
					Leer dia
					Mientras (dia < 1 o dia > 30)
						Escribir "| Dia fuera rango, ingrese el dia nuevamente (1 a 30):           |"
						leer dia
					FinMientras
					Escribir "| Fecha de inicio de la tarea - Ingrese mes (1 a 12):             |"
					Leer mes
					Mientras (mes < 1 o mes > 12)
						Escribir "| Mes fuera rango, ingrese el mes nuevamente (1 a 12):           |"
						leer mes
					FinMientras
					p_tarea_fechaini[j] <- mes*100+dia
				3:
					Escribir "| Nueva duracion de la tarea:                                     |"
					Leer dia
					p_tarea_duracion[j] <- dia
				4:
					Escribir "| Estado de la tarea:                                             |"
					Escribir "| 0. No iniciada.                                                 |"
					Escribir "| 1. En proceso.                                                  |"
					Escribir "| 2. Finalizada.                                                  |"
					Leer p_tarea_estado[j]
					Mientras p_tarea_estado[j] < 0 o p_tarea_estado[j] > 2
						Escribir "| Estado de la tarea no valido, ingrese nuevamente:               |"
						Escribir "| 0. No iniciada.                                                 |"
						Escribir "| 1. En proceso.                                                  |"
						Escribir "| 2. Finalizada.                                                  |"
						Leer p_tarea_estado[j]
					FinMientras
				0:
					Escribir "Se retorna al menu principal"
				Otro:
					Escribir "La opcion no esta en el men�."
			FinSegun
			Si flag>0 Y flag<=4 entonces
				Escribir "Tarea modificada con �xito."
				Repetir
					Escribir "Desea modificar otro campo de la tarea seleccionada?:"
					Escribir "0.No"
					Escribir "1.Si"
					leer flag
					Si flag < 0 o flag > 1 Entonces
						Escribir "Opcion incorrecta."
					FinSi
				Hasta Que flag = 0 O flag = 1
				Limpiar Pantalla
				Escribir ""
			FinSi
		Hasta que flag = 0
	FinSi
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
Fin Funcion

Funcion Gantt(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, k por referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, min por referencia, max por referencia)
	Si cont_proyectos=0 Entonces
		Escribir "No hay ningun proyecto vigente para visualizar"
	SiNo
		Para i<-0 hasta cont_proyectos-1 con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
		Escribir ""
		Escribir "Ingrese el Nro del proyecto que desea visualizar:"
		Leer i
		Mientras i<=0 o i>cont_proyectos Hacer
			Escribir "Numero de proyecto inexistente, ingresar numero nuevamente: "
			leer i
		FinMientras
		i<-i-1
		Escribir ""
		// Dibujar el encabezado del Gantt
		Escribir "DIAGRAMA DE GANTT"
		Escribir "----------------"
		Escribir ""
		Escribir "Proyecto N�" proyecto_nro[i] ": " proyecto_nombre[i]
		Escribir "------------------------------+-----------------------------------------------------------------------------------------"
		Escribir "Tarea                         | 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30"
		Escribir "------------------------------+-----------------------------------------------------------------------------------------"
		
		// Dibujar cada tarea
		Definir z, inicio, duracion como entero
		Para z <- 0 Hasta cont_tareas_proy-1 Hacer
			si ref_tarea_proyecto[z] = i+1 Entonces
				Escribir Sin Saltar p_tarea_nombre[z]
				// Rellenar espacios para alinear
				Para j <- 0 Hasta 29 - Longitud(p_tarea_nombre[z]) Hacer
					Escribir Sin Saltar " "
				FinPara
				Escribir Sin Saltar "|"
				// Dibujar la barra de la tarea
				Para j <- 0 Hasta 29 Hacer
					inicio<-(p_tarea_fechaini[z] MOD 100)-1
					duracion<-p_tarea_duracion[z]
					Si j >= inicio Y j < (inicio + duracion) Entonces
						Escribir Sin Saltar " X "
					Sino
						Escribir Sin Saltar " - "
					FinSi
				FinPara
				Escribir ""
			FinSi
		FinPara
		Escribir "------------------------------+-----------------------------------------------------------------------------------------"
		Escribir ""
	FinSi
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinFuncion

Funcion eliminar_proyecto(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, k por referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, min por referencia, max por referencia)
	Encabezado()
	Si cont_proyectos=0 Entonces
		Escribir "No hay ningun proyecto vigente para eliminar"
	SiNo
		Para i<-0 hasta cont_proyectos-1 con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
		Escribir "Ingrese el N� de proyecto que desea eliminar."
		Leer i
		Mientras i<=0 O i>cont_proyectos Hacer
			Escribir "El proyecto no existe, ingrese nuevamente el nro de proyecto que desea eliminar:"
			Leer i
		FinMientras
		Para j<-0 hasta cont_tareas_proy-1 con paso 1 hacer 
			Si ref_tarea_proyecto[j] = i entonces
				si p_tarea_nro[j] < min entonces
					min<-p_tarea_nro[j]
				FinSi
				si p_tarea_nro[j] > max entonces
					max<-p_tarea_nro[j]
				FinSi
			FinSi
		FinPara
		i <- i-1
		Definir res Como Entero
		res<-max-min
		Para w<-i hasta cont_proyectos-2 Hacer
			proyecto_nombre[w]<-proyecto_nombre[w+1]
		FinPara
		proyecto_nro[cont_proyectos-1]<-0
		proyecto_nombre[cont_proyectos-1]<-"Proyecto eliminado"
		min<-min-1
		Para u<-0 hasta res con paso 1 Hacer
			p_tarea_nombre[min]<-p_tarea_nombre[min+res]
			p_tarea_fechaini[min]<-p_tarea_fechaini[min+res]
			ref_tarea_proyecto[min]<-ref_tarea_proyecto[min+res]
			p_tarea_estado[min]<-p_tarea_estado[min+res]
		FinPara
		Para l<-0 hasta res con paso 1 Hacer
			p_tarea_nro[cont_tareas_proy-l]<-0
			p_tarea_nombre[cont_tareas_proy-l]<-"Tarea eliminada"
			p_tarea_fechaini[cont_tareas_proy-l]<-0
			ref_tarea_proyecto[cont_tareas_proy-l]<-	-1
			p_tarea_estado[cont_tareas_proy-l]<-	3
		FinPara

		
		proyecto_nro[cont_proyectos-1]<-0
		proyecto_nombre[cont_proyectos-1]<-"Proyecto eliminado"
		cont_proyectos<-cont_proyectos-1
		
		p_tarea_nro[cont_tareas_proy-1]<-0
		p_tarea_nombre[cont_tareas_proy-1]<-"Tarea eliminada"
		p_tarea_fechaini[cont_tareas_proy-1]<-0
		ref_tarea_proyecto[cont_tareas_proy-1]<- -1
		p_tarea_estado[cont_tareas_proy-1]<-3
		cont_tareas_proy<-cont_tareas_proy-res-1
		Limpiar pantalla
		Escribir ""
		Escribir "Proyecto eliminado con exito"
		i<-0
		Para i<-0 hasta cont_proyectos-1 con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
	FinSi
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinFuncion

Funcion imprimir_proyecto_tarea(ref_tarea_proyecto Por Referencia, proyecto_nro por referencia, cont_tareas_proy Por valor, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por valor, j Por Referencia)
	
	Escribir " ----------------------------------------------------------------- "
	Escribir "| N� " proyecto_nro[i] sin saltar
	Escribir " - " proyecto_nombre[i] sin saltar 
    Escribir Relleno(proyecto_nombre[i]) "|"
	Escribir " ----------------------------------------------------------------- "
	Escribir "| Nro        Tarea         Fecha   Duracion (dias)     Estado     |"
	Para j<-0 hasta cont_tareas_proy-1 con paso 1 Hacer
		Si ref_tarea_proyecto[j] = i+1 Entonces
			Escribir "| " sin saltar
			Escribir p_tarea_nro[j] sin saltar
			Escribir "     " sin saltar
			Escribir p_tarea_nombre[j] sin saltar
			Para r<-0 hasta (19-Longitud(p_tarea_nombre[j])) con paso 1 hacer
				Escribir sin saltar " "
			FinPara
			Escribir (p_tarea_fechaini[j] MOD 100) "/" sin saltar
			Escribir Trunc(p_tarea_fechaini[j]/100) sin saltar
			Escribir "           " sin saltar
			Escribir p_tarea_duracion[j] sin saltar
			Escribir "          " sin saltar
			Segun p_tarea_estado[j] hacer
				0:
					Escribir "No iniciada  |"
				1:
					Escribir "En proceso   |"
				2:
					Escribir "Finalizada   |"
				3:
					Escribir "Eliminada    |"
			FinSegun
		FinSi
	FinPara
	Escribir " ----------------------------------------------------------------- "
FinFuncion

Funcion Encabezado
	Borrar Pantalla
	Escribir " ---------- Bienvenido al gestor de tareas y proyectos ---------- "
	Escribir ""
FinFuncion

Funcion PrecargarTareas(cont_tareas Por Referencia, tarea_nro por referencia, tarea_fechaini por referencia, tarea_estado por referencia, tarea_nombre por referencia)
	Definir p Como Entero
	Para p<-0 hasta 2 con paso 1 hacer
		cont_tareas<-cont_tareas+1
		tarea_nro[cont_tareas-1]<-cont_tareas
		tarea_fechaini[cont_tareas-1]<-(cont_tareas*100)+cont_tareas
		tarea_estado[cont_tareas-1]<-p
		tarea_nombre[cont_tareas-1]<-"Tarea de prueba"
	FinPara
FinFuncion

Funcion cadena_caracteres<-Relleno(cadena_caracteres por valor)
	Definir long, restante, largo Como Entero
	long<-Longitud(cadena_caracteres)
	cadena_caracteres<-""
	largo<-57
	restante<-largo-long
	mientras (restante > 0) Hacer
		cadena_caracteres<-Concatenar(cadena_caracteres," ")
		restante<-restante-1
	FinMientras
FinFuncion

Funcion PrecargarProyecto (ref_tarea_proyecto por referencia, proyecto_nro por referencia, proyecto_nombre por referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, p_tarea_nro por referencia, p_tarea_fechaini por referencia, p_tarea_estado por referencia, p_tarea_nombre por referencia, p_tarea_duracion por referencia)
	Definir p Como Entero
	proyecto_nombre[cont_proyectos] <- concatenar("Proyecto de prueba ", ConvertirATexto(cont_proyectos+1))
	proyecto_nro[cont_proyectos] <- cont_proyectos+1
	cont_proyectos<-cont_proyectos+1
	
	Para p<-0 hasta 2 con paso 1 hacer
		cont_tareas_proy<-cont_tareas_proy+1
		p_tarea_nro[cont_tareas_proy-1]<-cont_tareas_proy
		ref_tarea_proyecto[cont_tareas_proy-1]<-cont_proyectos
		p_tarea_fechaini[cont_tareas_proy-1]<-((cont_tareas_proy)*100)+cont_tareas_proy+3
		p_tarea_duracion[cont_tareas_proy-1]<-cont_tareas_proy
		p_tarea_estado[cont_tareas_proy-1]<-p
		p_tarea_nombre[cont_tareas_proy-1]<-"Tarea prueba Proy"
	FinPara
FinFuncion

//FUNCION CALENDARIO
Funcion Calendario (p_tarea_nro por referencia, p_tarea_fechaini por Referencia, p_tarea_estado por Referencia, p_tarea_nombre por Referencia, tarea_nro por Referencia, tarea_fechaini por Referencia, tarea_estado por Referencia, tarea_nombre por Referencia, cont_tareas por valor, cont_tareas_proy por valor, m por valor, n por valor)
	Definir alerta, a, b, q, fila, columna, opt, dia_inc, mes_inc, tarea_cal_dia, tarea_cal_nro, tarea_cal_estado, cont_cal Como Entero
	Definir dias_semana, meses_anio, tarea_cal_nombre, hoja Como Caracter
	Dimension dias_semana[7], meses_anio[12], hoja[5,7], tarea_cal_nombre[m+n], tarea_cal_dia[m+n], tarea_cal_nro[m+n], tarea_cal_estado[m+n]
	
	cont_cal<-0
	dia_inc<-1
	a<-cont_tareas
	b<-cont_tareas_proy
	Para i<-0 hasta 3 con paso 1 Hacer
		para j<-0 hasta 6 con paso 1 Hacer
			hoja[i,j]<-ConvertirATexto(dia_inc)
			dia_inc<-dia_inc+1
		FinPara
	FinPara
	hoja[4,0]<-"29"
	hoja[4,1]<-"30"
	
	meses_anio[0]<-"ENERO"
	meses_anio[1]<-"FEBRERO"
	meses_anio[2]<-"MARZO"
	meses_anio[3]<-"ABRIL"
	meses_anio[4]<-"MAYO"
	meses_anio[5]<-"JUNIO"
	meses_anio[6]<-"JULIO"
	meses_anio[7]<-"AGOSTO"
	meses_anio[8]<-"SEPTIEMBRE"
	meses_anio[9]<-"OCTUBRE"
	meses_anio[10]<-"NOVIEMBRE"
	meses_anio[11]<-"DICIEMBRE"
	
	dias_semana[0]<-"Lunes"
	dias_semana[1]<-"Martes"
	dias_semana[2]<-"Miercoles"
	dias_semana[3]<-"Jueves"
	dias_semana[4]<-"Viernes"
	dias_semana[5]<-"Sabado"
	dias_semana[6]<-"Domingo"
	
	Escribir "|                            CALENDARIO DE TAREAS                                               |"
	Escribir "  ----------------------------------------------------------------------------------------------"
	Escribir "| Ingrese el mes que desea visualizar (1-12):                                                   |"
	Leer opt
	Mientras opt>12 O opt<1 Hacer
		Escribir "| Mes invalido. Ingrese el mes que desea visualizar:                                            |"
		Leer opt
	FinMientras
	Limpiar Pantalla
	
	Para q<-0 hasta a-1 con paso 1 Hacer
		mes_inc<-Trunc(tarea_fechaini[q]/100)
		Si mes_inc = opt Entonces
			tarea_cal_nro[cont_cal]<-tarea_nro[q]
			tarea_cal_nombre[cont_cal]<-tarea_nombre[q]
			tarea_cal_dia[cont_cal]<-tarea_fechaini[q]
			tarea_cal_estado[cont_cal]<-tarea_estado[q]
			cont_cal<-cont_cal+1
		FinSi
	FinPara
	
	Para q<-0 hasta b-1 con paso 1 Hacer
		mes_inc<-Trunc(p_tarea_fechaini[q]/100)
		Si mes_inc = opt Entonces
			tarea_cal_nro[cont_cal]<-p_tarea_nro[q]
			tarea_cal_nombre[cont_cal]<-p_tarea_nombre[q]
			tarea_cal_dia[cont_cal]<-p_tarea_fechaini[q]
			tarea_cal_estado[cont_cal]<-p_tarea_estado[q]
			cont_cal<-cont_cal+1
		FinSi
	FinPara
	
	Escribir "|                                       CALENDARIO DE TAREAS                                    |"
	Escribir "  ----------------------------------------------------------------------------------------------"
	Escribir "                                              " meses_anio[opt-1]
	Escribir "  ----------------------------------------------------------------------------------------------"
	
	// �ndice superior
	Escribir Sin Saltar "|    " 
    Para j = 0 Hasta 6 Con Paso 1
		Escribir Sin Saltar dias_semana[j]
		Para k<-0 hasta (12-Longitud(dias_semana[j])) con paso 1 hacer
			Escribir Sin Saltar" "
		FinPara
    FinPara
	Escribir "|" sin saltar
    Escribir "" 
	
	// Imprimir filas con �ndice lateral
    Para fila <- 0 Hasta 3 Hacer
		
        // Imprimir valores de la fila
		Escribir Sin Saltar "|" 
        Para columna <- 0 Hasta 6 Hacer
			Si ConvertirANumero(hoja[fila, columna])< 10 Entonces
                Escribir Sin Saltar "   ","[   ",hoja[fila, columna],"  ]", "  "
			Sino
				Si ConvertirANumero(hoja[fila, columna]) < 100 Entonces
					Escribir Sin Saltar "   ", "[  ",hoja[fila, columna],"  ]", "  "
				SiNo	
					Escribir Sin Saltar "   ", "[ ",hoja[fila, columna],"  ]", " "
				FinSi
            FinSi
        FinPara
		Escribir Sin Saltar "    |" 
        Escribir "" // Salto de l�nea para la siguiente fila
    FinPara
	Escribir Sin Saltar "|   ", "[  ",hoja[4, 0],"  ]", "  "
	Escribir "   ", "[  ",hoja[4, 1],"  ]", "                                                                       |"
	Escribir "  ----------------------------------------------------------------------------------------------"
	Escribir "| DIA       Tarea                     Estado                                                    |"
	Para w<-0 hasta cont_cal-1 con paso 1 Hacer
		Escribir "|  " tarea_cal_dia[w] MOD 100 ":" sin saltar
		Escribir "    " sin saltar
		Escribir tarea_cal_nombre[w] sin saltar
		Para g<-0 hasta (28-Longitud(tarea_cal_nombre[w])) con paso 1 hacer
			Escribir sin saltar " "
		FinPara
		Segun tarea_cal_estado[w] hacer
			0:
				Escribir "No iniciada                                               |"
			1:
				Escribir "En proceso                                                |"
			2:
				Escribir "Finalizada                                                |"
			3:
				Escribir "Eliminada                                                 |"
		FinSegun
	FinPara
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinFuncion


//FUNCION HOJA DE CALCULO
Funcion HojaDeCalculo
    Definir hoja, option Como Real
    Definir fila, columna Como Entero
    Definir value Como Real
    
    Dimension hoja[10, 10]
    
	LlenarMatriz(hoja)
	
    Repetir
		MostrarMenu
		
		Leer option
		
        Segun option Hacer
            1: 
				Repetir
					MostrarHoja(hoja)
					IngresarValor(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para ingresar otro valor - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            2: 
				Repetir
					MostrarHoja(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            3: 
				Repetir
					MostrarHoja(hoja)
					CalcularSumaFila(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            4: 
				Repetir
					MostrarHoja(hoja)
					CalcularPromedioColumna(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            5: 
				Repetir
					MostrarHoja(hoja)
					CalcularMaximoFila(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            6: 
				Repetir
					MostrarHoja(hoja)
					CalcularMinimoColumna(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            7: 
				Repetir
					MostrarHoja(hoja)
					CalcularPotencia(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            8: 
				Repetir
					MostrarHoja(hoja)
					CalcularRaizCuadrada(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            9: 
				Repetir
					MostrarHoja(hoja)
					CalcularValorAbsoluto(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            10: 
				Repetir
					MostrarHoja(hoja)
					CalcularLogaritmoNatural(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            11: 
				Repetir
					MostrarHoja(hoja)
					CalcularSeno(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            12: 
				Repetir
					MostrarHoja(hoja)
					CalcularProductoFila(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
			13:
				Repetir
					MostrarHoja(hoja)
					SumarCeldas(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
			14:
				Repetir
					MostrarHoja(hoja)
					RestarCeldas(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
			15:
				Repetir
					MostrarHoja(hoja)
					MultiplicarCeldas(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
			16:
				Repetir
					MostrarHoja(hoja)
					DivisionCeldas(hoja)
					Escribir " "
					Escribir "   --Presiona 1 para volver al menu--"
					escribir " - Presiona Enter para operar nuevamente - "
					leer opt
					
					si opt == 1 Entonces
						Borrar Pantalla
					FinSi
				Hasta Que opt == 1
            0: Escribir "Saliendo del programa..."
            De Otro Modo:
                Escribir "Opci�n no v�lida. Intente de nuevo."
        FinSegun
    Hasta Que (option = 0)
FinFuncion

Funcion LlenarMatriz (hoja)
	Para fila <- 0 Hasta 9 Hacer
		Para columna <- 0 Hasta 9 Hacer
			hoja[fila, columna] <- Aleatorio(1,200)
		FinPara
	FinPara
FinFuncion

Funcion MostrarMenu
	Escribir "Men� de opciones:"
    Escribir "    1. Ingresar valor", "                              9. Calcular valor absoluto"
    Escribir "    2. Mostrar hoja de c�lculo", "                    10. Calcular logaritmo natural"
    Escribir "    3. Calcular suma de una fila", "                  11. Calcular seno de un �ngulo"
    Escribir "    4. Calcular promedio de una columna", "           12. Calcular producto de una fila"
    Escribir "    5. Calcular m�ximo de una fila", "                13. Sumar dos valores por coordenadas"
    Escribir "    6. Calcular m�nimo de una columna", "             14. Restar dos valores por coordenadas"
    Escribir "    7. Calcular potencia de un valor", "              15. Multiplicar dos valores por coordenadas"
    Escribir "    8. Calcular ra�z cuadrada de un valor", "         16. Dividir dos valores por coordenadas"
    Escribir "    0. Salir"
FinFuncion

Funcion IngresarValor(hoja Por Referencia)
    Definir fila, columna Como Entero
    Definir value Como Real
	Escribir "Ingrese columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
    Escribir "Ingrese fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
	
    Escribir "Ingrese valor entre 1 y 200:"
    Leer value
	mientras (value <= 0 o falso) o value > 200 Hacer
		Escribir "Valor fuera de rango, ingresa un valor entre 1 y 200: "
		leer value
	FinMientras
    hoja[fila, columna] <- value
FinFuncion

Funcion MostrarHoja(hoja)
    Definir fila, columna, opt Como Entero
	Escribir "-----------------------------------------------------------------------------------------------------------------------------------"
	// �ndice superior
	Escribir Sin Saltar "       " 
    Para j = 0 Hasta 9 Con Paso 1
        Escribir Sin Saltar "    ", j+1, "        "
    FinPara
    Escribir "" 
	
	// Imprimir filas con �ndice lateral
    Para fila <- 0 Hasta 9 Hacer
        // �ndice lateral
        Si fila < 10 Entonces
            Escribir Sin Saltar " ", fila+1, " -" 
        Sino
            Escribir Sin Saltar fila+1, " -"
        FinSi
		
        // Imprimir valores de la fila
        Para columna <- 0 Hasta 9 Hacer
			Si hoja[fila, columna] < 10 Entonces
                Escribir Sin Saltar "   ","[   ",hoja[fila, columna],"  ]", "  "
			Sino
				Si hoja[fila, columna] < 100 Entonces
					Escribir Sin Saltar "   ", "[  ",hoja[fila, columna],"  ]", "  "
				SiNo	
					Escribir Sin Saltar "   ", "[ ",hoja[fila, columna],"  ]", "  "
				FinSi
            FinSi
        FinPara
        Escribir "" // Salto de l�nea para la siguiente fila
    FinPara
	Escribir "-----------------------------------------------------------------------------------------------------------------------------------"
FinFuncion


Funcion CalcularSumaFila(hoja)
    Definir fila, columna Como Entero
    Definir suma Como Real
    Escribir "Ingrese n�mero de fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila  < 0 o falso) o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    suma <- 0
    Para columna <- 0 Hasta 9 Hacer
        suma <- suma + hoja[fila, columna]
    FinPara
    Escribir "La suma de la fila ", fila, " es: ", suma
FinFuncion

Funcion CalcularPromedioColumna(hoja)
    Definir fila, columna Como Entero
    Definir suma, promedio Como Real
    Escribir "Ingrese n�mero de columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
    suma <- 0
    Para fila <- 0 Hasta 9 Hacer
        suma <- suma + hoja[fila, columna]
    FinPara
    promedio <- suma / 10
    Escribir "El promedio de la columna ", columna, " es: ", promedio
FinFuncion

Funcion CalcularMaximoFila(hoja)
    Definir fila, columna Como Entero
    Definir maximo Como Real
    Escribir "Ingrese n�mero de fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    maximo <- hoja[fila, 1]
    Para columna <-0 Hasta 9 Hacer
        Si hoja[fila, columna] > maximo Entonces
            maximo <- hoja[fila, columna]
        FinSi
    FinPara
    Escribir "El m�ximo de la fila ", fila, " es: ", maximo
FinFuncion

Funcion CalcularMinimoColumna(hoja)
    Definir fila, columna Como Entero
    Definir minimo Como Real
    Escribir "Ingrese n�mero de columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
    minimo <- hoja[1, columna]
    Para fila <- 0 Hasta 9 Hacer
        Si hoja[fila, columna] < minimo Entonces
            minimo <- hoja[fila, columna]
        FinSi
    FinPara
    Escribir "El m�nimo de la columna ", columna, " es: ", minimo
FinFuncion

Funcion CalcularPotencia(hoja Por Referencia)
    Definir fila, columna Como Entero
    Definir value Como Real
    Escribir "Ingrese fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    Escribir "Ingrese columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
    Escribir "Ingrese exponente:"
    Leer value
	mientras value < 0 o falso Hacer
		Escribir "valor inexistente, ingresa un numero real: "
		leer value
	FinMientras
	aux <- hoja[fila, columna] 
    hoja[fila, columna] <- hoja[fila, columna] ^ value
    Escribir "El resultado es: ", hoja[fila, columna]
	hoja[fila, columna] <- aux
FinFuncion

Funcion CalcularRaizCuadrada(hoja Por Referencia)
    Definir fila, columna Como Entero
    Escribir "Ingrese fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    Escribir "Ingrese columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
	aux <- hoja[fila, columna] 
    Si hoja[fila, columna] >= 0 Entonces
        hoja[fila, columna] <- raiz(hoja[fila, columna])
        Escribir "La ra�z cuadrada es: ", hoja[fila, columna]
		hoja[fila, columna] <- aux
    Sino
        Escribir "Error: No se puede calcular la ra�z cuadrada de un n�mero negativo"
    FinSi
FinFuncion

Funcion CalcularValorAbsoluto(hoja Por Referencia)
    Definir fila, columna, aux Como Entero
    Escribir "Ingrese fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    Escribir "Ingrese columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
    hoja[fila, columna] <- abs(hoja[fila, columna])
    Escribir "El valor absoluto es: ", hoja[fila, columna]
FinFuncion

Funcion CalcularLogaritmoNatural(hoja Por Referencia)
    Definir fila, columna Como Entero
    Escribir "Ingrese fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    Escribir "Ingrese columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
	aux <- hoja[fila, columna]
    Si hoja[fila, columna] > 0 Entonces
        hoja[fila, columna] <- ln(hoja[fila, columna])
        Escribir "El logaritmo natural es: ", hoja[fila, columna]
		hoja[fila, columna] <- aux
    Sino
        Escribir "Error: No se puede calcular el logaritmo de un n�mero no positivo"
    FinSi
FinFuncion

Funcion CalcularSeno(hoja Por Referencia)
    Definir fila, columna Como Entero
    Escribir "Ingrese fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    Escribir "Ingrese columna (1-10):"
    Leer columna
	columna<-columna-1
	mientras (columna < 0 o falso) o columna > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna
		columna<-columna-1
	FinMientras
	aux <- hoja[fila, columna] 
    hoja[fila, columna] <- sen(hoja[fila, columna])
    Escribir "El seno del �ngulo es: ", hoja[fila, columna]
	hoja[fila, columna] <- aux
FinFuncion

Funcion CalcularProductoFila(hoja)
    Definir fila, columna Como Entero
    Definir producto Como Real
    Escribir "Ingrese n�mero de fila (1-10):"
    Leer fila
	fila<-fila-1
	mientras (fila < 0 o falso)  o fila > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila
		fila<-fila-1
	FinMientras
    producto <- 1
    Para columna <- 0 Hasta 9 Hacer
        producto <- producto * hoja[fila, columna]
    FinPara
    Escribir "El producto de la fila ", fila, " es: ", producto
FinFuncion

Funcion SumarCeldas(hoja)
	Escribir "Ingrese fila del primer valor (1-10):"
	Leer fila1
	fila1<-fila1-1
	mientras (fila1 < 0 o falso)  o fila1 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila1
		fila1<-fila1-1
	FinMientras
	Escribir "Ingrese columna del primer valor (1-10):"
	Leer columna1
	columna1<-columna1-1
	mientras (columna1 < 0 o falso) o columna1 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna1
		columna1<-columna1-1
	FinMientras
	Escribir "Ingrese fila del segundo valor (1-10):"
	Leer fila2
	fila2<-fila2-1
	mientras (fila2 < 0 o falso)  o fila2 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila2
		fila2<-fila2-1
	FinMientras
	Escribir "Ingrese columna del segundo valor (1-10):"
	Leer columna2
	columna2<-columna2-1
	mientras (columna2 < 0 o falso) o columna2 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna2
		columna2<-columna2-1
	FinMientras
	resultado <- hoja[fila1, columna1] + hoja[fila2, columna2]
	Escribir "La suma de (", fila1, ",", columna1, ") y (", fila2, ",", columna2, ") es: ", resultado
FinFuncion 

Funcion RestarCeldas(hoja)
	Escribir "Ingrese fila del primer valor (1-10):"
	Leer fila1
	fila1<-fila1-1
	mientras (fila1 < 0 o falso)  o fila1 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila1
		fila1<-fila1-1
	FinMientras
	Escribir "Ingrese columna del primer valor (1-10):"
	Leer columna1
	columna1<-columna1-1
	mientras (columna1 < 0 o falso) o columna1 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna1
		columna1<-columna1-1
	FinMientras
	Escribir "Ingrese fila del segundo valor (1-10):"
	Leer fila2
	fila2<-fila2-1
	mientras (fila2 < 0 o falso)  o fila2 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila2
		fila2<-fila2-1
	FinMientras
	Escribir "Ingrese columna del segundo valor (1-10):"
	Leer columna2
	columna2<-columna2-1
	mientras (columna2 < 0 o falso) o columna2 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna2
		columna2<-columna2-1
	FinMientras
	resultado <- hoja[fila1, columna1] - hoja[fila2, columna2]
	Escribir "La suma de (", fila1, ",", columna1, ") y (", fila2, ",", columna2, ") es: ", resultado
FinFuncion

Funcion MultiplicarCeldas(hoja)
	Escribir "Ingrese fila del primer valor (1-10):"
	Leer fila1
	fila1<-fila1-1
	mientras (fila1 < 0 o falso)  o fila1 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila1
		fila1<-fila1-1
	FinMientras
	Escribir "Ingrese columna del primer valor (1-10):"
	Leer columna1
	columna1<-columna1-1
	mientras (columna1 < 0 o falso) o columna1 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna1
		columna1<-columna1-1
	FinMientras
	Escribir "Ingrese fila del segundo valor (1-10):"
	Leer fila2
	fila2<-fila2-1
	mientras (fila2 < 0 o falso)  o fila2 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila2
		fila2<-fila2-1
	FinMientras
	Escribir "Ingrese columna del segundo valor (1-10):"
	Leer columna2
	columna2<-columna2-1
	mientras (columna2 < 0 o falso) o columna2 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna2
		columna2<-columna2-1
	FinMientras
	resultado <- hoja[fila1, columna1] * hoja[fila2, columna2]
	Escribir "La suma de (", fila1, ",", columna1, ") y (", fila2, ",", columna2, ") es: ", resultado
FinFuncion

Funcion DivisionCeldas(hoja)
	Escribir "Ingrese fila del primer valor (1-10):"
	Leer fila1
	fila1<-fila1-1
	mientras (fila1 < 0 o falso)  o fila1 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila1
		fila1<-fila1-1
	FinMientras
	Escribir "Ingrese columna del primer valor (1-10):"
	Leer columna1
	columna1<-columna1-1
	mientras (columna1 < 0 o falso) o columna1 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna1
		columna1<-columna1-1
	FinMientras
	Escribir "Ingrese fila del segundo valor (1-10):"
	Leer fila2
	fila2<-fila2-1
	mientras (fila2 < 0 o falso)  o fila2 > 9 Hacer
		Escribir "Fila inexistente, ingresa un valor entre 1 y 10: "
		leer fila2
		fila2<-fila2-1
	FinMientras
	Escribir "Ingrese columna del segundo valor (1-10):"
	Leer columna2
	columna2<-columna2-1
	mientras (columna2 < 0 o falso) o columna2 > 9 Hacer
		Escribir "Columna inexistente, ingresa un valor entre 1 y 10: "
		leer columna2
		columna2<-columna2-1
	FinMientras
	Si hoja[fila2, columna2] <> 0 Entonces
		resultado <- hoja[fila1, columna1] / hoja[fila2, columna2]
		Escribir "La divisi�n de (", fila1, ",", columna1, ") entre (", fila2, ",", columna2, ") es: ", resultado
	Sino
		Escribir "Error: No se puede dividir por cero"
	FinSi
FinFuncion




