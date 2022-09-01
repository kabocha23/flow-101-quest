import YearbookMinter from 0x63ffd70144f80d07

transaction(yearbookOwner: Address, messageKey: String){
    prepare(signer: AuthAccount){
        // borrow the public reference & capability to the Yearbook at the address specified
        let yearbookReference = getAccount(yearbookOwner)
            .getCapability(YearbookMinter.publicPath)
            .borrow<&YearbookMinter.Yearbook>()
            ?? panic(YearbookMinter.errNoYearbook)
        
        // sign the yearbook
        yearbookReference.leaveMessage(signer: signer.address, messageKey: messageKey)
    }
}