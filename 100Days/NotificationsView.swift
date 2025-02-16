import SwiftUI

struct NotificationsView: View {
    // Define a structure to represent a notification
    struct Notification {
        let type: NotificationType
        let message: String
        let username: String
        let postId: String?
    }
    
    // Enum to define different types of notifications
    enum NotificationType {
        case likedPost, followedUser, rankUpdate, streak
    }
    
    // List of notifications
    let notifications: [Notification] = [
        Notification(type: .likedPost, message: "@user1 liked your post", username: "user1", postId: "1"),
        Notification(type: .followedUser, message: "@user2 followed you", username: "user2", postId: nil),
        Notification(type: .rankUpdate, message: "Rank update! You've leveled up!", username: "user3", postId: nil),
        Notification(type: .streak, message: "🔥 Streak! Keep engaging!", username: "user4", postId: nil)
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
            
            List(notifications, id: \.message) { notification in
                HStack {
                    // Handle clickable notification content
                    if notification.type == .likedPost || notification.type == .followedUser {
                        NavigationLink(destination: ProfileView(username: notification.username, bio: "Bio placeholder", rankings: "Rankings placeholder")) {
                            Text(notification.message)
                                .padding()
                        }
                    } else {
                        Text(notification.message)
                            .padding()
                    }
                }
            }
        }
        .navigationTitle("Notifications")
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
