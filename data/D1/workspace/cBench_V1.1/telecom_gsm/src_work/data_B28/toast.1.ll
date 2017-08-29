; ModuleID = 'toast.ll'
source_filename = "toast.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fmtdesc = type { i8*, i8*, i8*, i32 ()*, i32 ()*, i32 (i16*)*, i32 (i16*)* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.gsm_state = type opaque
%struct.utimbuf = type { i64, i64 }

@f_decode = local_unnamed_addr global i32 0, align 4
@f_cat = local_unnamed_addr global i32 0, align 4
@f_force = local_unnamed_addr global i32 0, align 4
@f_precious = local_unnamed_addr global i32 0, align 4
@f_fast = global i32 0, align 4
@f_verbose = global i32 0, align 4
@.str = private unnamed_addr constant [6 x i8] c"audio\00", align 1
@.str.1 = private unnamed_addr constant [50 x i8] c"8 kHz, 8 bit u-law encoding with Sun audio header\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c".au\00", align 1
@f_audio = global %struct.fmtdesc { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 ()* @audio_init_input, i32 ()* @audio_init_output, i32 (i16*)* @ulaw_input, i32 (i16*)* @ulaw_output }, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"u-law\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"plain 8 kHz, 8 bit u-law encoding\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c".u\00", align 1
@f_ulaw = global %struct.fmtdesc { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 ()* @generic_init, i32 ()* @generic_init, i32 (i16*)* @ulaw_input, i32 (i16*)* @ulaw_output }, align 8
@.str.6 = private unnamed_addr constant [6 x i8] c"A-law\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"8 kHz, 8 bit A-law encoding\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c".A\00", align 1
@f_alaw = global %struct.fmtdesc { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i32 ()* @generic_init, i32 ()* @generic_init, i32 (i16*)* @alaw_input, i32 (i16*)* @alaw_output }, align 8
@.str.9 = private unnamed_addr constant [7 x i8] c"linear\00", align 1
@.str.10 = private unnamed_addr constant [44 x i8] c"16 bit (13 significant) signed 8 kHz signal\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c".l\00", align 1
@f_linear = global %struct.fmtdesc { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i32 ()* @generic_init, i32 ()* @generic_init, i32 (i16*)* @linear_input, i32 (i16*)* @linear_output }, align 8
@alldescs = global [5 x %struct.fmtdesc*] [%struct.fmtdesc* @f_audio, %struct.fmtdesc* @f_alaw, %struct.fmtdesc* @f_ulaw, %struct.fmtdesc* @f_linear, %struct.fmtdesc* null], align 16
@f_format = local_unnamed_addr global %struct.fmtdesc* null, align 8
@.str.12 = private unnamed_addr constant [13 x i8] c"fcdpvhuaslVF\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.13 = private unnamed_addr constant [51 x i8] c"Usage: %s [-fcpdhvuaslF] [files...] (-h for help)\0A\00", align 1
@progname = common local_unnamed_addr global i8* null, align 8
@optind = external local_unnamed_addr global i32, align 4
@instat = common global %struct.stat zeroinitializer, align 8
@in = common local_unnamed_addr global %struct._IO_FILE* null, align 8
@out = common local_unnamed_addr global %struct._IO_FILE* null, align 8
@inname = common local_unnamed_addr global i8* null, align 8
@outname = common local_unnamed_addr global i8* null, align 8
@output = common local_unnamed_addr global i32 (i16*)* null, align 8
@input = common local_unnamed_addr global i32 (i16*)* null, align 8
@init_input = common local_unnamed_addr global i32 ()* null, align 8
@init_output = common local_unnamed_addr global i32 ()* null, align 8
@.str.14 = private unnamed_addr constant [6 x i8] c"toast\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"un\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"cat\00", align 1
@.str.17 = private unnamed_addr constant [54 x i8] c"%s: only one of -[uals] is possible (%s -h for help)\0A\00", align 1
@.str.18 = private unnamed_addr constant [20 x i8] c"%s 1.0, version %s\0A\00", align 1
@.str.19 = private unnamed_addr constant [58 x i8] c"$Id: toast.c,v 1.1.1.1 2000/11/06 19:54:26 mguthaus Exp $\00", align 1
@.str.20 = private unnamed_addr constant [37 x i8] c"Usage: %s [-fcpdhvaulsF] [files...]\0A\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.22 = private unnamed_addr constant [54 x i8] c" -f  force     Replace existing files without asking\0A\00", align 1
@.str.23 = private unnamed_addr constant [60 x i8] c" -c  cat       Write to stdout, do not remove source files\0A\00", align 1
@.str.24 = private unnamed_addr constant [48 x i8] c" -d  decode    Decode data (default is encode)\0A\00", align 1
@.str.25 = private unnamed_addr constant [41 x i8] c" -p  precious  Do not delete the source\0A\00", align 1
@.str.26 = private unnamed_addr constant [57 x i8] c" -u  u-law     Force 8 kHz/8 bit u-law in/output format\0A\00", align 1
@.str.27 = private unnamed_addr constant [53 x i8] c" -s  sun .au   Force Sun .au u-law in/output format\0A\00", align 1
@.str.28 = private unnamed_addr constant [57 x i8] c" -a  A-law     Force 8 kHz/8 bit A-law in/output format\0A\00", align 1
@.str.29 = private unnamed_addr constant [53 x i8] c" -l  linear    Force 16 bit linear in/output format\0A\00", align 1
@.str.30 = private unnamed_addr constant [53 x i8] c" -F  fast      Sacrifice conformance to performance\0A\00", align 1
@.str.31 = private unnamed_addr constant [41 x i8] c" -v  version   Show version information\0A\00", align 1
@.str.32 = private unnamed_addr constant [32 x i8] c" -h  help      Print this text\0A\00", align 1
@.str.33 = private unnamed_addr constant [17 x i8] c"%s: error %s %s\0A\00", align 1
@.str.34 = private unnamed_addr constant [18 x i8] c"writing header to\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"reading header from\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str.37 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.38 = private unnamed_addr constant [24 x i8] c"%s: error writing \22%s\22\0A\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.39 = private unnamed_addr constant [30 x i8] c"%s: source \22%s\22 not deleted.\0A\00", align 1
@.str.40 = private unnamed_addr constant [27 x i8] c"%s: could not unlink \22%s\22\0A\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c".gsm\00", align 1
@.str.42 = private unnamed_addr constant [46 x i8] c"%s: %s already has \22%s\22 suffix -- unchanged.\0A\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.44 = private unnamed_addr constant [34 x i8] c"%s: cannot open \22%s\22 for reading\0A\00", align 1
@.str.45 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.46 = private unnamed_addr constant [40 x i8] c"%s: failed to malloc %d bytes -- abort\0A\00", align 1
@.str.47 = private unnamed_addr constant [22 x i8] c"%s: cannot stat \22%s\22\0A\00", align 1
@.str.48 = private unnamed_addr constant [46 x i8] c"%s: \22%s\22 is not a regular file -- unchanged.\0A\00", align 1
@.str.49 = private unnamed_addr constant [44 x i8] c"%s: \22%s\22 has %s other link%s -- unchanged.\0A\00", align 1
@.str.50 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.51 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.52 = private unnamed_addr constant [33 x i8] c"%s: can't open \22%s\22 for writing\0A\00", align 1
@.str.53 = private unnamed_addr constant [48 x i8] c"%s: filename \22%s\22 is too long (maximum is %ld)\0A\00", align 1
@.str.54 = private unnamed_addr constant [58 x i8] c"%s already exists; do you wish to overwrite %s (y or n)? \00", align 1
@.str.55 = private unnamed_addr constant [18 x i8] c"\09not overwritten\0A\00", align 1
@.str.56 = private unnamed_addr constant [50 x i8] c"%s: incomplete frame (%d byte%s missing) from %s\0A\00", align 1
@.str.57 = private unnamed_addr constant [21 x i8] c"%s: bad frame in %s\0A\00", align 1
@.str.58 = private unnamed_addr constant [25 x i8] c"%s: error writing to %s\0A\00", align 1
@.str.59 = private unnamed_addr constant [27 x i8] c"%s: error reading from %s\0A\00", align 1
@.str.60 = private unnamed_addr constant [40 x i8] c"%s: could not change file mode of \22%s\22\0A\00", align 1
@str = private unnamed_addr constant [53 x i8] c" -f  force     Replace existing files without asking\00"
@str.1 = private unnamed_addr constant [59 x i8] c" -c  cat       Write to stdout, do not remove source files\00"
@str.2 = private unnamed_addr constant [47 x i8] c" -d  decode    Decode data (default is encode)\00"
@str.3 = private unnamed_addr constant [40 x i8] c" -p  precious  Do not delete the source\00"
@str.4 = private unnamed_addr constant [56 x i8] c" -u  u-law     Force 8 kHz/8 bit u-law in/output format\00"
@str.5 = private unnamed_addr constant [52 x i8] c" -s  sun .au   Force Sun .au u-law in/output format\00"
@str.6 = private unnamed_addr constant [56 x i8] c" -a  A-law     Force 8 kHz/8 bit A-law in/output format\00"
@str.7 = private unnamed_addr constant [52 x i8] c" -l  linear    Force 16 bit linear in/output format\00"
@str.8 = private unnamed_addr constant [52 x i8] c" -F  fast      Sacrifice conformance to performance\00"
@str.9 = private unnamed_addr constant [40 x i8] c" -v  version   Show version information\00"
@str.10 = private unnamed_addr constant [31 x i8] c" -h  help      Print this text\00"

