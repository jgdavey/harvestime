Harvestime
==========

This library is a very lightweight time calculator for time-tracking in
plain-text. The library expects a very specific format for tracking time:

```
  Monday August 8, 2011
  =====================

  09:00 - 09:08  0:08 Description of task
  14:23 - 15:33  1:10 Another task
```

Each log entry has the the following format:

```
  HH:MM - HH:MM HH:MM Description
```

Where the first time is the start time, the second is the end time, and
the third is the total amount of time spent (the difference between the
two). Time is kept using a 24-hour clock. Descriptions can be anything
you want. The time difference is space-padded instead of 0-padded. Thus,
the columns should *always* line up.

Vim integration
---------------

To aid with time-tracking this library provides a small vim plugin. To
install, use pathogen and clone this repository into your vim bundle
directory.

The default mapping is \<leader>t. On a blank line in normal mode, type
\<leader>t and the current timestamp will be inserted. When you are done
with a task, type \<leader>t again. This will insert the timestamp again.

A third invocation of the plugin will calculate the time difference
between the start and end times and insert it after the time range.

The plugin is simple, but it will allow you to have a description on the
line at any phase, and should leave it intact when inserting timestamps.
