// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";

// @dev Remotely attacks or heals automatons, or repairs structures. Can be targeted to any object in the room. However,
//      its effectiveness linearly depends on the distance. Each action consumes energy.
interface IStructureTower is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Remotely attack any automaton, power automaton or structure in the room.
    // @param structureId The id of the structure.
    // @param targetId The id of the target.
    // @return An error code indicating if the operation was successful.
    function attack(bytes32 structureId, bytes32 targetId) external returns (Errors);

    // @dev Remotely heal any automaton or power automaton in the room.
    // @param structureId The id of the structure.
    // @param targetId The id of the target.
    // @return An error code indicating if the operation was successful.
    function heal(bytes32 structureId, bytes32 targetId) external returns (Errors);

    // @dev Remotely repair any structure in the room.
    // @param structureId The id of the structure.
    // @param targetId The id of the target.
    // @return An error code indicating if the operation was successful.
    function repair(bytes32 structureId, bytes32 targetId) external returns (Errors);
}