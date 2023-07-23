// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";

// @dev A destroyed structure. This is a walkable object.
interface IRuin {
    // @dev Gets the position of the ruin.
    // @param ruinId The id of the ruin.
    // @return The position of the ruin.
    function getPosition(bytes32 ruinId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the ruin.
    // @param ruinId The id of the ruin.
    // @return The room id of the ruin.
    function getRoom(bytes32 ruinId) external view returns (bytes32);

    // @dev Gets the time when the structure has been destroyed.
    // @param ruinId The id of the ruin.
    // @return The time when the structure has been destroyed.
    function getDestroyTime(bytes32 ruinId) external view returns (uint256);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Gets the id of the destroyed structure.
    // @param ruinId The id of the ruin.
    // @return The id of the destroyed structure.
    function getStructureId(bytes32 ruinId) external view returns (bytes32);

    // @dev Gets the amount of game ticks before this ruin decays.
    // @param ruinId The id of the ruin.
    // @return The amount of game ticks before this ruin decays.
    function getTicksToDecay(bytes32 ruinId) external view returns (uint256);
}