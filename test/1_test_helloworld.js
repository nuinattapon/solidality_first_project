// require('chai')
//   .use(require('chai-as-promised'))
//   .should()

const HelloWorld = artifacts.require("HelloWorld")

contract("HelloWorld", () => {

  it("has been deployed successfully", async () => {
    helloWorld = await HelloWorld.deployed()
    assert(helloWorld, "HelloWorld contract was not deployed")
  })

  let helloWorld

  const secretNumber = 123456789

  beforeEach(async () => {
    helloWorld = await HelloWorld.deployed()
    await helloWorld.setSecretNumber(secretNumber)
  })

  describe('Testing HelloWorld contract...', () => {
    describe('success', () => {
      it('checking getHelloMessage', async () => {
        expect(await helloWorld.getHelloMessage()).to.be.eq("Hello, world")
      })
      it('checking setSecretNumber/getSecretNumber', async () => {
        expect(Number(await helloWorld.getSecretNumber())).to.be.eq(secretNumber)
      })      
    })
  })
})
