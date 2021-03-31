//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Troy York on 3/5/21.
//

import SwiftUI

struct BlueFont: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.headline)
    }
}

extension View {
    func blueTitleStyle() -> some View {
        self.modifier(BlueFont())
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content){
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    var body: some View{
        VStack{
            ForEach(0..<rows) { row in
                HStack{
                    ForEach(0..<columns) { column in
                        content(row, column)
                }
            }
        }
    }
}
}
struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }    .blueTitleStyle()

        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
