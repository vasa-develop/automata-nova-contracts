// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { ResourceTypes } from "../Enums.sol";

// @dev A dropped piece of resource. It will decay after a while if not picked up. Dropped resource pile decays for ceil(amount/1000) units per tick.
interface IResource {
    // @dev Gets the position of the resource.
    // @param resourceId The id of the resource.
    // @return The position of the resource.
    function getPosition(bytes32 resourceId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the resource.
    // @param resourceId The id of the resource.
    // @return The room id of the resource.
    function getRoom(bytes32 resourceId) external view returns (bytes32);

    // @dev Gets the amount of resource units contained.
    // @param resourceId The id of the resource.
    // @return The amount of resource units contained.
    function getAmount(bytes32 resourceId) external view returns (uint256);

    // @dev Gets the resource type.
    // @param resourceId The id of the resource.
    // @return The resource type.
    function getResourceType(bytes32 resourceId) external view returns (ResourceTypes);
}