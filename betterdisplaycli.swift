//
//  betterdisplaycli
//
//  Created by @waydabber
//
//  Usage:
//    1. compile by entering: `swiftc betterdisplaycli`
//    2. make sure BetterDisplay 2.2.x and newer is running and is configured to accept CLI/notification requests (default)
//    3. run `./betterdisplaycli` for help
//

import Foundation

var arguments = CommandLine.arguments
var commands: [String] = []
var parameters: [String: String?] = [:]

if arguments.count <= 1 {
  arguments = ["help"]
} else {
  arguments.removeFirst()
}

for argument in arguments {
  if argument.hasPrefix("-") {
    let argumentParts = argument.components(separatedBy: "=")
    parameters[argumentParts[0].trimmingCharacters(in: CharacterSet(charactersIn: "-"))] = argumentParts.count > 1 ? argumentParts[1] : nil
  } else {
    commands.append(argument)
  }
}

await BetterDisplayNotificationIntegration().sendRequest(commands: commands, parameters: parameters)
exit(EXIT_FAILURE)

class BetterDisplayNotificationIntegration {

  let integrationNotificationRequestName = "com.betterdisplay.BetterDisplay.request"
  let integrationNotificationResponseName = "com.betterdisplay.BetterDisplay.response"

  var integrationNotificationRequestData: IntegrationNotificationRequestData?

  struct IntegrationNotificationRequestData: Codable {
    var uuid: String?
    var commands: [String] = []
    var parameters: [String: String?] = [:]
  }

  struct IntegrationNotificationResponseData: Codable {
    var uuid: String?
    var result: Bool?
    var payload: String?
  }

  func sendRequest(commands: [String], parameters: [String: String?]) async {
    DistributedNotificationCenter.default.addObserver(self, selector: #selector(self.processResponse), name: .init(self.integrationNotificationResponseName), object: nil)
    self.integrationNotificationRequestData = IntegrationNotificationRequestData(uuid: UUID().uuidString, commands: commands, parameters: parameters)
    do {
      let encodedIntegrationNotificationRequestData = try JSONEncoder().encode(self.integrationNotificationRequestData)
      if let encodedIntegrationNotificationRequestDataString = String(data: encodedIntegrationNotificationRequestData, encoding: .utf8) {
        DistributedNotificationCenter.default().postNotificationName(.init(self.integrationNotificationRequestName), object: encodedIntegrationNotificationRequestDataString, userInfo: nil, deliverImmediately: true)
        do {
          try await Task.sleep(nanoseconds: UInt64(5 * 1_000_000_000))
        } catch {}
        fputs("Failed. Request timed out. BetterDisplay might not be running or is not configured to accept notifications.\n", stderr)
        exit(EXIT_FAILURE)
      }
    } catch {}
    fputs("Failed. Unable to send notification due to an error.\n", stderr)
    exit(EXIT_FAILURE)
  }

  @objc func processResponse(notification: NSNotification) {
    guard let notificationString = notification.object as? String else {
      return
    }
    do {
      let integrationNotificationResponseData = try JSONDecoder().decode(IntegrationNotificationResponseData.self, from: Data(notificationString.utf8))
      if integrationNotificationResponseData.uuid != self.integrationNotificationRequestData?.uuid {
        return
      }
      if integrationNotificationResponseData.result == false {
        fputs("Failed.\(integrationNotificationResponseData.payload != nil ? " \(integrationNotificationResponseData.payload ?? "")" : "")\n", stderr)
        exit(EXIT_FAILURE)
      } else {
        if let payload = integrationNotificationResponseData.payload {
          print(payload)
        }
        exit(EXIT_SUCCESS)
      }
    } catch {
      fputs("Failed. Unable to process response due to an error.\n", stderr)
      exit(EXIT_FAILURE)
    }
  }
}

