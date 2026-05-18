# Changelog

Все значимые изменения в этом проекте документируются здесь.

Формат основан на [Keep a Changelog](https://keepachangelog.com/ru/1.0.0/).
Проект следует [Semantic Versioning](https://semver.org/lang/ru/).

---

## [1.0.0] — 2025-05-18

### Добавлено

- 28 скиллов на русском языке, охватывающих весь цикл разработки
- Скрипт установки [`install.sh`](install.sh) с поддержкой `--dry-run` и `--force`
- Скрипт обновления [`update.sh`](update.sh) с поддержкой `--check` и `--dry-run`

#### Скиллы совместной работы
- [`using-superpowers`](skills/using-superpowers/SKILL.md) — мета-скилл системы
- [`brainstorming`](skills/brainstorming/SKILL.md) — проработка идей через метод Сократа
- [`writing-plans`](skills/writing-plans/SKILL.md) — детальные планы реализации
- [`executing-plans`](skills/executing-plans/SKILL.md) — выполнение планов пакетами с ревью
- [`subagent-driven-development`](skills/subagent-driven-development/SKILL.md) — разработка через подагентов
- [`finishing-a-development-branch`](skills/finishing-a-development-branch/SKILL.md) — завершение ветки
- [`requesting-code-review`](skills/requesting-code-review/SKILL.md) — запрос код-ревью
- [`receiving-code-review`](skills/receiving-code-review/SKILL.md) — обработка замечаний ревью
- [`remembering-conversations`](skills/remembering-conversations/SKILL.md) — поиск по истории разговоров
- [`dispatching-parallel-agents`](skills/dispatching-parallel-agents/SKILL.md) — параллельный запуск подагентов
- [`using-git-worktrees`](skills/using-git-worktrees/SKILL.md) — изолированные git worktree

#### Скиллы отладки
- [`systematic-debugging`](skills/systematic-debugging/SKILL.md) — 4-фазный фреймворк отладки
- [`root-cause-tracing`](skills/root-cause-tracing/SKILL.md) — трассировка первопричины
- [`defense-in-depth`](skills/defense-in-depth/SKILL.md) — многоуровневая валидация
- [`verification-before-completion`](skills/verification-before-completion/SKILL.md) — верификация перед "готово"

#### Скиллы тестирования
- [`tdd`](skills/tdd/SKILL.md) — разработка через тестирование
- [`testing-anti-patterns`](skills/testing-anti-patterns/SKILL.md) — антипаттерны тестирования
- [`condition-based-waiting`](skills/condition-based-waiting/SKILL.md) — ожидание по условию

#### Скиллы архитектуры
- [`preserving-productive-tensions`](skills/preserving-productive-tensions/SKILL.md) — сохранение продуктивных противоречий

#### Скиллы решения проблем
- [`when-stuck`](skills/when-stuck/SKILL.md) — диспетчеризация к нужной технике
- [`simplification-cascades`](skills/simplification-cascades/SKILL.md) — поиск упрощающего принципа
- [`collision-zone-thinking`](skills/collision-zone-thinking/SKILL.md) — столкновение несвязанных концепций
- [`inversion-exercise`](skills/inversion-exercise/SKILL.md) — инверсия допущений
- [`meta-pattern-recognition`](skills/meta-pattern-recognition/SKILL.md) — распознавание универсальных паттернов
- [`scale-game`](skills/scale-game/SKILL.md) — тестирование на крайних масштабах

#### Скиллы исследования
- [`tracing-knowledge-lineages`](skills/tracing-knowledge-lineages/SKILL.md) — трассировка эволюции идей

### Источник

Русскоязычная адаптация [obra/superpowers-skills](https://github.com/obra/superpowers-skills) для Roo Code.