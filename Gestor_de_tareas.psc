Algoritmo Gestor_de_Tareas
		SubAlgoritmo KanbanBoard
			
			Definir option, task Como Cadena
			Definir i, listChoice Como Entero
			
			Dimension todoList[10], inProgressList[10], doneList[10]
			
			Repetir
				Escribir "Kanban Board Menu:"
				Escribir "1. Add Task"
				Escribir "2. Move Task"
				Escribir "3. Display Board"
				Escribir "4. Exit"
				Leer option
				
				Segun option Hacer
					"1":
						Escribir "Enter task name:"
						Leer task
						Para i <- 1 Hasta 10 Con Paso 1 Hacer
							Si todoList[i] = "" Entonces
								todoList[i] <- task
								Escribir "Task added to To-Do list"
								i <- 10
							FinSi
						FinPara
					"2":
						Escribir "Select list (1: To-Do, 2: In Progress, 3: Done):"
						Leer listChoice
						Escribir "Enter task name to move:"
						Leer task
						
						Segun listChoice Hacer
							1: 
								MoveTask(todoList, inProgressList, task)
							2:
								MoveTask(inProgressList, doneList, task)
							3:
								Escribir "Cannot move from Done list"
						FinSegun
					"3":
						DisplayBoard(todoList, inProgressList, doneList)
				FinSegun
			Hasta Que option = "4"
	FinSubalgoritmo

	SubAlgoritmo MoveTask(sourceList, targetList, task)
		Definir i, j Como Entero
		Definir found Como Logico
		found <- Falso
		
		Para i <- 1 Hasta 10 Con Paso 1 Hacer
			Si sourceList[i] = task Entonces
				Para j <- 1 Hasta 10 Con Paso 1 Hacer
					Si targetList[j] = "" Entonces
						targetList[j] <- task
						sourceList[i] <- ""
						Escribir "Task moved successfully"
						found <- Verdadero
						j <- 10
					FinSi
				FinPara
				i <- 10
			FinSi
		FinPara
		
		Si No found Entonces
			Escribir "Task not found or target list is full"
		FinSi
	FinSubAlgoritmo

	SubAlgoritmo DisplayBoard(todoList, inProgressList, doneList)
		Definir i Como Entero
		
		Escribir "To-Do | In Progress | Done"
		Escribir "----------------------------"
		
		Para i <- 1 Hasta 10 Con Paso 1 Hacer
			Escribir todoList[i], " | ", inProgressList[i], " | ", doneList[i]
		FinPara
	FinSubalgoritmo
	
FinAlgoritmo


