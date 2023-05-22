//
//  ContentView.swift
//  FetchAPIJSON
//
//  Created by Claudio Tendean on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetch = ApiServices()
    
    var body: some View {
        List(fetch.post) { post in
            VStack(alignment: .leading) {
                Text(post.title).font(.system(size: 24, weight: .bold, design: .rounded))
                Text(post.body).font(.system(size: 24, weight: .light, design: .rounded))
                Button(action: {print("Klik Post ke \(post.id)")}) {
                    Text("Klik Saya")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
