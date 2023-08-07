// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from 'forge-std/Script.sol';
import {PullRewardsTransferStrategy} from 'aave-v3-periphery/contracts/rewards/transfer-strategies/PullRewardsTransferStrategy.sol';
import {AaveV3Metis} from 'aave-address-book/AaveV3Metis.sol';

contract MetisDeployTransferStrategy is Script {
  address internal constant EMISSION_ADMIN = 0x97177cD80475f8b38945c1E77e12F0c9d50Ac84D;
  address internal constant REWARDS_VAULT = EMISSION_ADMIN;

  function run() external {
    vm.startBroadcast();
    new PullRewardsTransferStrategy(
      AaveV3Metis.DEFAULT_INCENTIVES_CONTROLLER,
      EMISSION_ADMIN,
      REWARDS_VAULT
    );
    vm.stopBroadcast();
  }
}
