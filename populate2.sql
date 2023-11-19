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

INSERT INTO StartRoom (roomID) VALUES (1);

INSERT INTO Arena (roomID) VALUES
(2), (3), (9), (8), (10), (11), (12), (13), (15), (17);

INSERT INTO Shop (roomID) VALUES
(4), (5), (7), (6), (14), (16), (18), (19), (20);

INSERT INTO Monster (name, HP, CP, DP, XPgiven, inArena) VALUES
('Eldritch Horror', 150, 20, 10, 100, 2),
('Fire-breathing Drake', 180, 25, 12, 120, 2),
('Spectral Wraith', 120, 15, 8, 80, 2),
('Goblin King', 200, 30, 15, 140, 3),
('Shadow Stalker', 140, 22, 11, 90, 3),
('Venomous Serpent', 160, 18, 9, 110, 3),
('Ancient Lich', 220, 26, 13, 150, 8),
('Gargoyle Guardian', 200, 28, 14, 140, 8),
('Grumpy Troll', 180, 14, 7, 120, 8),
('Vicious Minotaur', 190, 23, 11, 130, 9),
('Frostbite Yeti', 170, 21, 10, 115, 9),
('Blazing Phoenix', 200, 27, 14, 145, 9),
('Dark Sorcerer', 210, 29, 15, 155, 10),
('The Kraken', 220, 24, 13, 160, 10),
('Thunderous Behemoth', 230, 32, 16, 170, 10),
('Mystic Unicorn', 180, 19, 9, 125, 11),
('Dread Reaper', 240, 35, 18, 180, 11),
('Crimson Wyvern', 260, 30, 20, 200, 11),
('Basilisk King', 280, 38, 22, 220, 12),
('Haunted Specter', 200, 25, 12, 150, 12),
('Savage Chimera', 300, 40, 25, 250, 12),
('Ethereal Banshee', 220, 28, 15, 160, 13),
('Cursed Mummy', 260, 32, 17, 190, 13),
('Hellfire Demon', 280, 36, 19, 210, 13),
('Nightshade Hydra', 320, 45, 28, 270, 15),
('Wicked Warlock', 240, 30, 16, 170, 15),
('Enigmatic Sphinx', 300, 42, 24, 230, 15),
('Ravenous Werewolf', 260, 34, 18, 200, 17),
('Frostbite Golem', 280, 38, 20, 220, 17),
('Thunderclap Dragon', 340, 50, 30, 290, 17),
('Abyssal Leviathan', 360, 55, 32, 310, 17),
('Eclipse Serpent', 320, 40, 22, 240, 15),
('Necrotic Revenant', 280, 36, 19, 210, 13),
('Doomsday Titan', 380, 60, 35, 330, 12),
('Chaos Elemental', 300, 45, 25, 250, 11),
('Molten Phoenix', 340, 48, 28, 280, 10);

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
('Lost Reliquary', 148),
('Flaming Sword', 160),
('Frostbite Axe', 170),
('Thunderstrike Hammer', 180),
('Venomous Dagger', 190),
('Dragonfire Bow', 200),
('Soul Reaver Scythe', 210),
('Stormcaller Staff', 220),
('Divine Rapier', 230),
('Shadowblade Katana', 240),
('Ethereal Lance', 250),
('Healing Tonic', 70),
('Mana Elixir', 75),
('Stamina Potion', 80),
('Invisibility Elixir', 85),
('Strength Draught', 90),
('Agility Tonic', 95),
('Resistance Elixir', 100),
('Speed Potion', 105),
('Fortitude Elixir', 110),
('Luck Elixir', 115);

INSERT INTO Effect (cp_ADD, dp_ADD, hp_ADD, duration, onPlayer, onMonster) VALUES
(-5, -5, -10, 3, 1, NULL),
(10, 10, 10, 5, NULL, NULL),
(7, 7, 7, 4, NULL, NULL),
(15, 15, 15, 6, NULL, NULL),
(-8, -8, -8, 4, NULL, NULL),
(12, 12, 12, 6, NULL, NULL),
(6, 6, 6, 3, NULL, NULL),
(14, 14, 14, 7, NULL, NULL),
(-9, -9, -9, 5, NULL, NULL),
(11, 11, 11, 6, NULL, NULL);

