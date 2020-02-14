connection: "internal"
include: "*.view.lkml"

datagroup: persist {
  max_cache_age: "24 hours"
  sql_trigger: SELECT CURDATE() ;;
}

explore: fruit {
  extension: required
  from: fruit

  join: inventory {
    sql_on: ${fruit.jid} = ${inventory.jid} ;;
    relationship: many_to_many
  }

  join: sales {
    sql_on: ${fruit.jid} = ${sales.jid} ;;
    relationship: one_to_many
  }
}
