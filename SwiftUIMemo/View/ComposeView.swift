//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 소프트웨어컴퓨터 on 2023/04/20.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    //status variable 프로그램이나 함수의 실행상태를 나타내기 위해 사용되는 변수
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //2-way binding
                //뷰와 뷰를 업데이트하는 데이터 사이의 양방향 바인딩을 의미한다
                //즉, 데이터를 변경하면 뷰도 함께 업데이트되고 반대의 경우도 적용된다
                
                TextEditor(text: $content)  //$기호는 @State 변수 content와 바인딩을 나타넨다
                    .padding()
                    .onAppear{
                        if let memo = memo {
                            content = memo.content
                        }
                    }
               
                
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else{
                            store.insert(memo: content)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
