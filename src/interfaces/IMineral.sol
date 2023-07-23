// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Density, ResourceTypes } from "../Enums.sol";

// @dev A mineral deposit. Can be harvested by automatons with a WORK body part using the extractor structure.
interface IMineral {
    // @dev Gets the position of the mineral in the room.
    // @param mineralId The id of the mineral.
    // @return The position of the mineral in the room.
    function getPosition(bytes32 mineralId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the mineral.
    // @param mineralId The id of the mineral.
    // @return The room id of the mineral.
    function getRoom(bytes32 mineralId) external view returns (bytes32);

    // @dev Gets the density that this mineral deposit will be refilled to once ticksToRegeneration reaches 0.
    // @param mineralId The id of the mineral.
    // @return The density that this mineral deposit will be refilled to once ticksToRegeneration reaches 0.
    function getDensity(bytes32 mineralId) external view returns (Density);

    // @dev Gets the remaining amount of resources.
    // @param mineralId The id of the mineral.
    // @return The remaining amount of resources.
    function getMineralAmount(bytes32 mineralId) external view returns (uint256);

    // @dev Gets the resource type.
    // @param mineralId The id of the mineral.
    // @return The resource type.
    function getMineralType(bytes32 mineralId) external view returns (ResourceTypes);

    // @dev Gets the amount of game ticks until the next regeneration.
    // @param mineralId The id of the mineral.
    // @return The amount of game ticks until the next regeneration.
    function getTicksToRegeneration(bytes32 mineralId) external view returns (uint256);
}