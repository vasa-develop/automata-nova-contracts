// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The address the precompile will be mapped to.
address constant GAME_ADDRESS = address(0x80);

interface IGame {
    // @dev Returns the game version.
    // @return The game version.
    function gameVersion() external view returns (string memory);

    // @dev Executes game tick.
    // @dev NOTE that this function should only be called via the ticking transaction from the rollup node.
    function tick() external returns (uint256);

    // Adds a player to the Game.
    function joinGame(address playerAddress, uint8 roomId) external;

    // Returns the player's room id(s).
    function getPlayerRooms(address playerAddress) external view returns (uint8[] memory);

    // Registers player script address.
    // The script address will implement an interface that will be called by the game.
    function registerScript(address playerAddress, address scriptAddress) external;

    // Returns the player's script address.
    function getPlayerScript(address playerAddress) external view returns (address);

    // Returns the current game time.
    function getTime() external view returns (uint256);

    // Returns the gas used by the lastest tick.
    function getGasUsed() external view returns (uint256);

    // Returns the gas limit for a tick.
    function getGasLimit() external view returns (uint256);
}
