#!/bin/bash
tail ./relatorio &> out &
dialog                                         \
   --title 'Relatório Atual'  \
   --tailbox out                               \
              0 0
