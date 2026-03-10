#!/bin/bash
set -euo pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# === BINARIES ===

DOCKER=/usr/bin/docker
MKDIR=/bin/mkdir
TAR=/usr/bin/tar
DATE=/bin/date
ECHO=/bin/echo
FIND=/usr/bin/find
SLEEP=/bin/sleep

# === CONFIGURATION ===
CONTAINER_NAME="javamc"
SERVER_DIR="/home/adrian/dockerfiles/javamc"
WORLD_NAME="Bedrock_level_v2"
BACKUP_DIR="$SERVER_DIR/backups"

# === SETUP ===
TIMESTAMP=$(date +"%Y.%m.%d.%H.%M.%S")
BACKUP_FILE="$BACKUP_DIR/$TIMESTAMP.tar.gz"

PRINT_DATE=$(date +"%m/%d/%Y at %H:%M:%S")
$ECHO "=== Running at $PRINT_DATE ==="

# Ensure backup directory exists
$ECHO "Checking for backup directory"
$MKDIR -p "$BACKUP_DIR"

# === DISABLE SAVES INSIDE CONTAINER ===

$ECHO "Disabling world saves"
$DOCKER exec "$CONTAINER_NAME" rcon-cli save-off
$DOCKER exec "$CONTAINER_NAME" rcon-cli save-all
sleep 5  # Wait for the server to process the save commands

# === CREATE BACKUP ===
$ECHO "Making backup tar.gz file"
$TAR -czf "$BACKUP_FILE" -C "${SERVER_DIR}/data" \
    "$WORLD_NAME" \

# === RE-ENABLE AUTO-SAVES ===
$ECHO "Re-enabling auto saves"
$DOCKER exec "$CONTAINER_NAME" rcon-cli save-on

$ECHO "Backup completed: $BACKUP_FILE"
$ECHO ""

# === DELETE OLD BACKUPS (older than 7 days) ===

$ECHO "Removing backups older than 7 days"
$FIND "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -print -delete

$ECHO ""

