/**
 * Created with IntelliJ IDEA.
 * User: alex
 * Date: 07/06/13
 * Time: 14:01
 * To change this template use File | Settings | File Templates.
 */
import com.codahale.jerkson.Json._
//import play.api.libs.json._
import models._
import com.codahale.jerkson.Json._
//val jsn = generate("""{"user_id":"1", "order_id":"1", "product_id": "5", "qty": "2.0"}""")
val map  = generate(Map("user_id"->1,"order_id"->1,"product_id"->1, "qty"->5.0) )
val res1 = parse[Map[String,String]](map)



val orderline = OrderLine (1, 4, "some_ref", "some_label", 5.5, 2.0, "kg", 6.99, 7.5)

orderline.toString

val s = Order.generateOrderInCSV(1)







































