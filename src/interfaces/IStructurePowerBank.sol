// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev Non-player structure. Contains power resource which can be obtained by destroying the structure. Hits the attacker creep back on each attack.
interface IStructurePowerBank is IStructure {
    // @dev Gets The amount of power contained in this structure.
    // @param structureId The id of the structure.
    // @return The amount of power contained in this structure.
    function getPower(bytes32 structureId) external view returns (uint256);

    // @dev Gets The amount of game ticks when this structure will disappear.
    // @param structureId The id of the structure.
    // @return The amount of game ticks when this structure will disappear.
    function getDecayTime(bytes32 structureId) external view returns (uint256);
}