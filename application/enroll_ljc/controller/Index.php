<?php
namespace app\enroll_ljc\controller;

use think\Controller;
use app\common\model\Lecture;

class Index extends Controller
{
    public function index()
    {
        $lectures = Lecture::where("delete_time",null)->order('last_enroll_time', 'desc')->paginate(5);
        $page = $lectures->render();
        $this->assign("lectures",$lectures);
        $this->assign("page",$page);
        return $this->fetch();
    }
}