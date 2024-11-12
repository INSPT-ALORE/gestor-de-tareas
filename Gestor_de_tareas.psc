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
	
	Repetir
		PrecargarTareas(cont_tareas, tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre)
		PrecargarProyecto(ref_tarea_proyecto, proyecto_nro, proyecto_nombre, cont_proyectos, cont_tareas_proy, p_tarea_nro, p_tarea_fechaini, p_tarea_estado, p_tarea_nombre, p_tarea_duracion)
		Escribir "----------- Bienvenido al gestor de tareas y proyectos -----------"
		Escribir ""
		Escribir "Elija una opción del menú:"
		Escribir "1.Tareas (crear, modificar, eliminar, visualizar)"
		Escribir "2.Proyectos (crear, modificar, eliminar, visualizar)"
		Escribir "3.Herramienta Hoja de calculo"
		Escribir "4.Calendario"
		Escribir "0.Finalizar programa"
		Escribir ""
		Escribir "Elija la opcion deseada: "
		Leer op
		Segun op Hacer
			1:
				menu_tareas(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, flag, dia, mes, n)
			2: 
				menu_proyectos(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j, flag, dia, mes, m, min, max)
			3:
				HojaDeCalculo()
			4:
				// Calendario
			0:
				Escribir "Se finaliza el programa."
			Otro:
				Escribir "La opcion ingresada no esta en el menú."
		FinSegun
	Hasta que op = 0		
FinAlgoritmo

// FUNCIONES PARA TAREAS (Menu, crear, modificar, visualizar y eliminar)
Funcion menu_tareas(tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Referencia, i Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, n por valor)
	Encabezado()
	Repetir
		Escribir "Elija la opcion deseada: "
		Escribir "1.Crear tareas"
		Escribir "2.Modificar tareas"
		Escribir "3.Visualizar tareas (Kanban)"
		Escribir "4.Eliminar tareas"
		Escribir "0.Volver al menu principal"
		Escribir "Elija una opcion: "
		Leer eleccion
		Segun eleccion Hacer
			1:
				Si cont_tareas >= n Entonces
					Escribir "Se alcanzó el máximo nro de tareas disponibles en esta version (20). Elimine una tarea existente para liberar espacio."
				SiNo
					crear_tarea(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, flag, dia, mes)
				FinSi
			2:
				modificar_tarea(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, k, flag, dia, mes)
			3:
				// Kanban 
			4:
				eliminar_tarea(tarea_nro, tarea_fechaini, tarea_estado, tarea_nombre, cont_tareas, i, j, k, flag, dia, mes)
			0:
				Escribir "Se retorna al menu principal"
			Otro:
				Escribir "La opcion no esta en el menú."
		FinSegun
	Hasta que eleccion = 0

Fin Funcion

Funcion crear_tarea (tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Referencia, i Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia)
	Encabezado()
	tarea_nro[cont_tareas] <- cont_tareas+1
	Escribir "Ingrese la tarea N° " tarea_nro[cont_tareas]
	Escribir "Nombre de la tarea: "
	Leer tarea_nombre[cont_tareas]
	Escribir "Fecha de ejecucion de la tarea - Ingrese dia (1 a 30):"
	Leer dia
	Mientras (dia < 1 o dia > 30)
		Escribir "Dia fuera rango, ingrese el dia nuevamente (1 a 30):"
		leer dia
	FinMientras
	Escribir "Fecha de ejecucion de la tarea - Ingrese mes (1 a 12):"
	Leer mes
	Mientras (mes < 1 o mes > 12)
		Escribir "Mes fuera rango, ingrese el mes nuevamente (1 a 12):"
		leer mes
	FinMientras
	tarea_fechaini[cont_tareas] <- mes*100+dia
	Escribir "Estado de la tarea (Ingrese un n° del 0 al 2): "
	Escribir "0.No iniciada."
	Escribir "1.En proceso."
	Escribir "2.Finalizada."
	Leer tarea_estado[cont_tareas]
	Mientras tarea_estado[cont_tareas] < 0 o tarea_estado[cont_tareas] > 2
		Escribir "Estado de la tarea no valido, ingrese nuevamente: "
		Escribir "0.No iniciada."
		Escribir "1.En proceso."
		Escribir "2.Finalizada."
		Leer tarea_estado[cont_tareas]
	FinMientras
	Escribir "Tarea creada con éxito." 
	cont_tareas <- cont_tareas+1
