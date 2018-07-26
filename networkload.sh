#!/bin/bash
nc -vvlnp 12345 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12345 &
nc -vvlnp 12346 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12346 &
nc -vvlnp 12347 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12347 &
nc -vvlnp 12348 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12348 &
nc -vvlnp 12349 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12349 &
nc -vvlnp 12350 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12350 &
nc -vvlnp 12351 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12351 &
nc -vvlnp 12352 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12352 &
nc -vvlnp 12353 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12353 &
nc -vvlnp 12354 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12354 &
nc -vvlnp 12355 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12355 &
nc -vvlnp 12356 >/dev/null & dd if=/dev/zero bs=10M count=100K | nc -vvn 127.0.0.1 12356 &
