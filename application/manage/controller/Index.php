<?php

namespace app\manage\controller;

use think\Controller;
use app\common\model\Lecture;
use app\common\model\Student;
use app\manage\model\Manager;
use think\Cookie;
use think\Session;

class Index extends Controller
{
    //检测是否登陆
    private function isLogined(){
        $isLogined = Session::get("isLogined");
        if($isLogined == null || $isLogined == ""){
            //没有登录
            return false;
        }
        if($isLogined == "ok"){
            //已经登录
            return true;
        }else{
            //没有登录
            return false;
        }
    }

    public function index()
    {
        $r = $this->isLogined();
        if (!$r){
            //未登录
            $this->redirect('/manage/login');
            return;
        }
        //已经登录，继续更新session
        Session::set("isLogined","ok");
        return $this->fetch();
    }
}