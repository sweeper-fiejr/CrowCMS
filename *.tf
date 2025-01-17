            "items": items
        ]

        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
            return String(data: jsonData, encoding: .utf8)
        }
        return nil
    }
}

// Usage
let app = main()
app.run()
if let json = app.toJSON() {
    print("\nJSON Output:")
    print(json)
}

# Setup Update 1760548346

# Setup Update 1760548346

# Setup Update 1760548347

# Setup Update 1760548347

# Setup Update 1760548347

# Setup Update 1760548347

# Setup Update 1760548347

# Setup Update 1760548347

# Setup Update 1760548347

# Setup Update 1760548347
