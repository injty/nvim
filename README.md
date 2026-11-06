# Neovim для фронтенда

Общий конфиг для Windows и macOS Apple Silicon. Требуется **Neovim 0.12+**.
React, Vue 3/Nuxt 3+, TypeScript, JavaScript, Node.js и Tailwind CSS 3/4.

## Установка

Расположение конфига:

- Windows: `%LOCALAPPDATA%\nvim`
- macOS: `~/.config/nvim`

Переноси весь репозиторий вместе с `lazy-lock.json`. Каталоги данных, Mason и
скомпилированные парсеры на каждой машине создаются отдельно.

### macOS / MacBook Air M4

Установи Command Line Tools и зависимости через Homebrew:

```sh
xcode-select --install
brew install neovim node ripgrep tree-sitter-cli
```

Используй ARM64-версии Homebrew/Node/Neovim; отдельные пути к Homebrew в конфиге
не нужны. Если Node уже установлен через менеджер версий, повторная установка
не требуется. `node` и `npm` должны быть доступны в терминале, запускающем Neovim.

### Windows

Пример для Scoop:

```powershell
scoop install neovim git nodejs-lts ripgrep tree-sitter gcc curl
```

Уже установленные инструменты можно пропустить. Node через nvm тоже подходит.
Нужны `tar`, `curl.exe` и C-компилятор в PATH. Если системный curl выдаёт
`CRYPT_E_NO_REVOCATION_CHECK`, установи curl из Scoop: конфиг автоматически
предпочитает его внутри Neovim, не меняя системный PATH.
Если MSVC отсутствует и `CC` не задан, для Treesitter автоматически выбирается GCC.

`tree-sitter` требуется версии **0.26.1+**, устанавливается через системный
менеджер пакетов, не npm. Для иконок выбери Nerd Font в настройках терминала.

### Первый запуск

1. Запусти `nvim`: lazy.nvim установит плагины, Treesitter — парсеры.
2. Выполни `:Lazy restore`, чтобы использовать версии из lock-файла.
3. Открой исходный файл или `:Mason`: недостающие LSP, Prettier и StyLua
   установятся автоматически. Ход установки виден в `:Mason`.
4. Дождись окончания установки и перезапусти Neovim.

Повторить установку инструментов: `:Mason`, затем `:MasonToolsInstall`.
Обновлять плагины осознанно через `:Lazy update`, парсеры — `:TSUpdate`.

## Что настроено

- **LSP:** `vtsls` для JS/TS/React/Node, `vue_ls` и Vue TypeScript plugin для SFC,
  Tailwind CSS, ESLint, HTML, CSS, JSON, YAML и Lua. Список — `lua/tooling.lua`.
- TypeScript берётся из проекта, если установлен. `ts_ls` параллельно не запускается.
- Tailwind запускается при наличии `tailwind.config.*` или зависимости
  `tailwindcss` в ближайшем родительском `package.json`. Для v4 нужен CSS entry point
  с `@import "tailwindcss"`; классы поддерживаются также в `cn`, `clsx`, `cva`, `tw`.
- ESLint использует конфигурацию и зависимости проекта, включая flat config.
  Все исправления: `:LspEslintFixAll`; отдельные — `<leader>ca`.
- **Conform:** Prettier при сохранении фронтенд-файлов, StyLua для Lua.
  Предпочитается локальный Prettier из `node_modules`, Mason — запасной вариант.
  Настройки и плагины Prettier (например, сортировка Tailwind) устанавливаются в проекте.
- **Blink:** LSP, пути, сниппеты и слова текущего буфера. Встроенный движок сниппетов
  Neovim, Lua matcher без дополнительной Rust-сборки.
- **Treesitter:** современный API и подсветка, включая Vue и TSX.
  Автоматическая подсветка Treesitter пропускает файлы больше 1 МБ.
- **Интерфейс:** Catppuccin без курсива, Lualine, Bufferline, Neo-tree справа,
  Telescope, Gitsigns, Neogit, mini.pairs/surround/move/bracketed.
- Терминал использует стандартный `&shell` Neovim: cmd на обычной установке
  Windows, пользовательский shell на macOS. Принудительной зависимости от PowerShell нет.

