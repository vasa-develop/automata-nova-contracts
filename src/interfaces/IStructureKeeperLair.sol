// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev Non-player structure. Spawns NPC Source Keepers that guards energy sources and minerals in some rooms. 
//      This structure cannot be destroyed.
interface IStructureExtractor is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the game ticks to spawning of the next Source Keeper.
    // @param structureId The id of the structure.
    // @return The game ticks to spawning of the next Source Keeper.
    function getTicksToSpawn(bytes32 structureId) external view returns (uint256);
}