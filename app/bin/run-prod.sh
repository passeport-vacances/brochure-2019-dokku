#!/bin/sh

gunicorn -w 4 -t 120 brochure.api:app -b 0.0.0.0:${PORT:-5000}
