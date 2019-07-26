//
//  HomeListView.swift
//  DesignCodeSUI
//
//  Created by hijazi on 26/07/2019.
//  Copyright © 2019 hijazi. All rights reserved.
//

import SwiftUI

struct HomeListView : View {
  var body: some View {
    
    ScrollView(showsHorizontalIndicator: false) {
      HStack(spacing:30) {
        ForEach(0 ..< 3) { item in
          
          PresentationButton(destination: ContentView()){
            CourseCardView()
          }
          
        }
      }
      .padding(.leading, 30)
    }
    
    
  }
}

#if DEBUG
struct HomeListView_Previews : PreviewProvider {
  static var previews: some View {
    HomeListView()
  }
}
#endif

struct CourseCardView : View {
  var body: some View {
    return VStack(alignment:.leading){
      Text("Build app with Swift UI")
        .font(.title)
        .fontWeight(.bold)
        .color(.white)
        .padding(20)
        .lineLimit(4)
        .frame(width: 150)
      
      Spacer()
      
      Image("Illustration1")
        .renderingMode(.original)
      
      }
      
      .background(Color("background3"))
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(radius: 20, x:0, y:10)
  }
}
