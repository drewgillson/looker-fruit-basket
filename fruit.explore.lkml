include: "*.view.lkml"

explore: fruit {
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
