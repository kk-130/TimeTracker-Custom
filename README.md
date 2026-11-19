# TimeTracker User Guide — English

Updated: 2026-11-18. This guide applies to the latest `TimeTracker_Custom.exe` in this folder.

The interface uses English. Task descriptions, custom categories and the window title can contain Chinese or other languages. The complete Chinese guide follows the English section.

## 1. Starting and quitting

- Double-click `TimeTracker_Custom.exe` to run the app. No Python installation or VBS script is required. `启动最新版.bat` also launches the EXE in the same folder.
- Only one instance can run at a time. If double-clicking does not open a new window, check the Windows system tray and click the app icon or choose **Show**.
- Closing the window normally hides it to the tray. To exit completely, choose **Quit** from the tray menu.
- Before quitting or switching versions, use **Record** to save any active timer session.

## 2. Timing and manual records

**Start** is above **Record**.

- Click **Start** to begin timing. While the timer is running, click **Record**, enter a category and task description, and click **Save** to record the session.
- Clicking **Cancel** in the session dialog does not save a record; the original timer continues running.
- When no timer is running, **Record** lets you add a past session manually. Set the full start and end dates and times, then enter a category and description—for example, work completed from 11:00 to 13:00.
- The end time must be later than the start time. Saved records can be viewed and edited in the calendar or **Task Details**.

## 3. Calendar, plans and statistics

- **Month / Week / Day** switches between calendar views. Use the date selector to jump to another date.
- The calendar supports plans, including recurring and all-day plans. Plans and actual timer records are separate types of data.
- Hold **Ctrl** or **Alt** while dragging an existing calendar item to copy it. Month view preserves its original time of day; week and day views use the drop position to set the copied time.
- In week and day views, drag an item's edge to adjust its duration. Double-click an item to edit it.
- **Stats / Work Summary** shows category totals and daily, weekly or monthly trends.
- Statistics currently add together plans and actual records. A plan and an actual record covering the same period can therefore be counted twice. Copying an actual record also adds to recorded time.

## 4. Tasks

### Creating and editing tasks

Click **Add** to create a task with:

- **Task description**: what needs to be done.
- **Task scope**: `day / week / month / custom`.
- **Start date**: the task's start date.
- **Deadline**: a customizable due date and time.
- **Priority**: the importance level, explained below.

Weekly tasks suggest a deadline on Sunday of the selected week; monthly tasks suggest the end of the selected month. You can change the actual deadline. Task scopes are categories and do not generate recurring tasks automatically. Use calendar plans for recurring schedules.

Use **All / Day / Week / Month / Custom** to filter tasks by scope. Double-click a task to edit it, or right-click and choose **Edit** or **Delete**.

### Completing and reopening tasks

In the gear menu, **Task completion** offers two modes:

1. **Click the Done cell (default)**: click anywhere inside the task's **Done** cell.
2. **Click anywhere in the task row**: click any cell in the task row.

An unfinished task has an empty Done cell. A completed task shows a check mark and the entire row turns gray. Click again to mark it unfinished. A short delay distinguishes single-click completion from double-click editing. Column headers do not temporarily become bold when a task is selected.

Unfinished tasks remain in the list after midnight or after their Deadline; they are not deleted automatically.

### Priority and fonts

**Priority** has four levels: **Default / Low / Medium / High**. When creating or editing a task, you can choose the current level's font color, size (8–32 pt), and **Bold** setting, with a live **Preview**.

Click **Save** to save both the task and the font settings for that priority. The settings are loaded automatically whenever you select the same priority, and existing tasks with that priority are updated too. **Cancel** discards the changes.

Completed tasks stay gray but retain their configured font size and weight. Tasks created before priority support use Default.

## 5. Recycle Bin

Click the trash icon after **Add** to open **Recycle Bin**.

- **Automatic removal**: completed tasks move out of Tasks after the local calendar day on which they were completed ends, regardless of their Deadline.
- **Manual removal**: right-click **Delete** and confirm to move a task to the Recycle Bin rather than delete it permanently.
- **Midnight checks**: cleanup runs at the day change and periodically while the app is running. If the app was closed at midnight, cleanup runs on the next launch.
- **Older records**: completed tasks from older versions that have no completion timestamp are treated as completed on the upgrade day. They stay visible until that day ends.

Items are grouped by their actual deletion date, newest date first. Items within a date are also ordered newest first. Under **Reason**, **Completed** means automatic cleanup and **Manual** means manual deletion.

### Retention

