# Database Normalization Explanation

## Objective
Ensure the Airbnb database design conforms to 3NF to reduce redundancy and improve data integrity.

---

## 1. First Normal Form (1NF)
- All tables contain only atomic values.
- No repeating groups or multivalued fields.
- ✅ 1NF achieved.

---

## 2. Second Normal Form (2NF)
- Every non-key attribute is fully functionally dependent on the entire primary key.
- No partial dependencies in any table.
- ✅ 2NF achieved.

---

## 3. Third Normal Form (3NF)
- No transitive dependencies (i.e., non-key attributes depending on other non-key attributes).
- Issue identified in the `Property` table: address, city, and state could be broken out into a `Location` entity.
- We created a new table:

### Location Table
| id | address | city | state |
|----|---------|------|-------|

And updated the Property table:
| id | owner_id | name | location_id | price_per_night |

- ✅ 3NF achieved.

---

## Notes
- We considered removing `total_price` from the Booking table to avoid storing derived data.
- This design improves consistency and reduces the risk of update anomalies.
