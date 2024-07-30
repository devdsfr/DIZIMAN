package models

import (
	"fmt"
	"time"
)

type Date time.Time

const dateLayout = "Mon Jan 02 2006 15:04:05 GMT-0700 (MST)"

func (d *Date) UnmarshalJSON(b []byte) error {
	str := string(b)
	if str == `""` {
		*d = Date(time.Time{})
		return nil
	}
	t, err := time.Parse(`"`+dateLayout+`"`, str)
	if err != nil {
		return fmt.Errorf("parsing time %q as %q: %v", str, dateLayout, err)
	}
	*d = Date(t)
	return nil
}

func (d Date) MarshalJSON() ([]byte, error) {
	return []byte(`"` + time.Time(d).Format(dateLayout) + `"`), nil
}

func (d Date) Format(s string) string {
	t := time.Time(d)
	return t.Format(s)
}
