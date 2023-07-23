// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { RoomPosition } from "../Structs.sol";
import { Errors, StructureTypes, BodyParts, Directions } from "../Enums.sol";
import { IPathFinder } from "./IPathFinder.sol";

// @dev Automatons are your units. Automatons can move, harvest energy, construct structures, attack another Automatons, and perform other actions. 
//      Each creep consists of up to 50 body parts.
interface IAutomaton {
    // @dev Gets the position of the Automaton in the room.
    // @param automatonId The id of the Automaton.
    // @return The position of the Automaton in the room.
    function getPosition(bytes32 automatonId) external view returns (RoomPosition memory);

    // @dev Gets the room id of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The room id of the Automaton.
    function getRoom(bytes32 automatonId) external view returns (bytes32);

    // @dev Gets the player address of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The player address of the Automaton.
    function getPlayer(bytes32 automatonId) external view returns (address);

    // @dev Checks if the player address owns the Automaton.
    // @param automatonId The id of the Automaton.
    // @param playerAddress The player address.
    // @return True if the player address owns the Automaton, false otherwise.
    function isPlayerOwner(bytes32 automatonId, address playerAddress) external view returns (bool);

    // @dev Gets the body parts of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The body parts of the Automaton.
    function getBodyParts(bytes32 automatonId) external view returns (BodyParts[] memory);

    // @dev Gets the fatigue of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The fatigue of the Automaton.
    function getFatigue(bytes32 automatonId) external view returns (uint256);

    // @dev Gets the hits of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The hits of the Automaton.
    function getHits(bytes32 automatonId) external view returns (uint256);

    // @dev Gets the hits limit of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The hits limit of the Automaton.
    function getHitsLimit(bytes32 automatonId) external view returns (uint256);

    // @dev Gets memory of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The memory of the Automaton.
    function getMemory(bytes32 automatonId) external view returns (bytes memory);

    // @dev Gets the message of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The message of the Automaton.
    function getMessage(bytes32 automatonId) external view returns (string memory);

    // @dev Checks if the Automaton is still spawning.
    // @param automatonId The id of the Automaton.
    // @return True if the Automaton is still spawning, false otherwise.
    function isSpawning(bytes32 automatonId) external view returns (bool);

    // @dev Gets the store id of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The store id of the Automaton.
    function getStoreId(bytes32 automatonId) external view returns (bytes32);

    // @dev Gets the remaining ticks to live of the Automaton.
    // @param automatonId The id of the Automaton.
    // @return The remaining ticks to live of the Automaton.
    function getTicksToLive(bytes32 automatonId) external view returns (uint256);