INSERT INTO Weapon (lootID, durability, weaponType, attackType, cp_ADD, effect) VALUES
(23, 100, 'Rod', 'Thunderbolt', 5, 1),
(24, 100, 'Fang', 'Venomous', 7, 5),
(26, 100, 'Knife', 'Sharp', 13, 9),
(30, 100, 'Blade', 'Silvered', 20, 1),
(31, 100, 'Sword', 'Melee', 25, 5),
(32, 90, 'Axe', 'Melee', 28, 5),
(33, 95, 'Hammer', 'Melee', 30, 9),
(34, 80, 'Dagger', 'Melee', 22, 1),
(35, 85, 'Bow', 'Ranged', 27, 5),
(36, 75, 'Scythe', 'Melee', 32, 1),
(37, 85, 'Staff', 'Magic', 35, 9),
(38, 90, 'Rapier', 'Melee', 33, 1),
(39, 95, 'Katana', 'Melee', 30, 5),
(40, 100, 'Lance', 'Melee', 28, 9);

INSERT INTO Armor (lootID, durability, dp_ADD) VALUES
(7, 100, 12),
(12, 100, 8),
(19, 100, 15),  
(22, 100, 10),  
(3, 100, 6),    
(10, 100, 9),  
(27, 100, 13),  
(14, 100, 7),   
(16, 100, 11),  
(28, 100, 14),  
(21, 100, 5);   

INSERT INTO Potion (lootID, durability, effect) VALUES
(11, 1, 2),
(13, 1, 8),
(41, 1, 6),
(42, 1, 7),
(43, 1, 4),
(44, 1, 3),
(45, 1, 6),
(46, 1, 10),
(47, 1, 7),
(48, 1, 10),
(49, 1, 8),
(50, 1, 2);

INSERT INTO Treasure (lootID) VALUES
(2), 
(4), 
(5), 
(6),  
(8),  
(9),  
(10),  
(14), 
(15), 
(16), 
(17),
(18), 
(19), 
(20), 
(30); 

INSERT INTO Chest (isInteractable, hasLoot, inRoom) VALUES
(TRUE, TRUE, 2),
(TRUE, TRUE, 2),
(TRUE, TRUE, 3),
(TRUE, TRUE, 3),
(TRUE, TRUE, 8),
(TRUE, TRUE, 9),
(TRUE, TRUE, 9),
(TRUE, TRUE, 9),
(TRUE, TRUE, 10),
(TRUE, TRUE, 10),
(TRUE, TRUE, 11),
(TRUE, TRUE, 12),
(TRUE, TRUE, 12),
(TRUE, TRUE, 12),
(TRUE, TRUE, 13),
(TRUE, TRUE, 13),
(TRUE, TRUE, 11),
(TRUE, TRUE, 15),
(TRUE, TRUE, 17),
(TRUE, TRUE, 17);

INSERT INTO Decor (isInteractable, hasLoot, inRoom) VALUES
(TRUE, FALSE, 1),
(FALSE, FALSE, 2),
(TRUE, FALSE, 3),
(TRUE, FALSE, 4),
(TRUE, FALSE, 5),
(FALSE, FALSE, 6),
(TRUE, FALSE, 7),
(TRUE, FALSE, 8),
(FALSE, FALSE, 9),
(TRUE, FALSE, 10),
(TRUE, FALSE, 11),
(TRUE, FALSE, 12),
(TRUE, FALSE, 13),
(FALSE, FALSE, 14),
(TRUE, FALSE, 15),
(TRUE, FALSE, 16),
(FALSE, FALSE, 17),
(TRUE, FALSE, 18),
(TRUE, FALSE, 19),
(FALSE, FALSE, 20),
(TRUE, FALSE, 1),
(TRUE, FALSE, 2),
(TRUE, FALSE, 3),
(TRUE, FALSE, 4),
(FALSE, FALSE, 5),
(TRUE, FALSE, 6),
(TRUE, FALSE, 7),
(TRUE, FALSE, 8),
(FALSE, FALSE, 9),
(TRUE, FALSE, 10),
(TRUE, FALSE, 11),
(TRUE, FALSE, 12),
(FALSE, FALSE, 13),
(TRUE, FALSE, 14),
(TRUE, FALSE, 15),
(TRUE, FALSE, 16),
(TRUE, FALSE, 17),
(TRUE, FALSE, 18),
(FALSE, FALSE, 19),
(TRUE, FALSE, 20);

