// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Errors, Directions } from "../Enums.sol";

// @dev Details of the automaton being spawned currently.
interface ISpawning {
    // @dev An array with the spawn directions while an automaton is spawning.
    // @param structureId The id of the structure.
    // @return An array with the spawn directions while an automaton is spawning.
    function getSpawnDirections(bytes32 structureId) external view returns (Directions[8] memory);

    // @dev Gets the id of a new automaton.
    // @param structureId The id of the structure.
    // @return The id of a new automaton.
    function getNewAutomatonId(bytes32 structureId) external view returns (bytes32);

    // @dev Gets the game ticks needed in total to complete the spawning.
    // @param structureId The id of the structure.
    // @return The game ticks needed in total to complete the spawning.
    function getTotalGameTicksForSpawing(bytes32 structureId) external view returns (uint256);

    // @dev Gets the game ticks left until the spawning is complete.
    // @param structureId The id of the structure.
    // @return The game ticks left until the spawning is complete.
    function getGameTicksLeftForSpawning(bytes32 structureId) external view returns (uint256);

    // @dev Cancel spawning immediately. Energy spent on spawning is not returned.
    // @param structureId The id of the structure.
    // @return An error code indicating if the operation was successful.
    function cancelSpawning(bytes32 structureId) external returns (Errors);

    // @dev Set desired directions where the automaton should move when spawned.
    // @param structureId The id of the structure.
    // @param directions An array with the spawn directions while an automaton is spawning.
    // @return An error code indicating if the operation was successful.
    function setSpawnDirections(bytes32 structureId, Directions[] memory directions) external returns (Errors);
}