    // @dev Attacks another Automaton or Structure.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Automaton or Structure.
    // @return An error code indicating if the operation was successful.
    function attack(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Attacks Controller.
    // @param automatonId The id of the Automaton.
    // @param controllerId The id of the Controller.
    // @return An error code indicating if the operation was successful.
    function attackController(bytes32 automatonId, bytes32 controllerId) external returns (Errors);

    // @dev Build a structure at the target construction site using carried energy.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target construction site.
    // @return An error code indicating if the operation was successful.
    function build(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Cancel the order given during the current game tick.
    // @param automatonId The id of the Automaton.
    // @return An error code indicating if the operation was successful.
    function cancelOrder(bytes32 automatonId) external returns (Errors);

    // @dev Claims a neutral controller under your control.
    // @param automatonId The id of the Automaton.
    // @param controllerId The id of the Controller.
    // @return An error code indicating if the operation was successful.
    function claimController(bytes32 automatonId, bytes32 controllerId) external returns (Errors);

    // @dev Dismantles any structure at the target site.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target structure.
    // @return An error code indicating if the operation was successful.
    function dismantle(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Drops a resource from the store on the ground.
    // @param automatonId The id of the Automaton.
    // @param resourceType The type of the resource.
    // @param amount The amount of the resource.
    // @return An error code indicating if the operation was successful.
    function drop(bytes32 automatonId, uint8 resourceType, uint256 amount) external returns (Errors);

    // @dev Add one more available safe mode activation to a room controller. 
    //      The automaton has to be at adjacent square to the target room controller and have 1000 ghodium resource.
    // @param automatonId The id of the Automaton.
    // @param controllerId The id of the Controller.
    // @return An error code indicating if the operation was successful.
    function generateSafeMode(bytes32 automatonId, bytes32 controllerId) external returns (Errors);

    // @dev Get the quantity of live body parts of the given type. Fully damaged parts do not count.
    // @param automatonId The id of the Automaton.
    // @param bodyPart The type of the body part.
    // @return The quantity of live body parts of the given type.
    function getActiveBodyParts(bytes32 automatonId, BodyParts bodyPart) external view returns (uint256);

    // @dev Harvest energy from the source or resources from minerals and deposits using carried work body parts.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target source, mineral, or deposit.
    // @return An error code indicating if the operation was successful.
    function harvest(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Heal self or another Automaton using carried heal body parts.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Automaton.
    // @return An error code indicating if the operation was successful.
    function heal(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Move the Automaton one square in the specified direction.
    // @param automatonId The id of the Automaton.
    // @param direction The direction to move in.
    // @return An error code indicating if the operation was successful.
    function move(bytes32 automatonId, Directions direction) external returns (Errors);

    // @dev Move the creep using the specified predefined path.
    // @param automatonId The id of the Automaton.
    // @param path The path to follow.
    // @return An error code indicating if the operation was successful.
    function moveByPath(bytes32 automatonId, RoomPosition[] memory path) external returns (Errors);

    // @dev Find the optimal path to the target within the same room and move to it.
    // @param automatonId The id of the Automaton.
    // @param target The target position.
    // @param options The path search options.
    // @return An error code indicating if the operation was successful.
    function moveTo(bytes32 automatonId, RoomPosition memory target, IPathFinder.PathSearchOptions memory options) external returns (Errors);

    // @dev Toggle auto notification when the Automaton is under attack.
    // @param automatonId The id of the Automaton.
    // @param enabled True to enable, false to disable.
    // @return An error code indicating if the operation was successful.
    function notifyWhenAttacked(bytes32 automatonId, bool enabled) external returns (Errors);

    // @dev Pick up an item (a dropped piece of energy).
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target item.
    // @return An error code indicating if the operation was successful.
    function pickup(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Help another creep to follow this creep. The fatigue generated for the target's 
    //      move will be added to the creep instead of the target.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Automaton.
    // @return An error code indicating if the operation was successful.
    function pull(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev A ranged attack against another Automaton or Structure.
    //      The target has to be within 3 squares range of the Automaton.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Automaton or Structure.
    // @return An error code indicating if the operation was successful.
    function rangedAttack(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Heal another Automaton at a distance using carried heal body parts.
    //      The target has to be within 3 squares range of the Automaton.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Automaton.
    // @return An error code indicating if the operation was successful.
    function rangedHeal(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev A ranged attack against all hostile automatons or structures within 3 squares range.
    // @param automatonId The id of the Automaton.
    // @return An error code indicating if the operation was successful.
    function rangedMassAttack(bytes32 automatonId) external returns (Errors);

    // @dev Repair a damaged structure using carried energy.
    //      The target has to be within 3 squares range of the Automaton.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target structure.
    // @return An error code indicating if the operation was successful.
    function repair(bytes32 automatonId, bytes32 targetId) external returns (Errors);

    // @dev Temporarily block a neutral controller from claiming by other players.
    //      Each tick, this command increases the counter of the period during which the controller is unavailable by 1 tick per each CLAIM body part.
    //      The maximum reservation period to maintain is 5,000 ticks.
    //      The target has to be at adjacent square to the Automaton.
    // @param automatonId The id of the Automaton.
    // @param controllerId The id of the Controller.
    // @return An error code indicating if the operation was successful.
    function reserveController(bytes32 automatonId, bytes32 controllerId) external returns (Errors);

    // @dev Display a visual speech balloon above the Automaton with the specified message.
    // @param automatonId The id of the Automaton.
    // @param message The message to display.
    // @param isPublic True to display the message to all players, false to display the message to your own account.
    // @return An error code indicating if the operation was successful.
    function say(bytes32 automatonId, string memory message, bool isPublic) external returns (Errors);

    // @dev Sign a Controller with an arbitrary text visible to all players.
    //      This text will appear in the room UI, in the world map, and can be accessed via the API.
    //      You can sign unowned and hostile Controllers. The target has to be at adjacent square to the Automaton.
    // @param automatonId The id of the Automaton.
    // @param controllerId The id of the Controller.
    // @param message The message to display.
    // @return An error code indicating if the operation was successful.
    function signController(bytes32 automatonId, bytes32 controllerId, string memory message) external returns (Errors);

    // @dev Kill the Automaton immediately.
    // @param automatonId The id of the Automaton.
    // @return An error code indicating if the operation was successful.
    function suicideSelf(bytes32 automatonId) external returns (Errors);

    // @dev Transfer resources from the store to another Automaton or Structure.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Automaton or Structure.
    // @param resourceType The type of the resource.
    // @param amount The amount of the resource.
    // @return An error code indicating if the operation was successful.
    function transfer(bytes32 automatonId, bytes32 targetId, uint8 resourceType, uint256 amount) external returns (Errors);

    // @dev Upgrade the Controller to the next available level using carried energy.
    //      Upgrading controllers raises your Global Control Level in parallel.
    //      The target has to be at adjacent square to the Automaton.
    // @param automatonId The id of the Automaton.
    // @param controllerId The id of the Controller.
    // @return An error code indicating if the operation was successful.
    function upgradeController(bytes32 automatonId, bytes32 controllerId) external returns (Errors);

    // @dev Withdraw resources from a Structure.
    // @param automatonId The id of the Automaton.
    // @param targetId The id of the target Structure.
    // @param resourceType The type of the resource.
    // @param amount The amount of the resource.
    // @return An error code indicating if the operation was successful.
    function withdraw(bytes32 automatonId, bytes32 targetId, uint8 resourceType, uint256 amount) external returns (Errors);
}