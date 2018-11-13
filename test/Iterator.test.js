const assert = require('assert');

const ganache = require('ganache-cli');
const options = { gasLimit: 3000000 };
const Web3 = require('web3');
const server = ganache.server(options);
const provider = ganache.provider(options);

const web3 = new Web3(provider);

let json = require('./../build/contracts/Iterator.json');

let accounts;

let iterator;

let creator;

const interface = json['abi'];

const bytecode = json['bytecode'];

beforeEach(async () => {

    accounts = await web3.eth.getAccounts();

    creator = accounts[0];

    iterator = await new web3.eth.Contract(interface)

        .deploy({ data: bytecode })

        .send({ from: creator, gas: '3000000' });
});

describe("Iterator", () => {

    it('deploy a contract', async () => {
        const currentCreator = await iterator.methods.creator().call();

        assert.equal(creator, currentCreator, 'The creator is the one who launches the smart contract');
    });

    it('only creator can get sum', async () => {
        let noncreator = accounts[1];

        try {

            await iterator.methods.getSum().send({ from: noncreator })

            assert(false);

        } catch (err){

            assert(err);

        }
    });

    it('get Sum', async () => {
        await iterator.methods.getSum().send({ from: creator })
    });

});