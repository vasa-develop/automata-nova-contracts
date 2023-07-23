// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// @dev Struct representing the specified position in the room.
// @param x The X position in the room.
// @param y The Y position in the room.
// @param roomId The room id.
struct RoomPosition {
    uint8 x;
    uint8 y;
    bytes32 roomId;
}