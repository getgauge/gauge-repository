package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

const (
	ext    = ".go"
	gopath = "GOPATH"
)

func main() {
	defer deleteSetupFile()
	projectDir := getCurrentDir()
	goPathSrc := os.Getenv(gopath)
	if !strings.HasPrefix(projectDir, goPathSrc) {
		fmt.Println("\nCurrent dir is not a subfolder in $GOPATH/src folder. Move this project inside $GOPATH/src and run go get ./...")
		return
	}
	fmt.Println("Executing go get ./... to fetch dependencies")
	runGoGet()
}

func runGoGet() {
	cmd := exec.Command("go", "get", "./...")
	if err := cmd.Run(); err != nil {
		fmt.Println("failed to run command \"go get ./..\"")
	}
}

func deleteFile(file string) {
	if err := os.RemoveAll(file); err != nil {
		fmt.Printf("Failed to remove file %s : %s\n", file, err.Error())
	}
}

func deleteSetupFile() {
	ex, _ := os.Executable()
	file := filepath.Base(ex) + ext
	dir := getCurrentDir()
	deleteFile(filepath.Join(dir, file))
}

func getCurrentDir() string {
	dir, err := os.Getwd()
	if err != nil {
		fmt.Printf("failed to find current dir : %s", err.Error())
	}
	return dir
}
