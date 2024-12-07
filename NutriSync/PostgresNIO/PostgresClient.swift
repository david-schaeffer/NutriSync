//
//  PostgresClient.swift
//  NutriSync
//
//  Created by David Schaeffer on 12/4/24.
//

import PostgresNIO
import Foundation

final class PGClient {
    static let shared = PGClient()
    
    private var connection: PostgresConnection?
    private let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private let logger: Logger = Logger(label: "PGClientLogger")
    
    private init() {}
    
    func connect() async throws {
        var tlsConfig = TLSConfiguration.makeClientConfiguration()
        tlsConfig.certificateVerification = .none
        
        let sslContext: NIOSSLContext
        do {
            sslContext = try NIOSSLContext(configuration: tlsConfig)
        } catch {
            print("Error creating TLS context: \(error)")
            throw error
        }
        
        let configuration = PostgresConnection.Configuration(
            host: "ep-dark-star-a5vmt8md.us-east-2.aws.neon.tech",
            port: 5432,
            username: "nutrisync-db_owner",
            password: "gy1aOAMV5hWT",
            database: "nutrisync-db",
            tls: .require(sslContext)
        )
        
        do {
            self.connection = try await PostgresConnection.connect(
                on: eventLoopGroup.next(),
                configuration: configuration,
                id: 1,
                logger: logger
            )
        } catch {
            print("Failed to connect to Postgres: \(error)")
            throw error
        }
    }
    
    deinit {
        try? eventLoopGroup.syncShutdownGracefully()
    }
    
    func logMood(userId: Int, moodTags: [String], stressLevel: Int) async throws {
        guard let connection = connection else {
            throw PostgresError.connectionClosed
        }
        
        let insertNewLog = try await connection.query(
            """
            INSERT INTO logs (log_type, stress_level, meal_description, event_name, event_date, user_id)
            VALUES ('mood', \(stressLevel), null, null, null, \(userId))
            RETURNING log_id
            """,
            logger: logger)
        
        var logId: Int?
        
        for try await (log_id) in insertNewLog.decode(Int.self) {
            logId = log_id
        }
        
        let moodTagsPostgres = PostgresData(array: moodTags.map { PostgresData(string: $0) }, elementType: .text)
        
        let getMoodTagIds = try await connection.query(
            """
            SELECT mood_tag_id
            FROM mood_tags
            WHERE name = ANY($1)
            """,
            [moodTagsPostgres]).get()
        
        var moodTagIds: [Int] = []
        
        for mood_tag_id in getMoodTagIds {
            let moodTagId = try mood_tag_id.decode(Int.self)
            moodTagIds.append(moodTagId)
        }
        
        for moodTagId in moodTagIds {
            try await connection.query(
                """
                INSERT INTO log_mood_tags (log_id, mood_tag_id)
                VALUES (\(logId), \(moodTagId))
                """,
                logger: logger)
        }
    }
    
    func logMeal(userId: Int, moodTags: [String], stressLevel: Int, mealDescription: String) async throws {
        guard let connection = connection else {
            throw PostgresError.connectionClosed
        }
        
        let insertNewLog = try await connection.query(
            """
            INSERT INTO logs (log_type, stress_level, meal_description, event_name, event_date, user_id)
            VALUES ('meal', \(stressLevel), \(mealDescription), null, null, \(userId))
            RETURNING log_id
            """,
            logger: logger)
        
        var logId: Int?
        
        for try await (log_id) in insertNewLog.decode(Int.self) {
            logId = log_id
        }
        
        let moodTagsPostgres = PostgresData(array: moodTags.map { PostgresData(string: $0) }, elementType: .text)
        
        let getMoodTagIds = try await connection.query(
            """
            SELECT mood_tag_id
            FROM mood_tags
            WHERE name = ANY($1)
            """,
            [moodTagsPostgres]).get()
        
        var moodTagIds: [Int] = []
        
        for mood_tag_id in getMoodTagIds {
            let moodTagId = try mood_tag_id.decode(Int.self)
            moodTagIds.append(moodTagId)
        }
        
        for moodTagId in moodTagIds {
            try await connection.query(
                """
                INSERT INTO log_mood_tags (log_id, mood_tag_id)
                VALUES (\(logId), \(moodTagId))
                """,
                logger: logger)
        }
    }
    
    func logEvent(userId: Int, moodTags: [String], stressLevel: Int, eventName: String, eventDate: Date) async throws {
        guard let connection = connection else {
            throw PostgresError.connectionClosed
        }
        
        let insertNewLog = try await connection.query(
            """
            INSERT INTO logs (log_type, stress_level, meal_description, event_name, event_date, user_id)
            VALUES ('event', \(stressLevel), null, \(eventName), \(eventDate), \(userId))
            RETURNING log_id
            """,
            logger: logger)
        
        var logId: Int?
        
        for try await (log_id) in insertNewLog.decode(Int.self) {
            logId = log_id
        }
        
        let moodTagsPostgres = PostgresData(array: moodTags.map { PostgresData(string: $0) }, elementType: .text)
        
        let getMoodTagIds = try await connection.query(
            """
            SELECT mood_tag_id
            FROM mood_tags
            WHERE name = ANY($1)
            """,
            [moodTagsPostgres]).get()
        
        var moodTagIds: [Int] = []
        
        for mood_tag_id in getMoodTagIds {
            let moodTagId = try mood_tag_id.decode(Int.self)
            moodTagIds.append(moodTagId)
        }
        
        for moodTagId in moodTagIds {
            try await connection.query(
                """
                INSERT INTO log_mood_tags (log_id, mood_tag_id)
                VALUES (\(logId), \(moodTagId))
                """,
                logger: logger)
        }
    }
    
    
    
    func disconnect() async throws {
        try await connection?.close()
        try await eventLoopGroup.shutdownGracefully()
    }
}
