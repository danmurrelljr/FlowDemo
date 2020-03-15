//
//  AppFlowTests.swift
//  FlowDemoTests
//
//  Created by Dan Murrell on 3/3/20.
//  Copyright © 2020 MutantSoup. All rights reserved.
//

import XCTest

class AppFlowTests: XCTestCase {
  var parent: TestFlowParent!
  var appFlow: AppFlow!

  override func setUp() {
    parent = TestFlowParent()
    appFlow = AppFlow(parent: parent)
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testAppFlowStarted() {
    appFlow.start()
    XCTAssertEqual(parent.subFlowStarted, appFlow)
  }

  func testAppFlowEnded() {
    appFlow.start()
    appFlow.end()
    XCTAssertEqual(parent.subFlowEnded, appFlow)
  }
}
