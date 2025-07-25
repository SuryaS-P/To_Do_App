//
//  To_Do_AppApp.swift
//  To_Do_App
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
