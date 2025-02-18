//
//  SearchView.swift
//  100Days
//
//  Created by 24AeliyaGrover on 2/15/25.
//
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let recentlyListened = ["Song 1", "Song 2", "Song 3", "Song 4"]
    let recommendations = ["Similar Song 1", "Similar Song 2", "Similar Song 3"]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Type query", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // Recently Listened Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Recently Listened")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(recentlyListened, id: \.self) { song in
                        NavigationLink(destination: PostView()) {
                            HStack {
                                Image(systemName: "music.note")
                                    .foregroundColor(.blue)
                                Text(song)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.top)
                
                // Recommendations Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("More Like...")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(recommendations, id: \.self) { song in
                        NavigationLink(destination: PostView()) {
                            HStack {
                                Image(systemName: "music.note")
                                    .foregroundColor(.blue)
                                Text(song)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
