<?php

namespace app\enroll_ljc\controller;

use think\Controller;
use app\common\model\Lecture as LectureModel;
use app\common\model\Student;
use think\Cookie;
use think\response\Json;

class Lecture extends Controller
{
    //处理记住学号的方法
    private function handleRemember($isremember, $student_num)
    {
        if ($isremember == "true") {
            Cookie::set('student_num', $student_num, 60 * 60 * 24 * 7);
        } else {
            Cookie::delete('student_num');
        }
    }

    public function index($appid)
    {
        $lecture = LectureModel::get($appid);
        $this->assign("lecture", $lecture);
        return $this->fetch();
    }

    public function cancel($student_num, $appid, $remember)
    {
        $this->handleRemember($remember, $student_num);
        $lecture = LectureModel::get($appid);
        if ($lecture == null) {
            $message = "<p style='color: #1e5bff'>该讲座不存在！</p>";
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        }
        $student = Student::get($student_num);
        if ($student == null) {
            $message = "<p style='color: #1e5bff'>该学号信息没有录入系统数据库，请联系管理员<span style='color: #f40002'>（QQ：1848757149）</span>申请录入。</p>";
            $data = ["code" => "202", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } elseif ($student->grade != $lecture->grade) {
            $message = "<p style='color: #1e5bff'>该学号所属年级与该讲座所属年级不符！</p>";
            $data = ["code" => "204", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } elseif (strtotime($lecture->last_enroll_time) < strtotime(date("Y-m-d H:i:s"))) {
            $message = "<p style='color: #1e5bff'>该讲座最迟报名时间已过，无法取消报名！</p>";
            $data = ["code" => "206", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } else {
            $title = "";
            $message = "";
            if ($student->appid != $appid) {
                $title = "<span style='color: #1e5bff'>取消报名结果：</span><span style='color: #f40002'>失败！</span>";
                $message = "<p style='color: #1e5bff'>你还未报名该讲座，无需取消报名！</p>";
            } else {
                if ($lecture->current_peoples > 0) {
                    $lecture->current_peoples = $lecture->current_peoples - 1;
                    $lecture->save();
                }
                $student->appid = "暂无";
                $student->save();
                $title = "<span style='color: #1e5bff'>取消报名结果：</span><span style='color: #27f412'>成功！</span>";
                $message = "<p style='color: #1e5bff'>你已经取消报名该讲座！</p>";
            }
            $data = ["code" => "200", "title" => $title, "message" => $message];
            return \json($data);
        }
    }

    public function query($student_num, $appid, $remember)
    {
        $this->handleRemember($remember, $student_num);
        $lecture = LectureModel::get($appid);
        if ($lecture == null) {
            $message = "<p style='color: #1e5bff'>该讲座不存在！</p>";
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        }
        $student = Student::get($student_num);
        if ($student == null) {
            $message = "<p style='color: #1e5bff'>该学号信息没有录入系统数据库，请联系管理员<span style='color: #f40002'>（QQ：1848757149）</span>申请录入。</p>";
            $data = ["code" => "202", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } elseif ($student->grade != $lecture->grade) {
            $message = "<p style='color: #1e5bff'>该学号所属年级与该讲座所属年级不符！</p>";
            $data = ["code" => "204", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } else {
            $title = "<span style='color: #1e5bff'>报名状态：</span><span style='color: #f40002'>未报名</span>";
            if ($student->appid == $appid) {
                $title = "<span style='color: #1e5bff'>报名状态：</span><span style='color: #27f412'>已报名</span>";
            }
            $name = "<span style='color: #1e5bff'>姓名：</span>" . "<span style='color: #05d2fa'>" . $student->name . "</span><br/>";
            $institute = "<span style='color: #1e5bff'>学院：</span>" . "<span style='color: #05d2fa'>" . $student->institute . "</span><br/>";;
            $class = "<span style='color: #1e5bff'>班级：</span>" . "<span style='color: #05d2fa'>" . $student->class . "</span><br/>";
            $sex = "<span style='color: #1e5bff'>性别：</span>" . "<span style='color: #05d2fa'>" . $student->sex . "</span><br/>";
            $student_num = "<span style='color: #1e5bff'>学号：</span>" . "<span style='color: #05d2fa'>" . $student->student_num . "</span><br/>";
            $phone_num = "<span style='color: #1e5bff'>电话号码：</span>" . "<span style='color: #05d2fa'>" . $student->phone_num . "</span><br/>";
            $message = "<span style='color: #f4cd10'>个人信息如下：</span><br/>" . $name . $institute . $class . $sex . $student_num . $phone_num;
            $data = ["code" => "200", "title" => $title, "message" => $message];
            return \json($data);
        }
    }

    public function start_query($student_num, $appid, $remember)
    {
        $this->handleRemember($remember, $student_num);
        $lecture = LectureModel::get($appid);
        if ($lecture == null) {
            $message = "<p style='color: #1e5bff'>该讲座不存在！</p>";
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        }
        $student = Student::get($student_num);
        if ($student == null) {
            $message = "<p style='color: #1e5bff'>该学号信息没有录入系统数据库，请联系管理员<span style='color: #f40002'>（QQ：1848757149）</span>申请录入。</p>";
            $data = ["code" => "202", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } elseif ($student->appid == $appid) {
            $message = "<p style='color: #1e5bff'>该学号已报名已经报名，无需重复报名！</p>";
            $data = ["code" => "204", "title" => "<span style='color: #ffab3f'>警告！</span>", "message" => $message];
            return \json($data);
        } elseif ($student->grade != $lecture->grade) {
            $message = "<p style='color: #1e5bff'>该学号所属年级与该讲座所属年级不符！</p>";
            $data = ["code" => "204", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } elseif ($lecture->current_peoples >= $lecture->max_peoples) {
            $message = "<p style='color: #1e5bff'>该讲座报名人数已达上限，无法继续报名！</p>";
            $data = ["code" => "205", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } elseif (strtotime($lecture->last_enroll_time) < strtotime(date("Y-m-d H:i:s"))) {
            $message = "<p style='color: #1e5bff'>该讲座最迟报名时间已过，无法继续报名！</p>";
            $data = ["code" => "206", "title" => "<span style='color: #f40002'>错误！</span>", "message" => $message];
            return \json($data);
        } else {
            $status = "<span style='color: #1e5bff'>报名状态：</span><span style='color: #f40002'>未报名</span>";
            if ($student->appid == $appid) {
                $status = "<span style='color: #1e5bff'>报名状态：</span><span style='color: #27f412'>已报名</span>";
            }
            $name = "<span style='color: #1e5bff'>姓名：</span>" . "<span style='color: #05d2fa'>" . $student->name . "</span><br/>";
            $institute = "<span style='color: #1e5bff'>学院：</span>" . "<span style='color: #05d2fa'>" . $student->institute . "</span><br/>";;
            $class = "<span style='color: #1e5bff'>班级：</span>" . "<span style='color: #05d2fa'>" . $student->class . "</span><br/>";
            $sex = "<span style='color: #1e5bff'>性别：</span>" . "<span style='color: #05d2fa'>" . $student->sex . "</span><br/>";
            $student_num = "<span style='color: #1e5bff'>学号：</span>" . "<span style='color: #05d2fa'>" . $student->student_num . "</span><br/>";
            $phone_num = "<span style='color: #1e5bff'>电话号码：</span>" . "<span style='color: #05d2fa'>" . $student->phone_num . "</span><br/>";
            $message = "<span style='color: #f4cd10'>个人信息如下：</span><br/>" . $name . $institute . $class . $sex . $student_num . $phone_num . $status;
            $data = ["code" => "200", "title" => "<span style='color: #1e5bff'>是否确认报名？</span>", "message" => $message];
            return \json($data);
        }
    }

    public function start_ok($student_num, $appid, $remember)
    {
        $lecture = LectureModel::get($appid);
        $student = Student::get($student_num);
        $this->handleRemember($remember, $student_num);
        if ($lecture->current_peoples < $lecture->max_peoples) {
            $student->appid = $appid;
            $student->save();
            $lecture->current_peoples = $lecture->current_peoples + 1;
            $lecture->save();
        }
        $data = ["code" => "200", "title" => "<span style='color: #1e5bff'>报名结果：</span>", "message" => "<span style='color: #27f412'>恭喜你，报名成功！</span>"];
        return \json($data);
    }
}