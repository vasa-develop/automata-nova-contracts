// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev Decreases movement cost to 1. Using roads allows creating automatons with less MOVE body parts. 
//      You can also build roads on top of natural terrain walls which are otherwise impassable.
interface IStructureRoad is IStructure {
    // @dev Gets the amount of game ticks when this road will lose some hit points.
    // @param structureId The id of the structure.
    // @return The amount of game ticks when this road will lose some hit points.
    function getTicksToDecay(bytes32 structureId) external view returns (uint256);
}