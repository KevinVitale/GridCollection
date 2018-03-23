// Grid<T>
//------------------------------------------------------------------------------
public struct Grid<T: Codable>: GridCollection where T: GridTile {
    // Private
    //--------------------------------------------------------------------------
    private var values: Array<T>
    
    // GridCollection
    //--------------------------------------------------------------------------
    public typealias Tile = T
    
    public var width:  Int
    public var height: Int
    
    // Init
    //--------------------------------------------------------------------------
    public init<S: Sequence>(width: Int, height: Int, values: S) throws where S.Element == T.RawValue, S: ExpressibleByArrayLiteral {
        let array = Array(values).flatMap { T(rawValue: $0) }
        guard array.count == width * height else {
            throw InitError.invalidValues
        }
        
        self.width  = width
        self.height = height
        self.values = array
    }
    
    // Collection
    //--------------------------------------------------------------------------
    public var startIndex: Int { return values.startIndex  }
    public var endIndex:   Int { return values.endIndex    }
    
    public func index(after i: Int) -> Int {
        return values.index(after: i)
    }
    
    // Subscripts
    //--------------------------------------------------------------------------
    public subscript(index: Int) -> T {
        return values[index]
    }
    
    public subscript(row: Int, col: Int) -> T {
        get { return values[(row * height) + col] }
        set { values[(row * height) + col] = newValue }
    }
}

// Grid<T> (Errors)
//--------------------------------------------------------------------------
extension Grid {
    // Init
    public enum InitError: Error {
        case invalidValues
    }
}
