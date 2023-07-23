// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";

// @dev Provides visibility into a distant room from your script.
interface IStructureObserver is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Provide visibility into a distant room from your script. The target room object will be available on the next tick.
    // @param structureId The id of the structure.
    // @param roomId The id of the target room.
    // @return An error code indicating if the operation was successful.
    function observeRoom(bytes32 structureId, bytes32 roomId) external returns (Errors);
}