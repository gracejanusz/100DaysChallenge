import SwiftUI

struct ProfileView: View {
    @State private var username: String = "USERNAME" // Default username
    @State private var bio: String = "This is a short bio." // Default bio text
    @State private var rankings: String = "Ranked #1 in SwiftUI" // Default ranking text
    @State private var previousPosts: String = "Post 1: SwiftUI Basics\nPost 2: Advanced SwiftUI Topics" // Default previous posts

    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            // Profile Image
            Image(systemName: "person.circle.fill") // Placeholder image (replace with actual image)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .padding(.top, 40)
            
            Spacer().frame(height: 60)
            
            Text(username)
                .font(.headline)
                .padding() // Align to the left with padding
            Spacer().frame(height: 30)
        
            // Bio (Non-editable)
            VStack(alignment: .leading) {
                Text("Bio:")
                    .font(.headline)
                    .padding(.leading)
                Text(bio)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding([.leading, .trailing, .top])
            
            // Rankings (Non-editable)
            VStack(alignment: .leading) {
                Text("Rankings:")
                    .font(.headline)
                    .padding(.leading)
                Text(rankings)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding([.leading, .trailing, .top])
            
            // Previous Posts (Non-editable)
            VStack(alignment: .leading) {
                Text("Previous Posts:")
                    .font(.headline)
                    .padding(.leading)
                Text(previousPosts)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding([.leading, .trailing, .top])
            
            Spacer()
        }
        .background(Color.gray.opacity(0.1)) // Background color for the profile page
        .edgesIgnoringSafeArea(.all)
    }
}
