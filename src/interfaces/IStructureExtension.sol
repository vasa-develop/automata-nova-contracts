// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev Allows to harvest a mineral deposit.
interface IStructureExtractor is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the amount of game ticks until the next harvest action is possible.
    // @param structureId The id of the structure.
    // @return The amount of game ticks until the next harvest action is possible.
    function getCooldownTime(bytes32 structureId) external view returns (uint256);
}