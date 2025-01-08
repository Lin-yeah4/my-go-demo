package main

import (
    "new-go-demo/config"
    "new-go-demo/router"
    //"github.com/gin-gonic/gin"
)

func main() {
    config.ConnectDatabase()
    
    r := router.SetupRouter()
    r.Run(":8080") // 监听8080端口
}
