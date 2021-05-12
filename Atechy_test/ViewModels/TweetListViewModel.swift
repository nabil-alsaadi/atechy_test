//
//  TweetListViewModel.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//


import Combine

class TweetListViewModel: ObservableObject {

    @Published var tweetRepository = TweetRepository()
    @Published var tweetViewModels: [TweetViewModel] = []
    private var cancellables: Set<AnyCancellable> = []

    func add(_ tweet: Tweet) {
        tweetRepository.add(tweet)
    }
    init() {
        tweetRepository.$tweets.map { tweets in
        tweets.map(TweetViewModel.init)
      }
      .assign(to: \.tweetViewModels, on: self)
      .store(in: &cancellables)
    }
}
