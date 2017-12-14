#!/bin/bash
tail ./relatoriolog &> oi &
dialog                                      \
   --title 'Relatório Completo' 	     \
   --tailbox oi                               \
   0 0
