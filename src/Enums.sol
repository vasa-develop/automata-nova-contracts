// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

enum Errors {
    OK,
    ERR_NOT_OWNER,
    ERR_NO_PATH,
    ERR_NAME_EXISTS,
    ERR_BUSY,
    ERR_NOT_FOUND,
    ERR_NOT_ENOUGH_ENERGY,
    ERR_NOT_ENOUGH_RESOURCES,
    ERR_INVALID_TARGET,
    ERR_FULL,
    ERR_NOT_IN_RANGE,
    ERR_INVALID_ARGS,
    ERR_TIRED,
    ERR_NO_BODYPART,
    ERR_NOT_ENOUGH_EXTENSIONS,
    ERR_RCL_NOT_ENOUGH,
    ERR_GCL_NOT_ENOUGH
}

enum StructureTypes {
    STRUCTURE_EXTENSION,
    STRUCTURE_RAMPART,
    STRUCTURE_ROAD,
    STRUCTURE_SPAWN,
    STRUCTURE_LINK,
    STRUCTURE_WALL,
    STRUCTURE_KEEPER_LAIR,
    STRUCTURE_CONTROLLER,
    STRUCTURE_STORAGE,
    STRUCTURE_TOWER,
    STRUCTURE_OBSERVER,
    STRUCTURE_POWER_BANK,
    STRUCTURE_POWER_SPAWN,
    STRUCTURE_EXTRACTOR,
    STRUCTURE_LAB,
    STRUCTURE_TERMINAL,
    STRUCTURE_CONTAINER,
    STRUCTURE_NUKER,
    STRUCTURE_PORTAL,
    STRUCTURE_FACTORY,
    STRUCTURE_INVADER_CORE
}

enum BodyParts {
    MOVE,
    WORK,
    CARRY,
    ATTACK,
    RANGED_ATTACK,
    TOUGH,
    HEAL,
    CLAIM
}

enum Directions {
    TOP,
    TOP_RIGHT,
    RIGHT,
    BOTTOM_RIGHT,
    BOTTOM,
    BOTTOM_LEFT,
    LEFT,
    TOP_LEFT
}

enum ResourceTypes {
    RESOURCE_MIST,
    RESOURCE_BIOMASS,
    RESOURCE_METAL,
    RESOURCE_SILICON
}

enum Colors {
    COLOR_RED,
    COLOR_PURPLE,
    COLOR_BLUE,
    COLOR_CYAN,
    COLOR_GREEN,
    COLOR_YELLOW,
    COLOR_ORANGE,
    COLOR_BROWN,
    COLOR_GREY,
    COLOR_WHITE
}

enum Density {
    DENSITY_LOW,
    DENSITY_MODERATE,
    DENSITY_HIGH,
    DENSITY_ULTRA
}

enum PowerClass {
    POWER_CLASS_OPERATOR
}

enum PowerTypes {
    PWR_GENERATE_OPS,
    PWR_OPERATE_SPAWN,
    PWR_OPERATE_TOWER,
    PWR_OPERATE_STORAGE,
    PWR_OPERATE_LAB,
    PWR_OPERATE_EXTENSION,
    PWR_OPERATE_OBSERVER,
    PWR_OPERATE_TERMINAL,
    PWR_DISRUPT_SPAWN,
    PWR_DISRUPT_TOWER,
    PWR_DISRUPT_SOURCE,
    PWR_SHIELD,
    PWR_REGEN_SOURCE,
    PWR_REGEN_MINERAL,
    PWR_DISRUPT_TERMINAL,
    PWR_OPERATE_POWER,
    PWR_FORTIFY,
    PWR_OPERATE_CONTROLLER,
    PWR_OPERATE_FACTORY
} 

enum EventTypes {
    EVENT_ATTACK,
    EVENT_OBJECT_DESTROYED,
    EVENT_ATTACK_CONTROLLER,
    EVENT_BUILD,
    EVENT_HARVEST,
    EVENT_HEAL,
    EVENT_REPAIR,
    EVENT_RESERVE_CONTROLLER,
    EVENT_UPGRADE_CONTROLLER,
    EVENT_EXIT,
    EVENT_POWER,
    EVENT_TRANSFER,

    EVENT_ATTACK_TYPE_MELEE,
    EVENT_ATTACK_TYPE_RANGED,
    EVENT_ATTACK_TYPE_RANGED_MASS,
    EVENT_ATTACK_TYPE_DISMANTLE,
    EVENT_ATTACK_TYPE_HIT_BACK,
    EVENT_ATTACK_TYPE_NUKE,

    EVENT_HEAL_TYPE_MELEE,
    EVENT_HEAL_TYPE_RANGED
}

enum TerrainTypes {
    TERRAIN_PLAIN,
    TERRAIN_SWAMP,
    TERRAIN_WALL
}