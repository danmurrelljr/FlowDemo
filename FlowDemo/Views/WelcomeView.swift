//
//  WelcomeView.swift
//  FlowDemo
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    VStack {
      VStack(spacing: 24) {
        Text("Welcome to Flow Demo!")
          .font(.largeTitle)
        Text("Please tap Next to continue.")
          .font(.headline)
      }.padding()

      NavigationLink(destination: Text("Tapped Next")) {
        Text("Next")
        .filledButtonStyle()
        .padding()
      }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      WelcomeView()
    }
  }
}
