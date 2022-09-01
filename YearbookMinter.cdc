pub contract YearbookMinter {

    pub event YearbookCreated(owner: Address)
    pub event YearbookSigned(owner: Address, signer: Address, message: String)

    pub let allowedMessages: {String: String}

    pub resource Yearbook {
        pub let messages: {Address: String}

        pub fun leaveMessage(signer: Address, messageKey: String) {
            let message = YearbookMinter.allowedMessages[messageKey] ?? "I don't have anything nice to say"
            self.messages[signer] = message
            emit YearbookSigned(owner: self.owner!.address, signer: signer, message: message)
        }

        init(owner: Address) {
            self.messages = {}
            emit YearbookCreated(owner: owner)
        }
    }

    pub fun createYearbook(owner: Address): @Yearbook {
        return <- create Yearbook(owner: owner)
    }

    init() {
        self.allowedMessages = {
        "hello": "hello",
        "goodbye": "goodbye",
        "greeting": "how are you doing?",
        "great": "I had a great time!",
        "friend": "You're my best friend!"
        }
    }
}