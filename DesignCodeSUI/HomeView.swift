//
//  HomeView.swift
//  DesignCodeSUI
//
//  Created by hijazi on 26/07/2019.
//  Copyright © 2019 hijazi. All rights reserved.
//

import SwiftUI

struct HomeView : View {
  
  @State var showMenu = false
  @State var showProfile = false
  
  var body: some View {
    
    ZStack {
      
      HomeListView()
        .padding(.top, 76)
        .blur(radius: showMenu ? 20 : 0)
        .scaleEffect( showProfile ? 0.95 : 1)
        .animation(.default)
      
      ContentView()
//        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .animation(.fluidSpring())
        .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
      
      
      
      MenuRight(show: $showProfile).offset(x: -16, y: showProfile ? 0: 88)
      .animation(.spring())
      
      MenuView(showMenu: $showMenu)
      
      MenuButton(showMenu: $showMenu).offset(x: -30, y: showProfile ? 0: 80)
        .animation(.spring())
      
      
    }
    
    
  }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
#endif

struct MenuRow : View {
  
  var image = "creditcard"
  var text = "My Account"
  
  var body: some View {
    
    return HStack{
      
      Image(systemName:image)
        .imageScale(.large)
        .foregroundColor(Color("icons"))
        .frame(width: 32, height: 32)
      
      Text(text)
        .font(.headline)
      
      Spacer()
      
    }
    
  }
}


struct Menu : Identifiable {
  
  var id = UUID()
  var title : String
  var icon : String
  
  
}

struct MenuView : View {
  
  var menuItems = ["My Account", "Team", "Inbox", "Sign Out"]
  
  @Binding var showMenu : Bool
  
  let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Inbox", icon: "tray.full"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down"),
  ]
  
  var body: some View {
    
    return VStack(alignment: .leading) {
      
      Text("iReka Soft").font(.largeTitle).fontWeight(.heavy)
      
      ForEach(menuData) { item in
        
        MenuRow(image: item.icon, text: item.title)
        
      }
      
      Spacer()
      
      }
      .padding(.top, 110)
      .padding(30)
      .frame(minWidth: 0, maxWidth: CGFloat.infinity)
      .background(Color.white)
      .cornerRadius(30)
      .padding(.trailing, 60)
      .shadow(radius: 20)
      .rotation3DEffect(Angle(degrees: showMenu ? 0 : 60), axis: (x: 0, y: 10, z: 0))
      .animation(.basic())
      .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width )
    
  }
}

struct CircleButton : View {
  
  var icon = "person.crop.circle"
  
  var body: some View {
    return HStack {
      
      Image(systemName:icon)
        .foregroundColor(.black)
      }
      .frame(width: 44, height: 44)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
  }
}

struct MenuButton : View {
  
  @Binding var showMenu : Bool
  
  var body: some View {
    return ZStack ( alignment: .topLeading ) {
      
      Button(action: {
        self.showMenu.toggle()
        
      }) {
        HStack {
          Spacer()
          
          Image(systemName:"list.dash")
            .foregroundColor(.black)
          }
          .padding(.trailing, 20)
          .frame(width: 90, height: 60)
          .background(Color.white)
          .cornerRadius(30)
          .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
        
        
      }
      
      Spacer()
      
    }
  }
}

struct MenuRight : View {
  
  @Binding var show : Bool
  
  var body: some View {
    return ZStack ( alignment: .topTrailing ) {
      
      HStack {
        Button(action: {
          self.show.toggle()
          
        }) {
          CircleButton()
        }
        
        Button(action: {
          self.show.toggle()
          
        }) {
          CircleButton(icon:"bell")
        }
        
      }
      
      Spacer()
      
    }
  }
}
