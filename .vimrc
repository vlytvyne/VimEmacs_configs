" включить синтаксис
syntax on
" размер таба
set tabstop=4
" размер отступа для auto C-style indentation
set shiftwidth=4
" не разворачивать табы в пробелы
set noexpandtab

" подгрузить плагин для автодополнения скобок
source ~/auto-pairs.vim

" отображать номер колонки на которой находиться курсор
set statusline+=Column:\ %c

" подсветить лишние пробелы ( '|' (экран) - или, Error - цветовая схема, '+'
" (экран) один или больше знак за которым стоит, в данном случае пробел)
match Error /  \+\| \n/

set backup
set backupdir=~/.vim/backup
