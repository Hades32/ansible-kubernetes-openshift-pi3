#!/bin/bash
grep '[0-9]' hosts | sed 's/\s.*//'|sort|uniq
