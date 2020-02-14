view: fruit {
  derived_table: {
    sql: SELECT 1 AS id, FLOOR(RAND()*(10)) AS jid, 'orange' AS name, 'round' AS shape, 'orange' AS colour, ROUND(RAND(),2) AS price UNION ALL
         SELECT 2, FLOOR(RAND()*(10)), 'banana', 'long', 'yellow', ROUND(RAND(),2) UNION ALL
         SELECT 3, FLOOR(RAND()*(10)), 'apple', 'round', 'red', ROUND(RAND(),2) UNION ALL
         SELECT 4, FLOOR(RAND()*(10)), 'apple', 'round', 'green', ROUND(RAND(),2) UNION ALL
         SELECT 5, FLOOR(RAND()*(10)), 'mango', 'oval', 'yellow', ROUND(RAND(),2) UNION ALL
         SELECT 6, FLOOR(RAND()*(10)), 'kiwi', 'oval', 'brown', ROUND(RAND(),2) UNION ALL
         SELECT 7, FLOOR(RAND()*(10)), 'guava', 'round', 'white', ROUND(RAND(),2) UNION ALL
         SELECT 8, FLOOR(RAND()*(10)), 'guava', 'round', 'pink', ROUND(RAND(),2) UNION ALL
         SELECT 9, FLOOR(RAND()*(10)), 'pineapple', 'oval', 'yellow', ROUND(RAND(),2) UNION ALL
         SELECT 10, FLOOR(RAND()*(10)), 'starfruit', 'star', 'yellow', ROUND(RAND(),2) UNION ALL
         SELECT 11, FLOOR(RAND()*(10)), 'plum', 'round', 'purple', ROUND(RAND(),2) UNION ALL
         SELECT 12, FLOOR(RAND()*(10)), 'peach', 'round', 'yellow', ROUND(RAND(),2) UNION ALL
         SELECT 13, FLOOR(RAND()*(10)), 'lemon', 'oval', 'yellow', ROUND(RAND(),2) UNION ALL
         SELECT 14, FLOOR(RAND()*(10)), 'lime', 'round', 'green', ROUND(RAND(),2)
    ;;
    datagroup_trigger: persist
    indexes: ["name"]
  }

  dimension: id {
    hidden: yes
    type: number
    primary_key: yes
  }

  dimension: jid {
    hidden: yes
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: shape {
    sql: ${TABLE}.shape ;;
  }

  dimension: colour {
    sql: ${TABLE}.colour ;;
  }

  dimension: price {
    sql: ${TABLE}.price ;;
    value_format: "$#,##0.00"
  }
}