declare i32 @audio_init_input() #0

declare i32 @audio_init_output() #0

declare i32 @ulaw_input(i16*) #0

declare i32 @ulaw_output(i16*) #0

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @generic_init() #1 {
  ret i32 0
}

declare i32 @alaw_input(i16*) #0

declare i32 @alaw_output(i16*) #0

declare i32 @linear_input(i16*) #0

declare i32 @linear_output(i16*) #0

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) local_unnamed_addr #2 {
  %3 = load i8*, i8** %1, align 8
  tail call fastcc void @parse_argv0(i8* %3)
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %2
  %4 = tail call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i64 0, i64 0)) #11
  switch i32 %4, label %17 [
    i32 -1, label %21
    i32 100, label %5
    i32 102, label %6
    i32 99, label %7
    i32 112, label %8
    i32 70, label %9
    i32 86, label %10
    i32 117, label %11
    i32 108, label %12
    i32 97, label %13
    i32 115, label %14
    i32 118, label %15
    i32 104, label %16
  ]

; <label>:5:                                      ; preds = %.backedge
  store i32 1, i32* @f_decode, align 4
  br label %.backedge.backedge

; <label>:6:                                      ; preds = %.backedge
  store i32 1, i32* @f_force, align 4
  br label %.backedge.backedge

; <label>:7:                                      ; preds = %.backedge
  store i32 1, i32* @f_cat, align 4
  br label %.backedge.backedge

; <label>:8:                                      ; preds = %.backedge
  store i32 1, i32* @f_precious, align 4
  br label %.backedge.backedge

; <label>:9:                                      ; preds = %.backedge
  store i32 1, i32* @f_fast, align 4
  br label %.backedge.backedge

; <label>:10:                                     ; preds = %.backedge
  store i32 1, i32* @f_verbose, align 4
  br label %.backedge.backedge

; <label>:11:                                     ; preds = %.backedge
  tail call fastcc void @set_format(%struct.fmtdesc* nonnull @f_ulaw)
  br label %.backedge.backedge

; <label>:12:                                     ; preds = %.backedge
  tail call fastcc void @set_format(%struct.fmtdesc* nonnull @f_linear)
  br label %.backedge.backedge

; <label>:13:                                     ; preds = %.backedge
  tail call fastcc void @set_format(%struct.fmtdesc* nonnull @f_alaw)
  br label %.backedge.backedge

; <label>:14:                                     ; preds = %.backedge
  tail call fastcc void @set_format(%struct.fmtdesc* nonnull @f_audio)
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %14, %13, %12, %11, %10, %9, %8, %7, %6, %5
  br label %.backedge

; <label>:15:                                     ; preds = %.backedge
  tail call fastcc void @version()
  tail call void @exit(i32 0) #12
  unreachable

; <label>:16:                                     ; preds = %.backedge
  tail call fastcc void @help()
  tail call void @exit(i32 0) #12
  unreachable

; <label>:17:                                     ; preds = %.backedge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** @progname, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.13, i64 0, i64 0), i8* %19) #13
  tail call void @exit(i32 1) #12
  unreachable

; <label>:21:                                     ; preds = %.backedge
  %22 = load i32, i32* @f_cat, align 4
  %23 = load i32, i32* @f_precious, align 4
  %24 = or i32 %23, %22
  store i32 %24, i32* @f_precious, align 4
  %25 = load i32, i32* @optind, align 4
  %26 = sub nsw i32 %0, %25
  tail call fastcc void @catch_signals()
  %27 = icmp slt i32 %26, 1
  br i1 %27, label %28, label %.lr.ph

; <label>:28:                                     ; preds = %21
  tail call fastcc void @process(i8* null)
  br label %.loopexit

.lr.ph:                                           ; preds = %21
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds i8*, i8** %1, i64 %29
  br label %31

; <label>:31:                                     ; preds = %.lr.ph, %31
  %.03 = phi i32 [ %26, %.lr.ph ], [ %32, %31 ]
  %.012 = phi i8** [ %30, %.lr.ph ], [ %33, %31 ]
  %32 = add nsw i32 %.03, -1
  %33 = getelementptr inbounds i8*, i8** %.012, i64 1
  %34 = load i8*, i8** %.012, align 8
  tail call fastcc void @process(i8* %34)
  %35 = icmp eq i32 %32, 0
  br i1 %35, label %.loopexit.loopexit, label %31

