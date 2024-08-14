#! /bin/bash

function check_dependencies() {
	command -v wget >/dev/null 2>&1 || { echo "wget is not installed. Aborting." >&2; exit 1; }
}
