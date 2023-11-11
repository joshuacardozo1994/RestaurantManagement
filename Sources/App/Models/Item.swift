//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor
import Fluent

/// `Item` represents a product or service item in the system.
///
/// This class serves as a model for managing items in a database using Fluent in Vapor. It includes details about the item, such as its name, description, price, and its categorization.
///
/// Properties:
///   - id: UUID? - A unique identifier for the item. Optional, as it may not be set before saving the object to the database.
///   - name: String - The name of the item.
///   - subtext: String? - An optional short description or subtitle for the item.
///   - position: Int - A numerical position or order for the item, potentially used for sorting or display purposes.
///   - description: String? - An optional detailed description of the item.
///   - price: Double - The price of the item.
///   - imageUrl: String? - An optional URL/path to an image representing the item.
///   - enabled: Bool - A flag indicating whether the item is active/enabled for use.
///   - category: Category - A parent relationship to the `Category` model, indicating the category to which this item belongs.
///   - createdAt: Date? - A timestamp for when the item record was created. Automatically set on creation.
///   - updatedAt: Date? - A timestamp for when the item record was last updated. Automatically set on update.
///
/// Initialization:
///   - An empty initializer for Fluent.
///   - An initializer with parameters for manual object creation, allowing the specification of all item properties, including its category.
///
/// Example Usage:
/// ```
/// let newItem = Item(name: "Espresso", position: 1, description: "A strong black coffee", price: 2.50, enabled: true, categoryId: someCategoryID)
/// ```
///
/// - Note: The relationship to ``Category`` is essential and requires a valid existing ID in the database for that model.
final class Item: Model, Content {
    static let schema = "items"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "subtext")
    var subtext: String?
    
    @Field(key: "position")
    var position: Int
    
    @Field(key: "description")
    var description: String?
    
    @Field(key: "price")
    var price: Double
    
    @Field(key: "image_url")
    var imageUrl: String?
    
    @Field(key: "enabled")
    var enabled: Bool
    
    @Parent(key: "category_id")
    var category: Category
    
    // When this Item was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    // When this Item was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, name: String, subtext: String? = nil, position: Int, description: String? = nil, price: Double, imageUrl: String? = nil, enabled: Bool, categoryId: UUID) {
        self.id = id
        self.name = name
        self.subtext = subtext
        self.position = position
        self.description = description
        self.price = price
        self.imageUrl = imageUrl
        self.enabled = enabled
        self.$category.id = categoryId
    }
}

