-- Step 1: Add new columns with the desired data types
ALTER TABLE users
ADD shipping_info_new VARCHAR(100);

ALTER TABLE users
ADD password_new VARCHAR(100);

-- Step 2: Copy data from the old columns to the new columns
UPDATE users
SET shipping_info_new = CAST(shipping_info AS VARCHAR(100)),
    password_new = CAST(password AS VARCHAR(100));

-- Step 3: Drop the old columns
ALTER TABLE users
DROP COLUMN shipping_info;

ALTER TABLE users
DROP COLUMN password;

ALTER TABLE users
ADD UROLE VARCHAR(5);

UPDATE users
SET UROLE= CAST(roles AS VARCHAR(5));

ALTER TABLE users
DROP COLUMN roles;