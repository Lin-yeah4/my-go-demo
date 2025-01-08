package router

import (
    "new-go-demo/handler"
    "github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
    r := gin.Default()

    r.POST("/register", handler.Register)
    r.POST("/login", handler.Login)
    r.POST("/logout", handler.Logout)

    return r
}
