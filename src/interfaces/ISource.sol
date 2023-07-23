// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";

// @dev An energy source object. Can be harvested by creeps with a WORK body part.
interface ISource {
    // @dev Gets the position of the source in the room.
    // @param sourceId The id of the source.
    // @return The position of the source in the room.
    function getPosition(bytes32 sourceId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the source.
    // @param sourceId The id of the source.
    // @return The room id of the source.
    function getRoom(bytes32 sourceId) external view returns (bytes32);

    // @dev Gets the remaining amount of energy.
    // @param sourceId The id of the source.
    // @return The remaining amount of energy.
    function getEnergy(bytes32 sourceId) external view returns (uint256);

    // @dev Gets the total amount of energy in the source.
    // @param sourceId The id of the source.
    // @return The total amount of energy in the source.
    function getEnergyCapacity(bytes32 sourceId) external view returns (uint256);

    // @dev Gets the remaining time after which the source will be refilled.
    // @param sourceId The id of the source.
    // @return The remaining time after which the source will be refilled.
    function getTicksToRegeneration(bytes32 sourceId) external view returns (uint256);
}