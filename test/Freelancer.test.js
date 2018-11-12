const web3 = new Web3(ganache.provider());

const json = require('./../build/contracts/Auction.json');

let accounts;

let freelancer;

let owner;

const interface = json['abi'];

const bytecode = json['bytecode'];

beforeEach(async () => {

    accounts = await web3.eth.getAccounts();

    owner = accounts[0];

    freelancer = await new web3.eth.Contract(interface)

        .deploy({ data: bytecode })

        .send({ from: owner, gas: '1000000' });
});

describe('Freelancer', () => {
    it('deploy a contract', async () => {
        const currentFreelancer = await freelancer.methods.owner().call();

        assert.equal(freelancer, currentFreelancer, 'The owner is the one who launches the smart contract');
    });

    it('only owner can set freelancer', async () => {

        nonowner = accounts[1];

        try {

            await auction.methods.setFreelancer("Name", "Surname", 100, 100, "Service").send({ from: nonowner });

            assert(false);

        } catch (err) {

            assert(err);

        }

    });

    it('only owner can set assets', async () => {

        nonowner = accounts[1];

        try {

            await auction.methods.setAssets(100, 100, "Service").send({ from: nonowner });

            assert(false);

        } catch (err) {

            assert(err);

        }

    });

    it('set freelancer', async () => {

        await freelancer.methods.setFreelancer("Name", "Surname", 100, 100, "Service").send({ from: owner });

    });

    it('only owner can get freelancer', async () => {

        nonowner = accounts[1];

        try {

            await auction.methods.myAccount().send({ from: nonowner });

            assert(false);

        } catch (err) {

            assert(err);

        }

    });

    it('get freelancer', async () => {

        gotFreelancer = await freelancer.methods.myAccount().send({ from: owner });

        console.log(gotFreelancer);

    });

    it('set assets', async () => {

        await freelancer.methods.setAssets(100, 100, "Service").send({ from: owner });

    });

});