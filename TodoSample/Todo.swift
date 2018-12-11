//
//  Todo.swift
//  TodoSample
//
//  Created by 匂坂 勇仁 on H30/12/10.
//  Copyright © 平成30年 TeamLab. All rights reserved.
//

import UIKit

struct Todo {
    let todoTitle: String
    let category: String
    let timeSchedule: String
    init(_ todoTitle: String, _ category: String, _ timeSchedule: String) {
        self.todoTitle = todoTitle
        self.category = category
        self.timeSchedule = timeSchedule
    }
    static var dummyData1: Todo { return Todo("タスク", "重要", "11月11日") }
    static var dummyData2: Todo { return Todo("課題", "個人", "12月10日") }
    static var dummyData3: Todo { return Todo("肉", "買い物", "11月29日") }
    static var karaData: Todo { return Todo("", "", "") }
}
