// Grid<T>
//------------------------------------------------------------------------------
public struct Grid<Element>: GridCollection {
    // Private
    //--------------------------------------------------------------------------
    private var values: Array<Element>
    
    // Public
    //--------------------------------------------------------------------------
    public var width:  Int
    public var height: Int
    
    // Init
    //--------------------------------------------------------------------------
    public init<S: Sequence>(width: Int, height: Int, values: S) where S.Element == Element {
        self.width  = width
        self.height = height
        self.values = Array(values)
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
    public subscript(index: Int) -> Element {
        return values[index]
    }
    
    public subscript(row: Int, col: Int) -> Element {
        get { return values[(row * height) + col] }
        set { values[(row * height) + col] = newValue }
    }
}

// Grid<T> (RawRepresentable)
//------------------------------------------------------------------------------
extension Grid where Element: RawRepresentable {
    public init?<S: Sequence>(width: Int, height: Int, values: S) where S.Element == Element.RawValue {
        let array = Array(values).flatMap { Element(rawValue: $0) }
        guard array.count == width * height else {
            return nil
        }

        self.values = array
        self.width  = width
        self.height = height
    }
}

