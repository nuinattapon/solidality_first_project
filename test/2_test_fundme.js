// require('chai')
//   .use(require('chai-as-promised'))
//   .should()

const FundMe = artifacts.require("FundMe")

contract("FundMe", () => {
  it("has been deployed successfully", async () => {
    const greeter = await FundMe.deployed()
    assert(greeter, "FundMe contract was not deployed")
  })
})
