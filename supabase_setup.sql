-- =====================================================
-- Supabase Database Setup - FULL RESET
-- Matches Local Drift Database Schema Exactly
-- =====================================================

-- =====================================================
-- STEP 1: DROP ALL EXISTING TABLES (in correct order due to FK constraints)
-- =====================================================

DROP TABLE IF EXISTS documents CASCADE;
DROP TABLE IF EXISTS notes CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;

-- Drop the trigger function if exists
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;

-- =====================================================
-- STEP 2: CREATE SUPPLIERS TABLE
-- Matches: supplier_table.dart
-- =====================================================

CREATE TABLE suppliers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR(50) NOT NULL,                           -- text().withLength(min: 1, max: 50)
  name VARCHAR(50) NOT NULL,                              -- text().withLength(min: 1, max: 50)
  company VARCHAR(100) NOT NULL,                          -- text().withLength(min: 1, max: 100)
  booth VARCHAR(50) NOT NULL,                             -- text().withLength(min: 1, max: 50)
  address VARCHAR(200),                                   -- text().nullable().withLength(max: 200)
  email VARCHAR(100),                                     -- text().nullable().withLength(max: 100)
  phone VARCHAR(20),                                      -- text().nullable().withLength(max: 20)
  we_chat_id VARCHAR(50),                                 -- text().nullable().withLength(max: 50)
  whats_app_number VARCHAR(20),                           -- text().nullable().withLength(max: 20)
  notes VARCHAR(500),                                     -- text().nullable().withLength(max: 500)
  industry VARCHAR(100),                                  -- text().nullable().withLength(max: 100)
  interest_level VARCHAR(50),                             -- text().nullable().withLength(max: 50)
  image_url VARCHAR(500),                                 -- text().nullable().withLength(max: 500)
  image_local_path TEXT,                                  -- text().nullable()
  scores JSONB DEFAULT '{}',                              -- text().nullable() - stored as JSONB in Supabase
  product_type VARCHAR(50),                               -- text().nullable().withLength(max: 50)
  is_synced BOOLEAN DEFAULT FALSE,                        -- boolean().withDefault(false)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- text().nullable() - stored as timestamp
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- text().nullable() - stored as timestamp
  deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL        -- dateTime().nullable()
);

-- =====================================================
-- STEP 3: CREATE PRODUCTS TABLE
-- Matches: product_table.dart
-- =====================================================

CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR(50),                                    -- for RLS (added for multi-user)
  supplier_id UUID NOT NULL REFERENCES suppliers(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,                             -- text().withLength(min: 1, max: 255)
  price DECIMAL(15, 2) NOT NULL,                          -- real()
  specifications TEXT,                                    -- text().nullable()
  notes TEXT,                                             -- text().nullable()
  category VARCHAR(100),                                  -- text().nullable().withLength(min: 1, max: 100)
  lead_time_days INTEGER,                                 -- integer().nullable()
  moq INTEGER,                                            -- integer().nullable()
  moq_unit VARCHAR(50),                                   -- text().nullable().withLength(min: 1, max: 50)
  image_local_paths JSONB DEFAULT '[]',                   -- text().nullable() - List<String> as JSON
  image_urls JSONB DEFAULT '[]',                          -- text().nullable() - List<String> as JSON
  certifications TEXT,                                    -- text().nullable()
  is_synced BOOLEAN DEFAULT FALSE,                        -- boolean().withDefault(false)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- dateTime().withDefault(currentDateAndTime)
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- dateTime().nullable()
  deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL        -- dateTime().nullable()
);

-- =====================================================
-- STEP 4: CREATE NOTES TABLE
-- Matches: notes_table.dart
-- =====================================================

CREATE TABLE notes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR(50),                                    -- for RLS (added for multi-user)
  supplier_id UUID NOT NULL REFERENCES suppliers(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,                            -- text().withLength(min: 1, max: 255)
  content VARCHAR(10000) NOT NULL,                        -- text().withLength(min: 1, max: 10000)
  is_synced BOOLEAN DEFAULT FALSE,                        -- boolean().withDefault(false)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- dateTime().withDefault(currentDateAndTime)
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- dateTime().nullable()
  deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL        -- dateTime().nullable()
);

-- =====================================================
-- STEP 5: CREATE DOCUMENTS TABLE
-- Matches: documents_table.dart
-- =====================================================

CREATE TABLE documents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR(50),                                    -- for RLS (added for multi-user)
  supplier_id UUID NOT NULL REFERENCES suppliers(id) ON DELETE CASCADE,
  title TEXT NOT NULL,                                    -- text()
  local_path TEXT NOT NULL,                               -- text()
  url TEXT,                                               -- text().nullable()
  type VARCHAR(50) NOT NULL,                              -- text().withLength(min: 1, max: 50)
  is_synced BOOLEAN DEFAULT FALSE,                        -- boolean().withDefault(false)
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- dateTime().withDefault(currentDateAndTime)
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),      -- dateTime().nullable()
  deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL        -- dateTime().nullable()
);

