// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ResourceTypes } from "../Enums.sol";

// @dev An object that can contain resources in its cargo.
interface IStore {
    // Gets the capacity of this store for the specified resource.
    // @param resource The type of the resource.
    // @return The capacity of this store for the specified resource.
    function getCapacity(ResourceTypes resource) external view returns (uint256);

    // Gets the free capacity for the store.
    // @param resource The type of the resource.
    // @return The free capacity for the store.
    function getFreeCapacity(ResourceTypes resource) external view returns (uint256);

    // @dev Gets the used capacity for the store.
    // @param resource The type of the resource.
    // @return The used capacity for the store.
    function getUsedCapacity(ResourceTypes resource) external view returns (uint256);
}