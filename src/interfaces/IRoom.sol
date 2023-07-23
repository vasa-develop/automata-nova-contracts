// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Errors, Directions, EventTypes, StructureTypes } from "../Enums.sol";

// @dev An object representing the room in which your units and structures are in. It can be used to look around, find paths, etc.
interface IRoom {
    // @dev Options for findPath method.
    struct FindPathOpts {
        bool ignoreautomatons;
        bool ignoreDestructibleStructures;
        bool ignoreRoads;
        // function costCallback;
        RoomPosition[] ignore;
        RoomPosition[] avoid;
        uint256 maxOps;
        uint256 heuristicWeight;
        bool serialize;
        uint256 maxRooms;
        uint256 range;
        uint256 plainCost;
        uint256 swampCost;
    }

    // @dev Gets the id of the controller of this room.
    // @param roomId The id of the room.
    // @return The id of the controller of this room.
    function getController(bytes32 roomId) external view returns (bytes32);

    // @dev Gets the total amount of energy available in all spawns and extensions in the room.
    // @param roomId The id of the room.
    // @return The total amount of energy available in all spawns and extensions in the room.
    function getEnergyAvailable(bytes32 roomId) external view returns (uint256);

    // @dev Gets the total amount of energy capacity of all spawns and extensions in the room.
    // @param roomId The id of the room.
    // @return The total amount of energy capacity of all spawns and extensions in the room.
    function getEnergyCapacityAvailable(bytes32 roomId) external view returns (uint256);

    // @dev Gets the Storage structure id of this room.
    // @param roomId The id of the room.
    // @return The Storage structure id of this room.
    function getStorageId(bytes32 roomId) external view returns (bytes32);

    // @dev Gets the Terminal structure id of this room.
    // @param roomId The id of the room.
    // @return The Terminal structure id of this room.
    function getTerminalId(bytes32 roomId) external view returns (bytes32);

    // @dev Serialize a path array into a short string representation, which is suitable to store in memory.
    // @param roomId The id of the room.
    // @param path The path array to serialize.
    // @return The serialized path string.
    function serializePath(bytes32 roomId, RoomPosition[] memory path) external pure returns (string memory);

    // @dev Deserialize a short string path representation into an array form.
    // @param roomId The id of the room.
    // @param path The path string to deserialize.
    // @return The deserialized path array.
    function deserializePath(bytes32 roomId, string memory path) external pure returns (RoomPosition[] memory);

    // @dev Create new ConstructionSite at the specified location.
    // @param roomId The id of the room.
    // @param x The x position.
    // @param y The y position.
    // @param structureType The structure type.
    // @return The id of the created ConstructionSite.
    // @return An error code indicating if the operation was successful.
    function createConstructionSite(bytes32 roomId, uint256 x, uint256 y, StructureTypes structureType) external returns (bytes32, Errors);

    // @dev Create new Flag at the specified location.
    // @param roomId The id of the room.
    // @param x The x position.
    // @param y The y position.
    // @param name The name of the flag.
    // @param color The color of the flag.
    // @param secondaryColor The secondary color of the flag.
    // @return The id of the created Flag.
    // @return An error code indicating if the operation was successful.
    function createFlag(bytes32 roomId, uint256 x, uint256 y, string memory name, uint256 color, uint256 secondaryColor) external returns (bytes32, Errors);

    // @dev Find all objects of the specified type in the room.
    // @param roomId The id of the room.
    // @param structureType The structure type.
    // @return An array of structure ids.
    function findStructures(bytes32 roomId, StructureTypes structureType) external view returns (bytes32[] memory);

    // @dev Find the exit direction en route to another room. Please note that this method is not required for inter-room movement.
    // @param roomId The id of the room.
    // @param targetRoomId The id of the target room.
    // @return The direction to the target room.
    function findExitTo(bytes32 roomId, bytes32 targetRoomId) external view returns (Directions);

    // @dev Find an optimal path inside the room between fromPos and toPos using Jump Point Search algorithm.
    // @param roomId The id of the room.
    // @param fromPos The start position.
    // @param toPos The end position.
    // @param opts The search options.
    // @return The path array.
    function findPath(bytes32 roomId, RoomPosition memory fromPos, RoomPosition memory toPos, FindPathOpts memory opts) external view returns (RoomPosition[] memory);

    // @dev Returns an array of events happened on the previous tick in this room.
    // @param roomId The id of the room.
    // @return An array of events.
    function getEventLog(bytes32 roomId) external view returns (EventTypes[] memory);

    // @dev Creates a RoomPosition object at the specified location.
    // @param roomId The id of the room.
    // @param x The x position.
    // @param y The y position.
    // @return The RoomPosition object.
    function getPositionAt(bytes32 roomId, uint256 x, uint256 y) external view returns (RoomPosition memory);

    // @dev Get the Terrain object id for the specified room.
    // @param roomId The id of the room.
    // @return The Terrain object id.
    function getTerrain(bytes32 roomId) external view returns (bytes32);

    // @dev Gets a list of objects at the specified room position.
    // @param roomId The id of the room.
    // @param pos The position.
    // @return An array of object ids.
    function lookAt(bytes32 roomId, RoomPosition memory pos) external view returns (bytes32[] memory);

    // @dev Get the list of objects at the specified room area.
    // @param roomId The id of the room.
    // @param top The top y boundary.
    // @param left The left x boundary.
    // @param bottom The bottom y boundary.
    // @param right The right x boundary.
    // @param asArray Set to true if you want to get the result as a plain array.
    // @return An array of objects.
    function lookAtArea(bytes32 roomId, uint256 top, uint256 left, uint256 bottom, uint256 right, bool asArray) external view returns (bytes32[] memory);

    // @dev Get an object with the given type at the specified room position.
    // @param roomId The id of the room.
    // @param pos The position.
    // @param objectType The type of the object.
    // @return The object id.
    function lookForAt(bytes32 roomId, RoomPosition memory pos, string memory objectType) external view returns (bytes32);

    // @dev Get the list of objects with the given type at the specified room area.
    // @param roomId The id of the room.
    // @param top The top y boundary.
    // @param left The left x boundary.
    // @param bottom The bottom y boundary.
    // @param right The right x boundary.
    // @param objectType The type of the object.
    // @return An array of object ids.
    function lookForAtArea(bytes32 roomId, uint256 top, uint256 left, uint256 bottom, uint256 right, string memory objectType) external view returns (bytes32[] memory);
}