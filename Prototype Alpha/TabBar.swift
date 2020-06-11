//
//  ContentView.swift
//  FloatingTabBar
//
//  Created by pasto on 11/06/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    @State var selected = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
 

                if self.selected == 0{
                    
                    NavigationView{
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 15){
                                ForEach(1...8,id: \.self){i in
                                    
                                    Image("p\(i)").resizable().frame(height: 250).cornerRadius(15)
                                }
                                
                            }.padding()
                                .navigationBarTitle("Home",displayMode: .inline)
                            
                        }
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }
                else if self.selected == 1{
                    
                    NewsView()
                    
                }
                else{
                    
                    GeometryReader{_ in
                        
                        Text("Profile")
                    }
                }
                
            }.background(Color("Color").edgesIgnoringSafeArea(.all))
            
            FloatingTabbar(selected: self.$selected)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FloatingTabbar : View {
    
    @Binding var selected : Int
    @State var expand = false
    
    var body : some View{
        
        HStack{
            Spacer(minLength: 0)
            HStack{
                Button(action: {
                    
                    self.selected = 0
                    
                }) {
                    
                    Image(systemName: "house.fill").foregroundColor(self.selected == 0 ? .black : .gray).padding()
                }
                
                Spacer(minLength: 15)
                
                Button(action: {
                    
                    self.selected = 1
                    
                }) {
                    
                    Image(systemName: "tray.fill").foregroundColor(self.selected == 1 ? .black : .gray).padding()
                }
                
                Spacer(minLength: 15)
                
                Button(action: {
                    
                    self.selected = 2
                    
                }) {
                    
                    Image(systemName: "person.fill").foregroundColor(self.selected == 2 ? .black : .gray).padding()
                }
            }
            
            
        }.padding(.vertical,self.expand ? 20 : 8)
            .padding(.horizontal,self.expand ? 35 : 8)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(22)
            .shadow(radius: 4)
            .onLongPressGesture {
                
                self.expand.toggle()
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
    }
    
    
}


