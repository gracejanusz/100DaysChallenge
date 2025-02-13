import SwiftUI
import AVKit

struct Video: Identifiable {
    let id = UUID()
    let url: String
}

struct ContentView: View {
    let videos = [
        Video(url: "https://www.w3schools.com/html/mov_bbb.mp4"),
        Video(url: "https://www.w3schools.com/html/movie.mp4"),
        Video(url: "https://www.w3schools.com/html/mov_bbb.mp4")
    ]
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(videos: videos)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Text("Search")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                Text("Upload")
                    .tabItem {
                        Image(systemName: "plus.app.fill")
                        Text("Upload")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView: View {
    let videos: [Video]
    let texts = [
        "I loved Kendrick's halftime show!",
        "Taylor Swift and Travis Kelce love song",
        "I need songs like Champagne Coast!",
        "Juice WRLD summer 2025!"
    ]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    VStack { // Wrap bell in VStack to push it down
                        Spacer()
                            .frame(height: 70)
                        NavigationLink(destination: NotificationsView()) {
                            Image(systemName: "bell.fill")
                                .font(.title2)
                                .padding(.trailing)
                        }
                        .padding(.bottom, 5) // Move bell lower
                    }                }
                .background(Color.white)
                
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 0) {
                            ForEach(videos.indices, id: \.self) { index in
                                VideoPlayerView(videoURL: videos[index].url)
                                    .frame(height: 300)
                                    .id(index)
                                    .onAppear {
                                        if selectedIndex != index {
                                            selectedIndex = index
                                        }
                                    }
                                
                                NavigationLink(destination: PostView()) {
                                    Text(texts.randomElement() ?? "Default text")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 150)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .padding()
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .onChange(of: selectedIndex) { newIndex in
                            withAnimation {
                                proxy.scrollTo(newIndex, anchor: .center)
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}



struct VideoPlayerView: View {
    let videoURL: String
    @State private var player: AVPlayer?
    
    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .onTapGesture {
                        if player.timeControlStatus == .playing {
                            player.pause()
                        } else {
                            player.play()
                        }
                    }
            } else {
                ProgressView() // Show loading indicator while video is initializing
                    .frame(height: 300)
                    .onAppear {
                        player = AVPlayer(url: URL(string: videoURL)!)
                    }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
