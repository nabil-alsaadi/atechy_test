//
//  ContentView.swift
//  Atechy_test
//
//  Created by nabil on 5/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    func getUser () {
        session.listen()
    }
    var body: some View {
        Group {
            if (session.session != nil) {
                HomeView()
            } else {
                LoginView()
            }
        }.onAppear(perform: getUser)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
