// Headless mGBA 0.10.5 runner with the same Lua scripting API as the Qt frontend's Tools > Scripting.
// usage: frank_mgba ROM SCRIPT.lua [--frames N] [--fast]
// Runs the core, triggers the script "frame" callback after every video frame (as mCoreThread does),
// paces to 59.7275 fps unless --fast. No window; screenshots come from emu:screenshot in the script.
#include <mgba/flags.h>
#include <mgba/core/core.h>
#include <mgba/core/log.h>
#include <mgba/core/scripting.h>
#include <mgba/script/context.h>
#include <mgba-util/vfs.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

static void logfn(struct mLogger* l, int cat, enum mLogLevel level, const char* fmt, va_list args) {
	(void) l;
	if (!(level & (mLOG_INFO | mLOG_WARN | mLOG_ERROR | mLOG_FATAL))) return;
	const char* name = mLogCategoryName(cat);
	if (!name || (strcmp(name, "Scripting") && !(level & (mLOG_ERROR | mLOG_FATAL)))) return;
	fprintf(stderr, "[%s] ", name);
	vfprintf(stderr, fmt, args);
	fputc('\n', stderr);
	fflush(stderr);
}

static struct mScriptContext ctx;
static void onFrame(void* c) { (void) c; mScriptContextTriggerCallback(&ctx, "frame"); }

static double now(void) {
	struct timespec ts;
	clock_gettime(CLOCK_MONOTONIC, &ts);
	return ts.tv_sec + ts.tv_nsec / 1e9;
}

int main(int argc, char** argv) {
	if (argc < 3) {
		fprintf(stderr, "usage: %s ROM SCRIPT.lua [--frames N] [--fast]\n", argv[0]);
		return 2;
	}
	long frames = -1;
	int fast = 0;
	for (int i = 3; i < argc; ++i) {
		if (!strcmp(argv[i], "--frames") && i + 1 < argc) frames = atol(argv[++i]);
		else if (!strcmp(argv[i], "--fast")) fast = 1;
	}
	struct mLogger logger = { .log = logfn };
	mLogSetDefaultLogger(&logger);
	struct mCore* core = mCoreFind(argv[1]);
	if (!core || !core->init(core)) { fprintf(stderr, "no core for %s\n", argv[1]); return 1; }
	mCoreInitConfig(core, NULL);
	unsigned w, h;
	core->desiredVideoDimensions(core, &w, &h);
	color_t* buf = calloc(w * h, sizeof(color_t));
	core->setVideoBuffer(core, buf, w);
	if (!mCoreLoadFile(core, argv[1])) { fprintf(stderr, "cannot load %s\n", argv[1]); return 1; }
	core->reset(core);

	mScriptContextInit(&ctx);
	mScriptContextAttachStdlib(&ctx);
	mScriptContextAttachSocket(&ctx);
	mScriptContextRegisterEngines(&ctx);
	mScriptContextAttachCore(&ctx, core);
	mScriptContextAttachLogger(&ctx, &logger);
	struct mCoreCallbacks cbs = { .videoFrameEnded = onFrame, .context = NULL };
	core->addCoreCallbacks(core, &cbs);
	struct mScriptEngineContext* lua = HashTableLookup(&ctx.engines, "lua");
	struct VFile* svf = VFileOpen(argv[2], O_RDONLY);
	if (!lua || !svf || !lua->load(lua, argv[2], svf) || !lua->run(lua)) {
		const char* err = lua && lua->getError ? lua->getError(lua) : NULL;
		fprintf(stderr, "script failed: %s %s\n", argv[2], err ? err : "");
		return 1;
	}
	svf->close(svf);
	fprintf(stderr, "frank_mgba: running %s with %s%s\n", argv[1], argv[2], fast ? " (fast)" : "");

	const double period = 1.0 / 59.7275;
	double next = now();
	for (long f = 0; frames < 0 || f < frames; ++f) {
		core->runFrame(core);
		if (!fast) {
			next += period;
			double d = next - now();
			if (d > 0) usleep((useconds_t) (d * 1e6));
			else if (d < -0.5) next = now();
		}
	}
	mScriptContextDetachCore(&ctx);
	mScriptContextDeinit(&ctx);
	core->deinit(core);
	free(buf);
	return 0;
}
