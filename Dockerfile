# 使用 Golang 官方镜像作为构建镜像
FROM golang:1.20-alpine AS builder

# 设置工作目录
WORKDIR /app

# 将 go.mod 和 go.sum 复制到容器中
COPY go.mod go.sum ./

# 下载所有依赖包
RUN go mod tidy

# 将整个应用程序复制到容器中
COPY . .

# 编译 Go 应用程序
RUN go build -o main .

# 运行时镜像，从轻量级的 Alpine 镜像开始
FROM alpine:latest

# 安装必要的依赖（比如 libc 等）
RUN apk --no-cache add ca-certificates

# 设置工作目录
WORKDIR /root/

# 从构建镜像中复制二进制文件
COPY --from=builder /app/main .

# 暴露应用端口
EXPOSE 8080

# 启动命令
CMD ["./main"]
