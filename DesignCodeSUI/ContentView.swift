//
//  ContentView.swift
//  DesignCodeSUI
//
//  Created by hijazi on 24/07/2019.
//  Copyright © 2019 hijazi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var show = false
  @State var viewState = CGSize.zero
  
  
  var body: some View {
    ZStack {
      
      TitleView().blur(radius: show ? 20 : 0)
        .animation(.default)
      
      CardBottomView()
        .offset(x: 0, y: 600)
        .blur(radius: show ? 20 : 0)
        .animation(.default)
      
      CardView()
        .background(show ? Color("background9") : Color("background9") )
        .cornerRadius(10)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -400 : -40)
        .scaleEffect(0.85)
        .rotationEffect(Angle(degrees: show ? 15 : 0))
        .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
        .blendMode(.hardLight)
        .animation(.basic(duration:0.6, curve: .easeInOut))
        .offset(x: viewState.width, y: viewState.height)
      
      CardView()
        .background(show ? Color("background8") : Color("background8"))
        .cornerRadius(10)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -200 : -20)
        .scaleEffect(0.9)
        .rotationEffect(Angle(degrees: show ? 10 : 0))
        .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
        //.animation(.spring(mass:1, stiffness:100, damping:10, initialVelocity:0))
        .blendMode(.hardLight)
        .animation(.basic(duration:0.5, curve: .easeInOut))
        .offset(x: viewState.width, y: viewState.height)
      
      CertificateView()
        .scaleEffect(0.95)
        .offset(x: viewState.width, y: viewState.height)
        .rotationEffect(Angle(degrees: show ? 5 : 0))
        .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
        .animation(.spring(mass:1, stiffness:100, damping:10, initialVelocity:0))
//        .animation(.default)
        .tapAction {
          
          self.show.toggle()
          
        }
        .gesture(
          DragGesture()
            .onChanged { value in
              self.viewState = value.translation
              self.show = false
            }
            .onEnded{ value in
              self.viewState = CGSize.zero
              self.show = false
            }
        )
      
    }
    
  }
  
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

struct CardView : View {
  var body: some View {
    return VStack {
      Text("Card").color(.white)
      }
      .frame(width: 340.0, height: 220.0)
    
  }
}

struct CertificateView : View {
  var body: some View {
    return VStack {
      HStack {
        VStack(alignment: .leading) {
          Text("UIDesign")
            .font(.headline)
            .fontWeight(.bold)
            .color(Color("accent"))
            .padding(.top)
          Text("Certificate").color(.white)
        }
        Spacer()
        Image("Logo")
          .resizable()
          .frame(width: 30.0, height: 30.0)
        }
        .padding(.horizontal)
      Spacer()
      Image("Certificate1")
      }
      .frame(width: 340.0, height: 220.0)
      .background(Color.black)
      .cornerRadius(10)
      .shadow(radius: 10)
  }
}

struct TitleView : View {
  var body: some View {
    return VStack {
      HStack {
        Text("Certificates")
          .font(.largeTitle)
          .fontWeight(.heavy)
        
        Spacer()
      }
      Image("Illustration5")
      Spacer()
      
      }.padding()
  }
}

struct CardBottomView : View {
  var body: some View {
    return VStack{
      
      Rectangle().frame(width: 60, height: 6).cornerRadius(3.0).opacity(0.2)
      
      Text("This certificate is a proof that Hijazi has attend this course and already can be organizing apps. And Develop more contents. This certificate is a proof that Hijazi has attend this course and already can be organizing apps. And Develop more contents.")
        .lineLimit(0)
      
      Spacer()
      
      }.padding()
      .frame(minWidth:0, maxWidth:.infinity)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(radius: 20)
  }
}
