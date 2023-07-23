// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev A small container that can be used to store resources. This is a walkable structure.
//      All dropped resources automatically goes to the container at the same tile.
interface IStructureContainer is IStructure {
    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);
}