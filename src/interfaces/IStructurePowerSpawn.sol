// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";

// @dev Processes power into your account, and spawns power automatons with special unique powers (in development).
interface IStructurePowerSpawn is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Register power resource units into your account. Registered power allows to develop power automatons skills.
    // @param structureId The id of the structure.
    // @return An error code indicating if the operation was successful.
    function processPower(bytes32 structureId) external returns (Errors);
}