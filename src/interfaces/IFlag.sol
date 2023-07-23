// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Colors, Errors } from "../Enums.sol";

// @dev Flags can be used to mark particular spots in a room. Flags are visible to their owners only. You cannot have more than 10,000 flags.
interface IFlag {
    // @dev Gets the position of the flag in the room.
    // @param flagId The id of the flag.
    // @return The position of the flag in the room.
    function getPosition(bytes32 flagId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the flag.
    // @param flagId The id of the flag.
    // @return The room id of the flag.
    function getRoom(bytes32 flagId) external view returns (bytes32);

    // @dev Gets the player address of the flag.
    // @param flagId The id of the flag.
    // @return The player address of the flag.
    function getPlayer(bytes32 flagId) external view returns (address);

    // @dev Checks if the player address owns the flag.
    // @param flagId The id of the flag.
    // @param playerAddress The player address.
    // @return True if the player address owns the flag, false otherwise.
    function isPlayerOwner(bytes32 flagId, address playerAddress) external view returns (bool);

    // @dev Gets the color of the flag.
    // @param flagId The id of the flag.
    // @return The color of the flag.
    function getColor(bytes32 flagId) external view returns (Colors);

    // @dev Gets the secondary color of the flag.
    // @param flagId The id of the flag.
    // @return The secondary color of the flag.
    function getSecondaryColor(bytes32 flagId) external view returns (Colors);

    // @dev Removes the flag from the game.
    // @param flagId The id of the flag.
    // @return An error code indicating if the operation was successful.
    function remove(bytes32 flagId) external returns (Errors);

    // @dev Sets the color of the flag.
    // @param flagId The id of the flag.
    // @param color The color of the flag.
    // @return An error code indicating if the operation was successful.
    function setColor(bytes32 flagId, Colors color) external returns (Errors);

    // @dev Sets the secondary color of the flag.
    // @param flagId The id of the flag.
    // @param color The secondary color of the flag.
    // @return An error code indicating if the operation was successful.
    function setSecondaryColor(bytes32 flagId, Colors color) external returns (Errors);

    // @dev Sets the position of the flag.
    // @param flagId The id of the flag.
    // @param position The position of the flag.
    // @return An error code indicating if the operation was successful.
    function setPosition(bytes32 flagId, RoomPosition memory position) external returns (Errors);
}