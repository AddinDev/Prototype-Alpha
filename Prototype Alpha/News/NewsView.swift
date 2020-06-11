//
//  NewsView.swift
//  Prototype Alpha
//
//  Created by pasto on 11/06/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct NewsView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var isShowing = false

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }.pullToRefresh(isShowing: $isShowing, onRefresh: {
                self.networkManager.fetchData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isShowing = false
                }
            })
                
                .navigationBarTitle("News", displayMode: .inline)
        }
        .onAppear() {
            self.networkManager.fetchData()
        }
        
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
