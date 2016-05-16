#!/bin/bash
grep 'k8s-master' hosts | sed 's/\s.*//'|sort|uniq
