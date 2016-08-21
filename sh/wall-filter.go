package main

import (
	"fmt"
	"image"
	_ "image/gif"
	_ "image/jpeg"
	_ "image/png"
	"io/ioutil"
	"log"
	"math"
	"os"
	"path/filepath"
)

func main() {
	files, err := ioutil.ReadDir(".")
	if err != nil {
		log.Fatal(err)
	}

	for _, file := range files {
		name := file.Name()
		if file.IsDir() {
			continue
		}
		switch filepath.Ext(name) {
		case ".jpg", ".jpeg", ".png", ".gif":
		default:
			log.Println("unknown format: ", name)
			continue
		}
		f, err := os.Open(name)
		if err != nil {
			log.Fatalln(err)
		}
		c, _, err := image.DecodeConfig(f)
		if err != nil {
			log.Fatalln(err)
		}
		f.Close()
		if !isLarge(&c) || !is169(&c) {
			continue
		}
		// fmt.Printf("%s%c", name, 0x00)
		fmt.Printf("%q\n", name)
	}
}

func isLarge(c *image.Config) bool {
	return c.Width >= 2560
}
func is169(c *image.Config) bool {
	return (math.Abs(float64(c.Width)/float64(c.Height)) - 1.778) <= 0.1
}
