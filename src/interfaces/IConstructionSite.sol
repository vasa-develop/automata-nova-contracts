// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Errors, StructureTypes } from "../Enums.sol";

// @dev A site of a structure which is currently under construction.
interface IConstructionSite {
    // @dev Gets the position of the construction site in the room.
    // @param constructionSiteId The id of the construction site.
    // @return The position of the construction site in the room.
    function getPosition(bytes32 constructionSiteId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the construction site.
    // @param constructionSiteId The id of the construction site.
    // @return The room id of the construction site.
    function getRoom(bytes32 constructionSiteId) external view returns (bytes32);

    // @dev Gets the player address of the construction site.
    // @param constructionSiteId The id of the construction site.
    // @return The player address of the construction site.
    function getPlayer(bytes32 constructionSiteId) external view returns (address);

    // @dev Checks if the player address owns the construction site.
    // @param constructionSiteId The id of the construction site.
    // @param playerAddress The player address.
    // @return True if the player address owns the construction site, false otherwise.
    function isPlayerOwner(bytes32 constructionSiteId, address playerAddress) external view returns (bool);

    // @dev Gets the progress of the construction site.
    // @param constructionSiteId The id of the construction site.
    // @return progress The current progress of the construction site.
    // @return total The total progress of the construction site.
    function getProgress(bytes32 constructionSiteId) external view returns (uint256 progress, uint256 total);

    // @dev Gets the structure type of the construction site.
    // @param constructionSiteId The id of the construction site.
    // @return The structure type of the construction site.
    function getStructureType(bytes32 constructionSiteId) external view returns (StructureTypes);

    // @dev Gets the remaining time to build the construction site.
    // @param constructionSiteId The id of the construction site.
    // @return The remaining time to build the construction site.
    function getRemainingTime(bytes32 constructionSiteId) external view returns (uint256);

    // @dev Gets the amount of game ticks until the construction site will be completed.
    // @param constructionSiteId The id of the construction site.
    // @return The amount of game ticks until the construction site will be completed.
    function getTicksToComplete(bytes32 constructionSiteId) external view returns (uint256);

    // @dev Removes the construction site from the game.
    // @param constructionSiteId The id of the construction site.
    // @return An error code indicating if the operation was successful.
    function remove(bytes32 constructionSiteId) external returns (Errors);
}