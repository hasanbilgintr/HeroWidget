//
//  WidgetHeroLiveActivity.swift
//  WidgetHero
//
//  Created by hasan bilgin on 30.10.2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetHeroAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetHeroLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetHeroAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetHeroAttributes {
    fileprivate static var preview: WidgetHeroAttributes {
        WidgetHeroAttributes(name: "World")
    }
}

extension WidgetHeroAttributes.ContentState {
    fileprivate static var smiley: WidgetHeroAttributes.ContentState {
        WidgetHeroAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetHeroAttributes.ContentState {
         WidgetHeroAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetHeroAttributes.preview) {
   WidgetHeroLiveActivity()
} contentStates: {
    WidgetHeroAttributes.ContentState.smiley
    WidgetHeroAttributes.ContentState.starEyes
}
