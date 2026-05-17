#!/usr/bin/env bash
# =============================================================================
# install.sh — Установка скиллов roo-superpowers в ~/.roo/skills/
#
# Этот скрипт копирует все скиллы из директории skills/ текущего репозитория
# в глобальную директорию скиллов Roo Code (~/.roo/skills/).
#
# Использование:
#   ./install.sh              — установить все скиллы
#   ./install.sh --dry-run    — показать что будет установлено без реального копирования
#   ./install.sh --force      — перезаписать существующие скиллы без подтверждения
#
# После установки скиллы становятся доступны во всех проектах Roo Code.
# =============================================================================

set -euo pipefail

# --- Цвета для вывода ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# --- Конфигурация ---
# Директория откуда запускается скрипт (корень репозитория)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.roo/skills"

# --- Флаги ---
DRY_RUN=false
FORCE=false

# --- Разбор аргументов ---
for arg in "$@"; do
  case $arg in
    --dry-run)
      DRY_RUN=true
      ;;
    --force)
      FORCE=true
      ;;
    --help|-h)
      echo "Использование: $0 [--dry-run] [--force] [--help]"
      echo ""
      echo "  --dry-run   Показать что будет установлено без реального копирования"
      echo "  --force     Перезаписать существующие скиллы без подтверждения"
      echo "  --help      Показать эту справку"
      exit 0
      ;;
    *)
      echo -e "${RED}Неизвестный аргумент: $arg${NC}"
      echo "Используй --help для справки"
      exit 1
      ;;
  esac
done

# --- Заголовок ---
echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${BLUE}║     roo-superpowers — Установка скиллов  ║${NC}"
echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""

if $DRY_RUN; then
  echo -e "${YELLOW}[РЕЖИМ ПРОСМОТРА] Реальные изменения не будут сделаны${NC}"
  echo ""
fi

# --- Проверка источника ---
if [ ! -d "$SOURCE_DIR" ]; then
  echo -e "${RED}Ошибка: Директория skills/ не найдена по пути: $SOURCE_DIR${NC}"
  echo "Убедись что запускаешь скрипт из корня репозитория roo-superpowers"
  exit 1
fi

# --- Создание целевой директории ---
if [ ! -d "$TARGET_DIR" ]; then
  echo -e "${YELLOW}Создаю директорию: $TARGET_DIR${NC}"
  if ! $DRY_RUN; then
    mkdir -p "$TARGET_DIR"
  fi
fi

# --- Подсчёт скиллов ---
SKILL_COUNT=0
INSTALLED_COUNT=0
SKIPPED_COUNT=0
UPDATED_COUNT=0

# --- Установка каждого скилла ---
echo -e "${BOLD}Скиллы для установки:${NC}"
echo ""

for skill_dir in "$SOURCE_DIR"/*/; do
  # Получаем имя скилла из имени директории
  skill_name=$(basename "$skill_dir")
  skill_file="$skill_dir/SKILL.md"
  target_skill_dir="$TARGET_DIR/$skill_name"
  target_skill_file="$target_skill_dir/SKILL.md"

  # Пропускаем если нет SKILL.md
  if [ ! -f "$skill_file" ]; then
    continue
  fi

  SKILL_COUNT=$((SKILL_COUNT + 1))

  # Проверяем существует ли уже скилл
  if [ -d "$target_skill_dir" ] && [ -f "$target_skill_file" ]; then
    if $FORCE; then
      echo -e "  ${YELLOW}↻${NC} $skill_name ${YELLOW}(обновление)${NC}"
      if ! $DRY_RUN; then
        cp -r "$skill_dir" "$TARGET_DIR/"
      fi
      UPDATED_COUNT=$((UPDATED_COUNT + 1))
    else
      # Проверяем отличается ли содержимое
      if diff -q "$skill_file" "$target_skill_file" > /dev/null 2>&1; then
        echo -e "  ${BLUE}✓${NC} $skill_name ${BLUE}(актуален)${NC}"
        SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
      else
        echo -e "  ${YELLOW}↻${NC} $skill_name ${YELLOW}(есть обновление)${NC}"
        if ! $DRY_RUN; then
          cp -r "$skill_dir" "$TARGET_DIR/"
        fi
        UPDATED_COUNT=$((UPDATED_COUNT + 1))
      fi
    fi
  else
    echo -e "  ${GREEN}+${NC} $skill_name ${GREEN}(новый)${NC}"
    if ! $DRY_RUN; then
      mkdir -p "$target_skill_dir"
      cp -r "$skill_dir"* "$target_skill_dir/"
    fi
    INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  fi
done

# --- Итог ---
echo ""
echo -e "${BOLD}Итог:${NC}"
echo -e "  Всего скиллов:    ${BOLD}$SKILL_COUNT${NC}"
echo -e "  ${GREEN}Установлено:      $INSTALLED_COUNT${NC}"
echo -e "  ${YELLOW}Обновлено:        $UPDATED_COUNT${NC}"
echo -e "  ${BLUE}Актуальных:       $SKIPPED_COUNT${NC}"
echo ""

if $DRY_RUN; then
  echo -e "${YELLOW}Это был режим просмотра. Для реальной установки запусти без --dry-run${NC}"
else
  echo -e "${GREEN}${BOLD}✓ Установка завершена!${NC}"
  echo ""
  echo -e "Скиллы установлены в: ${BOLD}$TARGET_DIR${NC}"
  echo ""
  echo -e "${BOLD}Следующие шаги:${NC}"
  echo -e "  1. Перезапусти Roo Code (или перезагрузи окно VS Code)"
  echo -e "  2. Скиллы будут доступны автоматически во всех проектах"
  echo -e "  3. Попроси Roo: ${BOLD}\"Используй скилл using-superpowers\"${NC}"
fi