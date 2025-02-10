import SwiftUI

struct ProfileView: View {
    @State private var username: String = "John Doe" // Default username, could be fetched from user data
    @State private var bio: String = "This is a short bio." // Default bio text
    
    var body: some View {
        VStack {
            // Profile Image
            Image(systemName: "person.circle.fill") // Placeholder image (replace with actual image)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 100)
                .clipShape(Circle())
                .padding(.top, 40)
            
            // Username
            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            // Bio Text
            TextEditor(text: $bio)
                .frame(height: 150)
                .padding()
                .border(Color.gray, width: 1)
                .cornerRadius(8)
                .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.gray.opacity(0.1)) // Background color for the profile page
        .edgesIgnoringSafeArea(.all)
    }
}