FinFuncion

Funcion modificar_tarea (tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Valor, i Por Referencia, k Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia)
	Encabezado()
	Escribir "Listado de tareas existentes"
	Escribir "Nro - Tarea - Fecha - Estado"
	Para k<-0 hasta cont_tareas-1 con paso 1 Hacer
		imprimir_tarea(tarea_nro, tarea_nombre, tarea_fechaini, tarea_estado, k)
	FinPara
	Escribir "Ingrese el Nro de la tarea que desea modificar."
	Leer i
	Mientras i>cont_tareas O i< 1 Hacer
		Escribir "La tarea no existe, ingrese nuevamente el nro de tarea que desea modificar:"
		Leer i
	FinMientras
	i <- i-1
	Repetir
		Escribir "¿Qué desea modificar de la tarea seleccionada?"
		Escribir "1.Nombre"
		Escribir "2.Fecha de ejecucion"
		Escribir "3.Estado"
		Escribir "0.Volver al menu principal"
		Escribir "Elija una opcion: "
		Leer flag
		Segun flag Hacer
			1:
				Escribir "Nuevo nombre de la tarea: "
				Leer tarea_nombre[i]
			2:
				Escribir "Nueva fecha de ejecucion de la tarea - Ingrese dia (1 a 30):"
				Leer dia
				Mientras (dia < 1 o dia > 30)
					Escribir "Dia fuera rango, ingrese el dia nuevamente (1 a 30):"
					leer dia
				FinMientras
				Escribir "Fecha de ejecucion de la tarea - Ingrese mes (1 a 12):"
				Leer mes
				Mientras (mes < 1 o mes > 12)
					Escribir "Mes fuera rango, ingrese el mes nuevamente (1 a 12):"
					leer mes
				FinMientras
				tarea_fechaini[i] <- mes*100+dia
			3:
				Escribir "Estado de la tarea: "
				Escribir "0.No iniciada."
				Escribir "1.En proceso."
				Escribir "2.Finalizada."
				Leer tarea_estado[cont_tareas]
				Mientras tarea_estado[cont_tareas] < 0 o tarea_estado[cont_tareas] > 2
					Escribir "Estado de la tarea no valido, ingrese nuevamente: "
					Escribir "0.No iniciada."
					Escribir "1.En proceso."
					Escribir "2.Finalizada."
					Leer tarea_estado[cont_tareas]
				FinMientras
			0:
				Escribir "Se retorna al menu principal"
			Otro:
				Escribir "La opcion no esta en el menú."
		FinSegun
		Si flag>0 Y flag<=3 entonces
			Escribir "Tarea modificada con éxito."
			Repetir
				Escribir "Desea modificar otro campo de la tarea seleccionada?:"
				Escribir "0.No"
				Escribir "1.Si"
				leer flag
				Si flag < 0 o flag > 1 Entonces
					Escribir "Opcion incorrecta."
				FinSi
			Hasta Que flag = 0 O flag = 1
		FinSi
	Hasta que flag = 0
Fin Funcion

