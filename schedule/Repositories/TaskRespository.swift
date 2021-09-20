//
//  TaskRespository.swift
//  schedule
//
//  Created by Miguel Nascimento on 17/09/21.
//

import Foundation
class TaskRespository {
    static let instance: TaskRespository = TaskRespository()
    
    private  var tasks : [Task]
    
    private init() {
    self.tasks = []
        
    }
    
    func save(task: Task) {
        self.tasks.append(task)
    }
    
    func update(taskToUpdate: Task) {
        let taskIndex = tasks.firstIndex{(task) -> Bool in
            task.id == taskToUpdate.id
        }
        tasks.remove(at: taskIndex!)
        tasks.append(taskToUpdate)
    }
    func geTask() -> [Task] {
        self.tasks
    }
}
