<?php

    /**
     * showImage方法主要是把数据库中的图片转化格式
     * @param type $url 图片的url地址
     * @param type $width 图片的宽度
     * @param type $height 图片的高度
     */
    function showImage($url, $width = '', $height = '')
    {
        $ic = config('IMAGE_CONFIG');
        if($width)
        {
             $width = "width='$width'";
        } 
        if($height)
        {
            $height = "height='$height'";
        } 
        echo "< img $width $height src='".$ic['viewPath'].$url."' />";
    }