Funcion eliminar_tarea (tarea_nro Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, tarea_nombre Por Referencia, cont_tareas Por Referencia, i Por Referencia, j Por Referencia, k Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia)
	Encabezado()
	Para i<-0 hasta cont_tareas-1 con paso 1 Hacer
		imprimir_tarea(tarea_nro, tarea_nombre, tarea_fechaini, tarea_estado, i)
	FinPara
	Escribir "Ingrese el Nro de la tarea que desea eliminar."
	Leer i
	Mientras i>cont_tareas Hacer
		Escribir "La tarea no existe, ingrese nuevamente el nro de tarea que desea eliminar:"
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
	Escribir "Tarea eliminada con exito."
	Escribir ""
	Escribir "Nuevo listado de tareas:"
	Para i<-0 hasta cont_tareas-1 con paso 1 Hacer
		imprimir_tarea(tarea_nro, tarea_nombre, tarea_fechaini, tarea_estado, i)
	FinPara
FinFuncion

Funcion imprimir_tarea (tarea_nro Por Referencia, tarea_nombre Por Referencia, tarea_fechaini Por Referencia, tarea_estado Por Referencia, k Por Valor)
	Escribir tarea_nro[k] sin saltar
	Escribir " - " sin saltar
	Escribir tarea_nombre[k] sin saltar
	Escribir " - " sin saltar
	Escribir tarea_fechaini[k] MOD 100 "/" sin saltar // desglosar el numero
	Escribir TRUNC(tarea_fechaini[k]/100) sin saltar // desglosar el numero
	Escribir " - " sin saltar
	Segun tarea_estado[k] hacer
		0:
			Escribir "No iniciada"
		1:
			Escribir "En proceso"
		2:
			Escribir "Finalizada"
		3:
			Escribir "Eliminada"
	FinSegun
	Escribir ""
FinFuncion

Funcion Kanban
	Limpiar Pantalla
	Definir seleccion Como Entero
	Escribir "=== Kanban Menu ==="
	MostrarTablero()
	Escribir "Desea cambiar el estado de alguna tarea? Ingrese: "
	Escribir "1.Mover Tarea/Cambiar estado"
	Escribir "0.Volver al menú principal"
	Leer seleccion
	Mientras seleccion <> 0 Y seleccion <> 1 hacer
		Escribir "Opcion no valida, ingrese la opcion nuevamente:"
		Leer seleccion
	FinMientras
	Si seleccion = 1 Entonces
		MoverTarea()
	SiNo
		Escribir "Se retorna al menú principal."
	FinSi
FinFuncion

Funcion MostrarTablero
	
FinFuncion

Funcion MoverTarea
	
FinFuncion

// MENU PARA PROYECTOS (Menu, crear, modificar, visualizar y eliminar)
Funcion menu_proyectos(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, m por Valor, min por referencia, max por referencia)
	Encabezado()
	Repetir
		Escribir "Elija la opcion deseada: "
		Escribir "1.Crear proyecto"
		Escribir "2.Modificar proyecto"
		Escribir "3.Visualizar proyecto (Gantt)"
		Escribir "4.Eliminar proyecto"
		Escribir "0.Volver al menu principal"
		Escribir "Elija una opcion: "
		Leer eleccion
		Segun eleccion Hacer
			1:
				Si cont_proyectos>=m Entonces
					Escribir "Se alcanzó el máximo nro de proyectos en esta version (20). Elimine un proyecto existente para liberar espacio."
				SiNo
					crear_proyecto(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j, flag, dia, mes, m)
				FinSi
			2:
				modificar_proyecto(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, k, j, flag, dia, mes, min, max)
			3:
				Gantt(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, k, j, flag, dia, mes, min, max)
			4:
				eliminar_proyecto(proyecto_nro, ref_tarea_proyecto, cont_proyectos, cont_tareas_proy, cant_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, k, j, flag, dia, mes, min, max)
			0:
				Escribir "Se retorna al menu principal"
			Otro:
				Escribir "La opcion no esta en el menú."
		FinSegun
	Hasta que eleccion = 0

Fin Funcion

