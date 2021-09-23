//
//  Task.swift
//  schedule
//
//  Created by Miguel Nascimento on 13/09/21.
//

import Foundation

struct Task {
    var id  = UUID ()
    var name : String = ""
    var date : Date = Date()
    var category: Category = Category (name: "Para Fazer", color: .black)
    
    
    
}