.loopexit.loopexit:                               ; preds = %31
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %28
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @parse_argv0(i8*) unnamed_addr #2 {
  %2 = icmp eq i8* %0, null
  %. = select i1 %2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0), i8* %0
  %3 = tail call fastcc i8* @endname(i8* %.)
  store i8* %3, i8** @progname, align 8
  %4 = tail call i32 @strncmp(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i64 0, i64 0), i64 2) #14
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  store i32 1, i32* @f_decode, align 4
  br label %7

; <label>:7:                                      ; preds = %1, %6
  %8 = tail call i64 @strlen(i8* %3) #14
  %9 = trunc i64 %8 to i32
  %10 = icmp sgt i32 %9, 2
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %7
  %sext = shl i64 %8, 32
  %12 = ashr exact i64 %sext, 32
  %13 = getelementptr inbounds i8, i8* %3, i64 %12
  %14 = getelementptr inbounds i8, i8* %13, i64 -3
  %15 = tail call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)) #14
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %11
  store i32 1, i32* @f_decode, align 4
  store i32 1, i32* @f_cat, align 4
  br label %18

; <label>:18:                                     ; preds = %11, %17, %7
  ret void
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @set_format(%struct.fmtdesc*) unnamed_addr #2 {
  %2 = load %struct.fmtdesc*, %struct.fmtdesc** @f_format, align 8
  %3 = icmp eq %struct.fmtdesc* %2, null
  %4 = icmp eq %struct.fmtdesc* %2, %0
  %or.cond = or i1 %3, %4
  br i1 %or.cond, label %9, label %5

; <label>:5:                                      ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** @progname, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.17, i64 0, i64 0), i8* %7, i8* %7) #13
  tail call void @exit(i32 1) #12
  unreachable

; <label>:9:                                      ; preds = %1
  store %struct.fmtdesc* %0, %struct.fmtdesc** @f_format, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @version() unnamed_addr #2 {
  %1 = load i8*, i8** @progname, align 8
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.18, i64 0, i64 0), i8* %1, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.19, i64 0, i64 0))
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @help() unnamed_addr #2 {
  %1 = load i8*, i8** @progname, align 8
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20, i64 0, i64 0), i8* %1)
  %putchar = tail call i32 @putchar(i32 10) #11
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @str, i64 0, i64 0))
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.1, i64 0, i64 0))
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @str.2, i64 0, i64 0))
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @str.3, i64 0, i64 0))
  %putchar4 = tail call i32 @putchar(i32 10) #11
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @str.4, i64 0, i64 0))
  %puts6 = tail call i32 @puts(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @str.5, i64 0, i64 0))
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @str.6, i64 0, i64 0))
  %puts8 = tail call i32 @puts(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @str.7, i64 0, i64 0))
  %putchar9 = tail call i32 @putchar(i32 10) #11
  %puts10 = tail call i32 @puts(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @str.8, i64 0, i64 0))
  %puts11 = tail call i32 @puts(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @str.9, i64 0, i64 0))
  %puts12 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str.10, i64 0, i64 0))
  %putchar13 = tail call i32 @putchar(i32 10) #11
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @catch_signals() unnamed_addr #2 {
  %1 = tail call void (i32)* @signal(i32 1, void (i32)* bitcast (void ()* @onintr to void (i32)*)) #11
  %2 = tail call void (i32)* @signal(i32 2, void (i32)* bitcast (void ()* @onintr to void (i32)*)) #11
  %3 = tail call void (i32)* @signal(i32 13, void (i32)* bitcast (void ()* @onintr to void (i32)*)) #11
  %4 = tail call void (i32)* @signal(i32 15, void (i32)* bitcast (void ()* @onintr to void (i32)*)) #11
  %5 = tail call void (i32)* @signal(i32 25, void (i32)* bitcast (void ()* @onintr to void (i32)*)) #11
  ret void
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal void @onintr() #5 {
  %1 = load i8*, i8** @outname, align 8
  store i8* null, i8** @outname, align 8
  %2 = icmp eq i8* %1, null
  br i1 %2, label %5, label %3

; <label>:3:                                      ; preds = %0
  %4 = tail call i32 @unlink(i8* nonnull %1) #11
  br label %5

; <label>:5:                                      ; preds = %0, %3
  tail call void @exit(i32 1) #12
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @process(i8*) unnamed_addr #2 {
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** @in, align 8
  store i8* null, i8** @outname, align 8
  store i8* null, i8** @inname, align 8
  %2 = tail call fastcc i32 @open_input(i8* %0)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %89, label %4

; <label>:4:                                      ; preds = %1
  %5 = tail call fastcc i32 @open_output(i8* %0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %89, label %7

; <label>:7:                                      ; preds = %4
  %8 = load i32, i32* @f_decode, align 4
  %9 = icmp eq i32 %8, 0
  %init_input.val = load i32 ()*, i32 ()** @init_input, align 8
  %init_output.val = load i32 ()*, i32 ()** @init_output, align 8
  %10 = select i1 %9, i32 ()* %init_input.val, i32 ()* %init_output.val
  %11 = tail call i32 %10() #11
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %24, label %13

; <label>:13:                                     ; preds = %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = load i8*, i8** @progname, align 8
  %16 = load i32, i32* @f_decode, align 4
  %17 = icmp ne i32 %16, 0
  %18 = select i1 %17, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.34, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.35, i64 0, i64 0)
  %19 = icmp eq i32 %16, 0
  %.sink6 = select i1 %19, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i64 0, i64 0)
  %inname.val = load i8*, i8** @inname, align 8
  %outname.val = load i8*, i8** @outname, align 8
  %20 = select i1 %19, i8* %inname.val, i8* %outname.val
  %21 = icmp eq i8* %20, null
  %22 = select i1 %21, i8* %.sink6, i8* %20
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.33, i64 0, i64 0), i8* %15, i8* %18, i8* %22) #13
  br label %89

; <label>:24:                                     ; preds = %7
  %25 = load i32, i32* @f_decode, align 4
  %26 = icmp ne i32 %25, 0
  %27 = select i1 %26, i32 ()* @process_decode, i32 ()* @process_encode
  %28 = tail call i32 %27() #11
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %89

; <label>:30:                                     ; preds = %24
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %32 = tail call i32 @fflush(%struct._IO_FILE* %31)
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %30
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %36 = tail call i32 @ferror(%struct._IO_FILE* %35) #11
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %48, label %38

