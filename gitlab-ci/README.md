# gitlab ci 文档

## 1. 在 gitlab 项目中创建 webHook 触发器  
    settings --> integrations  
 - 配置 URL
 - 配置 Secret Token
 - 配置 Trigger   
    
![integrations](../docs/integrations.jpg)  

## 2. 配置项目 default_branch  
    settings --> Edit Project   
- pipelien 会根据 default_branch 的分支进行构建   
    
![](../docs/edit_project.jpg)  
![](../docs/project_settings.jpg)  
    
## 3. 项目规范  
- Dockerfile 放在项目根目录下
- helm chart 放在项目charts目录下  
- helm chart 中的 Chart.yaml 中的 `appVersion`、`version` 的值设置为 `ciTagVersion`
- arfa harbor 上的项目名称和 git 上的项目名词保持一致（大小写忽略）

![](../docs/project.jpg)
![](../docs/chart.jpg)

## 4. 触发 CI
    New Tag   
       Tag name 填写版本号，构建后的 image 和 helm chart 使用此版本号  
       
![](../docs/tag.jpg)
    
