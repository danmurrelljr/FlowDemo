//
//  ButtonStyles.swift
//  FlowDemo
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import SwiftUI

struct FilledButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .frame(minWidth: 0, maxWidth: 400)
      .padding()
      .background(Color.blue)
      .cornerRadius(40)
  }
}

struct ClearButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(Color.blue)
      .frame(minWidth: 0, maxWidth: 400)
      .padding()
  }
}

struct ButtonStyles_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Button("Log in" + " Button") {}
        .filledButtonStyle()
        .previewLayout(.sizeThatFits)

      Text("Log in" + " Text")
        .filledButtonStyle()
        .previewLayout(.sizeThatFits)

      Button("Log in" + " Button") {}
        .clearButtonStyle()
        .previewLayout(.sizeThatFits)

      Text("Log in" + " Text")
        .clearButtonStyle()
        .previewLayout(.sizeThatFits)
    }
  }
}

extension View {
  func filledButtonStyle() -> some View {
    ModifiedContent(content: self, modifier: FilledButtonStyle())
  }

  func clearButtonStyle() -> some View {
    ModifiedContent(content: self, modifier: ClearButtonStyle())
  }
}

