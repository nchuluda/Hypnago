//
//  HypnagoWidgetLiveActivity.swift
//  HypnagoWidget
//
//  Created by Jackelyn Toral on 5/30/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct HypnagoWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct HypnagoWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HypnagoWidgetAttributes.self) { context in
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

extension HypnagoWidgetAttributes {
    fileprivate static var preview: HypnagoWidgetAttributes {
        HypnagoWidgetAttributes(name: "World")
    }
}

extension HypnagoWidgetAttributes.ContentState {
    fileprivate static var smiley: HypnagoWidgetAttributes.ContentState {
        HypnagoWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: HypnagoWidgetAttributes.ContentState {
         HypnagoWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: HypnagoWidgetAttributes.preview) {
   HypnagoWidgetLiveActivity()
} contentStates: {
    HypnagoWidgetAttributes.ContentState.smiley
    HypnagoWidgetAttributes.ContentState.starEyes
}
