//
//  TaskRepository.swift
//  Tasks
//
//  Created by Rayana Prata Neves on 27/10/21.
//

import Foundation

class TaskRepository {
    
    static let instance: TaskRepository = TaskRepository()
    
    let tasks: [Task]
    
    private init() {
        self.tasks = []
    }
    
}

// utilizando o padrao singleton, nao é possível chamar o método construtor pois ele é privado, mas é possível chamar a instance que é quem cria o repositório
// toda vez que chamar a instance, se um repositório já tiver sido criado, ele nao vai criar novamente!
