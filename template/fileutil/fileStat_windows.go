/*
 * This file is part of remco.
 * Based on code from confd. https://github.com/kelseyhightower/confd
 * © 2013 Kelsey Hightower
 * © 2016 The Remco Authors
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

package fileutil

import (
	hash "crypto/sha1"
	"errors"
	"fmt"
	"io"
	"os"
)

// Stat return a fileInfo describing the named file.
func Stat(name string) (fi fileInfo, err error) {
	if IsFileExist(name) {
		f, err := os.Open(name)
		defer f.Close()
		if err != nil {
			return fi, err
		}
		stats, _ := f.Stat()
		fi.Mode = stats.Mode()
		h := hash.New()
		io.Copy(h, f)
		fi.Hash = fmt.Sprintf("%x", h.Sum(nil))
		return fi, nil
	}
	return fi, errors.New("File not found")
}
