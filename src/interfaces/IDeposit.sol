// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { ResourceTypes } from "../Enums.sol";

// @dev A rare resource deposit needed for producing commodities. Can be harvested by automatons with a WORK body part.
//      Each harvest operation triggers a cooldown period, which becomes longer and longer over time.
interface IDeposit {
    // @dev Gets the position of the deposit in the room.
    // @param depositId The id of the deposit.
    // @return The position of the deposit in the room.
    function getPosition(bytes32 depositId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the deposit.
    // @param depositId The id of the deposit.
    // @return The room id of the deposit.
    function getRoom(bytes32 depositId) external view returns (bytes32);

    // @dev Gets the amount of game ticks until the next harvest action is possible.
    // @param depositId The id of the deposit.
    // @return The amount of game ticks until the next harvest action is possible.
    function getCooldownTime(bytes32 depositId) external view returns (uint256);

    // @dev Gets the deposit type.
    // @param depositId The id of the deposit.
    // @return The deposit resource type.
    function getDepositType(bytes32 depositId) external view returns (ResourceTypes);

    // @dev Gets the cooldown of the last harvest operation on this deposit.
    // @param depositId The id of the deposit.
    // @return The cooldown of the last harvest operation on this deposit.
    function getLastCooldown(bytes32 depositId) external view returns (uint256);

    // @dev Gets the amount of game ticks when this deposit will disappear.
    // @param depositId The id of the deposit.
    // @return The amount of game ticks when this deposit will disappear.
    function getDecayTime(bytes32 depositId) external view returns (uint256);
}