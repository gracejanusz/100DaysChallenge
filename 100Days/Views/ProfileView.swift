import SwiftUI

struct ProfileView: View {
    let username: String
    let bio: String
    let rankings: String
    let previousPosts = [
        "Why Kendrick is better than Drake",
        "I love Bladee!!"
    ]
    
    // List of ranked profiles that will be clickable under Rankings
    let rankedProfiles = [
        UserProfile(username: "JohnDoe", bio: "Music lover, tech enthusiast.", rankings: "Ranked 1st in Most Reviews this week!"),
        UserProfile(username: "JaneSmith", bio: "Game dev and movie critic.", rankings: "Ranked 2nd in Game Reviews this month!"),
        UserProfile(username: "KennyK", bio: "Sports fan, travel junkie.", rankings: "Ranked 3rd in Top Posters this year!")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView { // Make the whole profile view scrollable
                VStack {
                    // Adjusted Spacer to move text closer to the profile image
                    Spacer().frame(height: 20) // Reduced space between photo and text
                    
                    // Profile Image
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.top, 40)
                    
                    // Increase font size and padding for the username
                    Text(username)
                        .font(.largeTitle) // Increased font size
                        .fontWeight(.bold)
                        .padding(.top, 10) // Reduced padding to bring it closer
                        .padding(.bottom, 5)
                    
                    Spacer().frame(height: 20)
                
                    // Bio Section
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
                    
                    // Rankings Section - Clickable profiles
                    VStack(alignment: .leading) {
                        Text("Ranked Profiles:")
                            .font(.headline)
                            .padding(.leading)
                        
                        ForEach(rankedProfiles, id: \.username) { profile in
                            NavigationLink(destination: ProfileView(username: profile.username, bio: profile.bio, rankings: profile.rankings)) {
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    Text(profile.username)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Text(profile.rankings)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding([.leading, .trailing, .top])
                    
                    // Previous Posts Section (Now Clickable)
                    VStack(alignment: .leading) {
                        Text("Previous Posts:")
                            .font(.headline)
                            .padding(.leading)
                        
                        ForEach(previousPosts, id: \.self) { post in
                            NavigationLink(destination: PostDetailView(postTitle: post)) {
                                HStack {
                                    Image(systemName: "doc.text")
                                        .foregroundColor(.blue)
                                    Text(post)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                    
                    Spacer()
                }
                .background(Color.gray.opacity(0.1))
                .edgesIgnoringSafeArea(.all)
            }
            .navigationTitle("Profile")
        }
    }
}
