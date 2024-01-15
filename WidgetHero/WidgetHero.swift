/*
 -Widget eklemek için -> ana klasör seçip ->  en üst çubuktan ->File -> new -> Target… Widget Extension seçilir next tıklanır -> WidgetHero isim verip finish dedik -> açılana active denilebilir sonradan deactive denilebilir diye oda proje üstten hani simülatör çalıştırdığımız ayardan değişiklik sağlanabilir. Biz direk normal app simülasyonunu seçtik

 -Kullanılcak swift dosyalarınında show the file inspector sekmesinde  target Membership alanında eklediğimiz eklentiyide aktif  etmek gerekir
 
 -çalıştıırldığında ana ekranda widget eklenmesi gerekirismi ile
 
 */
import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    
    //eklendi
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.hasanbilgin.HeroWidget"))
    var heroData : Data = Data()
    
    
    //buda veri gelmedne kullanıcı rahatsız olmasın diye ön gösterim düşünülebilir
    func placeholder(in context: Context) -> SimpleEntry {
        //eklendi
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), hero: SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
    }
    
    //bir kez çalıştıırlan bir fonsiyon
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        //SimpleEntry(date: Date(), configuration: configuration, hero: <#SuperHero#>)
        
        //eklendi
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData){
            SimpleEntry(date: Date(), configuration: configuration, hero: hero)
        }else{
            SimpleEntry(date: Date(), configuration: configuration,hero:  SuperHero(image: "deneme", name: "deneme", realName: "deneme"))
        }
    }
    
    //zaman bazlı işlşemler yapılmış saate göre verdiği değerlerde değişiyor
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        //        var entries: [SimpleEntry] = []
        //
        //        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        //        let currentDate = Date()
        //        for hourOffset in 0 ..< 5 {
        //            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
        //            let entry = SimpleEntry(date: entryDate, configuration: configuration, hero: <#SuperHero#>)
        //            entries.append(entry)
        //        }
        //        //yenileme zamanları
        //        //.atEnd sonunda
        //        //.never hiç bir zaman
        //        //afert butarihten sonra yenile
        //        return Timeline(entries: entries, policy: .atEnd)
        
        //eklendi
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            return Timeline(entries: [entry], policy: .never)
        }else{
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: SuperHero(image: "deneme", name: "deneme", realName: "deneme"))
            return Timeline(entries: [entry], policy: .never)
        }
        
    }
}

//basit girdiler
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    //eklendi
    let hero : SuperHero
}

//widget içinde ne gösterilcek
struct WidgetHeroEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
//        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)
//            
//            Text("Favorite Emoji:")
//            Text(entry.configuration.favoriteEmoji)
//        }
        
        //eklendi
        CircularImageView(image: Image(entry.hero.image))
    }
}

//Widgetin kendisi

struct WidgetHero: Widget {
    //bir widget için 1 değişken tanımlanmış
    let kind: String = "WidgetHero555"
    
    //bu widget görünümü düşünebiliriz
    var body: some WidgetConfiguration {
        
        //StaticConfiguration  kullanıcı tarafındna herhangi bir değişikliğe tabi tutulmucaksa kullanılabilir
        //IntentConfiguration alttakine benzer  buda yani değiştirmeye müsait olacağı ayarda kullanıabilir
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetHeroEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
            //description kullanıcıya bir açıklama yazılabilir
            //configurationDisplayName ismide
        }.configurationDisplayName("Widget Hero").description("Hero widget!!!")
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

//#Preview(as: .systemSmall) {
//    WidgetHero()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .smiley, hero: <#SuperHero#>)
//    SimpleEntry(date: .now, configuration: .starEyes, hero: <#SuperHero#>)
//}
