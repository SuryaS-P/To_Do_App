import SwiftUI

struct EditTaskView: View {
    var task : Task
    @State private var newType: String
    @State private var newCompletion: Bool
    @State private var newImportanceLevel: String
    @Environment(\.dismiss) private var dismiss
    
    init(task: Task){
        self.task = task
        _newType = State(initialValue: task.type)
        _newCompletion = State(initialValue: task.completion)
        _newImportanceLevel = State(initialValue: task.importanceLevel)
    }
    var body: some View {
        Form {
            TextField("Item Name", text: $newType)
            TextField("Importance Level", text: $newImportanceLevel)
            
        }
        .navigationTitle("Edit Task")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
                }
            }
            ToolbarItem(placement:.confirmationAction){
                Button("Save"){
                    task.type = newType
                    task.importanceLevel = newImportanceLevel
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        EditTaskView(task: Task(type: "Item Name", completion: false, importanceLevel: "No Importance"))
    }
}

