// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";

// @dev Remotely transfers energy to another Link in the same room.
interface IStructureLink is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the amount of game ticks the link has to wait until the next transfer is possible.
    // @param structureId The id of the structure.
    // @return The amount of game ticks the link has to wait until the next transfer is possible.
    function getCooldownTime(bytes32 structureId) external view returns (uint256);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Remotely transfer energy to another link at any location in the same room.
    // @param structureId The id of the structure.
    // @param targetId The id of the target link.
    // @param amount The amount of energy to transfer.
    // @return An error code indicating if the operation was successful.
    function transferEnergy(bytes32 structureId, bytes32 targetId, uint256 amount) external returns (Errors);
}