; <label>:38:                                     ; preds = %34, %30
  %39 = load i8*, i8** @outname, align 8
  %40 = icmp eq i8* %39, null
  %41 = select i1 %40, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i64 0, i64 0), i8* %39
  tail call void @perror(i8* %41) #13
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = load i8*, i8** @progname, align 8
  %44 = load i8*, i8** @outname, align 8
  %45 = icmp eq i8* %44, null
  %46 = select i1 %45, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i64 0, i64 0), i8* %44
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.38, i64 0, i64 0), i8* %43, i8* %46) #13
  br label %89

; <label>:48:                                     ; preds = %34
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %50 = icmp eq %struct._IO_FILE* %35, %49
  br i1 %50, label %65, label %51

; <label>:51:                                     ; preds = %48
  tail call fastcc void @update_times()
  tail call fastcc void @update_mode()
  tail call fastcc void @update_own()
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %53 = tail call i32 @fclose(%struct._IO_FILE* %52)
  %54 = icmp slt i32 %53, 0
  %55 = load i8*, i8** @outname, align 8
  br i1 %54, label %56, label %61

; <label>:56:                                     ; preds = %51
  tail call void @perror(i8* %55) #13
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = load i8*, i8** @progname, align 8
  %59 = load i8*, i8** @outname, align 8
  %60 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.38, i64 0, i64 0), i8* %58, i8* %59) #13
  br label %89

; <label>:61:                                     ; preds = %51
  %62 = icmp eq i8* %55, %0
  br i1 %62, label %64, label %63

; <label>:63:                                     ; preds = %61
  tail call void @free(i8* %55) #11
  br label %64

; <label>:64:                                     ; preds = %61, %63
  store i8* null, i8** @outname, align 8
  br label %65

; <label>:65:                                     ; preds = %48, %64
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %68 = icmp eq %struct._IO_FILE* %66, %67
  br i1 %68, label %125, label %69

; <label>:69:                                     ; preds = %65
  %70 = tail call i32 @fclose(%struct._IO_FILE* %66)
  store %struct._IO_FILE* null, %struct._IO_FILE** @in, align 8
  %71 = load i32, i32* @f_cat, align 4
  %72 = load i32, i32* @f_precious, align 4
  %73 = or i32 %72, %71
  %74 = icmp eq i32 %73, 0
  %75 = load i8*, i8** @inname, align 8
  br i1 %74, label %76, label %85

; <label>:76:                                     ; preds = %69
  %77 = tail call i32 @unlink(i8* %75) #11
  %78 = icmp slt i32 %77, 0
  br i1 %78, label %79, label %89

; <label>:79:                                     ; preds = %76
  %80 = load i8*, i8** @inname, align 8
  tail call void @perror(i8* %80) #13
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = load i8*, i8** @progname, align 8
  %83 = load i8*, i8** @inname, align 8
  %84 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.39, i64 0, i64 0), i8* %82, i8* %83) #13
  br label %89

; <label>:85:                                     ; preds = %69
  %86 = icmp eq i8* %75, %0
  br i1 %86, label %88, label %87

; <label>:87:                                     ; preds = %85
  tail call void @free(i8* %75) #11
  br label %88

; <label>:88:                                     ; preds = %85, %87
  store i8* null, i8** @inname, align 8
  br label %125

; <label>:89:                                     ; preds = %76, %79, %24, %1, %4, %56, %38, %13
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %91 = icmp eq %struct._IO_FILE* %90, null
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %93 = icmp eq %struct._IO_FILE* %90, %92
  %or.cond11 = or i1 %91, %93
  br i1 %or.cond11, label %108, label %94

; <label>:94:                                     ; preds = %89
  %95 = tail call i32 @fclose(%struct._IO_FILE* nonnull %90)
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  %96 = load i8*, i8** @outname, align 8
  %97 = tail call i32 @unlink(i8* %96) #11
  %98 = icmp slt i32 %97, 0
  br i1 %98, label %99, label %108

; <label>:99:                                     ; preds = %94
  %100 = tail call i32* @__errno_location() #15
  %101 = load i32, i32* %100, align 4
  switch i32 %101, label %102 [
    i32 2, label %108
    i32 4, label %108
  ]

; <label>:102:                                    ; preds = %99
  %103 = load i8*, i8** @outname, align 8
  tail call void @perror(i8* %103) #13
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %105 = load i8*, i8** @progname, align 8
  %106 = load i8*, i8** @outname, align 8
  %107 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %104, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.40, i64 0, i64 0), i8* %105, i8* %106) #13
  br label %108

; <label>:108:                                    ; preds = %99, %99, %94, %102, %89
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %110 = icmp eq %struct._IO_FILE* %109, null
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %112 = icmp eq %struct._IO_FILE* %109, %111
  %or.cond13 = or i1 %110, %112
  br i1 %or.cond13, label %115, label %113

; <label>:113:                                    ; preds = %108
  %114 = tail call i32 @fclose(%struct._IO_FILE* nonnull %109)
  store %struct._IO_FILE* null, %struct._IO_FILE** @in, align 8
  br label %115

; <label>:115:                                    ; preds = %108, %113
  %116 = load i8*, i8** @inname, align 8
  %117 = icmp eq i8* %116, null
  %118 = icmp eq i8* %116, %0
  %or.cond3 = or i1 %117, %118
  br i1 %or.cond3, label %120, label %119

; <label>:119:                                    ; preds = %115
  tail call void @free(i8* %116) #11
  br label %120

; <label>:120:                                    ; preds = %115, %119
  %121 = load i8*, i8** @outname, align 8
  %122 = icmp eq i8* %121, null
  %123 = icmp eq i8* %121, %0
  %or.cond5 = or i1 %122, %123
  br i1 %or.cond5, label %125, label %124

; <label>:124:                                    ; preds = %120
  tail call void @free(i8* %121) #11
  br label %125

; <label>:125:                                    ; preds = %124, %120, %88, %65
  ret void
}

; Function Attrs: noinline nounwind readonly uwtable
define internal fastcc i8* @endname(i8* readonly) unnamed_addr #6 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %10, label %3

; <label>:3:                                      ; preds = %1
  %4 = tail call i8* @strrchr(i8* nonnull %0, i32 47) #14
  %5 = icmp eq i8* %4, null
  br i1 %5, label %10, label %6

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds i8, i8* %4, i64 1
  %8 = load i8, i8* %7, align 1
  %9 = icmp eq i8 %8, 0
  %. = select i1 %9, i8* %0, i8* %7
  ret i8* %.

; <label>:10:                                     ; preds = %3, %1
  ret i8* %0
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #7

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #7

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #7

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) local_unnamed_addr #7

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @unlink(i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @open_input(i8*) unnamed_addr #2 {
  %2 = load %struct.fmtdesc*, %struct.fmtdesc** @f_format, align 8
  store i64 0, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 2), align 8
  %3 = icmp eq i8* %0, null
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %1
  store i8* null, i8** @inname, align 8
  %5 = load i64, i64* bitcast (%struct._IO_FILE** @stdin to i64*), align 8
  store i64 %5, i64* bitcast (%struct._IO_FILE** @in to i64*), align 8
  br label %43

