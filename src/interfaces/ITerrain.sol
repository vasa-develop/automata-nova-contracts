// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { TerrainTypes } from "../Enums.sol";
import { RoomPosition } from "../Structs.sol";

// @dev An object which provides fast access to room terrain data. 
//      These objects can be constructed for any room in the world even if you have no access to it.
interface ITerrain {
    //  @dev Gets the terrain type at the specified room position.
    //  @param roomPosition The room position.
    //  @return The terrain type at the specified room position.
    function getTerrain(RoomPosition memory roomPosition) external view returns (TerrainTypes);

    // @dev Get copy of underlying static terrain buffer.
    // @return Copy of underlying static terrain buffer.
    function getTerrainBuffer() external view returns (uint256[2500] memory); 
}