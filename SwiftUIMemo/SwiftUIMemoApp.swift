//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 소프트웨어컴퓨터 on 2023/04/19.
//

import SwiftUI
  
@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
