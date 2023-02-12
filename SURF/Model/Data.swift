//
//  Data.swift
//  SURF
//
//  Created by Artem on 08.02.2023.
//

import Foundation

struct Data {
    
    static let shared = Data()
    private init() {}
    
    private let first: ListSection = {
        .first([
            Item(title: "Стажировка в Surf")])
    }()
    
    private let second: ListSection = {
        .second([
        Item(title: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты. ")])
    }()
    
    private let third: ListSection = {
        .third([
        Item(title: "IOS"),
        Item(title: "Android"),
        Item(title: "Design"),
        Item(title: "QA"),
        Item(title: "Flutter"),
        Item(title: "PM")])
    }()
    
    private let fourth: ListSection = {
        .fourth([
        Item(title: "Получай стипендию, выстраивай удобный график, работай на современном железе.")])
    }()
    
    private let fifth: ListSection = {
        .fifth([
            Item(title: "IOS"),
            Item(title: "Android"),
            Item(title: "Design")])
    }()
    
    private let sixth: ListSection = {
        .sixth([
            Item(title: "QA"),
            Item(title: "Flutter"),
            Item(title: "PM")])
    }()
    
    var pageList: [ListSection] {
        [first, second, third, fourth, fifth, sixth]
    }
}
