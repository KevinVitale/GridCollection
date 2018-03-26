// GridCollection
//------------------------------------------------------------------------------
public protocol GridCollection: Collection {
    var width:  Int { get }
    var height: Int { get }
    
    subscript(x: Index, y: Index) -> Element { get set }
}

// GridCollection (JSON)
//------------------------------------------------------------------------------
import Foundation
extension Collection where Self: Codable {
    public func jsonEncoded(_ encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

