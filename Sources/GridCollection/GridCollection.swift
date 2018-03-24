// GridCollection
//------------------------------------------------------------------------------
public protocol GridCollection: Collection, Codable {
    associatedtype Tile: GridElement
    
    var width:  Int { get }
    var height: Int { get }
    
    subscript(x: Index, y: Index) -> Tile { get set }
    
    init<S: Sequence>(width: Int, height: Int, values: S) throws where S.Element == Tile.RawValue, S: ExpressibleByArrayLiteral
}

// GridCollection (JSON)
//------------------------------------------------------------------------------
import Foundation
extension GridCollection {
    public func jsonEncoded(_ encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

// GridCollection (Random)
//------------------------------------------------------------------------------
extension GridCollection {
    public static func random<V: ValueRandomizer>(width: Int, height: Int, randomizer: V) -> Self where V.Value == Tile.RawValue {
        let empty  = Tile.empty.rawValue
        let array  = Array<Tile.RawValue>(repeating: empty, count: width * height)
        let values = array.map { _ in Tile.random(randomizer)!.rawValue }
        return try! Self(width: width, height: height, values: values)
    }

    public static func random(width: Int, height: Int) -> Self {
        return Self.random(width: width, height: height, randomizer: Arc4Randomizer<Tile.RawValue>())
    }
}