; <label>:6:                                      ; preds = %1
  %7 = load i32, i32* @f_decode, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

; <label>:9:                                      ; preds = %6
  %10 = tail call i8* @codename(i8* nonnull %0)
  br label %26

; <label>:11:                                     ; preds = %6
  %12 = load i32, i32* @f_cat, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %21

; <label>:14:                                     ; preds = %11
  %15 = tail call fastcc i8* @suffix(i8* nonnull %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i64 0, i64 0))
  %16 = icmp eq i8* %15, null
  br i1 %16, label %21, label %17

; <label>:17:                                     ; preds = %14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** @progname, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.42, i64 0, i64 0), i8* %19, i8* nonnull %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i64 0, i64 0)) #13
  br label %45

; <label>:21:                                     ; preds = %14, %11
  %22 = tail call i64 @strlen(i8* nonnull %0) #14
  %23 = add i64 %22, 1
  %24 = tail call fastcc i8* @emalloc(i64 %23)
  %25 = tail call i8* @strcpy(i8* %24, i8* nonnull %0) #11
  br label %26

; <label>:26:                                     ; preds = %21, %9
  %storemerge = phi i8* [ %25, %21 ], [ %10, %9 ]
  store i8* %storemerge, i8** @inname, align 8
  %27 = tail call %struct._IO_FILE* @fopen(i8* %storemerge, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i64 0, i64 0))
  store %struct._IO_FILE* %27, %struct._IO_FILE** @in, align 8
  %28 = icmp eq %struct._IO_FILE* %27, null
  %29 = load i8*, i8** @inname, align 8
  br i1 %28, label %30, label %35

; <label>:30:                                     ; preds = %26
  tail call void @perror(i8* %29) #13
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = load i8*, i8** @progname, align 8
  %33 = load i8*, i8** @inname, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.44, i64 0, i64 0), i8* %32, i8* %33) #13
  br label %45

; <label>:35:                                     ; preds = %26
  %36 = tail call fastcc i32 @okay_as_input(i8* %29, %struct._IO_FILE* nonnull %27, %struct.stat* nonnull @instat)
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %45, label %38

; <label>:38:                                     ; preds = %35
  %39 = icmp eq %struct.fmtdesc* %2, null
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %38
  %41 = load i8*, i8** @inname, align 8
  %42 = tail call fastcc %struct.fmtdesc* @grok_format(i8* %41)
  br label %43

; <label>:43:                                     ; preds = %40, %38, %4
  %.1 = phi %struct.fmtdesc* [ %2, %4 ], [ %2, %38 ], [ %42, %40 ]
  %44 = icmp eq %struct.fmtdesc* %.1, null
  %f_ulaw..1 = select i1 %44, %struct.fmtdesc* @f_ulaw, %struct.fmtdesc* %.1
  tail call fastcc void @prepare_io(%struct.fmtdesc* %f_ulaw..1)
  br label %45

; <label>:45:                                     ; preds = %35, %43, %30, %17
  %.0 = phi i32 [ 1, %43 ], [ 0, %30 ], [ 0, %17 ], [ 0, %35 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @open_output(i8*) unnamed_addr #2 {
  %2 = icmp ne i8* %0, null
  %3 = load i32, i32* @f_cat, align 4
  %4 = icmp eq i32 %3, 0
  %or.cond = and i1 %2, %4
  br i1 %or.cond, label %7, label %5

; <label>:5:                                      ; preds = %1
  %6 = load i64, i64* bitcast (%struct._IO_FILE** @stdout to i64*), align 8
  store i64 %6, i64* bitcast (%struct._IO_FILE** @out to i64*), align 8
  br label %36

; <label>:7:                                      ; preds = %1
  %8 = load i32, i32* @f_decode, align 4
  %9 = icmp ne i32 %8, 0
  %10 = select i1 %9, i8* (i8*)* @plainname, i8* (i8*)* @codename
  %11 = tail call i8* %10(i8* nonnull %0) #11
  %12 = tail call fastcc i32 @length_okay(i8* %11)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %37, label %14

; <label>:14:                                     ; preds = %7
  %15 = tail call i32 (i8*, i32, ...) @open(i8* %11, i32 193, i32 438) #11
  %16 = icmp sgt i32 %15, -1
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = tail call %struct._IO_FILE* @fdopen(i32 %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i64 0, i64 0)) #11
  br label %28

; <label>:19:                                     ; preds = %14
  %20 = tail call i32* @__errno_location() #15
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 17
  br i1 %22, label %23, label %.thread

.thread:                                          ; preds = %19
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  br label %30

; <label>:23:                                     ; preds = %19
  %24 = tail call fastcc i32 @ok_to_replace(i8* %11)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %37, label %26

; <label>:26:                                     ; preds = %23
  %27 = tail call %struct._IO_FILE* @fopen(i8* %11, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i64 0, i64 0))
  br label %28

; <label>:28:                                     ; preds = %26, %17
  %.sink = phi %struct._IO_FILE* [ %27, %26 ], [ %18, %17 ]
  store %struct._IO_FILE* %.sink, %struct._IO_FILE** @out, align 8
  %29 = icmp eq %struct._IO_FILE* %.sink, null
  br i1 %29, label %30, label %36

; <label>:30:                                     ; preds = %.thread, %28
  tail call void @perror(i8* %11) #13
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = load i8*, i8** @progname, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.52, i64 0, i64 0), i8* %32, i8* %11) #13
  br i1 %16, label %34, label %37

; <label>:34:                                     ; preds = %30
  %35 = tail call i32 @close(i32 %15) #11
  br label %37

; <label>:36:                                     ; preds = %28, %5
  %storemerge = phi i8* [ null, %5 ], [ %11, %28 ]
  store i8* %storemerge, i8** @outname, align 8
  br label %37

