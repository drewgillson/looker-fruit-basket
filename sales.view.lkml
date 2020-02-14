view: sales {
  derived_table: {
    sql: SELECT 1 AS id, NOW() - INTERVAL FLOOR(RAND() * 5) DAY AS order_date, FLOOR(RAND()*(10)) AS jid, 'Drew' AS customer, 'Alberta' AS provstate UNION ALL
         SELECT 2, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Scott', 'Texas' UNION ALL
         SELECT 3, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Alejandro', 'California' UNION ALL
         SELECT 4, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Allegra', 'California' UNION ALL
         SELECT 5, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Sharon', 'California' UNION ALL
         SELECT 6, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Colin', 'California' UNION ALL
         SELECT 7, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Drake', 'Colorado' UNION ALL
         SELECT 8, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Mark', 'California' UNION ALL
         SELECT 9, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Hugo', 'California' UNION ALL
         SELECT 10, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Tim', 'California' UNION ALL
         SELECT 11, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Chris', 'California' UNION ALL
         SELECT 12, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Nick', 'California' UNION ALL
         SELECT 13, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Shingi', 'California' UNION ALL
         SELECT 14, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Prasad', 'California' UNION ALL
         SELECT 15, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Drew', 'Alberta' UNION ALL
         SELECT 16, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Scott', 'Texas' UNION ALL
         SELECT 17, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Alejandro', 'California' UNION ALL
         SELECT 18, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Allegra', 'California' UNION ALL
         SELECT 19, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Sharon', 'California' UNION ALL
         SELECT 20, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Colin', 'California' UNION ALL
         SELECT 21, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Drake', 'Colorado' UNION ALL
         SELECT 22, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Mark', 'California' UNION ALL
         SELECT 23, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Hugo', 'California' UNION ALL
         SELECT 24, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Tim', 'California' UNION ALL
         SELECT 25, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Chris', 'California' UNION ALL
         SELECT 26, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Nick', 'California' UNION ALL
         SELECT 27, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Shingi', 'California' UNION ALL
         SELECT 28, NOW() - INTERVAL FLOOR(RAND() * 5) DAY, FLOOR(RAND()*(10)), 'Prasad', 'California'
    ;;
    datagroup_trigger: persist
    indexes: ["provstate"]
  }

  dimension: id {
    hidden: yes
    type: number
    primary_key: yes
  }

  dimension: jid {
    hidden: yes
  }

  dimension_group: order {
    type: time
    sql: ${TABLE}.order_date ;;
  }

  dimension: customer {
    sql: ${TABLE}.customer ;;
  }

  dimension: prov_state {
    label: "Province/State"
    sql: ${TABLE}.prov_state ;;
  }
}
