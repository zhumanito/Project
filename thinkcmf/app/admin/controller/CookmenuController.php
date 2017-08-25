<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class CookmenuController extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }
    /**
     * show方法实现菜谱列表的展示功能
     * @return type
     */
    public function show()
    {
        $result=Db::name('menu')->order('id asc')->paginate(6);
        //分页显示输出
        $page=$result->render();
        //渲染到模板的分页样式
        $this->assign('page', $page);
        //模板变量赋值
        $this->assign('result',$result);
        return $this->fetch();
    }
    /**
     * 编辑菜谱
     */
    public function edit()
    {
        
        $id = $this->request->param('id', 0, 'intval');
        $data = Db::name('menu')->where(["id" => $id])->find();
        //dump($data);die;
        $this->assign("data",$data);
        return $this->fetch();
       
    }
    /**
     * 编辑菜谱提交
     */
     public function editPost()
    {
        $id = $this->request->param("id", 0, 'intval');
        if ($this->request->isPost()) 
        {
            $data   = $this->request->param();
            if (Db::name('menu')->where(["id"=>$id])->update($data) !== false) 
            {
                $this->success("保存成功！", url('cookmenu/show'));
                exit;
            } 
            else 
            {
                $this->error("保存失败！");
                exit;
            }
          
        }
    }
    /**
     * del方法是删除功能
     */
    public function del()
    {
          
        if(request()->isGet())
        {
            $res = Db::name('menu')->where('id',input('id'))->delete();
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
    /**
     * 菜谱发布
     */
    public function add()
    {
        //判断是否是post提交数据
        if(request()->isPost())
        {
            //接收表单前端提交的数据
            $post=input('post.');
            $res=Db::name('menu')->insert($post);
            if($res)
            {
                $this->success('菜谱添加成功!');
                exit;
            }
            else 
            {
                $this->error('菜谱添加失败!');
                exit;
            }
        }
         
        return $this->fetch();
    }
    public function publish()
    {
        //判断是否是post提交数据
        if(request()->isPost())
        {
            //接收表单前端提交的数据
//            $post=input('post.');
            $post = $this->request->param();
//            dump($post);die;
            $res=Db::name('menu')->insert($post);
            if($res)
            {
                $this->success('菜谱发布成功!',url('cookmenu/show'));
                exit;
            }
            else 
            {
                $this->error('菜谱发布失败!');
                exit;
            }
        }
        return $this->fetch();
    }
   
}

