//
//  ProductLine.swift
//  MasterTableView
//
//  Created by Forrest Collins on 1/13/16.
//  Copyright © 2016 helloTouch. All rights reserved.
//

// Here we have several Apple prodct lines:
// (1) iDevices: Apple Watch, iPad, iPhone, iOS
// (2) Mac: MacBook, MacBook Pro with Retina Display, MacBook Air, iMac,
//          Mac Pro, MacBook Pro, Mac Mini, Display, Airport Extreme, 
//          Airport Time Capsule, Airport Express, Magic Trackpad,
//          Magic Mouse, Apple Keyboard, Apple Battery Charger
// (3) Software: OS X, iLife, iWork, Logic Pro X, Final Cut Pro X, Aperture
// (4) iPod: Apple Music, Apple TV, iPod Nano, iPod Shuffle, iPod Touch, iTunes
// (5) Services: iCloud, Apple Pay

import Foundation

class ProductLine {
    
    var nameOfProductLine: String   // name of the product line
    var allProducts: [Product]      // all products in line
    
    // Get total amount of products from all productLines
    class var numberOfProducts: Int {
        get {
            return (ProductLine.iDevices().allProducts.count + ProductLine.mac().allProducts.count + ProductLine.software().allProducts.count + ProductLine.iPod().allProducts.count + ProductLine.services().allProducts.count)
        }
    }
    
    // Single Product Line Constructor
    init(nameOfLine: String, includedProducts: [Product]) {
        self.nameOfProductLine = nameOfLine
        self.allProducts = includedProducts
    }
    
    // Return all product lines as an array of product lines
    class func productLines() -> [ProductLine] {
        return [self.iDevices(), self.mac(), self.software(), self.iPod(), self.services()]
    }
    
    //-------------------------------------------
    // MARK: - Private Methods for Productlines
    //         Create multiple Product objects
    //         to be held in a ProductLine object
    //-------------------------------------------
    
    // (1) iDevices: Apple Watch, iPad, iPhone, iOS
    private class func iDevices() -> ProductLine {
        
        var iDeviceProducts = [Product]()
        
        iDeviceProducts.append(Product(title: "Apple Watch", description: "Featuring revolutionary new technologies and a pioneering user interface with a beautiful design that honors the rich tradition of precision watchmaking.", imageName: "apple-watch.png"))
        iDeviceProducts.append(Product(title: "iPad", description: "iPad Air 2 is the thinnest and most powerful iPad ever.", imageName: "ipad-air2.png"))
        iDeviceProducts.append(Product(title: "iPhone", description: "The biggest advancement in iPhone history, featuring two models with stunning 4.7-inch and 5.5-inch Retina HD dislays.", imageName: "iphone6.png"))
        iDeviceProducts.append(Product(title: "iOS", description: "iOS is the world's most advanced operating system. Its easy-to-use interface, amazing features, and rock-solid stability are built into every iPhone, iPad, and iPod Touch.", imageName: "iOS9.png"))
        
        return ProductLine(nameOfLine: "iDevices", includedProducts: iDeviceProducts)
    }
    
    // (2) Mac: MacBook, MacBook Pro with Retina Display, MacBook Air, iMac,
    //          Mac Pro, MacBook Pro, Mac Mini, Display, Airport Extreme,
    //          Airport Time Capsule, Airport Express, Magic Trackpad,
    //          Magic Mouse, Apple Keyboard, Apple Battery Charger
    private class func mac() -> ProductLine {
        
        var macProducts = [Product]()
        
        macProducts.append(Product(title: "MacBook", description: "The thinnest and lightest Mac ever with every component meticulously redesigned to create a Mac that is just two pounds and 13.1 mm thin.", imageName: "macbook.png"))
        macProducts.append(Product(title: "MacBook Pro 13 inch", description: "MacBook Pro features the latest dual-core and quad-core processors, and faster graphics to deliver the perfect combination of pro performance and extreme portability.", imageName: "macbook-pro-13.png"))
        macProducts.append(Product(title: "MacBook Pro with Retina Dsiplay", description: "A stunning high-resolution display, an amazing thin and light design, and the latest technology to power through the most demanding projects.", imageName: "macbook-pro-retina"))
        macProducts.append(Product(title: "MacBook Air", description: "All day battery life, fourth generation Intel Core processors with faster graphics, 802.11ac Wi-Fi and flash storage that is up to 45 percent faster than the previous generation.", imageName: "macbook-air.png"))
        macProducts.append(Product(title: "iMac", description: "The 27-inch iMac with Retina 5K display features a breathtaking 14.7 million pixel display so text appears sharper than ever, videos are unbelievably lifelike.", imageName: "imac-5k.png"))
        macProducts.append(Product(title: "Mac Pro", description: "Designed around a revolutionary unified thermal core, the Mac Pro introduces a completely new pro desktop architecture design that is optimized for performance inside and out.", imageName: "mac-pro.png"))
        macProducts.append(Product(title: "Mac Mini", description: "With its sleek aluminum design, a removable bottom panel for easy access to memory, and a space-saving built-in power supply, Mac Mini is pretty incredible.", imageName: "mac-mini.png"))
        macProducts.append(Product(title: "Displays", description: "The 27-inch Apple LED Cinema Display supersizes your view with an incredible 2560-by-1440 resolution.", imageName: "display.png"))
        macProducts.append(Product(title: "Airport Extreme", description: "Featuring 802.11ac Wi-Fi for up to three times faster performance.", imageName: "airport-extreme.png"))
        macProducts.append(Product(title: "Airport Time Capsule", description: "Featuring 802.11ac Wi-Fi for up to three times faster performance.", imageName: "airport-time-capsule"))
        macProducts.append(Product(title: "Airport Express", description: "With simultaneous dual band 802.11n, the affordable AirPort Express is powerful enough to run a home Wi-Fi network.", imageName: "airport-express.png"))
        macProducts.append(Product(title: "Magic Trackpad", description: "Magic Trackpad 2 features a larger edge-to-edge glass surface that delivers a responsive, uniform click no matter where you press.", imageName: "magic-accessories.png"))
        macProducts.append(Product(title: "Magic Mouse", description: "Magic Mouse 2 features a state-of-the-art Multi-Touch surface that makes it easy to explore your favorite content.", imageName: "magic-accessories.png"))
        macProducts.append(Product(title: "Apple Keyboard", description: "For Magic Keyboard, we reengineered the scissor mechanism to increase key stability by 33 percent and optimized key travel.", imageName: "magic-accessories.png"))
        
