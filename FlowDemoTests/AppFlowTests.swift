//
//  AppFlowTests.swift
//  FlowDemoTests
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import XCTest
import UIKit
import SwiftUI

class AppFlowTests: XCTestCase {
  var parent: TestFlow!
  var appFlow: AppFlow!
  var window: UIWindow!

  override func setUp() {
    parent = TestFlow()
    window = UIWindow(frame: UIScreen.main.bounds)
    appFlow = AppFlow(parent: parent, window: window)
    appFlow.start()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testAppFlowStarted() {
    XCTAssertEqual(parent.subFlowStarted, appFlow)
  }

  func testAppFlowEnded() {
    appFlow.end()
    XCTAssertEqual(parent.subFlowEnded, appFlow)
  }

  func testCallingATestActionOnAppFlowBubblesUpToParent() {
    let action = TestFlowParentAction(id: "test", data: nil)
    appFlow.action(action)
    XCTAssertEqual(parent.lastAction.id, action.id)
  }

  func testAppFlowInitializesWithWindow() {
    XCTAssertEqual(appFlow.window, window)
  }

  func testAppFlowStartPresentsAppViewInWindow() {
    let rootViewController = window.rootViewController as? UIHostingController<AppView>
    XCTAssertNotNil(rootViewController)
  }
}
