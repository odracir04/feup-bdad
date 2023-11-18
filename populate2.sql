PRAGMA FOREIGN_KEYS = ON;

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
(10, 'Crystal Cavern'),
(11, 'Sands of Time'),
(12, 'Eternal Abyss'),
(13, 'Moonlit Meadow'),
(14, 'Thunderpeak Summit'),
(15, 'Serenity Bay'),
(16, 'Elysium Fields'),
(17, 'Frostbite Peak'),
(18, 'Aurora Falls'),
(19, 'Emerald Vale'),
(20, 'Starlight Citadel');

-- Populate the StartRoom table
INSERT INTO StartRoom (roomID) VALUES (1);

-- Populate the Arena table
INSERT INTO Arena (roomID) VALUES
(2), (3), (9), (8), (10), (11), (12), (13), (15), (17);


-- Populate the Shop table
INSERT INTO Shop (roomID) VALUES
(4), (5), (7), (6), (14), (16), (18), (19), (20);


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
('Vicious Minotaur', 190, 23, 11, 130, 10),
('Frostbite Yeti', 170, 21, 10, 115, 15),
('Blazing Phoenix', 200, 27, 14, 145, 17),
('Dark Sorcerer', 210, 29, 15, 155, 13),
('The Kraken', 220, 24, 13, 160, 2),
('Thunderous Behemoth', 230, 32, 16, 170, 11),
('Mystic Unicorn', 180, 19, 9, 125, 12);

-- Populate the Shopkeeper table with intriguing names
INSERT INTO Shopkeeper (name, inShop) VALUES
('Zarok the Enchanter', 4),
('Sylva the Mysterious', 5),
('Bartleby the Bargainer', 7),
('Grimm the Collector', 6),
('Thalia the Arcanist', 16),
('Fletcher the Arms Dealer', 14),
('Meridia the Apothecary', 18),
('Rune the Mystic', 19),
('Aldor the Blacksmith', 20);


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
('Player', 150, 300, 8, 1);

INSERT INTO Loot (name, value) VALUES
('Gold Coin', 50),
('Shiny Gem', 60),
('Enchanted Ring', 70),
('Mystic Scroll', 80),
('Ancient Relic', 90),
('Crystal Shard', 100),
('Silver Locket', 110),
('Emerald Necklace', 120),
('Sapphire Orb', 130),
('Diamond Tiara', 140),
('Glimmering Elixir', 55),
('Platinum Bracelet', 65),
('Ethereal Charm', 75),
('Moonstone Amulet', 85),
('Celestial Key', 95),
('Ruby Pendant', 105),
('Ornate Brooch', 115),
('Iridescent Trinket', 125),
('Obsidian Medallion', 135),
('Elven Artefact', 145),
('Crimson Scarf', 58),
('Frosty Crown', 68),
('Thunderbolt Rod', 78),
('Venomous Fang', 88),
('Dragon Scale', 98),
('Gilded Crown', 108),
('Phoenix Feather', 118),
('Starlight Pendant', 128),
('Silvered Blade', 138),
('Lost Reliquary', 148);

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
(23, 100, 'Rod', 'Thunderbolt', 5, 1),
(24, 100, 'Fang', 'Venomous', 7, 2),
(26, 100, 'Knife', 'Sharp', 13, 4),
(30, 100, 'Blade', 'Silvered', 20, 8);

-- Populate the Armor table
INSERT INTO Armor (lootID, durability, dp_ADD) VALUES
(7, 100, 12),   -- Silver Locket (lootID 7)
(12, 100, 8),   -- Platinum Bracelet (lootID 12)
(19, 100, 15),  -- Obsidian Medallion (lootID 19)
(22, 100, 10),  -- Frosty Crown (lootID 22)
(3, 100, 6),    -- Enchanted Ring (lootID 3)
(10, 100, 9),   -- Diamond Tiara (lootID 10)
(27, 100, 13),  -- Gilded Crown (lootID 27)
(14, 100, 7),   -- Moonstone Amulet (lootID 14)
(16, 100, 11),  -- Ruby Pendant (lootID 16)
(28, 100, 14),  -- Starlight Pendant (lootID 28)
(21, 100, 5);   -- Crimson Scarf (lootID 21)


-- Populate the Potion table
INSERT INTO Potion (lootID, durability, effect) VALUES
(11, 1, 5),
(13, 1, 8);

