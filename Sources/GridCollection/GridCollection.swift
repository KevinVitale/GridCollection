// GridCollection
//------------------------------------------------------------------------------
public protocol GridCollection: Collection, Codable {
    associatedtype Tile: GridTile
    
    var width:  Int { get }
    var height: Int { get }
    
    subscript(x: Index, y: Index) -> Tile { get set }
    
    init<S: Sequence>(width: Int, height: Int, values: S) throws where S.Element == Tile.RawValue, S: ExpressibleByArrayLiteral
}

// GridCollection (Random)
//------------------------------------------------------------------------------
extension GridCollection {
    static func random(width: Int, height: Int) -> Self {
        let empty  = Tile.empty.rawValue
        let array  = Array(repeating: empty, count: width * height)
        let values = array.map { _ in Tile.random().rawValue }

        return try! self.init(width: width, height: height, values: values)
    }
}

