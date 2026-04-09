CREATE TABLE IF NOT EXISTS public.users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT
);

CREATE TABLE IF NOT EXISTS public.products (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    price_in_cents INTEGER NOT NULL,
    size TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS public.purchases (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    purchase_date DATE NOT NULL,
    user_id UUID NOT NULL,
    delivery_address TEXT NOT NULL,
        CONSTRAINT fk_user 
            FOREIGN KEY (user_id)
                REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS public.purchaseproduct (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    purchase_id UUID REFERENCES purchases(id) NOT NULL,
    product_id UUID REFERENCES products(id) NOT NULL,
    product_amount INTEGER NOT NULL
);


-- DROP TABLE IF EXISTS public.users, public.purchases;

CREATE TABLE IF NOT EXISTS public.users (
	id SERIAL PRIMARY KEY,
	name TEXT,
	surname TEXT
);

-- criar múltiplos
INSERT INTO users (name, surname)
VALUES
	('Daniel', 'Porto'),
	('Alon', 'Pinheiro'),
	('João', 'Lira'),
	('Marcus', 'Cavalcanti');

-- criar - CREATE
-- leitura - READ
-- atualizar - UPDATE
-- apagar - DELETE

-- criar - CREATE
INSERT INTO users (name, surname) 
VALUES ('Marcus', 'Cavalcanti');

-- leitura - READ
SELECT id, name, surname
FROM public.users
WHERE surname = 'Porto';

BEGIN TRANSACTIO

-- atualizar - UPDATE
UPDATE users
SET name = 'Marcus', surname = 'Cavalcanti'
WHERE id = 4;

-- apagar - DELETE
DELETE FROM users
WHERE id = 4;
