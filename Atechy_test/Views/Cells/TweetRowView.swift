//
//  TweetRowView.swift
//  Atechy_test
//
//  Created by nabil on 5/11/21.
//

import SwiftUI
enum itemPosition {
    case first
    case last
    case middle
}
struct TweetRowView: View {
    
    var tweetViewModel: TweetViewModel
    @Binding var postion : itemPosition
    var index:Int = 0
    var count:Int = 0
    var body: some View {
        HStack(spacing:0) {
            ZStack {
                VStack(spacing:0) {
                    if postion == .first {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 2)
                    }
                    else {
                        Rectangle()
                            .fill(Color.deviderGrey)
                            .frame(width: 2)
                    }
                    if postion == .last {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 2)
                    }
                    else {
                        Rectangle()
                            .fill(Color.deviderGrey)
                            .frame(width: 2)
                    }
                    
                }
                tweetViewModel.tweet.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45, alignment: .center)
                    .padding(.leading,24)
                    .padding(.trailing,14)
                    //.padding(.vertical,25)
                    .offset(x: -4, y: 0)
            }
            
            
            VStack(alignment:.leading,spacing:8) {
                HStack(spacing:5) {
                    Text(tweetViewModel.tweet.name)
                        .font(Font.custom("Hellix", size: 14))
                        .fontWeight(.semibold)
                    Text(tweetViewModel.tweet.username)
                        .foregroundColor(Color.tweetTitleBlack)
                        .font(Font.custom("Hellix", size: 14))
                    Text( " . \(tweetViewModel.tweet.date.timeAgoDisplay())" )
                        .foregroundColor(Color.tweetTitleBlack)
                        .font(Font.custom("Hellix", size: 14))
                    Spacer()
                    if postion == .first  {
                    Image("twitter_logo")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(.trailing,17)
                    }
                }
                Text(tweetViewModel.tweet.message)
                    .foregroundColor(Color.tweetTitleBlack)
                    .font(Font.custom("Hellix", size: 14))
            }
            
        }
        .frame(height: 80)
        .padding(0)
        .onAppear(perform: {
        })
        
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(tweetViewModel: TweetViewModel(tweet: tweets[0]), postion: .constant(.first))
    }
}
