.headers ON
.mode columns
PRAGMA FOREIGN_KEYS = ON;

DROP TABLE IF EXISTS Room;
CREATE TABLE Room (
    roomID INTEGER CONSTRAINT roomPK PRIMARY KEY,
    name TEXT CONSTRAINT roomNameExists NOT NULL
);

DROP TABLE IF EXISTS StartRoom;
CREATE TABLE StartRoom (
    roomID INTEGER CONSTRAINT startRoomPK PRIMARY KEY,
    FOREIGN KEY(roomID) REFERENCES Room(roomID)
);

DROP TABLE IF EXISTS Arena;
CREATE TABLE Arena (
    roomID INTEGER CONSTRAINT arenaPK PRIMARY KEY,
    FOREIGN KEY(roomID) REFERENCES Room(roomID)
);

DROP TABLE IF EXISTS Shop;
CREATE TABLE Shop (
    roomID INTEGER CONSTRAINT shopPK PRIMARY KEY,
    FOREIGN KEY(roomID) REFERENCES Room(roomID)
);


DROP TABLE IF EXISTS Shopkeeper;
CREATE TABLE Shopkeeper (
    shopkeeperID INTEGER CONSTRAINT shopkeeperPK PRIMARY KEY,
    name TEXT CONSTRAINT shopkeeperNameExists NOT NULL,
    inShop INTEGER,
    FOREIGN KEY(inShop) REFERENCES Shop(RoomID)
);

DROP TABLE IF EXISTS Monster;
CREATE TABLE Monster (
    monsterID INTEGER CONSTRAINT monsterPK PRIMARY KEY,
    name TEXT CONSTRAINT monsterNameExists NOT NULL,
    HP INTEGER CONSTRAINT monsterHPPositive CHECK (HP >= 0),
    CP INTEGER CONSTRAINT mosnterCPPositive CHECK (CP >= 0),
    DP INTEGER CONSTRAINT monsterDPPositive CHECK (DP >= 0),
    XPgiven INTEGER CONSTRAINT monsterXPGivenPositive CHECK (XPgiven >= 0),
    inArena INTEGER,
    FOREIGN KEY(inArena) REFERENCES Arena(roomID)
);


DROP TABLE IF EXISTS Class;
CREATE TABLE Class (
    classID INTEGER CONSTRAINT classPK PRIMARY KEY,
    name TEXT CONSTRAINT classNameExists NOT NULL,
    HP INTEGER CONSTRAINT playerHPPositive CHECK (HP >= 0),
    CP INTEGER CONSTRAINT playerCPPositive CHECK (CP >= 0),
    DP INTEGER CONSTRAINT playerDPPositive CHECK (DP >= 0),
    proficiencies TEXT
);

DROP TABLE IF EXISTS Player;
CREATE TABLE Player (
    playerID INTEGER CONSTRAINT playerPK PRIMARY KEY,
    name TEXT CONSTRAINT playerNameExists NOT NULL,
    money INTEGER CONSTRAINT moneyPositive CHECK (money >= 0),
    XP INTEGER CONSTRAINT playerXPPositive CHECK (XP >= 0),
    class INTEGER,
    inRoom INTEGER,
    FOREIGN KEY(class) REFERENCES Class(classID),
    FOREIGN KEY(inRoom) REFERENCES Room(roomID)
);


DROP TABLE IF EXISTS Loot;
CREATE TABLE Loot (
    lootID INTEGER CONSTRAINT lootID PRIMARY KEY,
    name TEXT CONSTRAINT lootNameExists NOT NULL,
    value INTEGER CONSTRAINT valuePositive CHECK (value >= 0)
);


DROP TABLE IF EXISTS Effect;
CREATE TABLE Effect (
    effectID INTEGER CONSTRAINT effectPK PRIMARY KEY,
    cp_ADD INTEGER CONSTRAINT cpAddNonZero CHECK (cp_ADD != 0),
    dp_ADD INTEGER CONSTRAINT dpAddNonZero CHECK (dp_ADD != 0),
    hp_ADD INTEGER CONSTRAINT hpAddNonZero CHECK (hp_ADD != 0),
    duration INTEGER CONSTRAINT durationPositive CHECK (duration >= 0),
    onPlayer INTEGER,
    onMonster INTEGER,
    FOREIGN KEY(onPlayer) REFERENCES Player(playerID),
    FOREIGN KEY(onMonster) REFERENCES Monster(monsterID)
);


