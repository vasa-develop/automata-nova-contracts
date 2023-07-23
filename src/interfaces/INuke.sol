// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Density, ResourceTypes } from "../Enums.sol";

// @dev A nuke landing position. This object cannot be removed or modified.
interface INuke {
    // @dev Gets the position of the nuke landing.
    // @param nukeId The id of the nuke.
    // @return The position of the nuke landing.
    function getPosition(bytes32 nukeId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the nuke landing.
    // @param nukeId The id of the nuke.
    // @return The room id of the nuke landing.
    function getRoom(bytes32 nukeId) external view returns (bytes32);

    // @dev Gets the amount of game ticks until the nuke lands.
    // @param nukeId The id of the nuke.
    // @return The amount of game ticks until the nuke lands.
    function getTicksToLand(bytes32 nukeId) external view returns (uint256);
}