//
//  TweetViewModel.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import Combine

class TweetViewModel: Hashable, ObservableObject, Identifiable {
    static func == (lhs: TweetViewModel, rhs: TweetViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    private let tweetRepository = TweetRepository()
    @Published var tweet: Tweet
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    init(tweet: Tweet) {
        self.tweet = tweet

        $tweet
          .compactMap { $0.id }
          .assign(to: \.id, on: self)
          .store(in: &cancellables)
    }
}
