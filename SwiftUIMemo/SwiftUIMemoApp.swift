//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 소프트웨어컴퓨터 on 2023/04/19.
//

import SwiftUI
  
@main
struct SwiftUIMemoApp: App {
    //메모 저장소를 모든 뷰에서 사용할 수 있도록 커스텀 공유데이터로 등록
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
