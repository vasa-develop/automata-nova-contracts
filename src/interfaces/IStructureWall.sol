// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";

// @dev Blocks movement of all automatons. Players can build destructible walls in controlled rooms. 
//      Some rooms also contain indestructible walls separating novice and respawn areas from the
//      rest of the world or dividing novice / respawn areas into smaller sections. Indestructible walls have no hits property.
interface IStructureWall is IStructure {}