#!/usr/bin/env bash
# =============================================================================
# update.sh — Обновление скиллов roo-superpowers из репозитория
#
# Этот скрипт:
#   1. Подтягивает последние изменения из GitHub репозитория
#   2. Показывает что изменилось
#   3. Устанавливает обновлённые скиллы в ~/.roo/skills/
#
# Использование:
#   ./update.sh              — обновить из origin/main
#   ./update.sh --check      — только проверить наличие обновлений
#   ./update.sh --dry-run    — показать что изменится без применения
#
# Требования:
#   - git должен быть установлен
#   - Репозиторий должен быть клонирован (не просто скачан как архив)
# =============================================================================

set -euo pipefail

# --- Цвета для вывода ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

# --- Конфигурация ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Флаги ---
CHECK_ONLY=false
DRY_RUN=false

# --- Разбор аргументов ---
for arg in "$@"; do
  case $arg in
    --check)
      CHECK_ONLY=true
      ;;
    --dry-run)
      DRY_RUN=true
      ;;
    --help|-h)
      echo "Использование: $0 [--check] [--dry-run] [--help]"
      echo ""
      echo "  --check     Только проверить наличие обновлений без установки"
      echo "  --dry-run   Показать что изменится без реального применения"
      echo "  --help      Показать эту справку"
      exit 0
      ;;
    *)
      echo -e "${RED}Неизвестный аргумент: $arg${NC}"
      exit 1
      ;;
  esac
done

# --- Заголовок ---
echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${BLUE}║     roo-superpowers — Обновление скиллов ║${NC}"
echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""

# --- Проверка что это git репозиторий ---
if ! git -C "$SCRIPT_DIR" rev-parse --git-dir > /dev/null 2>&1; then
  echo -e "${RED}Ошибка: Это не git репозиторий.${NC}"
  echo "Для обновления нужно клонировать репозиторий:"
  echo "  git clone https://github.com/YOUR_USERNAME/roo-superpowers.git"
  exit 1
fi

# --- Переходим в директорию репозитория ---
cd "$SCRIPT_DIR"

# --- Проверяем наличие remote ---
if ! git remote get-url origin > /dev/null 2>&1; then
  echo -e "${RED}Ошибка: Нет remote 'origin'.${NC}"
  echo "Добавь remote:"
  echo "  git remote add origin https://github.com/YOUR_USERNAME/roo-superpowers.git"
  exit 1
fi

# --- Получаем текущий коммит ---
CURRENT_COMMIT=$(git rev-parse HEAD)
CURRENT_BRANCH=$(git branch --show-current)

echo -e "Текущая ветка:  ${BOLD}$CURRENT_BRANCH${NC}"
echo -e "Текущий коммит: ${BOLD}${CURRENT_COMMIT:0:8}${NC}"
echo ""

# --- Подтягиваем изменения ---
echo -e "${YELLOW}Проверяю обновления...${NC}"
git fetch origin --quiet

# --- Проверяем есть ли обновления ---
REMOTE_COMMIT=$(git rev-parse "origin/$CURRENT_BRANCH" 2>/dev/null || echo "")

if [ -z "$REMOTE_COMMIT" ]; then
  echo -e "${YELLOW}Не удалось получить информацию о remote ветке origin/$CURRENT_BRANCH${NC}"
  exit 1
fi

if [ "$CURRENT_COMMIT" = "$REMOTE_COMMIT" ]; then
  echo -e "${GREEN}✓ Скиллы актуальны. Обновлений нет.${NC}"
  exit 0
fi

# --- Показываем что изменилось ---
echo -e "${YELLOW}Доступны обновления!${NC}"
echo ""
echo -e "${BOLD}Изменённые скиллы:${NC}"

# Показываем только изменения в директории skills/
CHANGED_SKILLS=$(git diff --name-only "$CURRENT_COMMIT" "$REMOTE_COMMIT" -- skills/ 2>/dev/null || echo "")

if [ -n "$CHANGED_SKILLS" ]; then
  while IFS= read -r file; do
    # Определяем тип изменения
    STATUS=$(git diff --name-status "$CURRENT_COMMIT" "$REMOTE_COMMIT" -- "$file" | cut -f1)
    skill_name=$(echo "$file" | cut -d'/' -f2)

    case $STATUS in
      A) echo -e "  ${GREEN}+${NC} $skill_name (новый скилл)" ;;
      M) echo -e "  ${YELLOW}↻${NC} $skill_name (обновлён)" ;;
      D) echo -e "  ${RED}-${NC} $skill_name (удалён)" ;;
      *) echo -e "  ${BLUE}?${NC} $skill_name ($STATUS)" ;;
    esac
  done <<< "$CHANGED_SKILLS"
else
  echo -e "  ${BLUE}Изменения не в директории skills/${NC}"
fi

echo ""

# --- Если только проверка — выходим ---
if $CHECK_ONLY; then
  echo -e "Для применения обновлений запусти: ${BOLD}./update.sh${NC}"
  exit 0
fi

# --- Если dry-run — выходим ---
if $DRY_RUN; then
  echo -e "${YELLOW}[РЕЖИМ ПРОСМОТРА] Реальные изменения не будут сделаны${NC}"
  echo -e "Для применения обновлений запусти: ${BOLD}./update.sh${NC}"
  exit 0
fi

# --- Применяем обновления ---
echo -e "${YELLOW}Применяю обновления...${NC}"

# Проверяем нет ли локальных изменений
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo -e "${RED}Ошибка: Есть незакоммиченные локальные изменения.${NC}"
  echo "Сохрани или откати их перед обновлением:"
  echo "  git stash        — временно сохранить изменения"
  echo "  git checkout .   — откатить все изменения"
  exit 1
fi

# Подтягиваем изменения
git pull origin "$CURRENT_BRANCH" --quiet

NEW_COMMIT=$(git rev-parse HEAD)
echo -e "${GREEN}✓ Репозиторий обновлён до коммита: ${BOLD}${NEW_COMMIT:0:8}${NC}"
echo ""

# --- Устанавливаем обновлённые скиллы ---
echo -e "${YELLOW}Устанавливаю обновлённые скиллы...${NC}"
"$SCRIPT_DIR/install.sh" --force

echo ""
echo -e "${GREEN}${BOLD}✓ Обновление завершено!${NC}"
echo ""
echo -e "${BOLD}Что изменилось:${NC}"
git log --oneline "$CURRENT_COMMIT..$NEW_COMMIT" -- skills/ 2>/dev/null | head -10 || true