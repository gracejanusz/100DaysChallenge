//
//  NotificationsView.swift
//  100Days
//
//  Created by 24AeliyaGrover on 2/12/25.
//
import SwiftUI
struct NotificationsView: View {
    let notifications = [
        "@user1 liked your post",
        "@user2 followed you",
        "Rank update! You've leveled up!",
        "🔥 Streak! Keep engaging!"
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Notifications")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            List(notifications, id: \ .self) { notification in
                Text(notification)
                    .padding()
            }
        }
        .navigationTitle("Notifications")
    }
}