DROP TABLE IF EXISTS Weapon;
CREATE TABLE Weapon (
    lootID INTEGER CONSTRAINT weaponPK PRIMARY KEY,
    durability INTEGER CONSTRAINT durabilityPositive CHECK (durability >= 0),
    weaponType TEXT CONSTRAINT weaponTypeExists NOT NULL,
    attackType TEXT CONSTRAINT attackTypeExists NOT NULL,
    cp_ADD INTEGER CONSTRAINT cpAddPositive CHECK (cp_ADD >= 0),
    effect INTEGER,
    FOREIGN KEY(lootID) REFERENCES Loot(lootID),
    FOREIGN KEY(effect) REFERENCES Effect(effectID)
);


DROP TABLE IF EXISTS Armor;
CREATE TABLE Armor (
    lootID INTEGER CONSTRAINT armorPK PRIMARY KEY,
    durability INTEGER CONSTRAINT durabilityPositive CHECK (durability >= 0),
    dp_ADD INTEGER CONSTRAINT dpAddPositive CHECK (dp_ADD >= 0),
    FOREIGN KEY(lootID) REFERENCES Loot(lootID)
);


DROP TABLE IF EXISTS Potion;
CREATE TABLE Potion (
    lootID INTEGER CONSTRAINT potionPK PRIMARY KEY,
    durability INTEGER CONSTRAINT durabilityPotion CHECK (durability = 1),
    effect INTEGER,
    FOREIGN KEY(lootID) REFERENCES Loot(lootID),
    FOREIGN KEY(effect) REFERENCES Effect(effectID)
);


DROP TABLE IF EXISTS Treasure;
CREATE TABLE Treasure (
    lootID INTEGER CONSTRAINT treasurePK PRIMARY KEY,
    FOREIGN KEY(lootID) REFERENCES Loot(lootID)
);


DROP TABLE IF EXISTS Chest;
CREATE TABLE Chest (
    chestID INTEGER CONSTRAINT chestPK PRIMARY KEY,
    isInteractable BOOLEAN CONSTRAINT Interactable NOT NULL,
    hasLoot BOOLEAN CONSTRAINT Lootable NOT NULL,
    inRoom INTEGER,
    FOREIGN KEY(inRoom) REFERENCES Room(roomID)
);


DROP TABLE IF EXISTS Decor;
CREATE TABLE Decor (
    decorID INTEGER CONSTRAINT decorPK PRIMARY KEY,
    isInteractable BOOLEAN CONSTRAINT Interactable NOT NULL,
    hasLoot BOOLEAN CONSTRAINT Lootable NOT NULL,
    inRoom INTEGER,
    FOREIGN KEY(inRoom) REFERENCES Room(roomID)
);


DROP TABLE IF EXISTS Door;
CREATE TABLE Door (
    doorID INTEGER CONSTRAINT doorPK PRIMARY KEY,
    isInteractable BOOLEAN CONSTRAINT Interactable NOT NULL,
    hasLoot BOOLEAN CONSTRAINT Lootable NOT NULL,
    inRoom INTEGER,
    toRoom INTEGER,
    FOREIGN KEY(inRoom) REFERENCES Room(roomID),
    FOREIGN KEY(toRoom) REFERENCES Room(roomID)
);


DROP TABLE IF EXISTS InChest;
CREATE TABLE InChest (
    loot INTEGER CONSTRAINT inChestPK PRIMARY KEY,
    chest INTEGER,
    FOREIGN KEY(loot) REFERENCES Loot(lootID),
    FOREIGN KEY(chest) REFERENCES Chest(chestID)
);


DROP TABLE IF EXISTS InShop;
CREATE TABLE InShop (
    loot INTEGER CONSTRAINT inShopPK PRIMARY KEY,
    shop INTEGER,
    FOREIGN KEY(loot) REFERENCES Loot(lootID),
    FOREIGN KEY(shop) REFERENCES Shop(roomID)
);


DROP TABLE IF EXISTS InPlayerInventory;
CREATE TABLE InPlayerInventory (
    loot INTEGER CONSTRAINT inPlayerInventoryPK PRIMARY KEY,
    player INTEGER,
    FOREIGN KEY(loot) REFERENCES Loot(lootID),
    FOREIGN KEY(player) REFERENCES Player(playerID)
);