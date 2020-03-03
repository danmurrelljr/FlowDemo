//
//  AppFlow.swift
//  FlowDemo
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import Foundation

class AppFlow: Flow {
  override func action(_ action: FlowAction) {
    super.action(action)

    self.parent?.action(action)
  }
}
