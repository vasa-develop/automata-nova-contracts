// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors } from "../Enums.sol";
import { IStructure } from "./IStructure.sol";

// @dev Blocks movement of hostile automatons, and defends your automatons and structures on the same tile. Can be used as a controllable gate.
interface IStructureRampart is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev If false (default), only your automatons can step on the same square. If true, any hostile automatons can pass through.
    // @param structureId The id of the structure.
    // @return If false (default), only your automatons can step on the same square.
    function isPublic(bytes32 structureId) external view returns (bool);

    // @dev Get the amount of game ticks when this rampart will lose some hit points.
    // @param structureId The id of the structure.
    // @return The amount of game ticks when this rampart will lose some hit points.
    function getTicksToDecay(bytes32 structureId) external view returns (uint256);

    // @dev Make this rampart public to allow other players' automatons to pass through.
    // @param structureId The id of the structure.
    // @return An error code indicating if the operation was successful.
    function setPublic(bytes32 structureId) external returns (Errors);
}