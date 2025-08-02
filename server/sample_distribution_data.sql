-- Sample data for testing Asset Distribution functionality

-- Insert sample locations
INSERT INTO `locations` (`name`, `building`, `floor`, `metadata`) VALUES
('Reception Area', 'Main Building', 'Ground Floor', '{"capacity": 50, "type": "public"}'),
('Classroom A', 'Academic Building', '2nd Floor', '{"capacity": 30, "type": "classroom"}'),
('Conference Hall', 'Main Building', '3rd Floor', '{"capacity": 100, "type": "meeting"}'),
('Storage Room', 'Warehouse', 'Ground Floor', '{"capacity": 500, "type": "storage"}'),
('IT Department', 'Tech Building', '1st Floor', '{"capacity": 25, "type": "office"}'),
('Library', 'Academic Building', '1st Floor', '{"capacity": 200, "type": "public"}');

-- Insert sample asset types (if not exists)
INSERT INTO `asset_types` (`name`, `category`, `description`, `default_value`, `total_quantity`, `metadata`) VALUES
('Office Chairs', 'Furniture', 'Ergonomic office chairs with adjustable height', 150.00, 500, '{"color": "black", "warranty": "2 years"}'),
('Projectors', 'Electronics', 'HD projectors for presentations', 800.00, 15, '{"resolution": "1080p", "brightness": "3000 lumens"}'),
('Laptops', 'Electronics', 'Business laptops for staff use', 1200.00, 50, '{"brand": "Dell", "ram": "8GB", "storage": "256GB SSD"}'),
('Whiteboards', 'Furniture', 'Magnetic whiteboards for classrooms', 200.00, 25, '{"size": "120x90cm", "type": "magnetic"}');

-- Insert sample asset distributions
-- Office Chairs (500 total distributed across locations)
INSERT INTO `asset_locations` (`asset_type_id`, `location_id`, `quantity`, `last_updated`) VALUES
(1, 1, 120, '2025-07-28 09:00:00'),  -- Reception Area: 120 chairs
(1, 2, 150, '2025-07-29 14:30:00'),  -- Classroom A: 150 chairs
(1, 3, 50, '2025-07-30 11:15:00'),   -- Conference Hall: 50 chairs
(1, 4, 180, '2025-08-01 08:45:00');  -- Storage Room: 180 chairs

-- Projectors (15 total distributed)
INSERT INTO `asset_locations` (`asset_type_id`, `location_id`, `quantity`, `last_updated`) VALUES
(2, 2, 5, '2025-07-25 16:20:00'),    -- Classroom A: 5 projectors
(2, 3, 3, '2025-07-26 10:00:00'),    -- Conference Hall: 3 projectors
(2, 4, 7, '2025-07-27 13:45:00');    -- Storage Room: 7 projectors

-- Laptops (50 total distributed)
INSERT INTO `asset_locations` (`asset_type_id`, `location_id`, `quantity`, `last_updated`) VALUES
(3, 1, 10, '2025-07-20 12:00:00'),   -- Reception Area: 10 laptops
(3, 5, 25, '2025-07-22 09:30:00'),   -- IT Department: 25 laptops
(3, 6, 15, '2025-07-24 15:15:00');   -- Library: 15 laptops

-- Whiteboards (25 total distributed)
INSERT INTO `asset_locations` (`asset_type_id`, `location_id`, `quantity`, `last_updated`) VALUES
(4, 2, 12, '2025-07-15 11:00:00'),   -- Classroom A: 12 whiteboards
(4, 3, 8, '2025-07-16 14:20:00'),    -- Conference Hall: 8 whiteboards
(4, 4, 5, '2025-07-17 16:45:00');    -- Storage Room: 5 whiteboards
