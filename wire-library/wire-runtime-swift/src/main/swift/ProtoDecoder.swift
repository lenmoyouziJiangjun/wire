//
//  Copyright © 2020 Square Inc. All rights reserved.
//

import Foundation

/**
 A class responsible for turning bytes from a serialized protocol buffer message
 into an in-memory struct representing that message.

 General usage will look something like:
 ```
 let decoder = ProtoDecoder()
 let decodedMessage = try decoder.decode(GeneratedMessageType.self, from: data)
 ```
 */
public final class ProtoDecoder {

    // MARK: -

    public enum Error: Swift.Error, LocalizedError {

        case fieldKeyValueZero
        case invalidFieldWireType(_: UInt32)
        case invalidStructure(message: String)
        case invalidUTF8StringData(_: Data)
        case malformedVarint
        case missingRequiredField(typeName: String, fieldName: String)
        case unexpectedEndOfData
        case unknownEnumCase(type: Any.Type, fieldNumber: UInt32)

        var localizedDescription: String {
            switch self {
            case .fieldKeyValueZero:
                return "Message field has a field number of zero, which is invalid."
            case let .invalidFieldWireType(value):
                return "Field has an invalid wire type of \(value)."
            case let .invalidStructure(message):
                return "Message structure is invalid: \(message)."
            case let .invalidUTF8StringData(data):
                return "String field of size \(data.count) is not valid UTF8 encoded data."
            case .malformedVarint:
                return "Encoded varint was not in the correct format."
            case let .missingRequiredField(typeName, fieldName):
                return "Required field \(fieldName) for type \(typeName) is not included in the message data."
            case .unexpectedEndOfData:
                return "A field indicates that its data extends beyond the end of the available message data."
            case let .unknownEnumCase(type, fieldNumber):
                return "Unknown case with value \(fieldNumber) found for enum of type \(String(describing: type))."
            }
        }
    }

    // MARK: - Initialization

    public init() {}

    // MARK: - Public Methods

    public func decode<T: ProtoDecodable>(_ type: T.Type, from data: Data) throws -> T {
        fatalError("TODO")
    }

}

