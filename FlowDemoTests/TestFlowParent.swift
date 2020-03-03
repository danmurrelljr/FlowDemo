//
//  TestFlowParent.swift
//  FlowDemoTests
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import Foundation

/**
 Tests that a flow is calling expected parent functions
 */
class TestFlowParent: Flow {
  var subFlowStarted: Flow!
  var subFlowEnded: Flow!

  override func flowStarted(flow: Flow) {
    super.flowStarted(flow: flow)
    subFlowStarted = flow
  }

  override func flowEnded(flow: Flow, with data: Any? = nil) {
    super.flowEnded(flow: flow, with: data)
    subFlowEnded = flow
  }
}
