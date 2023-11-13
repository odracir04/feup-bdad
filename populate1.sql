.headers ON
.mode columns
PRAGMA FOREIGN_KEYS = ON;

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