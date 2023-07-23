// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";
import { Errors, ResourceTypes } from "../Enums.sol";

// @dev Produces mineral compounds from base minerals, boosts and unboosts automatons.
interface IStructureLab is IStructure {
    // @dev Gets the player address that owns the structure.
    // @param structureId The id of the structure.
    // @return The player address that owns the structure.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Gets the game ticks the lab has to wait until the next reaction or unboost operation is possible.
    // @param structureId The id of the structure.
    // @return The game ticks the lab has to wait until the next reaction or unboost operation is possible.
    function getCooldownTime(bytes32 structureId) external view returns (uint256);

    // @dev Gets the type of minerals contained in the lab. Labs can contain only one mineral type at the same time.
    // @param structureId The id of the structure.
    // @return The type of minerals contained in the lab.
    function getMineralType(bytes32 structureId) external view returns (ResourceTypes);

    // @dev Gets the store id that contains cargo of the structure.
    // @param structureId The id of the structure.
    // @return The store id that contains cargo of the structure.
    function getStoreId(bytes32 structureId) external view returns (bytes32);

    // @dev Boosts automaton body parts using the containing mineral compound. The automaton has to be at adjacent square to the lab.
    // @param structureId The id of the structure.
    // @param automatonId The id of the automaton to boost.
    // @param bodyPart The body part to boost.
    // @return An error code indicating if the operation was successful.
    function boostAutomaton(bytes32 structureId, bytes32 automatonId, uint256 bodyPart) external returns (Errors);

    // @dev Immediately remove boosts from the automaton and drop 50% of the mineral compounds used to boost
    //      it onto the ground regardless of the automaton's remaining time to live. The automaton has to be
    //      at adjacent square to the lab. Unboosting requires cooldown time equal to the total sum of the 
    //      reactions needed to produce all the compounds applied to the automaton.
    // @param structureId The id of the structure.
    // @param automatonId The id of the automaton to unboost.
    // @return An error code indicating if the operation was successful.
    function unboostAutomaton(bytes32 structureId, bytes32 automatonId) external returns (Errors);

    // @dev Breaks mineral compounds back into reagents. The same output labs can be used by many source labs.
    // @param structureId The id of the structure.
    // @param outputLabId The id of the output lab.
    // @return An error code indicating if the operation was successful.
    function reverseReaction(bytes32 structureId, bytes32 outputLabId) external returns (Errors);
}