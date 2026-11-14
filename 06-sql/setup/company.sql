-- =============================================================
-- Məşq bazası: şirkət (PostgreSQL)
-- İşə salmaq üçün: psql -U postgres -f company.sql
--             və ya faylı DBeaver/pgAdmin-də açıb icra et
--
-- Verilənlər qəsdən «tələli» seçilib:
--   * Marketinq şöbəsinin işçisi yoxdur    → LEFT JOIN və COUNT məşqi
--   * Tural heç bir şöbəyə bağlı deyil     → JOIN istiqaməti məşqi
--   * Rahim və Murad eyni maaşı alır       → RANK və DENSE_RANK fərqi
--   * bəzi işçilərin meneceri yoxdur       → NULL məntiqi
--   * manager_id cədvəlin özünə bağlıdır   → self join və rekursiv CTE
-- =============================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    id   INT  PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE employees (
    id            INT            PRIMARY KEY,
    name          TEXT           NOT NULL,
    salary        NUMERIC(10, 2) NOT NULL CHECK (salary > 0),
    department_id INT            REFERENCES departments (id),
    manager_id    INT            REFERENCES employees (id),
    hired_at      DATE           NOT NULL
);

INSERT INTO departments (id, name) VALUES
    (1, 'IT'),
    (2, 'Maliyyə'),
    (3, 'HR'),
    (4, 'Marketinq');          -- işçisi yoxdur

INSERT INTO employees (id, name, salary, department_id, manager_id, hired_at) VALUES
    (1, 'Aysel',  7000, 1,    NULL, '2018-03-01'),   -- IT rəhbəri
    (4, 'Leyla',  4500, 2,    NULL, '2019-09-01'),   -- Maliyyə rəhbəri
    (7, 'Elvin',  2800, 3,    NULL, '2021-04-12'),   -- HR rəhbəri
    (2, 'Rahim',  5000, 1,    1,    '2021-06-15'),
    (3, 'Murad',  5000, 1,    1,    '2022-01-10'),   -- Rahim ilə eyni maaş
    (5, 'Kamran', 3800, 2,    4,    '2020-11-20'),
    (6, 'Nigar',  3200, 2,    4,    '2023-02-05'),
    (8, 'Səbinə', 3000, 3,    7,    '2024-07-01'),   -- öz rəhbərindən çox maaş alır
    (9, 'Tural',  2500, NULL, 2,    '2025-01-15');   -- şöbəsi yoxdur

-- Yoxlama: 4 şöbə və 9 işçi görünməlidir
SELECT (SELECT COUNT(*) FROM departments) AS departments,
       (SELECT COUNT(*) FROM employees)   AS employees;
