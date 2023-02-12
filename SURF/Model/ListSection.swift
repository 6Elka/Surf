//
//  ListItem.swift
//  SURF
//
//  Created by Artem on 08.02.2023.
//

import Foundation

enum ListSection {
    case first(Lists)
    case second(Lists)
    case third(Lists)
    case fourth(Lists)
    case fifth(Lists)
    case sixth(Lists)
    
    var items: Lists {
        switch self {
        case
            .first(let item),
            .second(let item),
            .third(let item),
            .fourth(let item),
            .fifth(let item),
            .sixth(let item):
            return item
        }
    }
    
    var count: Int {
        return items.count
    }
}