Funcion crear_proyecto(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, m por valor)
	Encabezado()
	Escribir "ingrese la cantidad de tareas que componen su proyecto:"
	Leer cant_tareas_proy
	Si cant_tareas_proy > (m-cont_tareas_proy)
		Escribir "Su proyecto tiene más tareas que las disponibles en el espacio de memoria."
	Sino
		proyecto_nro[cont_proyectos]<-cont_proyectos+1
		Escribir "Ingrese el nombre del proyecto N° " proyecto_nro[cont_proyectos] ": "
		Leer proyecto_nombre[cont_proyectos]
		Para i<-0 Hasta cant_tareas_proy-1 Con Paso 1 Hacer
			p_tarea_nro[i] <- cont_tareas_proy+1
			Escribir "Ingrese la tarea N° " cont_tareas_proy+1
			Escribir "Nombre de la tarea: "
			Leer p_tarea_nombre[i]
			Escribir "Fecha de inicio de la tarea - Ingrese dia (1 a 30):"
			Leer dia
			Mientras (dia < 1 o dia > 30)
				Escribir "Dia fuera rango, ingrese el dia nuevamente (1 a 30):"
				leer dia
			FinMientras
			Escribir "Fecha de inicio de la tarea - Ingrese mes (1 a 12):"
			Leer mes
			Mientras (mes < 1 o mes > 12)
				Escribir "Mes fuera rango, ingrese el mes nuevamente (1 a 12):"
				leer mes
			FinMientras
			p_tarea_fechaini[i] <- mes*100+dia
			Escribir "Ingrese la cantidad de dias que dura la tarea:"
			Leer dia
			p_tarea_duracion[i] <- dia
			Escribir "Estado de la tarea: "
			Escribir "0.No iniciada."
			Escribir "1.En proceso."
			Escribir "2.Finalizada."
			Leer p_tarea_estado[i]
			Mientras p_tarea_estado[i] < 0 o p_tarea_estado[i] > 2
				Escribir "Estado de la tarea no valido, ingrese nuevamente: "
				Escribir "0.No iniciada."
				Escribir "1.En proceso."
				Escribir "2.Finalizada."
				Leer p_tarea_estado[i]
			FinMientras
			ref_tarea_proyecto[i]<-cont_proyectos+1 //asocia las tareas al nro de proyecto para luego poder modificar, imprimir o eliminar un proyecto entero
			cont_tareas_proy<-cont_tareas_proy+1
			Escribir "Tarea creada con éxito."
		FinPara
		cont_proyectos <- cont_proyectos+1
	Finsi
Fin Funcion