; <label>:37:                                     ; preds = %30, %34, %23, %7, %36
  %.0 = phi i32 [ 1, %36 ], [ 0, %7 ], [ 0, %23 ], [ 0, %34 ], [ 0, %30 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_decode() unnamed_addr #2 {
  %1 = alloca [33 x i8], align 16
  %2 = alloca [160 x i16], align 16
  %3 = tail call %struct.gsm_state* @gsm_create() #11
  %4 = icmp eq %struct.gsm_state* %3, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %0
  %6 = load i8*, i8** @progname, align 8
  tail call void @perror(i8* %6) #13
  br label %66

; <label>:7:                                      ; preds = %0
  %8 = tail call i32 @gsm_option(%struct.gsm_state* nonnull %3, i32 2, i32* nonnull @f_fast) #11
  %9 = tail call i32 @gsm_option(%struct.gsm_state* nonnull %3, i32 1, i32* nonnull @f_verbose) #11
  %10 = getelementptr inbounds [33 x i8], [33 x i8]* %1, i64 0, i64 0
  %11 = getelementptr inbounds [160 x i16], [160 x i16]* %2, i64 0, i64 0
  br label %12

; <label>:12:                                     ; preds = %43, %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %14 = call i64 @fread(i8* nonnull %10, i64 1, i64 33, %struct._IO_FILE* %13)
  %15 = trunc i64 %14 to i32
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %53

; <label>:17:                                     ; preds = %12
  %sext.mask = and i64 %14, 4294967295
  %18 = icmp eq i64 %sext.mask, 33
  br i1 %18, label %32, label %19

; <label>:19:                                     ; preds = %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = load i8*, i8** @progname, align 8
  %sext = shl i64 %14, 32
  %22 = ashr exact i64 %sext, 32
  %23 = sub nsw i64 33, %22
  %24 = icmp eq i64 %sext.mask, 32
  %25 = zext i1 %24 to i64
  %26 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.50, i64 0, i64 %25
  %27 = load i8*, i8** @inname, align 8
  %28 = icmp eq i8* %27, null
  %29 = select i1 %28, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* %27
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.56, i64 0, i64 0), i8* %21, i64 %23, i8* %26, i8* %29) #13
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  %31 = tail call i32* @__errno_location() #15
  store i32 0, i32* %31, align 4
  br label %66

; <label>:32:                                     ; preds = %17
  %33 = call i32 @gsm_decode(%struct.gsm_state* nonnull %3, i8* nonnull %10, i16* nonnull %11) #11
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %43, label %35

; <label>:35:                                     ; preds = %32
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = load i8*, i8** @progname, align 8
  %38 = load i8*, i8** @inname, align 8
  %39 = icmp eq i8* %38, null
  %40 = select i1 %39, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* %38
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.57, i64 0, i64 0), i8* %37, i8* %40) #13
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  %42 = tail call i32* @__errno_location() #15
  store i32 0, i32* %42, align 4
  br label %66

; <label>:43:                                     ; preds = %32
  %44 = load i32 (i16*)*, i32 (i16*)** @output, align 8
  %45 = call i32 %44(i16* nonnull %11) #11
  %46 = icmp slt i32 %45, 0
  br i1 %46, label %47, label %12

; <label>:47:                                     ; preds = %43
  %48 = load i8*, i8** @outname, align 8
  call void @perror(i8* %48) #13
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = load i8*, i8** @progname, align 8
  %51 = load i8*, i8** @outname, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.58, i64 0, i64 0), i8* %50, i8* %51) #13
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  br label %66

; <label>:53:                                     ; preds = %12
  %54 = icmp slt i32 %15, 0
  br i1 %54, label %55, label %65

; <label>:55:                                     ; preds = %53
  %56 = load i8*, i8** @inname, align 8
  %57 = icmp eq i8* %56, null
  %58 = select i1 %57, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* %56
  call void @perror(i8* %58) #13
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = load i8*, i8** @progname, align 8
  %61 = load i8*, i8** @inname, align 8
  %62 = icmp eq i8* %61, null
  %63 = select i1 %62, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* %61
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.59, i64 0, i64 0), i8* %60, i8* %63) #13
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  br label %66

; <label>:65:                                     ; preds = %53
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  br label %66

; <label>:66:                                     ; preds = %65, %55, %47, %35, %19, %5
  %.0 = phi i32 [ -1, %19 ], [ -1, %35 ], [ -1, %47 ], [ -1, %55 ], [ 0, %65 ], [ -1, %5 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_encode() unnamed_addr #2 {
  %1 = alloca [160 x i16], align 16
  %2 = alloca [33 x i8], align 16
  %3 = tail call %struct.gsm_state* @gsm_create() #11
  %4 = icmp eq %struct.gsm_state* %3, null
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %0
  %6 = load i8*, i8** @progname, align 8
  tail call void @perror(i8* %6) #13
  br label %51

; <label>:7:                                      ; preds = %0
  %8 = tail call i32 @gsm_option(%struct.gsm_state* nonnull %3, i32 2, i32* nonnull @f_fast) #11
  %9 = tail call i32 @gsm_option(%struct.gsm_state* nonnull %3, i32 1, i32* nonnull @f_verbose) #11
  %10 = getelementptr inbounds [160 x i16], [160 x i16]* %1, i64 0, i64 0
  %11 = getelementptr inbounds [33 x i8], [33 x i8]* %2, i64 0, i64 0
  br label %12

; <label>:12:                                     ; preds = %24, %7
  %13 = load i32 (i16*)*, i32 (i16*)** @input, align 8
  %14 = call i32 %13(i16* nonnull %10) #11
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %38

; <label>:16:                                     ; preds = %12
  %17 = icmp ult i32 %14, 160
  %18 = sext i32 %14 to i64
  br i1 %17, label %19, label %24

; <label>:19:                                     ; preds = %16
  %20 = shl nsw i64 %18, 1
  %21 = sub nsw i64 320, %20
  %22 = getelementptr inbounds [160 x i16], [160 x i16]* %1, i64 0, i64 %18
  %23 = bitcast i16* %22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %23, i8 0, i64 %21, i32 2, i1 false)
  br label %24

; <label>:24:                                     ; preds = %19, %16
  call void @gsm_encode(%struct.gsm_state* nonnull %3, i16* nonnull %10, i8* nonnull %11) #11
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %26 = call i64 @fwrite(i8* nonnull %11, i64 33, i64 1, %struct._IO_FILE* %25)
  %27 = icmp eq i64 %26, 1
  br i1 %27, label %12, label %28

; <label>:28:                                     ; preds = %24
  %29 = load i8*, i8** @outname, align 8
  %30 = icmp eq i8* %29, null
  %31 = select i1 %30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i64 0, i64 0), i8* %29
  call void @perror(i8* %31) #13
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = load i8*, i8** @progname, align 8
  %34 = load i8*, i8** @outname, align 8
  %35 = icmp eq i8* %34, null
  %36 = select i1 %35, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i64 0, i64 0), i8* %34
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.58, i64 0, i64 0), i8* %33, i8* %36) #13
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  br label %51

; <label>:38:                                     ; preds = %12
  %39 = icmp slt i32 %14, 0
  br i1 %39, label %40, label %50

; <label>:40:                                     ; preds = %38
  %41 = load i8*, i8** @inname, align 8
  %42 = icmp eq i8* %41, null
  %43 = select i1 %42, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* %41
  call void @perror(i8* %43) #13
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = load i8*, i8** @progname, align 8
  %46 = load i8*, i8** @inname, align 8
  %47 = icmp eq i8* %46, null
  %48 = select i1 %47, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8* %46
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.59, i64 0, i64 0), i8* %45, i8* %48) #13
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  br label %51

