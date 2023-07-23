// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { StructureTypes, Errors } from "../Enums.sol";

// @dev The base object of all structures.
interface IStructure {
    // @dev Gets the position of the structure in the room.
    // @param structureId The id of the structure.
    // @return The position of the structure in the room.
    function getPosition(bytes32 structureId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the structure.
    // @param structureId The id of the structure.
    // @return The room id of the structure.
    function getRoom(bytes32 structureId) external view returns (bytes32);

    // @dev Gets the current amount of hit points of the structure.
    // @param structureId The id of the structure.
    // @return The current amount of hit points of the structure.
    function getHits(bytes32 structureId) external view returns (uint256);

    // @dev Gets the maximum amount of hit points of the structure.
    // @param structureId The id of the structure.
    // @return The maximum amount of hit points of the structure.
    function getHitsMax(bytes32 structureId) external view returns (uint256);

    // @dev Gets the structure type.
    // @param structureId The id of the structure.
    // @return The structure type.
    function getStructureType(bytes32 structureId) external view returns (StructureTypes);

    // @dev Destroys the structure immediately.
    // @param structureId The id of the structure.
    // @return An error code indicating if the operation was successful.
    function destroy(bytes32 structureId) external returns (Errors);

    // @dev Check whether the structure can be used. If room controller level is insufficient, 
    //      then this method will return false, and the structure will be highlighted with red in the game.
    // @param structureId The id of the structure.
    // @return True if the structure can be used, false otherwise.
    function isActive(bytes32 structureId) external view returns (bool);

    // @dev Toggle auto notification when the structure is under attack.
    // @param structureId The id of the structure.
    // @param enabled True to enable, false to disable.
    // @return An error code indicating if the operation was successful.
    function notifyWhenAttacked(bytes32 structureId, bool enabled) external returns (Errors);
}