<?php

namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class CookusersController extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }
    /**
     * 用户列表
     * @return type
     */
    public function showlist()
    {
        $data=Db::name('users')->order('id asc')->paginate(8);
        //分页显示输出
        $page=$data->render();
        //渲染到模板的分页样式
        $this->assign('page', $page);
        //模板变量赋值
        $this->assign('data',$data);
        return $this->fetch();
    }
    /**
     * 用户详情
     * @return type
     */
    public function detail()
    {
        $result=Db::name('users')->order('id asc')->paginate(8);
        //分页显示输出
        $page=$result->render();
        //渲染到模板的分页样式
        $this->assign('page',$page);
        //模板变量赋值
        $this->assign('result',$result);
        return $this->fetch();
    }
     /**
     * 查看详情
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');
        $data = Db::name('users')->where(["id" => $id])->find();
        $this->assign("data",$data);
        return $this->fetch();
       
    }
    /**
     * 编辑用户提交
     */
     public function editPost()
    {
        $id = $this->request->param("id", 0, 'intval');
        if ($this->request->isPost()) 
        {
            $data   = $this->request->param();
            if (Db::name('users')->where(["id"=>$id])->update($data) !== false) 
            {
                $this->success("保存成功！", url('cookusers/showlist'));
            } 
            else 
            {
                $this->error("保存失败！");
            }     
        }
    }
    /**
     * del方法是删除功能
     */
    public function del()
    {
          
        if($this->request->isGet())
        {
            $res = Db::name('users')->where('id',input('id'))->delete();
            if($res)
            {
                return $this->success('删除成功');
            }
            else
            {
                return $this->error('删除失败');
            }
        }
    }
}