; <label>:50:                                     ; preds = %38
  call void @gsm_destroy(%struct.gsm_state* nonnull %3) #11
  br label %51

; <label>:51:                                     ; preds = %50, %40, %28, %5
  %.0 = phi i32 [ -1, %28 ], [ -1, %40 ], [ 0, %50 ], [ -1, %5 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) local_unnamed_addr #7

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @update_times() unnamed_addr #2 {
  %1 = alloca [2 x i64], align 16
  %2 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 2), align 8
  %3 = icmp eq i64 %2, 0
  %4 = load i8*, i8** @outname, align 8
  %5 = icmp eq i8* %4, null
  %or.cond = or i1 %3, %5
  br i1 %or.cond, label %14, label %6

; <label>:6:                                      ; preds = %0
  %7 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 11, i32 0), align 8
  %8 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i64 0, i64 0
  store i64 %7, i64* %8, align 16
  %9 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 12, i32 0), align 8
  %10 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i64 0, i64 1
  store i64 %9, i64* %10, align 8
  %11 = load i8*, i8** @outname, align 8
  %12 = bitcast [2 x i64]* %1 to %struct.utimbuf*
  %13 = call i32 @utime(i8* %11, %struct.utimbuf* nonnull %12) #11
  br label %14

; <label>:14:                                     ; preds = %0, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @update_mode() unnamed_addr #2 {
  %1 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 2), align 8
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %16, label %3

; <label>:3:                                      ; preds = %0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %5 = tail call i32 @fileno(%struct._IO_FILE* %4) #11
  %6 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 3), align 8
  %7 = and i32 %6, 4095
  %8 = tail call i32 @fchmod(i32 %5, i32 %7) #11
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %16, label %10

; <label>:10:                                     ; preds = %3
  %11 = load i8*, i8** @outname, align 8
  tail call void @perror(i8* %11) #13
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load i8*, i8** @progname, align 8
  %14 = load i8*, i8** @outname, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.60, i64 0, i64 0), i8* %13, i8* %14) #13
  br label %16

; <label>:16:                                     ; preds = %0, %3, %10
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @update_own() unnamed_addr #2 {
  %1 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 2), align 8
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %9, label %3

; <label>:3:                                      ; preds = %0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %5 = tail call i32 @fileno(%struct._IO_FILE* %4) #11
  %6 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 4), align 4
  %7 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i64 0, i32 5), align 8
  %8 = tail call i32 @fchown(i32 %5, i32 %6, i32 %7) #11
  br label %9

; <label>:9:                                      ; preds = %0, %3
  ret void
}

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #8

; Function Attrs: noinline nounwind uwtable
define internal i8* @codename(i8* readonly) unnamed_addr #2 {
  %2 = tail call fastcc i8* @normalname(i8* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.45, i64 0, i64 0))
  ret i8* %2
}

; Function Attrs: noinline nounwind readonly uwtable
define internal fastcc i8* @suffix(i8* readonly, i8* nocapture readonly) unnamed_addr #6 {
  %3 = tail call i64 @strlen(i8* %0) #14
  %4 = tail call i64 @strlen(i8* %1) #14
  %5 = icmp ne i64 %4, 0
  %6 = icmp ugt i64 %3, %4
  %or.cond = and i1 %5, %6
  %7 = sub i64 %3, %4
  %8 = getelementptr inbounds i8, i8* %0, i64 %7
  br i1 %or.cond, label %9, label %12

; <label>:9:                                      ; preds = %2
  %10 = tail call i32 @memcmp(i8* %8, i8* %1, i64 %4) #14
  %11 = icmp eq i32 %10, 0
  %. = select i1 %11, i8* %8, i8* null
  br label %12

; <label>:12:                                     ; preds = %2, %9
  %.0 = phi i8* [ %., %9 ], [ null, %2 ]
  ret i8* %.0
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc noalias i8* @emalloc(i64) unnamed_addr #2 {
  %2 = tail call noalias i8* @malloc(i64 %0) #11
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %8

; <label>:4:                                      ; preds = %1
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = load i8*, i8** @progname, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.46, i64 0, i64 0), i8* %6, i64 %0) #13
  tail call void @onintr()
  unreachable

; <label>:8:                                      ; preds = %1
  ret i8* %2
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @okay_as_input(i8*, %struct._IO_FILE* nocapture, %struct.stat* nocapture) unnamed_addr #2 {
  %4 = tail call i32 @fileno(%struct._IO_FILE* %1) #11
  %5 = tail call i32 @fstat(i32 %4, %struct.stat* %2) #11
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %3
  tail call void @perror(i8* %0) #13
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = load i8*, i8** @progname, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.47, i64 0, i64 0), i8* %9, i8* %0) #13
  br label %37

; <label>:11:                                     ; preds = %3
  %12 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = and i32 %13, 61440
  %15 = icmp eq i32 %14, 32768
  br i1 %15, label %20, label %16

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = load i8*, i8** @progname, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.48, i64 0, i64 0), i8* %18, i8* %0) #13
  br label %37

; <label>:20:                                     ; preds = %11
  %21 = getelementptr inbounds %struct.stat, %struct.stat* %2, i64 0, i32 2
  %22 = load i64, i64* %21, align 8
  %23 = icmp ugt i64 %22, 1
  %24 = load i32, i32* @f_cat, align 4
  %25 = load i32, i32* @f_precious, align 4
  %26 = or i32 %25, %24
  %27 = icmp eq i32 %26, 0
  %28 = and i1 %23, %27
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %20
  %30 = icmp ult i64 %22, 3
  %31 = zext i1 %30 to i64
  %32 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.50, i64 0, i64 %31
  %33 = add i64 %22, -1
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = load i8*, i8** @progname, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.49, i64 0, i64 0), i8* %35, i8* %0, i64 %33, i8* %32) #13
  br label %37

