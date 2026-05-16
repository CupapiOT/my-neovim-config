local g_keymap = vim.keymap.set -- "Global keymap."

-- Compiling files with specific tools.

--   C-lang and C++
local common_gcompiler_flags = '-Wall -Wextra -Wshadow -Wfloat-equal -Wformat=2 -g -O2 -pedantic'
g_keymap(
  'n',
  '<leader>ccc',
  ':!gcc -std=c99 ' .. common_gcompiler_flags .. ' % -o %:r.out<CR>',
  { desc = '[C]ode [c]ompile [c]-lang with gcc (output: filename.out).', noremap = true, silent = true }
)
g_keymap(
  'n',
  '<leader>ccp',
  ':!g++ -std=c++20 ' .. common_gcompiler_flags .. ' % -o %:r.out<CR>',
  { desc = '[C]ode [c]ompile c[p]p20 with g++ (output: filename.out).', noremap = true, silent = true }
)

--   Assembly
g_keymap(
  'n',
  '<leader>cca',
  ':!as -g -o %:r.o % && ld -g -o %:r.out %:r.o<CR>',
  { desc = '[C]ode [c]ompile [a]t&t-syntax netwide-assembly.', noremap = true, silent = true }
)
g_keymap(
  'n',
  '<leader>ccn',
  ':!nasm -f elf64 -g -o %:r.o % && ld -g -o %:r.out %:r.o<CR>',
  { desc = '[C]ode [c]ompile intel-syntax [n]etwide-assembly.', noremap = true, silent = true }
)

--   Java
g_keymap('n', '<leader>ccj', ':!javac %<CR>', { desc = '[C]ode [c]ompile [j]ava with javac', noremap = true, silent = true })
