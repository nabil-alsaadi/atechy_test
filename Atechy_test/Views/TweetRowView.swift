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
    var tweet : Tweet{
        didSet{
            self.postion = .middle
            if tweet.id == tweets[0].id {
                self.postion = .first
            }
            if tweet.id == tweets[tweets.count-1].id {
                self.postion = .last
            }
        }
    }
    var postion : itemPosition = .middle
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
                tweet.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45, alignment: .center)
                    .padding(.leading,24)
                    .padding(.trailing,14)
                    .padding(.vertical,25)
                    .offset(x: -4, y: 0)
            }
            .frame(height: 80)
            
            VStack(alignment:.leading,spacing:8) {
                HStack(spacing:5) {
                    Text(tweet.name)
                        .font(Font.custom("Hellix", size: 14))
                        .fontWeight(.semibold)
                    Text(tweet.username)
                        .foregroundColor(Color.tweetTitleBlack)
                        .font(Font.custom("Hellix", size: 14))
                    Spacer()
                    if tweet.id == 1 {
                    Image("twitter_logo")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(.trailing,17)
                    }
                }
                Text(tweet.message)
                    .foregroundColor(Color.tweetTitleBlack)
                    .font(Font.custom("Hellix", size: 14))
            }
            
        }
        
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(tweet: tweets[0])
    }
}