; <label>:37:                                     ; preds = %20, %29, %16, %7
  %.0 = phi i32 [ 0, %7 ], [ 0, %29 ], [ 0, %16 ], [ 1, %20 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.fmtdesc* @grok_format(i8*) unnamed_addr #2 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %23, label %3

; <label>:3:                                      ; preds = %1
  %4 = tail call i8* @plainname(i8* nonnull %0)
  %5 = load %struct.fmtdesc*, %struct.fmtdesc** getelementptr inbounds ([5 x %struct.fmtdesc*], [5 x %struct.fmtdesc*]* @alldescs, i64 0, i64 0), align 16
  %6 = icmp eq %struct.fmtdesc* %5, null
  br i1 %6, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %19
  %7 = phi %struct.fmtdesc* [ %21, %19 ], [ %5, %.lr.ph.preheader ]
  %.013 = phi %struct.fmtdesc** [ %20, %19 ], [ getelementptr inbounds ([5 x %struct.fmtdesc*], [5 x %struct.fmtdesc*]* @alldescs, i64 0, i64 0), %.lr.ph.preheader ]
  %8 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %7, i64 0, i32 2
  %9 = load i8*, i8** %8, align 8
  %10 = icmp eq i8* %9, null
  br i1 %10, label %19, label %11

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load i8, i8* %9, align 1
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %19, label %14

; <label>:14:                                     ; preds = %11
  %15 = tail call fastcc i8* @suffix(i8* %4, i8* nonnull %9)
  %16 = icmp eq i8* %15, null
  br i1 %16, label %19, label %17

; <label>:17:                                     ; preds = %14
  tail call void @free(i8* %4) #11
  %18 = load %struct.fmtdesc*, %struct.fmtdesc** %.013, align 8
  br label %23

; <label>:19:                                     ; preds = %.lr.ph, %11, %14
  %20 = getelementptr inbounds %struct.fmtdesc*, %struct.fmtdesc** %.013, i64 1
  %21 = load %struct.fmtdesc*, %struct.fmtdesc** %20, align 8
  %22 = icmp eq %struct.fmtdesc* %21, null
  br i1 %22, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  tail call void @free(i8* %4) #11
  br label %23

; <label>:23:                                     ; preds = %._crit_edge, %1, %17
  %.0 = phi %struct.fmtdesc* [ %18, %17 ], [ null, %1 ], [ null, %._crit_edge ]
  ret %struct.fmtdesc* %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @prepare_io(%struct.fmtdesc* nocapture readonly) unnamed_addr #9 {
  %2 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %0, i64 0, i32 6
  %3 = bitcast i32 (i16*)** %2 to i64*
  %4 = load i64, i64* %3, align 8
  store i64 %4, i64* bitcast (i32 (i16*)** @output to i64*), align 8
  %5 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %0, i64 0, i32 5
  %6 = bitcast i32 (i16*)** %5 to i64*
  %7 = load i64, i64* %6, align 8
  store i64 %7, i64* bitcast (i32 (i16*)** @input to i64*), align 8
  %8 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %0, i64 0, i32 3
  %9 = bitcast i32 ()** %8 to i64*
  %10 = load i64, i64* %9, align 8
  store i64 %10, i64* bitcast (i32 ()** @init_input to i64*), align 8
  %11 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %0, i64 0, i32 4
  %12 = bitcast i32 ()** %11 to i64*
  %13 = load i64, i64* %12, align 8
  store i64 %13, i64* bitcast (i32 ()** @init_output to i64*), align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i8* @normalname(i8* readonly, i8* nocapture readonly, i8* nocapture readonly) unnamed_addr #2 {
  %4 = icmp eq i8* %0, null
  br i1 %4, label %26, label %5

; <label>:5:                                      ; preds = %3
  %6 = tail call i64 @strlen(i8* nonnull %0) #14
  %7 = add i64 %6, 1
  %8 = tail call i64 @strlen(i8* %1) #14
  %9 = add i64 %7, %8
  %10 = tail call i64 @strlen(i8* %2) #14
  %11 = add i64 %9, %10
  %12 = tail call fastcc i8* @emalloc(i64 %11)
  %13 = tail call i8* @strcpy(i8* %12, i8* nonnull %0) #11
  %14 = tail call fastcc i8* @suffix(i8* %13, i8* %2)
  %15 = icmp eq i8* %14, null
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %5
  %17 = tail call i8* @strcpy(i8* nonnull %14, i8* %1) #11
  br label %26

; <label>:18:                                     ; preds = %5
  %19 = load i8, i8* %1, align 1
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %26, label %21

; <label>:21:                                     ; preds = %18
  %22 = tail call fastcc i8* @suffix(i8* %13, i8* nonnull %1)
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %21
  %25 = tail call i8* @strcat(i8* %13, i8* nonnull %1) #11
  br label %26

; <label>:26:                                     ; preds = %16, %21, %18, %24, %3
  %.0 = phi i8* [ null, %3 ], [ %13, %24 ], [ %13, %18 ], [ %13, %21 ], [ %13, %16 ]
  ret i8* %.0
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #7

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @plainname(i8* readonly) unnamed_addr #2 {
  %2 = tail call fastcc i8* @normalname(i8* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.45, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i64 0, i64 0))
  ret i8* %2
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal fastcc i32 @length_okay(i8* readnone) unnamed_addr #1 {
  %not. = icmp ne i8* %0, null
  %. = zext i1 %not. to i32
  ret i32 %.
}

declare i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #0

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fdopen(i32, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @ok_to_replace(i8*) unnamed_addr #2 {
  %2 = load i32, i32* @f_force, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %23

; <label>:4:                                      ; preds = %1
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 @fileno(%struct._IO_FILE* %5) #11
  %7 = tail call i32 @isatty(i32 %6) #11
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %23, label %9

; <label>:9:                                      ; preds = %4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.54, i64 0, i64 0), i8* %0, i8* %0) #13
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i32 @fflush(%struct._IO_FILE* %12)
  %14 = tail call i32 @getchar() #11
  br label %15

; <label>:15:                                     ; preds = %16, %9
  %.01 = phi i32 [ %14, %9 ], [ %17, %16 ]
  switch i32 %.01, label %16 [
    i32 -1, label %18
    i32 10, label %18
  ]

; <label>:16:                                     ; preds = %15
  %17 = tail call i32 @getchar() #11
  br label %15

; <label>:18:                                     ; preds = %15, %15
  %19 = icmp eq i32 %14, 121
  br i1 %19, label %23, label %20

; <label>:20:                                     ; preds = %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.55, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %21) #13
  br label %23

; <label>:23:                                     ; preds = %18, %4, %1, %20
  %.0 = phi i32 [ 0, %20 ], [ 1, %1 ], [ 0, %4 ], [ 1, %18 ]
  ret i32 %.0
}

declare i32 @close(i32) local_unnamed_addr #0

; Function Attrs: nounwind
declare i32 @isatty(i32) local_unnamed_addr #3

declare i32 @getchar() local_unnamed_addr #0

declare %struct.gsm_state* @gsm_create() local_unnamed_addr #0

declare i32 @gsm_option(%struct.gsm_state*, i32, i32*) local_unnamed_addr #0

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

declare void @gsm_destroy(%struct.gsm_state*) local_unnamed_addr #0

declare i32 @gsm_decode(%struct.gsm_state*, i8*, i16*) local_unnamed_addr #0

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #10

declare void @gsm_encode(%struct.gsm_state*, i16*, i8*) local_unnamed_addr #0

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @utime(i8* nocapture readonly, %struct.utimbuf* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fchmod(i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fchown(i32, i32, i32) local_unnamed_addr #3

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #11

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { argmemonly nounwind }
attributes #11 = { nounwind }
attributes #12 = { noreturn nounwind }
attributes #13 = { cold }
attributes #14 = { nounwind readonly }
attributes #15 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
