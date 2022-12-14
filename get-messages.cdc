import YearbookMinter from 0x63ffd70144f80d07

pub fun main(owner: Address): {Address: String}{
    // get a reference to the yearbook
    let yearbookReference = getAccount(owner)
        .getCapability(YearbookMinter.publicPath)
        .borrow<&YearbookMinter.Yearbook>() 
        ?? panic(YearbookMinter.errNoYearbook)
    
    // return its messages
    return yearbookReference.messages
}