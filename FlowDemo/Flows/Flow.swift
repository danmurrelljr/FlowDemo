//
//  Flow.swift
//  FlowDemo
//

import Foundation

protocol FlowAction {
  var id: String { get set }
  var data: Any? { get set }
}

private protocol Protocol {
  /** Optional final data to be passed to a parent flow when ending */
  var endData: Any? { get }

  /**
   Start the flow, providing optional initial data
   - Parameter data: is an optional payload to pass into the flow
   */
  func start(with data: Any?)

  /**
   Step backward in the flow, providing optional data
   - Parameter data: is an optional payload to pass into the flow
   */
  func back(with data: Any?)

  /**
   Step forward in the flow, providing optional data
   - Parameter data: is an optional payload to pass into the flow
   */
  func next(with data: Any?)

  /**
   Perform an action on the flow, providing optional data
   - Parameter action: is a FlowAction with `id` and optional `data` payload

   Unhandled actions should be forwarded to the flow parent, if available
   */
  func action(_ action: FlowAction)

  /**
   Log an action on the flow, providing optional data. No actual action is taken
   - Parameter action: is a FlowAction with `id` and optional `data` payload
   */
  func log(_ action: FlowAction)

  /**
   Complete the flow, providing optional data. If no data is provided, the flow will use `endData` instead.
   - Parameter data: is an optional payload representing final data from the flow

   This is final and cannot be overridden. To handle any clean up, override the `willEnd()` delegate function instead.
   Any sub-flows of this flow will also be automatically ended, with `nil` data (and must be able to handle `nil` data).
   */
  func end(with data: Any?)

  /**
   The flow is ending, and this is an opportunity to clean up any resources.
   - Parameter data: is an optional payload representing final data from the flow
   */
  func willEnd(with data: Any?)

  /**
   The parent flow is notified that a sub flow is starting
   - Parameter flow: is the sub-flow being started
   */
  func flowStarted(flow: Flow)

  /**
   The parent flow is notified that a sub flow has completed, providing optional final data
   - Parameter flow: is the sub-flow that has ended
   - Parameter data: is an optional payload representing final data from the flow
   */
  func flowEnded(flow: Flow, with data: Any?)
}

class Flow: NSObject, Protocol {
  private var subflows: [Flow] = []

  var parent: Flow?

  /** Set to end the flow end with specific data */
  var endData: Any?

  final var name: String {
    return String(describing: self)
  }

  init(parent: Flow? = nil) {
    self.parent = parent
  }

  deinit {
    print("\(name) is being deinit")
  }

  func start(with data: Any? = nil) {
    print("\(name) start(data: \(String(describing: data)))")
    if self.parent != nil {
      self.parent?.flowStarted(flow: self)
    }
  }

  func back(with data: Any? = nil) {
    print("\(name) back(data: \(String(describing: data)))")
  }

  func next(with data: Any? = nil) {
    print("\(name) next(data: \(String(describing: data)))")
  }

  func action(_ action: FlowAction) {
    print("\(name) action(id: \(action)")
  }

  func log(_ action: FlowAction) {
    print("\(name) log(id: \(action)")
    if self.parent != nil {
      self.parent?.log(action)
    }
  }

  final func end(with data: Any? = nil) {
    print("\(name) end(data: \(String(describing: data)))")
    willEnd(with: data ?? endData)

    subflows.forEach {
      print("\(name) auto-ending sub-flow \($0.name)")
      $0.end(with: nil)
    }

    if self.parent != nil {
      self.parent?.flowEnded(flow: self, with: data ?? endData)
    }
  }

  func willEnd(with data: Any? = nil) {
    print("\(name) willEnd(data: \(String(describing: data)))")
  }

  func flowStarted(flow: Flow) {
    print("\(name) sub-flow \(flow.name) started")
    subflows.upsert(flow)
  }

  func flowEnded(flow: Flow, with data: Any? = nil) {
    print("\(name) sub-flow \(flow.name) ended, with data: \(String(describing: data)))")
    subflows.removeAll(where: { $0 == flow })
  }
}

extension Array where Element: Equatable {
  mutating func upsert(_ element: Element) {
    if let row = self.firstIndex(where: { $0 == element }) {
      self[row] = element
    } else {
      self.append(element)
    }
  }
}
