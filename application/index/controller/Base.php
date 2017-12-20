<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-11-24
 * Time: 9:44
 */

namespace app\index\controller;
use think\Controller;
use think\Cookie;
use think\Db;

class Base extends Controller
{
    public function _initialize()
    {
//        $uid = Cookie::get("uid");
//
//        if (!isset($uid)) {
//            $this -> error('请登录', url('Login/index'), 3);
//        }
//        return json($_COOKIE);
    }
}