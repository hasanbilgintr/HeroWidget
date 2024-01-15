//
//  HeroView.swift
//  HeroWidget
//
//  Created by hasan bilgin on 30.10.2023.
//

import SwiftUI

struct HeroView: View {
    let hero : SuperHero
    
    var body: some View {
        HStack{
           
            //.frame diyip çerçevesini belirledik tabiki view ne ise bounds ile de berlilenebilir
            CircularImageView(image: Image(hero.image)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
            Spacer()
            VStack {
                //foregroundStyle(.black) yazı rengi
                Text(hero.name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.black)
                Text(hero.realName).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            
        }
        //view ortlaması sağladık diyebilirizz
        .frame(minWidth: UIScreen.main.bounds.width,alignment: .center)
    }
}

#Preview {
    HeroView(hero: ironman)
}
