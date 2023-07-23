// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IStructure } from "./IStructure.sol";
import { Errors } from "../Enums.sol";

// @dev Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.
interface IStructureController is IStructure {
    // @dev The reservation of the controller.
    // @param owner The owner of the reservation.
    // @param endTime The time when the reservation ends.
    struct Reservation {
        address owner;
        uint256 endTime;
    }

    // @dev Gets the player address of the controller.
    // @param structureId The id of the structure.
    // @return The player address of the controller.
    function getOwner(bytes32 structureId) external view returns (address);

    // @dev Checks whether using power is enabled in the room.
    // @param structureId The id of the structure.
    // @return True if using power is enabled in the room, false otherwise.
    function isPowerEnabled(bytes32 structureId) external view returns (bool);

    // @dev Gets the current controller level.
    // @param structureId The id of the structure.
    // @return The current controller level.
    function getLevel(bytes32 structureId) external view returns (uint256);

    // @dev Gets the current progress of the controller level.
    // @param structureId The id of the structure.
    // @return The current progress of the controller level.
    function getProgress(bytes32 structureId) external view returns (uint256);

    // @dev Gets the total progress of the controller level.
    // @param structureId The id of the structure.
    // @return The total progress of the controller level.
    function getProgressTotal(bytes32 structureId) external view returns (uint256);

    // @dev Gets the controller reservation info if present.
    // @param structureId The id of the structure.
    // @return The controller reservation info if present.
    function getReservation(bytes32 structureId) external view returns (Reservation memory);

    // @dev Gets the amount of game ticks until the safe mode will end.
    // @param structureId The id of the structure.
    // @return The amount of game ticks until the safe mode will end.
    function getSafeModeTicksToEnd(bytes32 structureId) external view returns (uint256);

    // @dev Gets the safe mode activations available to use.
    // @param structureId The id of the structure.
    // @return The safe mode activations available to use.
    function getSafeModeAvailable(bytes32 structureId) external view returns (uint256);

    // @dev Gets the amount of game ticks until safe mode cooldown ends.
    // @param structureId The id of the structure.
    // @return The amount of game ticks until safe mode cooldown ends.
    function getSafeModeCooldownTicks(bytes32 structureId) external view returns (uint256);

    // @dev Gets the amount of game ticks when this controller will lose one level.
    // @param structureId The id of the structure.
    // @return The amount of game ticks when this controller will lose one level.
    function getDowngradeTime(bytes32 structureId) external view returns (uint256);

    // @dev Gets the amount of game ticks while this controller cannot be upgraded due to attack. 
    //      Safe mode is also unavailable during this period.
    // @param structureId The id of the structure.
    // @return The amount of game ticks while this controller cannot be upgraded due to attack.
    function getUpgradeBlockedUntil(bytes32 structureId) external view returns (uint256);

    // @dev Activate safe mode if available.
    // @param structureId The id of the structure.
    // @return An error code indicating if the operation was successful.
    function activateSafeMode(bytes32 structureId) external returns (Errors);

    // @dev Make your claimed controller neutral again.
    // @param structureId The id of the structure.
    // @return An error code indicating if the operation was successful.
    function unclaim(bytes32 structureId) external returns (Errors);
}