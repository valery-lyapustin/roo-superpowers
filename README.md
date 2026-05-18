# roo-superpowers

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/скиллов-28-blue)](skills/)
[![Roo Code](https://img.shields.io/badge/Roo%20Code-compatible-green)](https://github.com/RooVetGit/Roo-Code)

Русскоязычная адаптация библиотеки скиллов [obra/superpowers](https://github.com/obra/superpowers) для [Roo Code](https://github.com/RooVetGit/Roo-Code).

28 скиллов охватывающих весь цикл разработки: от мозгового штурма до деплоя, от отладки до код-ревью.

---

## Что это такое

Скиллы — это модульные инструкции которые Roo Code загружает по требованию. Каждый скилл содержит проверенный рабочий процесс для конкретной задачи. Вместо того чтобы каждый раз объяснять AI как правильно отлаживать или писать тесты — скилл делает это автоматически.

**Пример:** Вместо "используй TDD подход" → Roo сам определяет что нужен скилл `tdd` и следует строгому циклу Красный-Зелёный-Рефакторинг.

---

## Установка

### Быстрая установка

```bash
git clone https://github.com/valery-lyapustin/roo-superpowers.git
cd roo-superpowers
chmod +x install.sh update.sh
./install.sh
```

### Что делает установка

Скрипт копирует все скиллы из `skills/` в `~/.roo/skills/` — глобальную директорию скиллов Roo Code. После этого скиллы доступны во всех проектах.

### Проверка установки

```bash
ls ~/.roo/skills/
```

Должны появиться директории: `using-superpowers`, `systematic-debugging`, `tdd` и другие.

### Перезапуск Roo Code

После установки перезагрузи окно VS Code (`Ctrl+Shift+P` → `Developer: Reload Window`).

---

## Обновление скиллов

### Автоматическое обновление

```bash
./update.sh
```

Скрипт:
1. Подтягивает последние изменения из GitHub
2. Показывает что изменилось
3. Устанавливает обновлённые скиллы

### Проверка наличия обновлений (без установки)

```bash
./update.sh --check
```

### Просмотр что изменится (без применения)

```bash
./update.sh --dry-run
```

### Ручное обновление

```bash
git pull origin main
./install.sh --force
```

---

## Список скиллов

### Совместная работа

| Скилл | Описание | Когда использовать |
|---|---|---|
| [`using-superpowers`](skills/using-superpowers/SKILL.md) | Мета-скилл: как использовать систему скиллов | В начале любой сессии |
| [`brainstorming`](skills/brainstorming/SKILL.md) | Проработка идей через метод Сократа | Перед написанием кода |
| [`writing-plans`](skills/writing-plans/SKILL.md) | Детальные планы реализации | После утверждения дизайна |
| [`executing-plans`](skills/executing-plans/SKILL.md) | Выполнение планов пакетами с ревью | При наличии готового плана |
| [`subagent-driven-development`](skills/subagent-driven-development/SKILL.md) | Разработка через подагентов | Выполнение плана в текущей сессии |
| [`finishing-a-development-branch`](skills/finishing-a-development-branch/SKILL.md) | Завершение ветки: merge/PR/discard | После завершения реализации |
| [`requesting-code-review`](skills/requesting-code-review/SKILL.md) | Запрос код-ревью через подагента | После завершения задачи |
| [`receiving-code-review`](skills/receiving-code-review/SKILL.md) | Обработка обратной связи ревью | При получении замечаний |
| [`remembering-conversations`](skills/remembering-conversations/SKILL.md) | Поиск по истории разговоров | При упоминании прошлых обсуждений |
| [`dispatching-parallel-agents`](skills/dispatching-parallel-agents/SKILL.md) | Параллельный запуск подагентов | При 3+ независимых задачах |
| [`using-git-worktrees`](skills/using-git-worktrees/SKILL.md) | Изолированные git worktree | Перед началом работы над фичей |

### Отладка

| Скилл | Описание | Когда использовать |
|---|---|---|
| [`systematic-debugging`](skills/systematic-debugging/SKILL.md) | 4-фазный фреймворк отладки | При любом баге или ошибке |
| [`root-cause-tracing`](skills/root-cause-tracing/SKILL.md) | Трассировка назад через стек вызовов | Ошибка глубоко в стеке |
| [`defense-in-depth`](skills/defense-in-depth/SKILL.md) | Многоуровневая валидация данных | После нахождения бага |
| [`verification-before-completion`](skills/verification-before-completion/SKILL.md) | Верификация перед заявлением об успехе | Перед любым "готово" |

### Тестирование

| Скилл | Описание | Когда использовать |
|---|---|---|
| [`tdd`](skills/tdd/SKILL.md) | Красный-Зелёный-Рефакторинг | При любой новой фиче или баге |
| [`testing-anti-patterns`](skills/testing-anti-patterns/SKILL.md) | Антипаттерны тестирования | При написании тестов с моками |
| [`condition-based-waiting`](skills/condition-based-waiting/SKILL.md) | Ожидание по условию вместо таймаутов | При нестабильных тестах |

### Архитектура

| Скилл | Описание | Когда использовать |
|---|---|---|
| [`preserving-productive-tensions`](skills/preserving-productive-tensions/SKILL.md) | Сохранение продуктивных противоречий | При выборе между равно валидными подходами |

### Решение проблем

| Скилл | Описание | Когда использовать |
|---|---|---|
| [`when-stuck`](skills/when-stuck/SKILL.md) | Диспетчеризация к нужной технике | Когда застрял и не знаешь что делать |
| [`simplification-cascades`](skills/simplification-cascades/SKILL.md) | Поиск упрощающего принципа | Спираль сложности, много спецслучаев |
| [`collision-zone-thinking`](skills/collision-zone-thinking/SKILL.md) | Столкновение несвязанных концепций | Нужен прорыв, обычные подходы не работают |
| [`inversion-exercise`](skills/inversion-exercise/SKILL.md) | Инверсия допущений | Застрял на "единственном способе" |
| [`meta-pattern-recognition`](skills/meta-pattern-recognition/SKILL.md) | Распознавание универсальных паттернов | Один паттерн в 3+ местах |
| [`scale-game`](skills/scale-game/SKILL.md) | Тестирование на крайних масштабах | Неясна масштабируемость |

### Исследование

| Скилл | Описание | Когда использовать |
|---|---|---|
| [`tracing-knowledge-lineages`](skills/tracing-knowledge-lineages/SKILL.md) | Трассировка эволюции идей | Перед отказом от подходов |

---

## Как работают скиллы в Roo Code

Roo Code автоматически проверяет список доступных скиллов перед каждым ответом. Когда задача совпадает с описанием скилла — Roo загружает его и следует инструкциям.

Ты также можешь явно попросить использовать скилл:

```
Используй скилл systematic-debugging для этой ошибки
```

```
Примени TDD для реализации этой фичи
```

---

## Структура проекта

```
roo-superpowers/
├── README.md                          # Этот файл
├── install.sh                         # Скрипт установки
├── update.sh                          # Скрипт обновления
└── skills/
    ├── using-superpowers/SKILL.md     # Мета-скилл
    ├── brainstorming/SKILL.md
    ├── writing-plans/SKILL.md
    ├── executing-plans/SKILL.md
    ├── subagent-driven-development/SKILL.md
    ├── finishing-a-development-branch/SKILL.md
    ├── requesting-code-review/SKILL.md
    ├── receiving-code-review/SKILL.md
    ├── remembering-conversations/SKILL.md
    ├── dispatching-parallel-agents/SKILL.md
    ├── using-git-worktrees/SKILL.md
    ├── systematic-debugging/SKILL.md
    ├── root-cause-tracing/SKILL.md
    ├── defense-in-depth/SKILL.md
    ├── verification-before-completion/SKILL.md
    ├── tdd/SKILL.md
    ├── testing-anti-patterns/SKILL.md
    ├── condition-based-waiting/SKILL.md
    ├── preserving-productive-tensions/SKILL.md
    ├── when-stuck/SKILL.md
    ├── simplification-cascades/SKILL.md
    ├── collision-zone-thinking/SKILL.md
    ├── inversion-exercise/SKILL.md
    ├── meta-pattern-recognition/SKILL.md
    ├── scale-game/SKILL.md
    └── tracing-knowledge-lineages/SKILL.md
```

---

## Полезные инструменты для разработчиков

### Управление версиями и Git

| Инструмент | Описание | Ссылка |
|---|---|---|
| **lazygit** | Терминальный UI для git | [github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) |
| **delta** | Красивый diff для git | [github.com/dandavison/delta](https://github.com/dandavison/delta) |
| **gh** | GitHub CLI | [cli.github.com](https://cli.github.com) |
| **glab** | GitLab CLI | [gitlab.com/gitlab-org/cli](https://gitlab.com/gitlab-org/cli) |
| **git-flow** | Расширение для git-flow | [github.com/nvie/gitflow](https://github.com/nvie/gitflow) |
| **commitizen** | Стандартизация коммитов | [github.com/commitizen/cz-cli](https://github.com/commitizen/cz-cli) |

### Качество кода

| Инструмент | Описание | Ссылка |
|---|---|---|
| **ESLint** | Линтер для JavaScript/TypeScript | [eslint.org](https://eslint.org) |
| **Prettier** | Форматирование кода | [prettier.io](https://prettier.io) |
| **Biome** | Быстрый линтер + форматтер (замена ESLint+Prettier) | [biomejs.dev](https://biomejs.dev) |
| **Ruff** | Быстрый линтер для Python | [github.com/astral-sh/ruff](https://github.com/astral-sh/ruff) |
| **SonarQube** | Статический анализ кода | [sonarqube.org](https://www.sonarqube.org) |
| **CodeClimate** | Автоматизированное ревью кода | [codeclimate.com](https://codeclimate.com) |

### Тестирование

| Инструмент | Описание | Ссылка |
|---|---|---|
| **Vitest** | Быстрый тест-раннер для Vite | [vitest.dev](https://vitest.dev) |
| **Jest** | Тестирование JavaScript | [jestjs.io](https://jestjs.io) |
| **Playwright** | E2E тестирование браузеров | [playwright.dev](https://playwright.dev) |
| **Cypress** | E2E тестирование | [cypress.io](https://cypress.io) |
| **pytest** | Тестирование Python | [pytest.org](https://pytest.org) |
| **k6** | Нагрузочное тестирование | [k6.io](https://k6.io) |
| **Storybook** | Разработка и тестирование UI компонентов | [storybook.js.org](https://storybook.js.org) |

### Отладка и мониторинг

| Инструмент | Описание | Ссылка |
|---|---|---|
| **Sentry** | Отслеживание ошибок | [sentry.io](https://sentry.io) |
| **OpenTelemetry** | Наблюдаемость (трейсинг, метрики, логи) | [opentelemetry.io](https://opentelemetry.io) |
| **Grafana** | Визуализация метрик | [grafana.com](https://grafana.com) |
| **Jaeger** | Распределённый трейсинг | [jaegertracing.io](https://www.jaegertracing.io) |
| **clinic.js** | Профилирование Node.js | [clinicjs.org](https://clinicjs.org) |
| **py-spy** | Профилировщик Python | [github.com/benfred/py-spy](https://github.com/benfred/py-spy) |

### Документация

| Инструмент | Описание | Ссылка |
|---|---|---|
| **Docusaurus** | Сайты документации | [docusaurus.io](https://docusaurus.io) |
| **VitePress** | Статические сайты на Vue | [vitepress.dev](https://vitepress.dev) |
| **Swagger/OpenAPI** | Документация API | [swagger.io](https://swagger.io) |
| **TypeDoc** | Документация TypeScript | [typedoc.org](https://typedoc.org) |
| **Sphinx** | Документация Python | [sphinx-doc.org](https://www.sphinx-doc.org) |
| **Mermaid** | Диаграммы в Markdown | [mermaid.js.org](https://mermaid.js.org) |

### CI/CD и DevOps

| Инструмент | Описание | Ссылка |
|---|---|---|
| **GitHub Actions** | CI/CD в GitHub | [docs.github.com/actions](https://docs.github.com/en/actions) |
| **GitLab CI** | CI/CD в GitLab | [docs.gitlab.com/ee/ci](https://docs.gitlab.com/ee/ci/) |
| **Docker** | Контейнеризация | [docker.com](https://docker.com) |
| **Docker Compose** | Многоконтейнерные приложения | [docs.docker.com/compose](https://docs.docker.com/compose/) |
| **act** | Запуск GitHub Actions локально | [github.com/nektos/act](https://github.com/nektos/act) |
| **Earthly** | Воспроизводимые сборки | [earthly.dev](https://earthly.dev) |

### Безопасность

| Инструмент | Описание | Ссылка |
|---|---|---|
| **Snyk** | Сканирование уязвимостей | [snyk.io](https://snyk.io) |
| **OWASP ZAP** | Тестирование безопасности веб-приложений | [zaproxy.org](https://www.zaproxy.org) |
| **Trivy** | Сканер уязвимостей контейнеров | [github.com/aquasecurity/trivy](https://github.com/aquasecurity/trivy) |
| **gitleaks** | Поиск секретов в git | [github.com/gitleaks/gitleaks](https://github.com/gitleaks/gitleaks) |
| **semgrep** | Статический анализ безопасности | [semgrep.dev](https://semgrep.dev) |

### Продуктивность в терминале

| Инструмент | Описание | Ссылка |
|---|---|---|
| **fzf** | Нечёткий поиск в терминале | [github.com/junegunn/fzf](https://github.com/junegunn/fzf) |
| **ripgrep (rg)** | Быстрый поиск по файлам | [github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) |
| **bat** | `cat` с подсветкой синтаксиса | [github.com/sharkdp/bat](https://github.com/sharkdp/bat) |
| **eza** | Современная замена `ls` | [github.com/eza-community/eza](https://github.com/eza-community/eza) |
| **zoxide** | Умная навигация по директориям | [github.com/ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) |
| **tmux** | Мультиплексор терминала | [github.com/tmux/tmux](https://github.com/tmux/tmux) |
| **httpie** | Удобный HTTP-клиент | [httpie.io](https://httpie.io) |
| **jq** | Обработка JSON в терминале | [jqlang.github.io/jq](https://jqlang.github.io/jq/) |

### Управление зависимостями

| Инструмент | Описание | Ссылка |
|---|---|---|
| **pnpm** | Быстрый менеджер пакетов Node.js | [pnpm.io](https://pnpm.io) |
| **Bun** | Быстрый runtime + менеджер пакетов | [bun.sh](https://bun.sh) |
| **uv** | Быстрый менеджер пакетов Python | [github.com/astral-sh/uv](https://github.com/astral-sh/uv) |
| **Renovate** | Автоматическое обновление зависимостей | [docs.renovatebot.com](https://docs.renovatebot.com) |
| **Dependabot** | Автоматические PR для обновлений | [docs.github.com/dependabot](https://docs.github.com/en/code-security/dependabot) |

---

## Как внести вклад

Хочешь добавить новый скилл или улучшить существующий? Читай [CONTRIBUTING.md](CONTRIBUTING.md).

Нашёл проблему или есть идея? Открой [issue](https://github.com/valery-lyapustin/roo-superpowers/issues).

---

## Источник

Этот проект — русскоязычная адаптация [obra/superpowers-skills](https://github.com/obra/superpowers-skills) для Roo Code.

Оригинальные скиллы написаны для Claude Code. Здесь они переведены на русский язык и адаптированы под инструменты и режимы Roo Code.

---

## Changelog

История изменений — в [CHANGELOG.md](CHANGELOG.md).

---

## Лицензия

[MIT](LICENSE)