Funcion modificar_proyecto(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, k por referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, min por referencia, max por referencia)
	Encabezado()
	Si cont_proyectos=0 Entonces
		Escribir "No hay ningun proyecto vigente para modificar"
	SiNo
		Para i<-0 hasta cont_proyectos-1 con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
		Escribir ""
		Escribir "Ingrese el Nro del proyecto que desea modificar."
		Leer i
		i<-i-1
		Escribir ""
		Escribir "Proyecto seleccionado:"
		imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
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
		Escribir "Selecciones la tarea que desea modificar:"
		Leer j
		Mientras j<min O j>max Hacer
			Escribir "La tarea indicada no pertenece a este proyecto, ingrese la tarea nuevamente:"
			Leer j
		FinMientras
		j<-j-1
		
		Repetir
			Escribir "¿Qué desea modificar de la tarea seleccionada?"
			Escribir "1.Nombre"
			Escribir "2.Fecha de inicio"
			Escribir "3.Fecha de finalizacion"
			Escribir "4.Estado"
			Escribir "0.Volver al menu principal"
			Escribir "Elija una opcion: "
			Leer flag
			Segun flag Hacer
				1:
					Escribir "Nuevo nombre de la tarea: "
					Leer p_tarea_nombre[j]
				2:
					Escribir "Nueva fecha de inicio de la tarea - Ingrese dia (1 a 30):"
					Leer dia
					Mientras (dia < 1 o dia > 30)
						Escribir "Dia fuera rango, ingrese el dia nuevamente (1 a 30):"
						leer dia
					FinMientras
					Escribir "Fecha de inicio de la tarea - Ingrese mes (1 a 12):"
					Leer mes
					Mientras (mes < 1 o mes > 12)
						Escribir "Mes fuera rango, ingrese el mes nuevamente (1 a 12):"
						leer mes
					FinMientras
					p_tarea_fechaini[j] <- mes*100+dia
				3:
					Escribir "Nueva duraacion de la tarea:"
					Leer dia
					p_tarea_duracion[j] <- dia
				4:
					Escribir "Estado de la tarea: "
					Escribir "0.No iniciada."
					Escribir "1.En proceso."
					Escribir "2.Finalizada."
					Leer p_tarea_estado[j]
					Mientras p_tarea_estado[j] < 0 o p_tarea_estado[j] > 2
						Escribir "Estado de la tarea no valido, ingrese nuevamente: "
						Escribir "0.No iniciada."
						Escribir "1.En proceso."
						Escribir "2.Finalizada."
						Leer p_tarea_estado[j]
					FinMientras
				0:
					Escribir "Se retorna al menu principal"
				Otro:
					Escribir "La opcion no esta en el menú."
			FinSegun
			Si flag>0 Y flag<=4 entonces
				Escribir "Tarea modificada con éxito."
				Repetir
					Escribir "Desea modificar otro campo de la tarea seleccionada?:"
					Escribir "0.No"
					Escribir "1.Si"
					leer flag
					Si flag < 0 o flag > 1 Entonces
						Escribir "Opcion incorrecta."
					FinSi
				Hasta Que flag = 0 O flag = 1
			FinSi
		Hasta que flag = 0
	FinSi
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
		i<-i-1
		Mientras i<0 o i>cont_proyectos Hacer
			Escribir "Numero de proyecto inexistente, ingresar numero nuevamente: "
			leer i
		FinMientras
		Escribir ""
		// Dibujar el encabezado del Gantt
		Escribir "DIAGRAMA DE GANTT"
		Escribir "----------------"
		Escribir "Proyecto N°" proyecto_nro[i] ": " proyecto_nombre[i]
		Escribir "Tarea          | 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30"
		Escribir "----------------+--------------------------------------------------------------------------------"
		
		// Dibujar cada tarea
		Definir z, inicio, duracion como entero
		Para z <- 0 Hasta cont_tareas_proy-1 Hacer
			si ref_tarea_proyecto[z] = i+1 Entonces
				Escribir Sin Saltar p_tarea_nombre[z]
				// Rellenar espacios para alinear
				Para j <- 0 Hasta 15 - Longitud(p_tarea_nombre[z]) Hacer
					Escribir Sin Saltar " "
				FinPara
				Escribir Sin Saltar "|"
				// Dibujar la barra de la tarea
				Para j <- 0 Hasta 79 Hacer
					inicio<-Trunc(p_tarea_fechaini[z]/100)
					duracion<-p_tarea_duracion[z]
					Si j >= inicio Y j < (inicio + duracion) Entonces
						Escribir Sin Saltar "X"
					Sino
						Escribir Sin Saltar "-"
					FinSi
				FinPara
				Escribir ""
			FinSi
		FinPara
		Escribir "----------------+--------------------------------------------------------------------------------"
	FinSi
FinFuncion

