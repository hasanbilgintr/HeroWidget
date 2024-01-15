/*
 WidgetKit
 telefonda, macbookta  kutucuklar yandan üstten açılan direk erişiebildiğimiz bunlar uygulama değil bir nevi ana ekranda oluştuurlan yapılardır
 https://developer.apple.com/design/human-interface-guidelines/widgets
 
 Flaticon dan hero resimler çektik  freeleri çektik  hocasng çekilmiş biz png çektik
 
 
 iOS -> app ile Swift UI  ->swift (dil) -> açıldı
 */

import SwiftUI
//eklendi
import WidgetKit

let superHeroArray = [superman,batman,ironman]

struct ContentView: View {
    
    //group kullanıarak UserDefault yaptık yani ufakta olsa her tıklandığında kayıt ettik
    //buda Ana klasöre tıklayıp targets seçili ve sipning & Capabilities sekmesinden  +Capability tıklayıp App Groups (süreç içersindeki iletişimi kolaylalştırmak için bir özellik) seçtik ve  üstteki Bundle İdentifier kopyalayıp açılan alanda  + ya basıyoruz group.com.hasanbilgin.HeroWidget yaptık ve ok dedik kırmızı gözükürse yenile işaretine tıklanması yeterlidir geliştirici hesabınada gerek kalmadı çünkü çalıştı
    
    //hero keydir //buda tanımladığımız group ismidir
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.hasanbilgin.HeroWidget"))
    //üsstteki property repir heroDataya aittir
    var heroData : Data = Data()
    
    var body: some View {
        
        
        VStack {
            ForEach(superHeroArray) {hero in
                /*
                 .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                 /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                 }) tıklama özelliği ekledik count ve perform da silinebilir alltta yapılan gibi
                 */
                HeroView(hero: hero).onTapGesture{
                    saveToDefaults(hero: hero)
                }
            }
        }
        
    }
    
    func saveToDefaults(hero : SuperHero){
        //        print(hero.name)
        if let newHeroData = try? JSONEncoder().encode(hero) {
            self.heroData = newHeroData
            print(hero.name)
            //widget değiştiniği bildiriyoruz odadeğişçektir uygulamada tıkladığımız widget resmi
            
            //tüümnü yenilicektir
            //            WidgetCenter.shared.reloadAllTimelines()
            
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero555")
            
        }
        
    }
}

#Preview {
    ContentView()
}