-- Populate the Treasure table
INSERT INTO Treasure (lootID) VALUES
(2),  -- Shiny Gem (lootID 2)
(4),  -- Mystic Scroll (lootID 4)
(5),  -- Ancient Relic (lootID 5)
(6),  -- Crystal Shard (lootID 6)
(8),  -- Emerald Necklace (lootID 8)
(9),  -- Sapphire Orb (lootID 9)
(10),  -- Diamond Tiara (lootID 10)
(14), -- Moonstone Amulet (lootID 14)
(15), -- Celestial Key (lootID 15)
(16), -- Ruby Pendant (lootID 16)
(17), -- Ornate Brooch (lootID 17)
(18), -- Iridescent Trinket (lootID 18)
(19), -- Obsidian Medallion (lootID 19)
(20), -- Elven Artefact (lootID 20)
(30); -- Lost Reliquary (lootID 30)


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
(1, 0, 1, 5),   -- The Enchanted Forest -> Mystic Grove
(1, 0, 1, 20),  -- The Enchanted Forest -> Starlight Citadel
(1, 0, 1, 3),   -- The Enchanted Forest -> Cursed Crypt
(1, 0, 1, 9),   -- The Enchanted Forest -> Lost Temple
(1, 0, 5, 2),   -- Mystic Grove -> Dragons Lair
(1, 0, 2, 8),   -- Dragons Lair -> Haunted Mansion
(1, 0, 3, 12),  -- Cursed Crypt -> Eternal Abyss
(1, 0, 4, 15),  -- Whispering Winds Inn -> Serenity Bay
(1, 0, 5, 6),   -- Mystic Grove -> Pirates Cove
(1, 0, 6, 14),  -- Pirates Cove -> Thunderpeak Summit
(1, 0, 7, 19),  -- The Forbidden Library -> Emerald Vale
(1, 0, 8, 6),   -- Haunted Mansion -> Pirates Cove
(1, 0, 9, 10),  -- Lost Temple -> Crystal Cavern
(1, 0, 10, 7),  -- Crystal Cavern -> The Forbidden Library
(1, 0, 11, 20), -- Sands of Time -> Starlight Citadel
(1, 0, 12, 17), -- Eternal Abyss -> Frostbite Peak
(1, 0, 13, 4),  -- Moonlit Meadow -> Whispering Winds Inn
(1, 0, 14, 11), -- Thunderpeak Summit -> Sands of Time
(1, 0, 15, 18), -- Serenity Bay -> Aurora Falls
(1, 0, 16, 13), -- Elysium Fields -> Moonlit Meadow
(1, 0, 17, 16), -- Frostbite Peak -> Elysium Fields
(1, 0, 18, 9),  -- Aurora Falls -> Lost Temple
(1, 0, 19, 3);  -- Emerald Vale -> Cursed Crypt

-- Populate the InChest table
INSERT INTO InChest (loot, chest)
VALUES 
(1, 3),  -- 'Gold Coin'
(2, 1),  -- 'Shiny Gem'
(3, 5),  -- 'Enchanted Ring'
(4, 8),  -- 'Mystic Scroll'
(5, 9),  -- 'Ancient Relic'
(6, 10), -- 'Crystal Shard'
(7, 2),  -- 'Silver Locket'
(8, 4),  -- 'Emerald Necklace'
(9, 7),  -- 'Sapphire Orb'
(10, 6), -- 'Diamond Tiara'
(11, 3), -- 'Glimmering Elixir'
(12, 1), -- 'Platinum Bracelet'
(13, 5), -- 'Ethereal Charm'
(14, 8), -- 'Moonstone Amulet'
(15, 9), -- 'Celestial Key'
(16, 10),-- 'Ruby Pendant'
(17, 2), -- 'Ornate Brooch'
(18, 4), -- 'Iridescent Trinket'
(19, 7), -- 'Obsidian Medallion'
(20, 6), -- 'Elven Artefact'
(21, 1); -- 'Crimson Scarf'

-- Populate the InShop table
INSERT INTO InShop (loot, shop)
VALUES
(22, 4), -- 'Frosty Crown'
(23, 6), -- 'Thunderbolt Rod'
(24, 5), -- 'Venomous Fang'
(25, 7), -- 'Dragon Scale'
(26, 16),-- 'Gilded Crown'
(27, 14), -- 'Phoenix Feather'
(28, 7); -- 'Starlight Pendant'

-- Populate the InPlayerInventory table
INSERT INTO InPlayerInventory (loot, player)
VALUES
(29, 1),
(30, 1);
