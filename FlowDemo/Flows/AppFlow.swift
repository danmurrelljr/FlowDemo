//
//  AppFlow.swift
//  FlowDemo
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class AppFlow: Flow {
  let window: UIWindow!

  init(parent: Flow? = nil, window: UIWindow) {
    self.window = window
    super.init(parent: parent)
  }

  override func start(with data: Any? = nil) {
    super.start(with: data)

    let welcomeView = WelcomeView()
    window.rootViewController = UIHostingController(rootView: welcomeView)
    window.makeKeyAndVisible()
  }

  override func action(_ action: FlowAction) {
    super.action(action)

    self.parent?.action(action)
  }
}