-- =====================================================
-- STEP 6: ENABLE ROW LEVEL SECURITY ON ALL TABLES
-- =====================================================

ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- STEP 7: CREATE RLS POLICIES FOR SUPPLIERS
-- =====================================================

CREATE POLICY "Anyone can view suppliers"
  ON suppliers FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can insert suppliers"
  ON suppliers FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can update own suppliers"
  ON suppliers FOR UPDATE
  TO authenticated
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can delete own suppliers"
  ON suppliers FOR DELETE
  TO authenticated
  USING (auth.uid()::text = user_id);

-- =====================================================
-- STEP 8: CREATE RLS POLICIES FOR PRODUCTS
-- =====================================================

CREATE POLICY "Anyone can view products"
  ON products FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can insert products"
  ON products FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can update own products"
  ON products FOR UPDATE
  TO authenticated
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can delete own products"
  ON products FOR DELETE
  TO authenticated
  USING (auth.uid()::text = user_id);

-- =====================================================
-- STEP 9: CREATE RLS POLICIES FOR NOTES
-- =====================================================

CREATE POLICY "Anyone can view notes"
  ON notes FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can insert notes"
  ON notes FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can update own notes"
  ON notes FOR UPDATE
  TO authenticated
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can delete own notes"
  ON notes FOR DELETE
  TO authenticated
  USING (auth.uid()::text = user_id);

-- =====================================================
-- STEP 10: CREATE RLS POLICIES FOR DOCUMENTS
-- =====================================================

CREATE POLICY "Anyone can view documents"
  ON documents FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can insert documents"
  ON documents FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can update own documents"
  ON documents FOR UPDATE
  TO authenticated
  USING (auth.uid()::text = user_id)
  WITH CHECK (auth.uid()::text = user_id);

CREATE POLICY "Users can delete own documents"
  ON documents FOR DELETE
  TO authenticated
  USING (auth.uid()::text = user_id);

-- =====================================================
-- STEP 11: CREATE INDEXES FOR PERFORMANCE
-- =====================================================

-- Suppliers indexes
CREATE INDEX idx_suppliers_user_id ON suppliers(user_id);
CREATE INDEX idx_suppliers_created_at ON suppliers(created_at DESC);
CREATE INDEX idx_suppliers_deleted_at ON suppliers(deleted_at);
CREATE INDEX idx_suppliers_updated_at ON suppliers(updated_at);

-- Products indexes
CREATE INDEX idx_products_user_id ON products(user_id);
CREATE INDEX idx_products_supplier_id ON products(supplier_id);
CREATE INDEX idx_products_created_at ON products(created_at DESC);
CREATE INDEX idx_products_deleted_at ON products(deleted_at);
CREATE INDEX idx_products_updated_at ON products(updated_at);

-- Notes indexes
CREATE INDEX idx_notes_user_id ON notes(user_id);
CREATE INDEX idx_notes_supplier_id ON notes(supplier_id);
CREATE INDEX idx_notes_created_at ON notes(created_at DESC);
CREATE INDEX idx_notes_deleted_at ON notes(deleted_at);
CREATE INDEX idx_notes_updated_at ON notes(updated_at);

-- Documents indexes
CREATE INDEX idx_documents_user_id ON documents(user_id);
CREATE INDEX idx_documents_supplier_id ON documents(supplier_id);
CREATE INDEX idx_documents_created_at ON documents(created_at DESC);
CREATE INDEX idx_documents_deleted_at ON documents(deleted_at);
CREATE INDEX idx_documents_updated_at ON documents(updated_at);

-- =====================================================
-- STEP 12: CREATE AUTO-UPDATE TRIGGER FOR updated_at
-- =====================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_suppliers_updated_at
    BEFORE UPDATE ON suppliers
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_products_updated_at
    BEFORE UPDATE ON products
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_notes_updated_at
    BEFORE UPDATE ON notes
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_documents_updated_at
    BEFORE UPDATE ON documents
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- STEP 13: CREATE STORAGE BUCKETS (Run separately in Storage settings)
-- =====================================================

-- Go to Supabase Dashboard → Storage → Create new bucket:
-- 1. supplier-images (public: true)
-- 2. product-images (public: true)
-- 3. documents (public: true)

-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================

-- Check suppliers table structure
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns 
WHERE table_name = 'suppliers' 
ORDER BY ordinal_position;

-- Check products table structure
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns 
WHERE table_name = 'products' 
ORDER BY ordinal_position;

-- Check notes table structure
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns 
WHERE table_name = 'notes' 
ORDER BY ordinal_position;

-- Check documents table structure
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns 
WHERE table_name = 'documents' 
ORDER BY ordinal_position;
