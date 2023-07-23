// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";

// @dev A remnant of dead automatons. This is a walkable object.
interface ITombstone {
    // @dev Gets the position of the tombstone.
    // @param tombstoneId The id of the tombstone.
    // @return The position of the tombstone.
    function getPosition(bytes32 tombstoneId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the tombstone.
    // @param tombstoneId The id of the tombstone.
    // @return The room id of the tombstone.
    function getRoom(bytes32 tombstoneId) external view returns (bytes32);

    // @dev Gets the the deceased automaton id or power automaton id.
    // @param tombstoneId The id of the tombstone.
    // @return The the deceased automaton id or power automaton id.
    function getAutomatonId(bytes32 tombstoneId) external view returns (bytes32);

    // @dev Get game tick of death.
    // @param tombstoneId The id of the tombstone.
    // @return Game tick of death.
    function getDeathTick(bytes32 tombstoneId) external view returns (uint256);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Gets the amount of game ticks until the tombstone decays.
    // @param tombstoneId The id of the tombstone.
    // @return The amount of game ticks until the tombstone decays.
    function getTicksToDecay(bytes32 tombstoneId) external view returns (uint256);
}