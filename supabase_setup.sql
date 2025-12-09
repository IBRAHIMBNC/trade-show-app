-- =====================================================
-- Supplier Table Setup for Supabase
-- Multi-User Access Implementation
-- =====================================================

-- Step 1: Create the suppliers table
CREATE TABLE IF NOT EXISTS suppliers (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  name VARCHAR(50) NOT NULL,
  company VARCHAR(100) NOT NULL,
  booth VARCHAR(50) NOT NULL,
  address VARCHAR(200),
  email VARCHAR(100),
  phone VARCHAR(15),
  we_chat_id VARCHAR(50),
  whats_app_number VARCHAR(15),
  notes VARCHAR(500),
  industry VARCHAR(100),
  interest_level VARCHAR(50),
  image_url VARCHAR(500),
  score INTEGER CHECK (score >= 0 AND score <= 10),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Step 2: Enable Row Level Security
ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;

-- Step 3: Drop existing policies if any (to avoid conflicts)
DROP POLICY IF EXISTS "Anyone can view suppliers" ON suppliers;
DROP POLICY IF EXISTS "Users can insert suppliers" ON suppliers;
DROP POLICY IF EXISTS "Users can update own suppliers" ON suppliers;
DROP POLICY IF EXISTS "Users can delete own suppliers" ON suppliers;

-- Step 4: Create RLS Policies for Multi-User Access

-- Policy 1: All authenticated users can view ALL suppliers (multi-user access)
CREATE POLICY "Anyone can view suppliers"
  ON suppliers FOR SELECT
  TO authenticated
  USING (true);

-- Policy 2: Users can insert their own suppliers
CREATE POLICY "Users can insert suppliers"
  ON suppliers FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Policy 3: Users can update their own suppliers only
CREATE POLICY "Users can update own suppliers"
  ON suppliers FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Policy 4: Users can delete their own suppliers only
CREATE POLICY "Users can delete own suppliers"
  ON suppliers FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- Step 5: Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_suppliers_user_id ON suppliers(user_id);
CREATE INDEX IF NOT EXISTS idx_suppliers_created_at ON suppliers(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_suppliers_name ON suppliers USING gin(to_tsvector('english', name));
CREATE INDEX IF NOT EXISTS idx_suppliers_company ON suppliers USING gin(to_tsvector('english', company));
CREATE INDEX IF NOT EXISTS idx_suppliers_industry ON suppliers(industry);
CREATE INDEX IF NOT EXISTS idx_suppliers_interest_level ON suppliers(interest_level);

-- Step 6: Create a function to automatically update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 7: Create trigger to auto-update updated_at
DROP TRIGGER IF EXISTS update_suppliers_updated_at ON suppliers;
CREATE TRIGGER update_suppliers_updated_at
    BEFORE UPDATE ON suppliers
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- Optional: Sample Data for Testing
-- =====================================================

-- Uncomment to insert sample data (replace 'your-user-id' with actual user UUID from auth.users)
/*
INSERT INTO suppliers (user_id, name, company, booth, email, phone, industry, interest_level, score)
VALUES 
  ('your-user-id', 'John Smith', 'ABC Electronics Ltd', 'A-101', 'john@abcelectronics.com', '+1234567890', 'Electronics', 'High', 8),
  ('your-user-id', 'Jane Doe', 'XYZ Trading Co', 'B-202', 'jane@xyztrading.com', '+0987654321', 'Textiles', 'Medium', 6),
  ('your-user-id', 'Bob Johnson', 'Tech Innovators', 'C-303', 'bob@techinnovators.com', '+1122334455', 'Technology', 'Very High', 9);
*/

-- =====================================================
-- Verification Queries
-- =====================================================

-- Check if table was created successfully
SELECT table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'suppliers' 
ORDER BY ordinal_position;

-- Check RLS policies
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual, with_check
FROM pg_policies
WHERE tablename = 'suppliers';

-- Check indexes
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'suppliers';

-- Count suppliers (should return 0 initially or sample count)
SELECT COUNT(*) as total_suppliers FROM suppliers;
