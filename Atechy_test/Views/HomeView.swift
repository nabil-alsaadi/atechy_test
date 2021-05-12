//
//  HomeView.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import SwiftUI

struct HomeView: View {
    @State var replyText : String = ""
    var body: some View {
        VStack(spacing:0) {
            // custom navigation bar
            CustomNavigationView()
            // tweets list
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(tweets, id: \.self) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            // tweet reply field
            VStack(spacing:8) {
                Divider()
                    .padding(.trailing,17)
                
                HStack(spacing:8) {
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45, alignment: .center)
                        .padding(.leading,20)
                    HStack(spacing: 0) {
                        TextField("Tweet your reply", text: $replyText)
                            .foregroundColor(Color.darkGrey)
                            .frame(height: 50)
                            .padding(.horizontal,12)
                        .background(Color.lightGrey)
                            .foregroundColor(Color.darkGrey)
                            
                    }
                    .cornerRadius(25)
                    .padding(.trailing,17)
                    
                    
                }
                
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

