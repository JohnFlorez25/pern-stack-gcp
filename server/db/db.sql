CREATE TABLE products (
    id INT UNIQUE,
    name VARCHAR(50),
    price INT,
    on_sale boolean
);

CREATE TABLE restaurants (
    id INT UNIQUE,
    name VARCHAR(50),
    location VARCHAR(50),
    price_range INT
);

INSERT INTO restaurants (id, name, location, price_range) values (123, 'mcdonals', 'new york', 3);

CREATE TABLE reviews (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL REFERENCES restaurants(id),
    name VARCHAR(50) NOT NULL,
    review TEXT NOT NULL,
    rating INT NOT NULL check(
        rating >= 1
        and rating <= 5
    )
);
select *
from restaurants
    left join(
        select restaurant_id,
            count(*),
            TRUNC(AVG(rating, 1)) as average_rating
        from reviews
        group by restaurant_id
    ) reviews on restaurants.id = reviews.restaurant_id;
