//
//  NewTweetView.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var replyText : String
    @ObservedObject var tweetListViewModel: TweetListViewModel
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack(spacing:8) {
            Divider()
                .padding(.trailing,17)
            
            HStack(spacing:8) {
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45, alignment: .center)
                    .padding(.leading,20)
                ZStack {
                    TextField("Tweet your reply", text: $replyText,onCommit: {
                        if replyText != "" {
                            addTweet()
                        }
                        
                      })
                        .foregroundColor(Color.darkGrey)
                        .frame(height: 50)
                        .padding(.horizontal,12)
                    .background(Color.lightGrey)
                        .foregroundColor(Color.darkGrey)
//                    Button(action: {
//                        addTweet()
//                    }, label: {
//                        Text("Send")
//                    })
                        
                }
                .cornerRadius(25)
                .padding(.trailing,17)
                
                
            }
            
        }
    }
    private func addTweet() {
        if let user  = session.session {
            let tweet = Tweet(message: replyText,user: user)
            tweetListViewModel.add(tweet)
            replyText = ""
        }
        
        
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(replyText: .constant(""),tweetListViewModel: TweetListViewModel())
    }
}
