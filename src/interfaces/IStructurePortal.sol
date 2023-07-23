// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { IStructure } from "./IStructure.sol";

// @dev A non-player structure. Instantly teleports your creeps to a distant room acting as a room exit tile. 
//      Portals appear randomly in the central room of each sector.
interface IStructurePortal is IStructure {
    // @dev Gets portal destination room position.
    // @param structureId The id of the structure.
    // @return Portal destination room position.
    function getDestination(bytes32 structureId) external view returns (RoomPosition memory);

    // @dev Gets the amount of game ticks when the portal disappears.
    // @param structureId The id of the structure.
    // @return The amount of game ticks when the portal disappears.
    function getDecayTime(bytes32 structureId) external view returns (uint256);
}