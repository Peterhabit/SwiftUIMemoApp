//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 소프트웨어컴퓨터 on 2023/04/19.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject{
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now){
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
