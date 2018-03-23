// GridTile
//------------------------------------------------------------------------------
public protocol GridTile: RawRepresentable where Self.RawValue: ExpressibleByIntegerLiteral {
    static func random() -> Self
    static var  empty: Self { get }
}