Funcion eliminar_proyecto(proyecto_nro por referencia, ref_tarea_proyecto Por Referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, cant_tareas_proy por referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, i Por Referencia, k por referencia, j Por Referencia, flag Por Referencia, dia Por Referencia, mes Por Referencia, min por referencia, max por referencia)
	Encabezado()
	Si cont_proyectos=0 Entonces
		Escribir "No hay ningun proyecto vigente para eliminar"
	SiNo
		Para i<-0 hasta cont_proyectos-1 con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
		Escribir "Ingrese el N° de proyecto que desea eliminar."
		Leer i
		Mientras i>cont_proyectos Hacer
			Escribir "El proyecto no existe, ingrese nuevamente el nro de proyecto que desea eliminar:"
			Leer i
		FinMientras
		i <- i-1
		proyecto_nro[i]<-0
		proyecto_nombre[i]<-"Proyecto eliminado"
		cont_proyectos<-cont_proyectos-1
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
		Para j<-min-1 hasta max-1 con paso 1 Hacer
			p_tarea_nro[j]<-0
			p_tarea_nombre[j]<-"Tarea eliminada"
			p_tarea_fechaini[j]<-0
			ref_tarea_proyecto[j]<-0
			p_tarea_estado[j]<-3
			cont_tareas_proy<-cont_tareas_proy - 1
		FinPara
		Escribir "Proyecto eliminado con exito"
		Para i<-0 hasta cont_proyectos con paso 1 Hacer
			imprimir_proyecto_tarea(ref_tarea_proyecto, proyecto_nro, cont_tareas_proy, proyecto_nombre, p_tarea_nro, p_tarea_fechaini, p_tarea_duracion, p_tarea_estado, p_tarea_nombre, i, j)
		FinPara
	FinSi
FinFuncion

Funcion imprimir_proyecto_tarea(ref_tarea_proyecto Por Referencia, proyecto_nro por referencia, cont_tareas_proy Por Referencia, proyecto_nombre por referencia, p_tarea_nro Por Referencia, p_tarea_fechaini Por Referencia, p_tarea_duracion Por Referencia, p_tarea_estado Por Referencia, p_tarea_nombre Por Referencia, k Por Referencia, j Por Referencia)
	Escribir ""
	Escribir proyecto_nro[k] sin saltar
	Escribir " - " sin saltar
	Escribir proyecto_nombre[k]
	Escribir "Nro - Nombre Tarea - Fecha - Duracion - Estado"
	Para j<-0 hasta cont_tareas_proy-1 con paso 1 Hacer
		Si ref_tarea_proyecto[j] = k+1 Entonces
			Escribir p_tarea_nro[j] sin saltar
			Escribir " - " sin saltar
			Escribir p_tarea_nombre[j] sin saltar
			Escribir " - " sin saltar
			Escribir (p_tarea_fechaini[j] MOD 100) "/" sin saltar // desglosar el numero
			Escribir Trunc(p_tarea_fechaini[j]/100) sin saltar // desglosar el numero
			Escribir " - " sin saltar
			Escribir p_tarea_duracion[j] sin saltar
			Escribir " - " sin saltar
			Segun p_tarea_estado[j] hacer
				0:
					Escribir "No iniciada"
				1:
					Escribir "En proceso"
				2:
					Escribir "Finalizada"
				3:
					Escribir "Eliminada"
			FinSegun
		FinSi
	FinPara
FinFuncion

Funcion Encabezado
	Borrar Pantalla
	Escribir "----------- Bienvenido al gestor de tareas y proyectos -----------"
	Escribir ""
FinFuncion

Funcion PrecargarTareas(cont_tareas Por Referencia, tarea_nro por referencia, tarea_fechaini por referencia, tarea_estado por referencia, tarea_nombre por referencia)
	Definir p Como Entero
	Para p<-0 hasta 2 con paso 1 hacer
		cont_tareas<-cont_tareas+1
		tarea_nro[p]<-cont_tareas
		tarea_fechaini[p]<-(cont_tareas*100)+cont_tareas
		tarea_estado[p]<-cont_tareas-1
		tarea_nombre[p]<-"Tarea de prueba"
	FinPara
FinFuncion

