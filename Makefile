# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update:; forge update

# Build & test
build  :; forge build --sizes --via-ir
test   :; forge test -vvv
test-sd-rewards :; forge test -vvv --match-contract EmissionTestMetisMetis

# scripts
deploy-metis-transfer-strategy :;  forge script scripts/RewardsConfigHelpers.s.sol:MetisDeployTransferStrategy --rpc-url metis --broadcast --legacy --private-key ${PRIVATE_KEY} --sender ${SENDER} --verify -vvvv
