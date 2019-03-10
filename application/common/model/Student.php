<?php

namespace app\common\model;

use think\Model;
use traits\model\SoftDelete;

class Student extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'student';
    protected $pk = 'student_num';
    protected $autoWriteTimestamp = 'datetime';
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
}