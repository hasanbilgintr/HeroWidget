//
//  CircularImageView.swift
//  HeroWidget
//
//  Created by hasan bilgin on 30.10.2023.
//

import SwiftUI

struct CircularImageView: View {
    var image : Image
    var body: some View {
        //.clipShape(Circle()) yuvarlak şeklin için ehapsetti
        //.overlay(Circle().stroke(Color.black,lineWidth: 5)) yuvarlak kenarlarına çizgi çekti istersekte siyaha boyayabiliriz ve yine isteğe bağlı çizgiye et kalınlığı verebiliriz
        //.shadow(radius: 15) gölgelendirmede yapabiliriz
        image.resizable().aspectRatio(contentMode: .fit).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.black,lineWidth: 5))
            .shadow(radius: 15)
    }
}

#Preview {
    CircularImageView(image: Image("ironman"))
}
