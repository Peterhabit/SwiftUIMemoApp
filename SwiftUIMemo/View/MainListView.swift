//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 소프트웨어컴퓨터 on 2023/04/19.
//

import SwiftUI

struct MainListView: View {
    //뷰가 생성되는 시점에서 공유 데이터 목록을 확인하고
    //store속성과 동일한 타입을 가진 인스턴스가 등록되어 있다면
    //속성을 해당 인스턴스로 자동으로 초기화한다
    //하나의 데이터를 여러뷰에서 공유하고 싶을 때 사용하는 방식
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                NavigationLink{
                    DetailView(memo: memo)
                } label: {
                    MemoCell(memo: memo)
                }
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                Button{
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
        .navigationViewStyle(.stack)
      
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}



