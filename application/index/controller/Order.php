<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-12-21
 * Time: 9:16
 */

namespace app\index\controller;


use think\Cookie;
use think\Db;

class Order extends Base
{
    public function index()
    {
        $order = Db::table("order") -> where("user_id", "=", Cookie::get("uid")) -> paginate(5);
        $page  = $order -> render();

        $this -> assign([
           "order" => $order,
           "page"  => $page
        ]);
        return $this -> fetch();
    }
    public function add()
    {
        $cate = Db::table("cate") -> select();

        $this -> assign([
            "cate" => $cate
        ]);
        return $this -> fetch();
    }
    public function getItem() {

        $res = [
            "success" => "0",
            "message" => "获取失败",
            "data"    => []
        ];

        if (empty($_POST["cate_id"])) {
            $res["message"] = "获取失败,缺少分类id";
        } else {
            $item = Db::table("item") -> where("cate_id", "=", $_POST["cate_id"]) -> select();

            $res["data"] = $item;
            $res["success"] = "1";
            $res["message"] = "获取成功";
        }
        return json($res);
    }
    public function addOrder()
    {
        $map = $_REQUEST;

        $order_item = [];
        foreach ($map["order_item"] as $item) {
            array_push($order_item, $item);
        }

        $map["order_item"] = join(',', $order_item);
        $map["order_num"] = "ES" . time();
        $map["user_id"] = Cookie::get("uid");

        $items = Db::table("item") -> where("id", "in", $order_item) -> select();
        $order_item_name = [];
        foreach ($items as $i) {
            array_push($order_item_name, $i["name"]);
        }
        $map["order_item_name"] = join(',', $order_item_name);
        $map["order_cate_name"] = Db::table("cate") -> where("id", "=", $map["order_cate"]) -> find()["name"];

        $result = Db::table("order") -> insert($map);

        if ($result == 1) {
            return $this -> redirect('order/index');
        }
    }
    public function delete()
    {
        $id = $_REQUEST["id"];

        $result = Db::table("order") -> where("id", "=", $id) -> delete();

        if ($result == 1) {
            return $this -> redirect('order/index');
        }
    }
    public function getOrderOne()
    {
        $res = [
            "success" => "0",
            "message" => "获取失败",
            "data"    => []
        ];

        if (empty($_POST["order_id"])) {
            $res["message"] = "获取失败,缺少分类id";
        } else {
            $order = Db::table("order") -> where("id", "=", $_POST["order_id"]) -> select()[0];

            $res["data"]    = $order;
            $res["success"] = "1";
            $res["message"] = "获取成功";
        }
        return json($res);
    }
}