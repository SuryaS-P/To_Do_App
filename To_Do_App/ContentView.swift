//
//  ContentView.swift
//  To_Do_App
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var tasks : [Task]
    @Environment(\.modelContext) private var context
    @State private var newType = ""
    @State private var newCompletion = false
    @State private var newImportanceLevel = ""
    @State private var selectedTask : Task?
    var body: some View {
        NavigationStack{
            List{
                ForEach(tasks) {task in
                    HStack{
                        Text(task.type)
                        Spacer()
                        Text(task.importanceLevel)
                    }
                    .onTapGesture {
                        selectedTask = task
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("To-Do")
            .sheet(item: $selectedTask){
                task in
                NavigationStack{
                    EditTaskView(task: task)
                }
            }
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("New Task")
                        .font(.headline)
                    
                    TextField("Item Name", text: $newType)
                        .textFieldStyle(.roundedBorder)
                    TextField("Importance Level", text: $newImportanceLevel)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save"){
                        let newTask = Task(type: newType, completion: newCompletion, importanceLevel: newImportanceLevel)
                        context.insert(newTask)
                        
                        newType = ""
                        newCompletion = false
                        newImportanceLevel = ""
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
                
            }
        }
    }
            func deleteTask(at offsets: IndexSet) {
                for index in offsets{
                    let taskToDelete = tasks[index]
                    context.delete(taskToDelete)
                }
            }
        }
        
        #Preview {
            ContentView()
                .modelContainer(for: Task.self, inMemory: true)
            
        }