The default retention is **7 days**, measured from the time a task enters the Recycle Bin. Set **Keep deleted tasks for** to 1–365 days and click **Apply** to change it.

Expired items are permanently removed and cannot be restored through the app. Shortening retention may immediately remove older items; the app asks for confirmation.

### Restoring tasks

Select one or more tasks and click **Restore Selected**. They return as unfinished tasks, preserving their descriptions, scopes, dates, Deadlines and priorities. Resetting completion prevents them from being immediately removed again because of an old completion date.

If a restored task is not visible in Tasks, check the scope filter at the top.

## 6. Settings

Click the gear in the upper-right corner to open **Settings**. Click **Save** to apply changes or **Cancel** to discard them.

- **Theme, Colors and Categories...** opens theme color, opacity and category settings.
- **Window title** changes the title. Titles containing Chinese use SimHei; English-only titles retain the original font.
- **Window layer**: **Desktop** keeps the window at the desktop layer; **Normal** behaves as a normal window and supports minimizing and restoring; **Always on Top** keeps it above other ordinary windows.
- **Background path / Choose Background Image** selects a background, centered and cropped to fill the window. The image is copied into the app's data directory. Clear the path to restore the default background.
- Panel checkboxes show or hide the calendar, timer, statistics, Tasks, legacy to-do list and task details.
- **Task completion** selects how clicking completes a task.
- **Launch at startup** controls startup at Windows sign-in, as described below.

Drag the dividers between panels to resize them. The layout is saved automatically. Panel positions are fixed, and minimum sizes keep controls usable.

**Legacy to-do list** preserves the original to-do data separately from the newer Tasks panel. The Recycle Bin rules in this guide apply to Tasks.

## 7. Windows startup and moving the folder

Use **Launch at startup** inside the app. You do not need to place a VBS script in the Windows Startup folder.

- Check it and click **Save** to register startup for the current Windows user. At sign-in, the app opens its main window using the last saved Window layer.
- Uncheck it and click **Save** to remove the startup entry managed by the app.
- When enabled, seeing TimeTracker_Custom.exe in Task Manager's **Startup apps** is normal. If you manually disable it there, you must enable it there again.

You can move or rename the app folder. Recommended steps:

1. Save any active timer session, uncheck Launch at startup and click Save, then choose Quit from the tray.
2. Move or rename the folder.
3. Run TimeTracker_Custom.exe from its new location, check Launch at startup again, and click Save.
4. Recreate any shortcuts that still point to the old location.

Startup stores the EXE's full path, so it must be updated after a move. Do not also create a separate VBS or another startup entry, which would create duplicate launch entries.

## 8. Data, backups and sharing

User data is stored separately in:

```text
%LOCALAPPDATA%\TimeTrackerGlass
```

This directory contains the `tracker.db` database, settings and copied background images. Moving the app folder does not move or delete this data.

Exit the app completely before backing up the entire data directory. Copying only the EXE or app folder does not back up your records.

To share the app, provide only the latest **TimeTracker_Custom.exe**. It is a standalone app for 64-bit Intel/AMD Windows and does not require Python. Sharing the EXE does not include your records, backgrounds or settings. Other users can enable startup on their own computers.

An active timer session that has not been saved has no crash recovery. Use Record to save it promptly.

## 9. Files and further development

| File | Purpose |
| --- | --- |
| `TimeTracker_Custom.exe` | Latest standalone app; the only file ordinary users need |
| `main.py` | Corresponding source code for further development |
| `requirements.txt` | Dependencies for running the source |
| `icon.png` | Icon used by the source and build |
| `TimeTracker_Custom.spec` | PyInstaller configuration; finds the source and icon relative to the configuration file |
| `Time Tracker Custom.vbs` | Previous fallback script; not required by the current version, and its old path does not automatically follow a folder move |
| `__pycache__` | Python cache; not required by the standalone EXE |

Python is needed only for running the source or building the app. From this folder, run:

```text
python -m pip install -r requirements.txt
python main.py
```

To build an EXE, also install PyInstaller:

```text
python -m pip install pyinstaller
python -m PyInstaller TimeTracker_Custom.spec
```

The generated EXE is normally placed in `dist`. Save active timing and quit the app from the tray before replacing the version in use.

---

# TimeTracker 使用说明 — 中文

说明更新日期：2026-11-18。适用于本文件夹中的最新版 TimeTracker_Custom.exe。

程序界面使用英文；下文保留英文按钮名称，便于查找。自己填写的任务内容、自定义分类和窗口标题可以使用中文或其他语言。

