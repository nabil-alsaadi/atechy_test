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
        VStack {
            List(tweets) { tweet in
                
                TweetRowView(tweet: tweet)
                    
            }
            .onAppear {
               UITableView.appearance().separatorStyle = .none
               // can update any other property like tableFooterView etc
            }
            VStack(spacing:8) {
                Divider()
                    .padding(.trailing,17)
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(Color.deviderGrey)
                HStack(spacing:8) {
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45, alignment: .center)
                        .padding(.leading,20)
                    HStack(spacing: 0) {
                        TextField("Tweet your reply", text: $replyText)
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
        
        
//        List {
//            TweetRowView(tweet: tweets[0])
//        }
        //Text("test")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
