//
//  HomeView.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import SwiftUI

struct HomeView: View {
    @State var replyText : String = ""
    @ObservedObject var tweetListViewModel = TweetListViewModel()
    var body: some View {
        VStack(spacing:0) {
            // custom navigation bar
            CustomNavigationView()
            // tweets list
            ScrollViewReader { scrollProxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(tweetListViewModel.tweetViewModels, id: \.id) { tweetViewModel in
                            
                                TweetRowView(tweetViewModel: tweetViewModel,postion: getPostion(item: tweetViewModel))
                           
                            
                        }
                    }
                }
            }
            // tweet reply field
            NewTweetView(replyText: $replyText, tweetListViewModel: TweetListViewModel())
                .padding(.bottom,20)
        }
        .navigationBarHidden(true)
    }
    private func getPostion(item:TweetViewModel) -> itemPosition {
        if item == tweetListViewModel.tweetViewModels.last {
            return .last
        }
        else if item == tweetListViewModel.tweetViewModels.first {
            return .first
        }
        else {
            return .middle
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