## 1. 启动和退出

- 双击 `TimeTracker_Custom.exe` 即可运行，无需安装 Python，也无需 VBS 脚本。
- 程序只允许同时运行一个实例。如果双击后没有新窗口，请检查右下角系统托盘，点击程序图标或选择 **Show**。
- 关闭窗口通常只是隐藏到托盘。要完全退出，请在托盘菜单中选择 **Quit**。
- 退出或更换版本前，请先用 **Record** 保存正在进行的计时。

## 2. 计时和补记

**Start** 在上，**Record** 在下。

- 点击 **Start** 开始计时；计时期间点击 **Record**，填写分类和任务内容，点击 **Save** 保存本次记录。
- 计时记录对话框点击 **Cancel** 时，不保存记录，原计时继续。
- 没有正在进行的计时时，点击 **Record** 可以手动补记。选择完整的开始、结束日期和时间，再填写分类及内容，例如补记 11:00–13:00 的工作。
- 结束时间必须晚于开始时间。已保存记录可在日历或 **Task Details** 中查看和编辑。

## 3. 日历、计划和统计

- **Month / Week / Day** 切换月、周、日视图；可通过日期选择功能跳转日期。
- 日历可创建计划，支持重复计划和全天计划。计划与实际计时记录是两种不同的数据。
- 在日历中按住 **Ctrl** 或 **Alt** 拖动已有项目，可以复制。月视图保持原项目的时间段；周、日视图按落点时间复制。
- 周、日视图中拖动项目边缘可调整时间长度；双击项目可编辑。
- **Stats / Work Summary** 提供分类时长和日、周、月趋势。
- 当前统计会共同累计计划和实际记录。若同一时间段同时存在计划和实际记录，可能重复累计；复制实际记录也会增加实际记录的统计时长。

## 4. Tasks 任务清单

### 新建和编辑

点击 **Add** 新建任务，可设置：

- **Task description**：任务内容。
- **Task scope**：`day / week / month / custom`，即日、周、月或自定义任务类型。
- **Start date**：开始日期。
- **Deadline**：截止日期和时间，可自定义。
- **Priority**：重要程度，见下一节。

周任务默认建议截至该周周日，月任务默认建议截至月底；可以修改实际截止日期。任务类型用于分类，不会自动生成重复任务。重复计划请使用日历中的计划功能。

顶部 **All / Day / Week / Month / Custom** 用于筛选任务类型。双击任务可编辑，右键可选择 **Edit** 或 **Delete**。

### 完成和撤销完成

齿轮设置中的 **Task completion** 提供两种方式：

1. **Click the Done cell (default)**：默认方式，点击 **Done** 列单元格的任意位置。
2. **Click anywhere in the task row**：点击任务行的任意单元格。

未完成时 Done 列为空；完成后显示对号，整行变灰。再次点击可撤销完成。为区分单击完成和双击编辑，单击后会有短暂延迟。表头不会随选择临时加粗。

未完成任务不会因为跨天或超过 Deadline 而自动删除，仍会保留在清单中。

### 重要程度和字体

**Priority** 有 **Default / Low / Medium / High** 四档。新建、编辑任务时可设置当前档位的字体颜色、字号（8–32 pt）以及 **Bold** 加粗，并查看 **Preview**。

点击 **Save** 同时保存任务和该档位的字体配置：以后选择相同档位时会自动载入，已有同档任务也会统一更新。点击 **Cancel** 不保存更改。

已完成任务仍显示为灰色，保留所选字号和字重。升级前的旧任务归入 Default。

## 5. Recycle Bin 回收站

**Add** 后面的垃圾桶图标打开 **Recycle Bin**。

- **自动移入**：任务完成的当地自然日结束后，会自动从 Tasks 移入回收站，与 Deadline 无关。
- **手动移入**：右键选择 **Delete** 并确认，也会移入回收站，不会立即永久删除。
- **跨日处理**：程序在跨日及运行期间定期检查；如果午夜没有运行，下次启动时补做清理。
- **旧数据兼容**：没有完成时间的旧版已完成任务，按升级当天完成处理，保留至当天结束后再移入回收站。

回收站按实际删除日期分组，日期从近到远，同一天内也按删除时间从近到远排列。**Reason** 中的 **Completed** 表示完成后自动移入，**Manual** 表示手动删除。

### 保留时间

默认保留 **7 天**，从移入回收站的时间起计算。可以在 **Keep deleted tasks for** 中设置 1–365 天，点击 **Apply** 应用。

