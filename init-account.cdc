import YearbookMinter from 0x63ffd70144f80d07

transaction {
  prepare(signer: AuthAccount) {
    // checks if we have a yearbook resource in our account
    let yearbookExists = signer.getCapability(YearbookMinter.publicPath)
      .check<&YearbookMinter.Yearbook>()

    // if it doesn't find one, let's create a new one.
    if(!yearbookExists){
      let book <- YearbookMinter.createYearbook(ownerAddress: signer.address)
      signer.save(<-book, to: YearbookMinter.storagePath)
      signer.link<&YearbookMinter.Yearbook>(YearbookMinter.publicPath, target: YearbookMinter.storagePath)
    }
  }
}