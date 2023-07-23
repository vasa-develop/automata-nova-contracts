// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Errors, PowerClass, PowerTypes, Directions } from "../Enums.sol";

// @dev Power automatons are immortal "heroes" that are tied to your account and can be respawned in any PowerSpawn after death. 
//      You can upgrade their abilities ("powers") up to your account Global Power Level.
interface IPowerAutomaton {
    struct Powers {
        uint32 level;       //  Current level of the power.
        uint32 cooldown;    //  Cooldown ticks remaining.
    }

    // @dev Gets the position of the power automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The position of the power automaton.
    function getPosition(bytes32 powerAutomatonId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the power automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The room id of the power automaton.
    function getRoom(bytes32 powerAutomatonId) external view returns (bytes32);

    // @dev Gets the power class of the power automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The power class of the power automaton.
    function getPowerClass(bytes32 powerAutomatonId) external view returns (PowerClass);

    // @dev Gets a timestamp when this automaton is marked to be permanently deleted from the account.
    // @param powerAutomatonId The id of the power automaton.
    // @return A timestamp when this automaton is marked to be permanently deleted from the account.
    function getDeleteTime(bytes32 powerAutomatonId) external view returns (uint256);

    // @dev Gets The current amount of hit points of the automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The current amount of hit points of the automaton.
    function getHits(bytes32 powerAutomatonId) external view returns (uint32);

    // @dev Gets The maximum amount of hit points of the automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The maximum amount of hit points of the automaton.
    function getMaxHits(bytes32 powerAutomatonId) external view returns (uint32);

    // @dev Gets the power automaton's level.
    // @param powerAutomatonId The id of the power automaton.
    // @return The power automaton's level.
    function getLevel(bytes32 powerAutomatonId) external view returns (uint32);

    // @dev Gets the player address of the power automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The player address of the power automaton.
    function getPlayer(bytes32 powerAutomatonId) external view returns (address);

    // @dev Checks if the player address owns the power automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @param playerAddress The player address.
    // @return True if the player address owns the power automaton, false otherwise.
    function isPlayerOwner(bytes32 powerAutomatonId, address playerAddress) external view returns (bool);

    // @dev Gets the store id that contains cargo of the power automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @return The store id that contains cargo of the power automaton.
    function getStoreId(bytes32 powerAutomatonId) external view returns (bytes32);

    // @dev Get available powers, an object with power ID as a key, and Power struct as a value.
    // @param powerAutomatonId The id of the power automaton.
    // @return Available powers, an object with power ID as a key, and Power struct as a value.
    function getPowers(bytes32 powerAutomatonId) external view returns (Powers[] memory);

    // @dev Gets the text message that the automaton was saying at the last tick.
    // @param powerAutomatonId The id of the power automaton.
    // @return The text message that the automaton was saying at the last tick.
    function getSpeech(bytes32 powerAutomatonId) external view returns (string memory);

    // @dev Gets the id of the shard where the power automaton is spawned.
    // @param powerAutomatonId The id of the power automaton.
    // @return The id of the shard where the power automaton is spawned.
    function getSpawnShardId(bytes32 powerAutomatonId) external view returns (bytes32);

    // @dev Gets the timestamp when spawning or deleting this automaton will become available.
    // @param powerAutomatonId The id of the power automaton.
    // @return The timestamp when spawning or deleting this automaton will become available.
    function getCooldownTime(bytes32 powerAutomatonId) external view returns (uint256);

    // @dev Gets the remaining amount of game ticks after which the automaton will die and become unspawned.
    // @param powerAutomatonId The id of the power automaton.
    // @return The remaining amount of game ticks after which the automaton will die and become unspawned.
    function getTicksToLive(bytes32 powerAutomatonId) external view returns (uint32);

    // @dev Creates new Power automaton.
    // @param powerClass The power class of the automaton.
    // @param shardId The id of the shard where the automaton will be spawned.
    // @return The id of the created automaton.
    // @return An error code indicating if the operation was successful.
    function create(PowerClass powerClass, bytes32 shardId) external returns (bytes32, Errors);

    // @dev Cancel the order given during the current game tick.
    // @param powerAutomatonId The id of the power automaton.
    // @param methodName The name of a automaton's method to be cancelled.
    // @return An error code indicating if the operation was successful.
    function cancelOrder(bytes32 powerAutomatonId, string memory methodName) external returns (Errors);

    // @dev Delete the power automaton permanently from your account. It should NOT be spawned in the world.
    //      The automaton is not deleted immediately, but a 24-hours delete timer is started instead.
    //      You can cancel deletion by calling delete() again before the timer is over.
    // @param powerAutomatonId The id of the power automaton.
    // @param cancel Set this to true to cancel previously scheduled deletion.
    // @return An error code indicating if the operation was successful.
    function destroy(bytes32 powerAutomatonId, bool cancel) external returns (Errors);

    // @dev Drop this resource on the ground.
    // @param powerAutomatonId The id of the power automaton.
    // @param resourceType One of the RESOURCE_* constants.
    // @param amount The amount of resource units to be dropped.
    // @return An error code indicating if the operation was successful.
    function drop(bytes32 powerAutomatonId, string memory resourceType, uint32 amount) external returns (Errors);

    // @dev Enable powers usage in this room. The room controller should be at adjacent tile.
    // @param powerAutomatonId The id of the power automaton.
    // @param controllerId The id of the target controller.
    // @return An error code indicating if the operation was successful.
    function enableRoom(bytes32 powerAutomatonId, bytes32 controllerId) external returns (Errors);

    // @dev Move the automaton one square in the specified direction.
    // @param powerAutomatonId The id of the power automaton.
    // @param direction One of the directions.
    // @return An error code indicating if the operation was successful.
    function move(bytes32 powerAutomatonId, Directions direction) external returns (Errors);

    // @dev Move the automaton using the specified predefined path.
    // @param powerAutomatonId The id of the power automaton.
    // @param path The path array returned from Room#findPath.
    // @return An error code indicating if the operation was successful.
    function moveByPath(bytes32 powerAutomatonId, RoomPosition[] memory path) external returns (Errors);

    // @dev Find the optimal path to the target within the same room and move to it.
    // @param powerAutomatonId The id of the power automaton.
    // @param target The target object to move to.
    // @param options An object containing additional options:
    //                reusePath - If reusePath is true, the given path will be reused on the next tick if possible.
    //                serializeMemory - If serializeMemory is true, the result path will be serialized using Room.serializePath.
    // @return An error code indicating if the operation was successful.
    function moveTo(bytes32 powerAutomatonId, RoomPosition memory target, string[] memory options) external returns (Errors);

    // @dev Toggle auto notification when the automaton is under attack. The notification will be sent to your account email. Turned on by default.
    // @param powerAutomatonId The id of the power automaton.
    // @param enabled True to enable, false to disable.
    // @return An error code indicating if the operation was successful.
    function notifyWhenAttacked(bytes32 powerAutomatonId, bool enabled) external returns (Errors);

    // @dev Pick up an item (a dropped piece of energy). The target has to be at adjacent square to the automaton or at the same square.
    // @param powerAutomatonId The id of the power automaton.
    // @param targetId The id of the target object.
    // @return An error code indicating if the operation was successful.
    function pickup(bytes32 powerAutomatonId, bytes32 targetId) external returns (Errors);

    // @dev Instantly restore time to live to the maximum using a Power Spawn or a Power Bank nearby. It has to be at adjacent tile.
    // @param powerAutomatonId The id of the power automaton.
    // @param targetId The id of the target object.
    // @return An error code indicating if the operation was successful.
    function renew(bytes32 powerAutomatonId, bytes32 targetId) external returns (Errors);

    // @dev Display a visual speech balloon above the automaton with the specified message. The message will be available for one tick.
    //      You can read the last message using the saying property. Any valid Unicode characters are allowed, including emoji.
    // @param powerAutomatonId The id of the power automaton.
    // @param message The message to be displayed.
    // @param isPublic Set to true to allow other players to see this message.
    // @return An error code indicating if the operation was successful.
    function say(bytes32 powerAutomatonId, string memory message, bool isPublic) external returns (Errors);

    // @dev Spawn this power automaton in the specified Power Spawn.
    // @param powerAutomatonId The id of the power automaton.
    // @param targetId The id of the target object.
    // @return An error code indicating if the operation was successful.
    function spawn(bytes32 powerAutomatonId, bytes32 targetId) external returns (Errors);

    // @dev Kill the power automaton immediately. It will not be destroyed permanently, but will become unspawned, so that you can spawn it again.
    // @param powerAutomatonId The id of the power automaton.
    // @return An error code indicating if the operation was successful.
    function suicideSelf(bytes32 powerAutomatonId) external returns (Errors);

    // @dev Transfer resource from the automaton to another object. The target has to be at adjacent square to the automaton.
    // @param powerAutomatonId The id of the power automaton.
    // @param targetId The id of the target object.
    // @param resourceType One of the RESOURCE_* constants.
    // @param amount The amount of resource units to be transferred.
    // @return An error code indicating if the operation was successful.
    function transfer(bytes32 powerAutomatonId, bytes32 targetId, string memory resourceType, uint32 amount) external returns (Errors);

    // @dev Upgrade the power of the automaton, adding a new power ability to it or increasing the level of the existing power.
    // @param powerAutomatonId The id of the power automaton.
    // @param power The power to upgrade.
    // @return An error code indicating if the operation was successful.
    function upgradePower(bytes32 powerAutomatonId, PowerTypes power) external returns (Errors);

    // @dev Apply one the automaton's powers on the specified target. You can only use powers in rooms either without a controller,
    //      or with a power-enabled controller. Only one power can be used during the same tick, each usePower call will override the previous one. 
    //      If the target has the same effect of a lower or equal level, it is overridden. If the existing effect level is higher, an error is returned.
    // @param powerAutomatonId The id of the power automaton.
    // @param power The power to apply.
    // @param targetId The id of the target object.
    // @return An error code indicating if the operation was successful.
    function usePower(bytes32 powerAutomatonId, PowerTypes power, bytes32 targetId) external returns (Errors);

    // @dev Withdraw resources from a structure or tombstone. The target has to be at adjacent square to the automaton. 
    //      Multiple automatons can withdraw from the same object in the same tick. Your automatons can withdraw resources
    //      from hostile structures/tombstones as well, in case if there is no hostile rampart on top of it.
    // @param powerAutomatonId The id of the power automaton.
    // @param targetId The id of the target object.
    // @param resourceType One of the RESOURCE_* constants.
    // @param amount The amount of resource units to be transferred.
    // @return An error code indicating if the operation was successful.
    function withdraw(bytes32 powerAutomatonId, bytes32 targetId, string memory resourceType, uint32 amount) external returns (Errors);
}