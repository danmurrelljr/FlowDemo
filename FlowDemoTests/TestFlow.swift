//
//  TestFlowParent.swift
//  FlowDemoTests
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import Foundation

struct TestFlowParentAction: FlowAction {
  var id: String
  var data: Any?
}

/**
 Tests that a flow is calling expected parent functions
 */
class TestFlow: Flow {
  var subFlowStarted: Flow!
  var subFlowEnded: Flow!
  var lastAction: FlowAction!

  override func flowStarted(flow: Flow) {
    super.flowStarted(flow: flow)
    subFlowStarted = flow
  }

  override func flowEnded(flow: Flow, with data: Any? = nil) {
    super.flowEnded(flow: flow, with: data)
    subFlowEnded = flow
  }

  override func action(_ action: FlowAction) {
    super.action(action)
    lastAction = action
  }
}
