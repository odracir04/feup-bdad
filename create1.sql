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


-- Populate 

INSERT INTO Room (roomID, name) VALUES
(1, 'The Enchanted Forest'),
(2, 'Dragons Lair'),
(3, 'Cursed Crypt'),
(4, 'Whispering Winds Inn'),
(5, 'Mystic Grove'),
(6, 'Pirates Cove'),
(7, 'The Forbidden Library'),
(8, 'Haunted Mansion'),
(9, 'Lost Temple'),
(10, 'Crystal Cavern');

-- Populate the StartRoom table
INSERT INTO StartRoom (roomID) VALUES (1);

-- Populate the Arena table
INSERT INTO Arena (roomID) VALUES
(2), (3), (9), (8), (10); 


-- Populate the Shop table
INSERT INTO Shop (roomID) VALUES
(4), (5), (7), (6);


-- Populate the Monster table with unique names
INSERT INTO Monster (name, HP, CP, DP, XPgiven, inArena) VALUES
('Eldritch Horror', 150, 20, 10, 100, 3),
('Fire-breathing Drake', 180, 25, 12, 120, 2),
('Spectral Wraith', 120, 15, 8, 80, 8),
('Goblin King', 200, 30, 15, 140, 9),
('Shadow Stalker', 140, 22, 11, 90, 3),
('Venomous Serpent', 160, 18, 9, 110, 9),
('Ancient Lich', 220, 26, 13, 150, 8),
('Gargoyle Guardian', 200, 28, 14, 140, 2),
('Grumpy Troll', 180, 14, 7, 120, 8),
('The Kraken', 220, 24, 13, 160, 2);

-- Populate the Shopkeeper table with intriguing names
INSERT INTO Shopkeeper (name, inShop) VALUES
('Zarok the Enchanter', 4),
('Sylva the Mysterious', 5),
('Bartleby the Bargainer', 7),
('Grimm the Collector', 6);

-- Populate the Class table
INSERT INTO Class (name, HP, CP, DP, proficiencies) VALUES
('Warrior', 150, 30, 15, 'Sword, Shield'),
('Mage', 100, 40, 10, 'Staff, Wand'),
('Rogue', 120, 25, 12, 'Dagger, Bow'),
('Cleric', 140, 20, 14, 'Mace, Healing'),
('Archer', 110, 35, 11, 'Bow, Dagger'),
('Paladin', 160, 28, 16, 'Sword, Shield'),
('Sorcerer', 90, 45, 9, 'Staff, Wand'),
('Thief', 100, 22, 10, 'Dagger, Lockpicking'),
('Druid', 130, 24, 13, 'Staff, Healing'),
('Bard', 120, 26, 12, 'Instrument, Charm');

-- Populate the Player table
INSERT INTO Player (name, money, XP, class, inRoom) VALUES
('Herói de LDTS', 500, 100, 1, 1);

INSERT INTO Loot (name, value) VALUES
('Loot 1', 50),
('Loot 2', 60),
('Loot 3', 70),
('Loot 4', 80),
('Loot 5', 90),
('Loot 6', 100),
('Loot 7', 110),
('Loot 8', 120),
('Loot 9', 130),
('Loot 10', 140);

-- Populate the Effect table
INSERT INTO Effect (cp_ADD, dp_ADD, hp_ADD, duration, onPlayer, onMonster) VALUES
(5, 5, -10, 3, 1, NULL),
(10, 10, 10, 5, NULL, NULL),
(7, 7, 7, 4, NULL, NULL),
(15, 15, 15, 6, NULL, 2),
(8, 8, 8, 4, 1, 7),
(12, 12, 12, 6, NULL, NULL),
(6, 6, 6, 3, NULL, NULL),
(14, 14, 14, 7, NULL, 5),
(9, 9, 9, 5, NULL, NULL),
(11, 11, 11, 6, NULL, NULL);

-- Populate the Weapon table
INSERT INTO Weapon (lootID, durability, weaponType, attackType, cp_ADD, effect) VALUES
(1, 50, 'Sword', 'Melee', 10, 1),
(2, 60, 'Staff', 'Magic', 15, 2),
(8, 120, 'Lockpick', 'Utility', 6, 8),
(10, 140, 'Sword', 'Melee', 11, 10);

-- Populate the Armor table
INSERT INTO Armor (lootID, durability, dp_ADD) VALUES
(3, 50, 10),
(5, 60, 15),
(6, 120, 6);


-- Populate the Potion table
INSERT INTO Potion (lootID, durability, effect) VALUES
(4, 1, 5),
(7, 1, 9);

-- Populate the Treasure table
INSERT INTO Treasure (lootID) VALUES (9);

INSERT INTO Chest (isInteractable, hasLoot, inRoom) VALUES
(TRUE, TRUE, 1),
(TRUE, TRUE, 2),
(TRUE, TRUE, 3),
(TRUE, TRUE, 4),
(TRUE, TRUE, 5),
(TRUE, TRUE, 6),
(TRUE, TRUE, 7),
(TRUE, TRUE, 8),
(TRUE, TRUE, 9),
(TRUE, TRUE, 10);

-- Populate the Decor table
INSERT INTO Decor (isInteractable, hasLoot, inRoom) VALUES
(TRUE, FALSE, 1),
(TRUE, FALSE, 2),
(TRUE, FALSE, 3),
(TRUE, FALSE, 4),
(TRUE, FALSE, 5),
(TRUE, FALSE, 6),
(TRUE, FALSE, 7),
(TRUE, FALSE, 8),
(TRUE, FALSE, 9),
(TRUE, FALSE, 10);

-- Populate the Door table
INSERT INTO Door (isInteractable, hasLoot, inRoom, toRoom) VALUES
(TRUE, FALSE, 1, 2),
(TRUE, FALSE, 2, 5),
(TRUE, FALSE, 3, 4),
(TRUE, FALSE, 4, 8),
(TRUE, FALSE, 5, 3),
(TRUE, FALSE, 6, 7),
(TRUE, FALSE, 7, 9),
(TRUE, FALSE, 8, 6),
(TRUE, FALSE, 9, 10),
(TRUE, FALSE, 10, 1);

-- Populate the InChest table
INSERT INTO InChest (loot, chest) VALUES
(2, 3), 
(7, 1),
(9, 5),
(5, 8);

-- Populate the InShop table
INSERT INTO InShop (loot, shop) VALUES
(1, 4),
(8, 7),
(3, 5),
(10, 6);

-- Populate the InPlayerInventory table
INSERT INTO InPlayerInventory (loot, player) VALUES
(4, 1),
(6, 1);
