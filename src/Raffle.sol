
// Layout of Contract:
// license
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

//SPDX-LICENSE-IDENTIFIER : MIT

pragma solidity ^0.8.19;

/**
 * @title A sample Raffle contract
 * @author  Ramprasad
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlinks VRFv2.5
 */

/** Imports */
import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";


contract Raffle {

    /** Errors */
    error Raffle__sendMoreEthToEnterRaffle();

    uint256 private immutable i_entranceFee;
    //@dev The duration of the lottery in seconds
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_players;

    /*Events */
    event RaffleEntered(address indexed player);


    constructor(uint256 entranceFee ,uint256 interval , uint256 lastTimeStamp)  {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    /** Public and External Functions */

    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH sent")

        if (msg.value < i_entranceFee) {
            revert Raffle__sendMoreEthToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);

    }

    //1. Get a random number
    //2. use that number to pick a winner
    //3. Be automacally called
    function pickWinner() external {
        //check to see if enough time has passed
       if((block.timestamp - s_lastTimeStamp) < i_interval) {
        revert ();
       }
          requestId = s_vrfCoordinator.requestRandomWords(
            VRFV2PlusClient.RandomWordsRequest({
                keyHash: s_keyHash,
                subId: s_subscriptionId,
                requestConfirmations: requestConfirmations,
                callbackGasLimit: callbackGasLimit,
                numWords: numWords,
                extraArgs: VRFV2PlusClient._argsToBytes(
                    // Set nativePayment to true to pay for VRF requests with Sepolia ETH instead of LINK
                    VRFV2PlusClient.ExtraArgsV1({nativePayment: false})
                )
            })
        );


    }

    /** Getter Functions */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }

}