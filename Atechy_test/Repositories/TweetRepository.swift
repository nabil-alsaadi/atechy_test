//
//  TweetRepository.swift
//  Atechy_test
//
//  Created by nabil on 5/12/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine


class TweetRepository: ObservableObject {
  
    private let path: String = "tweets"

    private let store = Firestore.firestore()
    
    @Published var tweets: [Tweet] = []

    init() {
        get()
    }

    func get() {
        let query = store.collection(path).order(by: "created_at", descending: false)
        query.addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting cards: \(error.localizedDescription)")
                return
            }

            self.tweets = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Tweet.self)
            } ?? []
        }
    }
    func add(_ tweet: Tweet) {
        do {
         
          _ = try store.collection(path).addDocument(from: tweet)
        } catch {
          fatalError("Unable to add tweet: \(error.localizedDescription).")
        }
    }
}