超过保留时间的任务会被永久清除，不能再通过程序恢复。缩短保留时间可能立即清除较早的任务，程序会要求确认。

### 恢复任务

选中一个或多个任务，点击 **Restore Selected**。任务会恢复为未完成状态，并保留内容、任务类型、日期、Deadline 和重要程度，避免因旧的完成时间被立即再次清理。

如果恢复后没有在 Tasks 中看到它，请检查顶部任务类型筛选。

## 6. 齿轮设置

点击右上角齿轮打开 **Settings**，修改后点击 **Save**；点击 **Cancel** 不提交本次设置。

- **Theme, Colors and Categories...**：进入主题颜色、透明度及分类设置。
- **Window title**：修改标题；中文标题使用黑体，纯英文保持原字体。
- **Window layer**：**Desktop** 显示在桌面层；**Normal** 是普通窗口，可最小化、还原；**Always on Top** 保持在其他普通窗口上方。
- **Background path / Choose Background Image**：选择背景图，采用居中裁切铺满。图片会复制到应用数据目录；清空路径可恢复默认背景。
- 模块复选框：显示或隐藏日历、计时器、统计、Tasks、旧版待办和记录详情。
- **Task completion**：选择任务完成方式。
- **Launch at startup**：控制开机登录启动，见下一节。

拖动模块之间的分隔条可调整大小，布局自动保存。模块位置固定，并保留最小尺寸以保证可操作。

**Legacy to-do list** 是保留旧数据的原版待办，和新版 Tasks 分别管理；本说明的回收站规则针对新版 Tasks。

## 7. 开机自启动与移动文件夹

只需使用程序内的 **Launch at startup**，不需要将 VBS 放入启动文件夹。

- 勾选并点击 **Save**：在当前 Windows 用户下注册自启动。登录 Windows 后会打开主窗口，并沿用上次保存的 Window layer。
- 取消勾选并点击 **Save**：移除程序管理的自启动项。
- 启用后，任务管理器的 **Startup apps** 中出现 TimeTracker_Custom.exe 是正常现象。如果在那里手动禁用了它，需要在那里重新启用。

可以移动、重命名程序文件夹。建议按以下步骤操作：

1. 保存正在进行的计时，取消 Launch at startup 并 Save，再从托盘 Quit。
2. 移动或重命名文件夹。
3. 从新位置运行 TimeTracker_Custom.exe，重新勾选 Launch at startup 并 Save。
4. 如有旧快捷方式，重新创建。

自启动使用 EXE 的完整路径；更新路径后才能从新位置启动。请勿同时另设 VBS 或其他启动项，以免产生重复入口。

## 8. 数据、备份和分享

使用数据独立保存在：

```text
%LOCALAPPDATA%\TimeTrackerGlass
```

其中包含 `tracker.db` 数据库、设置和已复制的背景图片。移动程序文件夹不会移动或删除这些数据。

建议完全退出程序后，备份整个数据目录。仅复制 EXE 或程序文件夹，不等于备份使用记录。

分享给其他人时，只需提供最新版 **TimeTracker_Custom.exe**。它是 Windows 64 位 Intel/AMD 独立程序，不需要 Python；不会携带你的使用记录、背景和设置。其他用户可在自己的电脑上开启自启动。

未保存的正在计时数据没有崩溃恢复功能，请及时 Record 保存。

## 9. 文件用途与后续开发

| 文件 | 用途 |
| --- | --- |
| `TimeTracker_Custom.exe` | 独立运行的最新版程序；普通用户只需要此文件 |
| `main.py` | 对应源码，供后续开发 |
| `requirements.txt` | 源码运行所需依赖 |
| `icon.png` | 源码及打包使用的图标 |
| `TimeTracker_Custom.spec` | PyInstaller 打包配置，按配置文件所在位置寻找源码和图标 |
| `启动最新版.bat` | 启动同文件夹中的 EXE 的便捷入口 |
| `Time Tracker Custom.vbs` | 之前的备用脚本；当前版本无需使用，其中的旧路径也不会随文件夹移动自动更新 |
| `__pycache__` | Python 缓存，不是独立 EXE 的运行依赖 |

只有运行源码或重新打包时才需要安装 Python。在本文件夹中执行：

```text
python -m pip install -r requirements.txt
python main.py
```

重新打包还需安装 PyInstaller：

```text
python -m pip install pyinstaller
python -m PyInstaller TimeTracker_Custom.spec
```

生成的 EXE 通常位于 `dist` 目录。替换正在使用的版本前，应先保存计时并从托盘退出。

