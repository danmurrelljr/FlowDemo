//
//  AppView.swift
//  FlowDemo
//
//  Created by Dan Murrell on 3/15/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationView {
          WelcomeView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
