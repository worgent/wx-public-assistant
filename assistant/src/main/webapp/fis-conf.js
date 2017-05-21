// CDN域名配置

fis.config.merge({
    roadmap : {
        path : [
            {
                //
                reg : 'admin-lib/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //
                reg : 'css/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //
                reg : 'font2/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //
                reg : 'images/article/thumbnail/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //
                reg : 'js/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'lib/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'xigua/fonts/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'xigua/js/bootstrap/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'xigua/js/libs/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'xigua/js/plugin/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'xigua/js/smartwidgets/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
            {
                //所有的ico文件
                reg : 'xigua/js/smart-chat-ui/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
             {
                //所有的ico文件
                reg : 'xigua/js/speech/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
             {
                //所有的ico文件
                reg : 'xigua/js/xiguaji/ue/**',
                //发布的时候即使加了--md5参数也不要生成带md5戳的文件
                useHash : false,
                //发布到/static/xxx目录下
                release : '$&'
            },
         ]
    }
});