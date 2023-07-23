// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors } from "../Enums.sol";
import { RoomPosition } from "../Structs.sol";
import { IStructure } from "./IStructure.sol";

// @dev Launches a nuke to another room dealing huge damage to the landing area. Each launch has a cooldown and requires energy and ghodium resources.
//      Launching creates a Nuke object at the target room position which is visible to any player until it is landed. 
//      Incoming nuke cannot be moved or cancelled. Nukes cannot be launched from or to novice rooms. 
//      Resources placed into a StructureNuker cannot be withdrawn.
interface IStructureNuker is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the amount of game ticks until the next launch is possible.
    // @param structureId The id of the structure.
    // @return The amount of game ticks until the next launch is possible.
    function getCooldownTime(bytes32 structureId) external view returns (uint256);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Launch a nuke to the specified position.
    // @param structureId The id of the structure.
    // @param target The target position.
    // @return An error code indicating if the operation was successful.
    function launchNuke(bytes32 structureId, RoomPosition memory target) external returns (Errors);
}