Funcion PrecargarProyecto (ref_tarea_proyecto por referencia, proyecto_nro por referencia, proyecto_nombre por referencia, cont_proyectos por referencia, cont_tareas_proy Por Referencia, p_tarea_nro por referencia, p_tarea_fechaini por referencia, p_tarea_estado por referencia, p_tarea_nombre por referencia, p_tarea_duracion por referencia)
	Definir p Como Entero
	proyecto_nombre[cont_proyectos] <- "Proyecto de prueba"
	proyecto_nro[cont_proyectos] <- cont_proyectos+1
	cont_proyectos<-cont_proyectos+1
	
	Para p<-0 hasta cont_proyectos+1 con paso 1 hacer
		cont_tareas_proy<-cont_tareas_proy+1
		p_tarea_nro[p]<-cont_tareas_proy
		ref_tarea_proyecto[p]<-cont_proyectos
		p_tarea_fechaini[p]<-(cont_tareas_proy*100)+cont_tareas_proy
		p_tarea_duracion[p]<-cont_tareas_proy
		p_tarea_estado[p]<-cont_tareas_proy-1
		p_tarea_nombre[p]<-"Tarea de prueba"
	FinPara
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
                Escribir "Opción no válida. Intente de nuevo."
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
	Escribir "Menú de opciones:"
    Escribir "    1. Ingresar valor", "                              9. Calcular valor absoluto"
    Escribir "    2. Mostrar hoja de cálculo", "                    10. Calcular logaritmo natural"
    Escribir "    3. Calcular suma de una fila", "                  11. Calcular seno de un ángulo"
    Escribir "    4. Calcular promedio de una columna", "           12. Calcular producto de una fila"
    Escribir "    5. Calcular máximo de una fila", "                13. Sumar dos valores por coordenadas"
    Escribir "    6. Calcular mínimo de una columna", "             14. Restar dos valores por coordenadas"
    Escribir "    7. Calcular potencia de un valor", "              15. Multiplicar dos valores por coordenadas"
    Escribir "    8. Calcular raíz cuadrada de un valor", "         16. Dividir dos valores por coordenadas"
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
	// Índice superior
	Escribir Sin Saltar "       " 
    Para j = 0 Hasta 9 Con Paso 1
        Escribir Sin Saltar "    ", j+1, "        "
    FinPara
    Escribir "" 
	
	// Imprimir filas con índice lateral
    Para fila <- 0 Hasta 9 Hacer
        // Índice lateral
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
        Escribir "" // Salto de línea para la siguiente fila
    FinPara
	Escribir "-----------------------------------------------------------------------------------------------------------------------------------"
FinFuncion


Funcion CalcularSumaFila(hoja)
    Definir fila, columna Como Entero
    Definir suma Como Real
    Escribir "Ingrese número de fila (1-10):"
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
    Escribir "Ingrese número de columna (1-10):"
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
    Escribir "Ingrese número de fila (1-10):"
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
    Escribir "El máximo de la fila ", fila, " es: ", maximo
FinFuncion

Funcion CalcularMinimoColumna(hoja)
    Definir fila, columna Como Entero
    Definir minimo Como Real
    Escribir "Ingrese número de columna (1-10):"
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
    Escribir "El mínimo de la columna ", columna, " es: ", minimo
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
        Escribir "La raíz cuadrada es: ", hoja[fila, columna]
		hoja[fila, columna] <- aux
    Sino
        Escribir "Error: No se puede calcular la raíz cuadrada de un número negativo"
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
        Escribir "Error: No se puede calcular el logaritmo de un número no positivo"
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
    Escribir "El seno del ángulo es: ", hoja[fila, columna]
	hoja[fila, columna] <- aux
FinFuncion

Funcion CalcularProductoFila(hoja)
    Definir fila, columna Como Entero
    Definir producto Como Real
    Escribir "Ingrese número de fila (1-10):"
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
		Escribir "La división de (", fila1, ",", columna1, ") entre (", fila2, ",", columna2, ") es: ", resultado
	Sino
		Escribir "Error: No se puede dividir por cero"
	FinSi
FinFuncion
