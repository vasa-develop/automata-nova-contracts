// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";
import { Errors, ResourceTypes } from "../Enums.sol";

// @dev Produces trade commodities from base minerals and other commodities.
interface IStructureFactory is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the amount of game ticks the factory has to wait until the next production is possible.
    // @param structureId The id of the structure.
    // @return The amount of game ticks the factory has to wait until the next production is possible.
    function getCooldownTime(bytes32 structureId) external view returns (uint256);

    // @dev Gets the factory's level.
    // @param structureId The id of the structure.
    // @return The factory's level.
    function getLevel(bytes32 structureId) external view returns (uint256);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Produces the specified commodity. All ingredients should be available in the factory store.
    // @param structureId The id of the structure.
    // @param commodity The commodity to produce.
    // @return An error code indicating if the operation was successful.
    function produce(bytes32 structureId, ResourceTypes commodity) external returns (Errors);
}