INSERT INTO Door (isInteractable, hasLoot, inRoom, toRoom) VALUES
(TRUE, FALSE, 1, 5),   -- The Enchanted Forest -> Mystic Grove
(TRUE, FALSE, 1, 20),  -- The Enchanted Forest -> Starlight Citadel
(TRUE, FALSE, 1, 3),   -- The Enchanted Forest -> Cursed Crypt
(TRUE, FALSE, 1, 9),   -- The Enchanted Forest -> Lost Temple
(TRUE, FALSE, 5, 2),   -- Mystic Grove -> Dragons Lair
(TRUE, FALSE, 2, 8),   -- Dragons Lair -> Haunted Mansion
(TRUE, FALSE, 3, 12),  -- Cursed Crypt -> Eternal Abyss
(TRUE, FALSE, 4, 15),  -- Whispering Winds Inn -> Serenity Bay
(TRUE, FALSE, 5, 6),   -- Mystic Grove -> Pirates Cove
(TRUE, FALSE, 6, 14),  -- Pirates Cove -> Thunderpeak Summit
(TRUE, FALSE, 7, 19),  -- The Forbidden Library -> Emerald Vale
(TRUE, FALSE, 8, 6),   -- Haunted Mansion -> Pirates Cove
(TRUE, FALSE, 9, 10),  -- Lost Temple -> Crystal Cavern
(TRUE, FALSE, 10, 7),  -- Crystal Cavern -> The Forbidden Library
(TRUE, FALSE, 1, 20), -- Sands of Time -> Starlight Citadel
(TRUE, FALSE, 12, 17), -- Eternal Abyss -> Frostbite Peak
(TRUE, FALSE, 13, 4),  -- Moonlit Meadow -> Whispering Winds Inn
(TRUE, FALSE, 14, 11), -- Thunderpeak Summit -> Sands of Time
(TRUE, FALSE, 15, 18), -- Serenity Bay -> Aurora Falls
(TRUE, FALSE, 16, 13), -- Elysium Fields -> Moonlit Meadow
(TRUE, FALSE, 17, 16), -- Frostbite Peak -> Elysium Fields
(TRUE, FALSE, 18, 9),  -- Aurora Falls -> Lost Temple
(TRUE, FALSE, 19, 3);  -- Emerald Vale -> Cursed Crypt

INSERT INTO InChest (lootID, chest)
VALUES 
(1, 1),  -- 'Gold Coin'
(2, 11),  -- 'Shiny Gem'
(3, 5),  -- 'Enchanted Ring'
(4, 18),  -- 'Mystic Scroll'
(5, 9),  -- 'Ancient Relic'
(6, 20), -- 'Crystal Shard'
(7, 2),  -- 'Silver Locket'
(8, 14),  -- 'Emerald Necklace'
(9, 7),  -- 'Sapphire Orb'
(10, 16), -- 'Diamond Tiara'
(11, 3), -- 'Glimmering Elixir'
(12, 11), -- 'Platinum Bracelet'
(13, 5), -- 'Ethereal Charm'
(14, 18), -- 'Moonstone Amulet'
(15, 19), -- 'Celestial Key'
(16, 10),-- 'Ruby Pendant'
(17, 12), -- 'Ornate Brooch'
(18, 4), -- 'Iridescent Trinket'
(19, 7), -- 'Obsidian Medallion'
(20, 6), -- 'Elven Artefact'
(21, 1), -- 'Crimson Scarf'
(31, 3), -- 'Flaming Sword'
(32, 8), -- 'Frostbite Axe'
(33, 5), -- 'Thunderstrike Hammer'
(41, 13), -- 'Healing Tonic'
(42, 15), -- 'Mana Elixir'
(43, 17), -- 'Stamina Potion'
(44, 12), -- 'Invisibility Elixir'
(45, 17), -- 'Strength Draught'
(46, 19); -- 'Agility Tonic'

INSERT INTO InShop (lootID, shop)
VALUES
(22, 4), -- 'Frosty Crown'
(23, 6), -- 'Thunderbolt Rod'
(24, 5), -- 'Venomous Fang'
(25, 7), -- 'Dragon Scale'
(26, 16),-- 'Gilded Crown'
(27, 14), -- 'Phoenix Feather'
(28, 7), -- 'Starlight Pendant'
(34, 6), -- 'Venomous Dagger'
(35, 16), -- 'Dragonfire Bow'
(36, 14), -- 'Soul Reaver Scythe'
(37, 7), -- 'Stormcaller Staff'
(38, 4), -- 'Divine Rapier'
(39, 5), -- 'Shadowblade Katana'
(47, 5), -- 'Resistance Elixir'
(49, 16), -- 'Fortitude Elixir'
(50, 7); -- 'Luck Elixir'

INSERT INTO InPlayerInventory (lootID, player)
VALUES
(29, 1), -- 'Silvered Blade'
(30, 1), -- 'Lost Reliquary'
(40, 1), -- 'Ethereal Lance'
(48, 1); -- 'Speed Potion'