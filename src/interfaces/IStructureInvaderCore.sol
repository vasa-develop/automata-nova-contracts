// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";
import { ISpawning } from "./ISpawning.sol";

// @dev This NPC structure is a control center of NPC Strongholds, and also rules all invaders in the sector.
//      It spawns NPC defenders of the stronghold, refill towers, repairs structures. While it's alive, it will
//      spawn invaders in all rooms in the same sector. It also contains some valuable resources inside, which
//      you can loot from its ruin if you destroy the structure.
interface IStructureInvaderCore is IStructure, ISpawning {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the level of the stronghold. 
    //      The amount and quality of the loot depends on the level.
    // @param structureId The id of the structure.
    // @return The level of the stronghold.
    function getLevel(bytes32 structureId) external view returns (uint256);

    // @dev Gets the amount of game ticks until the next spawn action is possible.
    // @param structureId The id of the structure.
    // @return The amount of game ticks until the next spawn action is possible.
    function getTicksToDeploy(bytes32 structureId) external view returns (uint256);
}