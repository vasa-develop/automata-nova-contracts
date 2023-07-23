// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors, ResourceTypes } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";

// @dev Sends any resources to a Terminal in another room. The destination Terminal can belong to any player.
interface IStructureTerminal is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev The remaining amount of ticks while this terminal cannot be used.
    // @param structureId The id of the structure.
    // @return The remaining amount of ticks while this terminal cannot be used.
    function getCooldownTime(bytes32 structureId) external view returns (uint256);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Sends resource to a Terminal in another room with the specified name.
    // @param structureId The id of the structure.
    // @param resource The type of the resource to send.
    // @param amount The amount of resource units to send.
    // @param destination The room id of the destination room.
    // @return An error code indicating if the operation was successful.
    function send(
        bytes32 structureId,
        ResourceTypes resource,
        uint256 amount,
        bytes32 destination
    ) external returns (Errors);
}