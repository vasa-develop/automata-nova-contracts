// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";

// @dev The address the precompile will be mapped to.
address constant PATHFINDER_ADDRESS = address(0x81);

// @dev Contains powerful methods for pathfinding in the game world. 
//      It supports custom navigation costs and paths which span multiple rooms.
interface IPathFinder {

    // @dev Struct representing the specified goal details.
    // @param pos The goal position.
    // @param range Range to pos before goal is considered reached. The default is 0.
    struct Goal {
        RoomPosition pos;
        uint8 range;
    }

    // @dev Struct representing the specified path search options.
    // @param plainCost Cost for walking on plain positions. The default is 1.
    // @param swampCost Cost for walking on swamp positions. The default is 5.
    // @param Instead of searching for a path to the goals this will search for
    //        a path away from the goals. The cheapest path that is out of range 
    //        of every goal will be returned. The default is false.
    // @param maxGas Maximum limit of gas to consume. The default value is 2000, maximum is 4000.
    // @param maxRooms Maximum number of rooms to search. The default is 16, maximum is 64.
    // @param maxCost The maximum allowed cost of the path returned. If at any point the pathfinder
    //                detects that it is impossible to find a path with a cost less than or equal to 
    //                maxCost it will immediately halt the search. The default is Infinity.
    // @param heuristicWeight Weight to apply to the heuristic in the A* formula F = G + weight * H.
    //                        Use this option only if you understand the underlying A* algorithm mechanics! 
    //                        The default value is 1.2.
    // @param serialize If true, the result path will be serialized using Room.serializePath.
    struct PathSearchOptions {
        // function (RoomPosition pos, CostMatrix costMatrix) returns uint
        uint256 plainCost;
        uint256 swampCost;
        bool flee;
        uint256 maxGas;
        uint256 maxRooms;
        uint256 maxCost;
        bool heuristicWeight;
        bool serialize;
    }

    // @dev Struct representing the result of a path search.
    // @param path An array of RoomPosition objects.
    // @param ops Total number of operations performed before this path was calculated.
    // @param cost The total cost of the path as derived from plainCost and swampCost values.
    // @param incomplete If the pathfinder fails to find a complete path, this will be true.
    //                   Note that path will still be populated with a partial path which 
    //                   represents the closest path it could find given the search parameters.
    struct PathSearchResult {
        RoomPosition[] path;
        uint256 ops;
        uint256 cost;
        bool incomplete;
    }

    // @dev Finds an optimal path between origin and goal.
    // @param origin The origin position.
    // @param goal The goal position.
    // @param opts The search options.
    // @return The result of the search.
    function search(
        RoomPosition memory origin, 
        Goal memory goal, 
        PathSearchOptions memory opts
    ) external view returns (PathSearchResult memory);
}
