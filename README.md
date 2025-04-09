## Unichain Cronjobs

## Foundry Documentation

https://book.getfoundry.sh/

## Usage

### Installing Foundry

https://book.getfoundry.sh/getting-started/installation#using-foundryup

### Build

```shell
$ forge build
```

### Create a Cronjob On Unichain Sepolia

To create a Cronjob, first you need to setup your .env:

```shell
cp env.sample .env
// replace L2_RPC_URL with your preferred url (or keep it localhost if you're testing locally with anvil)
source .env
```

Then deploy the CronInbox.sol (which stores all the Cronjobs) using:

```shell
// this will ask you for your private key (make sure it's funded!)
// also note, you can remove the --chain CLI arg if you're deploying to anvil for testing
$ forge script --chain 14412437 script/CronInbox.s.sol:CronInboxScript --rpc-url $L2_RPC_URL --broadcast -vvvv --interactives 1
```

Then deploy Increment.sol, which has the `increment()` and `check()` functions your Cronjob will call

```shell
$ forge script --chain 14412437 script/Increment.s.sol:IncrementScript --rpc-url $L2_RPC_URL --broadcast -vvvv --interactives 1
```

Finally, create your Cronjob using the following script:

```shell
$ forge script --chain 14412437 script/CreateCronJob.s.sol:CreateCronJobScript --rpc-url $L2_RPC_URL --broadcast -vvvv --interactives 1
```

That will call the `CronInbox.schedule(Cronjob memory cronjob)` function which will emit a `CronjobAdded` event with all of the Cronjob info

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
