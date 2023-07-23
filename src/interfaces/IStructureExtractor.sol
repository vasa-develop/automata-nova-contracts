// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev Contains energy which can be spent on spawning bigger creeps. Extensions can be placed anywhere in the room, 
//      any spawns will be able to use them regardless of distance.
interface IStructureContainer is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);
}