// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors, Directions, BodyParts } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";
import { ISpawning } from "./ISpawning.sol";

// @dev Spawn is your colony center. This structure can create, renew, and recycle automatons.
interface IStructureSpawn is IStructure, ISpawning {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Start the automaton spawning process. The required energy amount can be withdrawn from all spawns and extensions in the room.
    // @param structureId The id of the structure.
    // @param body The body of the automaton.
    // @return An error code indicating if the operation was successful.
    function spawnAutomaton(bytes32 structureId, BodyParts[] memory body) external returns (Errors);

    // @dev Kill the automaton and drop up to 100% of resources spent on its spawning and boosting depending on remaining life time.
    //      The target should be at adjacent square. Energy return is limited to 125 units per body part.
    // @param structureId The id of the structure.
    // @param targetId The id of the target automaton.
    // @return An error code indicating if the operation was successful.
    function recycleAutomaton(bytes32 structureId, bytes32 targetId) external returns (Errors);

    // @dev Increase the remaining time to live of the target automaton. The target should be at adjacent square. 
    //      The target should not have CLAIM body parts. The spawn should not be busy with the spawning process.
    // @param structureId The id of the structure.
    // @param targetId The id of the target automaton.
    // @return An error code indicating if the operation was successful.
    function renewAutomaton(bytes32 structureId, bytes32 targetId) external returns (Errors);
}