Устанавливай зависимости рабочего проекта своим пакетным менеджером. Глобальные
TypeScript, ESLint и Prettier для этого конфига не нужны. Vue 2 требует отдельной настройки.

### Форматирование

```vim
:Format                     " Отформатировать текущий файл
:ConformInfo                " Какой formatter выбран и где он находится
:lua vim.b.autoformat = false " Отключить на сохранение для текущего буфера
:lua vim.b.autoformat = true  " Включить обратно
:lua vim.g.autoformat = false " Отключить на сохранение во всей текущей сессии
```

ESLint fixes выполняются отдельно от форматирования. Автоматическое форматирование
не запускает несколько LSP-форматтеров подряд. Prettier-проекты и монорепозитории
сохраняют свои `.prettierrc`, `.prettierignore` и локальные плагины.

## Привычные клавиши

`leader` — пробел. Существующие сочетания сохранены.

| Клавиши | Действие |
| --- | --- |
| `Ctrl+t` | Открыть/закрыть терминал |
| `<leader>e` / `<leader>n` | Фокус Neo-tree / открыть-закрыть дерево |
| `<leader>f` / `<leader>/` | Файлы проекта / поиск текста |
| `<leader>b` | Список буферов |
| `Shift+h` / `Shift+l` | Предыдущий/следующий буфер |
| `<leader>bj` / `<leader>bp` | Выбрать буфер / закрепить |
| `<leader>gg` | Neogit |
| `<leader>d` | Диагностика через Telescope |
| `Ctrl+Shift+j` / `Ctrl+Shift+k` | Следующая/предыдущая диагностика |
| `]d` / `[d` | То же, если терминал не различает Ctrl+Shift |
| `gd` / `gr` / `gI` / `gD` | Definition / references / implementation / declaration |
| `<leader>D` | Определение типа |
| `gh` / `Ctrl+k` в Normal | Документация / сигнатура |
| `<leader>rn` / `<leader>ca` | Rename / code actions |
| `<leader>ds` / `<leader>ws` | Символы файла / workspace |
| `<leader>wa` / `<leader>wr` / `<leader>wl` | Добавить / убрать / показать workspace folders |
| `K` | Удалить строку без копирования |
| `fd` в Visual | Удалить выделение без копирования |
| `<leader>h` / `<leader>l` | Начало/конец строки |
| `<leader>p` в Visual | Вставить без перезаписи регистра |
| `<leader>y` / `<leader>Y` | Копирование в системный буфер |
| `gc` / `gb` | Строчные/блочные комментарии |
| `<leader>op` | Markdown preview через Peek (нужен Deno) |

В Insert: `Ctrl+k` — дополнение, `Enter` — принять выбранный или первый вариант,
`Ctrl+y` — принять выбранное, `Ctrl+e` — закрыть, `Ctrl+n/p` и стрелки — выбор,
`Ctrl+b/f` — прокрутка документации,
`Tab` / `Shift+Tab` — переходы по полям сниппета.

Менеджер плагинов открывается командой `:Lazy`: `<leader>l` занят концом строки.
`<leader>b` и `<leader>d` остаются одновременно командами и префиксами — Neovim
ожидает продолжения в пределах `timeoutlen`, чтобы сохранить все привычные сочетания.

Peek загружается только по `<leader>op`. Для него установи Deno (`brew install deno`
или `scoop install deno`) и выполни `:Lazy build peek.nvim`.

## Проверка

- `:checkhealth vim.lsp mason nvim-treesitter blink.cmp conform`
- `:checkhealth vim.provider` — системный буфер обмена.
- `:checkhealth vim.lsp` — серверы текущего файла и ошибки запуска.
- `:Lazy profile` — время загрузки плагинов.
- Blink health может предупреждать об отсутствии Rust-библиотеки: здесь выбран Lua matcher,
  поэтому она не требуется.
- В TSX/Vue проверь `gd`, `gh`, rename, дополнения и намеренную ошибку типов.
- В Tailwind-проекте проверь дополнение `class`/`className` и `cn(...)`.
- После сохранения `:ConformInfo` должен показывать ожидаемый Prettier проекта.

Старые пакеты Mason могут оставаться на диске, но конфиг их не запускает.