        return ProductLine(nameOfLine: "Mac", includedProducts: macProducts)
    }
    
    // (3) Software: OS X, iLife, iWork, Logic Pro X, Final Cut Pro X, Aperture
    private class func software() -> ProductLine {
        
        var softwareProducts = [Product]()
        
        softwareProducts.append(Product(title: "OS X", description: "Built on a rock-solid UNIX foundation, OS X is engineered to take full advantage of the technologies in every new Mac. And to deliver the most intuitive and integrated computer experience.", imageName: "osx.png"))
        softwareProducts.append(Product(title: "iLife", description: "Do more with movies and music than you ever thought possible.", imageName: "iLife.png"))
        softwareProducts.append(Product(title: "iWork", description: "iWork is the easiest way to create great-looking documents, spreadsheets, and presentations.", imageName: "iWork.png"))
        softwareProducts.append(Product(title: "Logic Pro X", description: "Logic Pro X, the most advanced version of Logic Pro to date, with a new interface designed for pros, powerful new creative tools for musicians and an expanded collection of instruments and effects.", imageName: "logic-pro-x.png"))
        softwareProducts.append(Product(title: "Final Cut Pro X", description: "Final Cut Pro X reinvents video editing with a modern interface and powerful new features for professional editors.", imageName: "final-cut-pro-x.png"))
        
        return ProductLine(nameOfLine: "Software", includedProducts: softwareProducts)
    }
    
    // (4) iPod: Apple Music, Apple TV, iPod Nano, iPod Shuffle, iPod Touch, iTunes
    private class func iPod() -> ProductLine {
        
        var iPodProducts = [Product]()
        
        iPodProducts.append(Product(title: "Apple Music", description: "A revolutionary streaming music service, a pioneering worldwide live radio station from Apple broadcasting 24 hours a day and a great new way for music fans to connect with their favorite artists.", imageName: "apple-music.png"))
        iPodProducts.append(Product(title: "Apple TV", description: "The all-new Apple TV brings a revolutionary experience to the living room based on apps built for the television.", imageName: "apple-tv.png"))
        iPodProducts.append(Product(title: "iPod Nano", description: "The thinnest iPod ever featuring a 2.5-inch Multi-Touch display; convenient navigation buttons; built-in Bluetooth for wireless listening; and the iPod nano comes in five gorgeous colors.", imageName: "ipod-nano.png"))
        iPodProducts.append(Product(title: "iPod Shuffle", description: "Colorful, portable, and wearable. Clip it on and take hundreds of songs with you everywhere.", imageName: "ipod-shuffle.png"))
        iPodProducts.append(Product(title: "iPod Touch", description: "iPod touch is the perfect way to carry your music collection in your pocket.", imageName: "ipod-touch.png"))
        iPodProducts.append(Product(title: "iTunes", description: "A free application for your Mac or PC, iTunes organizes and plays your digital music and video on your computer. It keeps all your content in sync.", imageName: "itunes.png"))
        
        return ProductLine(nameOfLine: "iPod", includedProducts: iPodProducts)
    }
    
    // (5) Services: iCloud, Apple Pay
    private class func services() -> ProductLine {
        
        var serviceProducts = [Product]()
        
        serviceProducts.append(Product(title: "iCloud", description: "A breakthrough set of free new cloud services that work seamlessly with applications to automatically and wirelessly store your content in iCloud and automatically and wirelessly push it to all your devices.", imageName: "icloud.png"))
        serviceProducts.append(Product(title: "Apple Pay", description: "A new category of service that is transforming mobile payments with an easy, secure and private way to pay.", imageName: "apple-pay.png"))
        
        return ProductLine(nameOfLine: "Services", includedProducts: serviceProducts)
    }
}