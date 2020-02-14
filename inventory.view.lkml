view: inventory {
  derived_table: {
    sql:  SELECT 1 AS id, FLOOR(RAND()*(10)) AS jid, FLOOR(RAND()*(50)) AS quantity, 'A' AS shelf UNION ALL
          SELECT 2, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'A' UNION ALL
          SELECT 3, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'A' UNION ALL
          SELECT 4, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'A' UNION ALL
          SELECT 5, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'A' UNION ALL
          SELECT 6, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'A' UNION ALL
          SELECT 7, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'B' UNION ALL
          SELECT 8, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'B' UNION ALL
          SELECT 9, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'B' UNION ALL
          SELECT 10, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'B' UNION ALL
          SELECT 11, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'B' UNION ALL
          SELECT 12, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'B' UNION ALL
          SELECT 13, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'C' UNION ALL
          SELECT 14, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'C' UNION ALL
          SELECT 15, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'C' UNION ALL
          SELECT 16, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'C' UNION ALL
          SELECT 17, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'C' UNION ALL
          SELECT 18, FLOOR(RAND()*(10)), FLOOR(RAND()*(50)), 'C'
    ;;
    #datagroup_trigger: persist
    #indexes: ["shelf"]
  }

  dimension: id {
    hidden: yes
    type: number
    primary_key: yes
  }

  dimension: jid {
    hidden: yes
  }

  dimension: shelf {
    sql: ${TABLE}.shelf ;;
  }

  measure: quantity {
    type: sum
    sql: ${TABLE}.quantity ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.price ;;
    value_format: "$#,##0.00"
  }

  measure: items {
    view_label: "Sales"
    type: count_distinct
    sql: ${TABLE}.jid ;;
  }
}
