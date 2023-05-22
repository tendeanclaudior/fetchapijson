//
//  ContentView.swift
//  DragGesture
//
//  Created by Claudio Tendean on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        let drag = DragGesture()
            .onChanged {
                gesture in
                self.offset = gesture.translation
            }
            .onEnded{
                value in
                self.offset = CGSize.zero
                self.showMenu = false
            }
        
        return ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 300, height: 100)
                    .padding(.bottom, 20)
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Text("Good Luck")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                
            }
            
            if self.showMenu {
                Kupon()
                    .transition(.move(edge: .bottom).animation(.default))
                    .offset(y: self.offset.height)
                    .gesture(drag)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Kupon : View {
    var body: some View {
        VStack {
            Text("Selamat anda berhasil menjadi Swift Programmer")
                .font(.largeTitle).bold().foregroundColor(Color.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.bottom)
    }
}
