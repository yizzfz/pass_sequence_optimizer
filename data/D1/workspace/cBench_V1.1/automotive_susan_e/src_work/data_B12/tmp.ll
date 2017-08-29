; ModuleID = 'susan.1.ll'
source_filename = "susan.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.anon = type { i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [44 x i8] c"Usage: susan <in.pgm> <out.pgm> [options]\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"-s : Smoothing mode (default)\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"-e : Edges mode\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"-c : Corners mode\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [67 x i8] c"See source code for more information about setting the thresholds\0A\00", align 1
@.str.5 = private unnamed_addr constant [60 x i8] c"-t <thresh> : Brightness threshold, all modes (default=20)\0A\00", align 1
@.str.6 = private unnamed_addr constant [107 x i8] c"-d <thresh> : Distance threshold, smoothing mode, (default=4) (use next option instead for flat 3x3 mask)\0A\00", align 1
@.str.7 = private unnamed_addr constant [49 x i8] c"-3 : Use flat 3x3 mask, edges or smoothing mode\0A\00", align 1
@.str.8 = private unnamed_addr constant [79 x i8] c"-n : No post-processing on the binary edge map (runs much faster); edges mode\0A\00", align 1
@.str.9 = private unnamed_addr constant [111 x i8] c"-q : Use faster (and usually stabler) corner mode; edge-like corner suppression not carried out; corners mode\0A\00", align 1
@.str.10 = private unnamed_addr constant [108 x i8] c"-b : Mark corners/edges with single black points instead of black with white border; corners or edges mode\0A\00", align 1
@.str.11 = private unnamed_addr constant [91 x i8] c"-p : Output initial enhancement image only; corners or edges mode (default is edges mode)\0A\00", align 1
@.str.12 = private unnamed_addr constant [77 x i8] c"\0ASUSAN Version 2l (C) 1995-1997 Stephen Smith, DRA UK. steve@fmrib.ox.ac.uk\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.13 = private unnamed_addr constant [26 x i8] c"Image %s not binary PGM.\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"Can't input image %s.\0A\00", align 1
@.str.17 = private unnamed_addr constant [43 x i8] c"Image %s does not have binary PGM header.\0A\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"Image %s is wrong size.\0A\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.20 = private unnamed_addr constant [23 x i8] c"Can't output image%s.\0A\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"P5\0A\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"255\0A\00", align 1
@.str.24 = private unnamed_addr constant [23 x i8] c"Can't write image %s.\0A\00", align 1
@.str.25 = private unnamed_addr constant [54 x i8] c"Distance_thresh (%f) too big for integer arithmetic.\0A\00", align 1
@.str.26 = private unnamed_addr constant [61 x i8] c"Either reduce it to <=15 or recompile with variable \22total\22\0A\00", align 1
@.str.27 = private unnamed_addr constant [40 x i8] c"as a float: see top \22defines\22 section.\0A\00", align 1
@.str.28 = private unnamed_addr constant [65 x i8] c"Mask size (1.5*distance_thresh+1=%d) too big for image (%dx%d).\0A\00", align 1
@.str.29 = private unnamed_addr constant [19 x i8] c"Too many corners.\0A\00", align 1
@.str.30 = private unnamed_addr constant [26 x i8] c"No argument following -d\0A\00", align 1
@.str.31 = private unnamed_addr constant [26 x i8] c"No argument following -t\0A\00", align 1
@str = private unnamed_addr constant [43 x i8] c"Usage: susan <in.pgm> <out.pgm> [options]\0A\00"
@str.1 = private unnamed_addr constant [30 x i8] c"-s : Smoothing mode (default)\00"
@str.2 = private unnamed_addr constant [16 x i8] c"-e : Edges mode\00"
@str.3 = private unnamed_addr constant [19 x i8] c"-c : Corners mode\0A\00"
@str.4 = private unnamed_addr constant [66 x i8] c"See source code for more information about setting the thresholds\00"
@str.5 = private unnamed_addr constant [59 x i8] c"-t <thresh> : Brightness threshold, all modes (default=20)\00"
@str.6 = private unnamed_addr constant [106 x i8] c"-d <thresh> : Distance threshold, smoothing mode, (default=4) (use next option instead for flat 3x3 mask)\00"
@str.7 = private unnamed_addr constant [48 x i8] c"-3 : Use flat 3x3 mask, edges or smoothing mode\00"
@str.8 = private unnamed_addr constant [78 x i8] c"-n : No post-processing on the binary edge map (runs much faster); edges mode\00"
@str.9 = private unnamed_addr constant [110 x i8] c"-q : Use faster (and usually stabler) corner mode; edge-like corner suppression not carried out; corners mode\00"
@str.10 = private unnamed_addr constant [107 x i8] c"-b : Mark corners/edges with single black points instead of black with white border; corners or edges mode\00"
@str.11 = private unnamed_addr constant [90 x i8] c"-p : Output initial enhancement image only; corners or edges mode (default is edges mode)\00"
@str.12 = private unnamed_addr constant [76 x i8] c"\0ASUSAN Version 2l (C) 1995-1997 Stephen Smith, DRA UK. steve@fmrib.ox.ac.uk\00"
@str.13 = private unnamed_addr constant [60 x i8] c"Either reduce it to <=15 or recompile with variable \22total\22\00"
@str.14 = private unnamed_addr constant [39 x i8] c"as a float: see top \22defines\22 section.\00"
@str.15 = private unnamed_addr constant [25 x i8] c"No argument following -t\00"
@str.16 = private unnamed_addr constant [25 x i8] c"No argument following -d\00"

; Function Attrs: noinline noreturn nounwind uwtable
define void @usage() local_unnamed_addr #0 {
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @str, i64 0, i64 0))
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @str.1, i64 0, i64 0))
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.2, i64 0, i64 0))
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.3, i64 0, i64 0))
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @str.4, i64 0, i64 0))
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.5, i64 0, i64 0))
  %puts6 = tail call i32 @puts(i8* getelementptr inbounds ([106 x i8], [106 x i8]* @str.6, i64 0, i64 0))
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @str.7, i64 0, i64 0))
  %puts8 = tail call i32 @puts(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @str.8, i64 0, i64 0))
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([110 x i8], [110 x i8]* @str.9, i64 0, i64 0))
  %puts10 = tail call i32 @puts(i8* getelementptr inbounds ([107 x i8], [107 x i8]* @str.10, i64 0, i64 0))
  %puts11 = tail call i32 @puts(i8* getelementptr inbounds ([90 x i8], [90 x i8]* @str.11, i64 0, i64 0))
  %puts12 = tail call i32 @puts(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @str.12, i64 0, i64 0))
  tail call void @exit(i32 0) #9
  unreachable
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @getint(%struct._IO_FILE* nocapture) local_unnamed_addr #3 {
  %2 = alloca [10000 x i8], align 16
  %3 = getelementptr inbounds [10000 x i8], [10000 x i8]* %2, i64 0, i64 0
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %1
  %4 = call i32 @_IO_getc(%struct._IO_FILE* %0)
  switch i32 %4, label %9 [
    i32 35, label %.thread
    i32 -1, label %6
  ]

.thread:                                          ; preds = %.backedge
  %5 = call i8* @fgets(i8* nonnull %3, i32 9000, %struct._IO_FILE* %0)
  br label %.backedge.backedge

; <label>:6:                                      ; preds = %.backedge
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i64 0, i64 0)) #10
  call void @exit(i32 0) #9
  unreachable

; <label>:9:                                      ; preds = %.backedge
  %.off = add i32 %4, -48
  %10 = icmp ult i32 %.off, 10
  br i1 %10, label %.preheader.preheader, label %.backedge.backedge

.backedge.backedge:                               ; preds = %9, %.thread
  br label %.backedge

.preheader.preheader:                             ; preds = %9
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %.1 = phi i32 [ %14, %.preheader ], [ %4, %.preheader.preheader ]
  %.01 = phi i32 [ %13, %.preheader ], [ 0, %.preheader.preheader ]
  %11 = mul nsw i32 %.01, 10
  %12 = add nsw i32 %.1, -48
  %13 = add nsw i32 %12, %11
  %14 = call i32 @_IO_getc(%struct._IO_FILE* %0)
  %15 = icmp eq i32 %14, -1
  %.off5 = add i32 %14, -48
  %16 = icmp ugt i32 %.off5, 9
  %or.cond = or i1 %15, %16
  br i1 %or.cond, label %17, label %.preheader

; <label>:17:                                     ; preds = %.preheader
  ret i32 %13
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @get_image(i8*, i8** nocapture, i32* nocapture, i32* nocapture) local_unnamed_addr #3 {
  %5 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i64 0, i64 0))
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.16, i64 0, i64 0), i8* %0) #10
  tail call void @exit(i32 0) #9
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = tail call i32 @fgetc(%struct._IO_FILE* nonnull %5)
  %12 = tail call i32 @fgetc(%struct._IO_FILE* nonnull %5)
  %13 = trunc i32 %12 to i8
  %sext.mask = and i32 %11, 255
  %14 = icmp eq i32 %sext.mask, 80
  %15 = icmp eq i8 %13, 53
  %or.cond = and i1 %14, %15
  br i1 %or.cond, label %19, label %16

; <label>:16:                                     ; preds = %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.17, i64 0, i64 0), i8* %0) #10
  tail call void @exit(i32 0) #9
  unreachable

; <label>:19:                                     ; preds = %10
  %20 = tail call i32 @getint(%struct._IO_FILE* nonnull %5)
  store i32 %20, i32* %2, align 4
  %21 = tail call i32 @getint(%struct._IO_FILE* nonnull %5)
  store i32 %21, i32* %3, align 4
  %22 = tail call i32 @getint(%struct._IO_FILE* nonnull %5)
  %23 = load i32, i32* %2, align 4
  %24 = load i32, i32* %3, align 4
  %25 = mul nsw i32 %24, %23
  %26 = sext i32 %25 to i64
  %27 = tail call noalias i8* @malloc(i64 %26) #8
  store i8* %27, i8** %1, align 8
  %28 = load i32, i32* %2, align 4
  %29 = load i32, i32* %3, align 4
  %30 = mul nsw i32 %29, %28
  %31 = sext i32 %30 to i64
  %32 = tail call i64 @fread(i8* %27, i64 1, i64 %31, %struct._IO_FILE* nonnull %5)
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %34, label %37

; <label>:34:                                     ; preds = %19
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.18, i64 0, i64 0), i8* %0) #10
  tail call void @exit(i32 0) #9
  unreachable

; <label>:37:                                     ; preds = %19
  %38 = tail call i32 @fclose(%struct._IO_FILE* nonnull %5)
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @put_image(i8*, i8* nocapture, i32, i32) local_unnamed_addr #3 {
  %5 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i64 0, i64 0))
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.20, i64 0, i64 0), i8* %0) #10
  tail call void @exit(i32 0) #9
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.21, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* nonnull %5)
  %12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* nonnull %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i32 %2, i32 %3)
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* nonnull %5)
  %14 = mul nsw i32 %3, %2
  %15 = sext i32 %14 to i64
  %16 = tail call i64 @fwrite(i8* %1, i64 %15, i64 1, %struct._IO_FILE* nonnull %5)
  %17 = icmp eq i64 %16, 1
  br i1 %17, label %21, label %18

; <label>:18:                                     ; preds = %10
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.24, i64 0, i64 0), i8* %0) #10
  tail call void @exit(i32 0) #9
  unreachable

; <label>:21:                                     ; preds = %10
  %22 = tail call i32 @fclose(%struct._IO_FILE* nonnull %5)
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @int_to_uchar(i32* nocapture readonly, i8* nocapture, i32) local_unnamed_addr #4 {
  %4 = load i32, i32* %0, align 4
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %.lr.ph10.preheader, label %._crit_edge

.lr.ph10.preheader:                               ; preds = %3
  %6 = add i32 %2, -1
  %xtraiter16 = and i32 %2, 3
  %lcmp.mod17 = icmp eq i32 %xtraiter16, 0
  br i1 %lcmp.mod17, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol.preheader

.lr.ph10.prol.preheader:                          ; preds = %.lr.ph10.preheader
  br label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.prol, %.lr.ph10.prol.preheader
  %indvars.iv13.prol = phi i64 [ %indvars.iv.next14.prol, %.lr.ph10.prol ], [ 0, %.lr.ph10.prol.preheader ]
  %.08.prol = phi i32 [ %.1.prol, %.lr.ph10.prol ], [ %4, %.lr.ph10.prol.preheader ]
  %.017.prol = phi i32 [ %..01.prol, %.lr.ph10.prol ], [ %4, %.lr.ph10.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph10.prol ], [ %xtraiter16, %.lr.ph10.prol.preheader ]
  %7 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv13.prol
  %8 = load i32, i32* %7, align 4
  %9 = icmp sgt i32 %8, %.017.prol
  %..01.prol = select i1 %9, i32 %8, i32 %.017.prol
  %10 = icmp slt i32 %8, %.08.prol
  %.1.prol = select i1 %10, i32 %8, i32 %.08.prol
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv13.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph10.prol.loopexit.loopexit, label %.lr.ph10.prol, !llvm.loop !1

.lr.ph10.prol.loopexit.loopexit:                  ; preds = %.lr.ph10.prol
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol.loopexit.loopexit, %.lr.ph10.preheader
  %indvars.iv13.unr = phi i64 [ 0, %.lr.ph10.preheader ], [ %indvars.iv.next14.prol, %.lr.ph10.prol.loopexit.loopexit ]
  %.08.unr = phi i32 [ %4, %.lr.ph10.preheader ], [ %.1.prol, %.lr.ph10.prol.loopexit.loopexit ]
  %.017.unr = phi i32 [ %4, %.lr.ph10.preheader ], [ %..01.prol, %.lr.ph10.prol.loopexit.loopexit ]
  %..01.lcssa.unr = phi i32 [ undef, %.lr.ph10.preheader ], [ %..01.prol, %.lr.ph10.prol.loopexit.loopexit ]
  %.1.lcssa.unr = phi i32 [ undef, %.lr.ph10.preheader ], [ %.1.prol, %.lr.ph10.prol.loopexit.loopexit ]
  %11 = icmp ult i32 %6, 3
  br i1 %11, label %._crit_edge11.thread, label %.lr.ph10.preheader23

.lr.ph10.preheader23:                             ; preds = %.lr.ph10.prol.loopexit
  %wide.trip.count15.3 = zext i32 %2 to i64
  br label %.lr.ph10

._crit_edge11.thread:                             ; preds = %.lr.ph10.prol.loopexit
  %12 = sub nsw i32 %..01.lcssa.unr, %.1.lcssa.unr
  br label %.lr.ph.preheader

.lr.ph10:                                         ; preds = %.lr.ph10, %.lr.ph10.preheader23
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.3, %.lr.ph10 ], [ %indvars.iv13.unr, %.lr.ph10.preheader23 ]
  %.08 = phi i32 [ %.1.3, %.lr.ph10 ], [ %.08.unr, %.lr.ph10.preheader23 ]
  %.017 = phi i32 [ %..01.3, %.lr.ph10 ], [ %.017.unr, %.lr.ph10.preheader23 ]
  %13 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv13
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, %.017
  %..01 = select i1 %15, i32 %14, i32 %.017
  %16 = icmp slt i32 %14, %.08
  %.1 = select i1 %16, i32 %14, i32 %.08
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %17 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next14
  %18 = load i32, i32* %17, align 4
  %19 = icmp sgt i32 %18, %..01
  %..01.1 = select i1 %19, i32 %18, i32 %..01
  %20 = icmp slt i32 %18, %.1
  %.1.1 = select i1 %20, i32 %18, i32 %.1
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %21 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next14.1
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, %..01.1
  %..01.2 = select i1 %23, i32 %22, i32 %..01.1
  %24 = icmp slt i32 %22, %.1.1
  %.1.2 = select i1 %24, i32 %22, i32 %.1.1
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv13, 3
  %25 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next14.2
  %26 = load i32, i32* %25, align 4
  %27 = icmp sgt i32 %26, %..01.2
  %..01.3 = select i1 %27, i32 %26, i32 %..01.2
  %28 = icmp slt i32 %26, %.1.2
  %.1.3 = select i1 %28, i32 %26, i32 %.1.2
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv13, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next14.3, %wide.trip.count15.3
  br i1 %exitcond.3, label %._crit_edge11, label %.lr.ph10

._crit_edge11:                                    ; preds = %.lr.ph10
  %29 = sub nsw i32 %..01.3, %.1.3
  %30 = icmp sgt i32 %2, 0
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge11, %._crit_edge11.thread
  %31 = phi i32 [ %12, %._crit_edge11.thread ], [ %29, %._crit_edge11 ]
  %.0.lcssa20 = phi i32 [ %.1.lcssa.unr, %._crit_edge11.thread ], [ %.1.3, %._crit_edge11 ]
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %32 = load i32, i32* %0, align 4
  %33 = sub nsw i32 %32, %.0.lcssa20
  %34 = mul nsw i32 %33, 255
  %35 = sdiv i32 %34, %31
  %36 = trunc i32 %35 to i8
  store i8 %36, i8* %1, align 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %37 = icmp eq i32 %2, 1
  br i1 %37, label %._crit_edge, label %.lr.ph.preheader22

.lr.ph.preheader22:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader22
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader22 ]
  %38 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %39 = load i32, i32* %38, align 4
  %40 = sub nsw i32 %39, %.0.lcssa20
  %41 = mul nsw i32 %40, 255
  %42 = sdiv i32 %41, %31
  %43 = trunc i32 %42 to i8
  %44 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv
  store i8 %43, i8* %44, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %46 = load i32, i32* %45, align 4
  %47 = sub nsw i32 %46, %.0.lcssa20
  %48 = mul nsw i32 %47, 255
  %49 = sdiv i32 %48, %31
  %50 = trunc i32 %49 to i8
  %51 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv.next
  store i8 %50, i8* %51, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %._crit_edge11, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @setup_brightness_lut(i8** nocapture, i32, i32) local_unnamed_addr #3 {
  %4 = tail call noalias i8* @malloc(i64 516) #8
  %5 = getelementptr inbounds i8, i8* %4, i64 258
  store i8* %5, i8** %0, align 8
  %6 = sitofp i32 %1 to float
  %7 = icmp eq i32 %2, 6
  br i1 %7, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %3
  br label %.split

.split.us.preheader:                              ; preds = %3
  br label %.split.us

.split.us:                                        ; preds = %.split.us, %.split.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.split.us ], [ -256, %.split.us.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to float
  %10 = fdiv float %9, %6
  %11 = fpext float %10 to double
  %12 = fmul double %11, %11
  %13 = fmul double %12, %12
  %14 = fmul double %12, %13
  %15 = fsub double -0.000000e+00, %14
  %16 = tail call double @exp(double %15) #8
  %17 = fmul double %16, 1.000000e+02
  %18 = fptoui double %17 to i8
  %19 = load i8*, i8** %0, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 %indvars.iv
  store i8 %18, i8* %20, align 1
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 257
  br i1 %exitcond, label %.us-lcssa.us.loopexit, label %.split.us

.split:                                           ; preds = %.split, %.split.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %.split ], [ -256, %.split.preheader ]
  %21 = trunc i64 %indvars.iv4 to i32
  %22 = sitofp i32 %21 to float
  %23 = fdiv float %22, %6
  %24 = fpext float %23 to double
  %25 = fmul double %24, %24
  %26 = fsub double -0.000000e+00, %25
  %27 = tail call double @exp(double %26) #8
  %28 = fmul double %27, 1.000000e+02
  %29 = fptoui double %28 to i8
  %30 = load i8*, i8** %0, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 %indvars.iv4
  store i8 %29, i8* %31, align 1
  %indvars.iv.next5 = add nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 257
  br i1 %exitcond6, label %.us-lcssa.us.loopexit9, label %.split

.us-lcssa.us.loopexit:                            ; preds = %.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit9:                           ; preds = %.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit9, %.us-lcssa.us.loopexit
  ret void
}

; Function Attrs: nounwind
declare double @exp(double) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @free_brightness_lut(i8* nocapture) local_unnamed_addr #3 {
  %2 = getelementptr inbounds i8, i8* %0, i64 -258
  tail call void @free(i8* %2) #8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @susan_principle(i8* nocapture readonly, i32* nocapture, i8* readonly, i32, i32, i32) local_unnamed_addr #3 {
  %7 = bitcast i32* %1 to i8*
  %8 = mul nsw i32 %5, %4
  %9 = sext i32 %8 to i64
  %10 = shl nsw i64 %9, 2
  tail call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %10, i32 4, i1 false)
  %11 = add nsw i32 %5, -3
  %12 = icmp sgt i32 %11, 3
  br i1 %12, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %6
  %13 = add nsw i32 %4, -3
  %14 = icmp sgt i32 %13, 3
  %15 = sext i32 %13 to i64
  %16 = add nsw i32 %4, -5
  %17 = sext i32 %16 to i64
  %18 = add nsw i32 %4, -6
  %19 = sext i32 %18 to i64
  %20 = sext i32 %4 to i64
  %21 = sext i32 %4 to i64
  %wide.trip.count = zext i32 %13 to i64
  %wide.trip.count7 = zext i32 %11 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 3, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge ]
  br i1 %14, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %22 = add nsw i64 %indvars.iv5, -3
  %23 = mul nsw i64 %22, %21
  %24 = getelementptr inbounds i8, i8* %0, i64 %23
  %25 = mul nsw i64 %indvars.iv5, %20
  br label %26

; <label>:26:                                     ; preds = %325, %.lr.ph
  %indvars.iv = phi i64 [ 3, %.lr.ph ], [ %indvars.iv.next, %325 ]
  %27 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv
  %28 = getelementptr inbounds i8, i8* %27, i64 -1
  %29 = add nsw i64 %indvars.iv, %25
  %30 = getelementptr inbounds i8, i8* %0, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i64
  %33 = getelementptr inbounds i8, i8* %2, i64 %32
  %34 = getelementptr inbounds i8, i8* %28, i64 1
  %35 = load i8, i8* %28, align 1
  %36 = zext i8 %35 to i64
  %37 = sub nsw i64 0, %36
  %38 = getelementptr inbounds i8, i8* %33, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = add nuw nsw i32 %40, 100
  %42 = getelementptr inbounds i8, i8* %34, i64 1
  %43 = load i8, i8* %34, align 1
  %44 = zext i8 %43 to i64
  %45 = sub nsw i64 0, %44
  %46 = getelementptr inbounds i8, i8* %33, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = add nuw nsw i32 %41, %48
  %50 = load i8, i8* %42, align 1
  %51 = zext i8 %50 to i64
  %52 = sub nsw i64 0, %51
  %53 = getelementptr inbounds i8, i8* %33, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = add nuw nsw i32 %49, %55
  %57 = getelementptr inbounds i8, i8* %42, i64 %15
  %58 = getelementptr inbounds i8, i8* %57, i64 1
  %59 = load i8, i8* %57, align 1
  %60 = zext i8 %59 to i64
  %61 = sub nsw i64 0, %60
  %62 = getelementptr inbounds i8, i8* %33, i64 %61
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = add nuw nsw i32 %56, %64
  %66 = getelementptr inbounds i8, i8* %58, i64 1
  %67 = load i8, i8* %58, align 1
  %68 = zext i8 %67 to i64
  %69 = sub nsw i64 0, %68
  %70 = getelementptr inbounds i8, i8* %33, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = add nuw nsw i32 %65, %72
  %74 = getelementptr inbounds i8, i8* %66, i64 1
  %75 = load i8, i8* %66, align 1
  %76 = zext i8 %75 to i64
  %77 = sub nsw i64 0, %76
  %78 = getelementptr inbounds i8, i8* %33, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = add nuw nsw i32 %73, %80
  %82 = getelementptr inbounds i8, i8* %74, i64 1
  %83 = load i8, i8* %74, align 1
  %84 = zext i8 %83 to i64
  %85 = sub nsw i64 0, %84
  %86 = getelementptr inbounds i8, i8* %33, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = add nsw i32 %81, %88
  %90 = load i8, i8* %82, align 1
  %91 = zext i8 %90 to i64
  %92 = sub nsw i64 0, %91
  %93 = getelementptr inbounds i8, i8* %33, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = add nsw i32 %89, %95
  %97 = getelementptr inbounds i8, i8* %82, i64 %17
  %98 = getelementptr inbounds i8, i8* %97, i64 1
  %99 = load i8, i8* %97, align 1
  %100 = zext i8 %99 to i64
  %101 = sub nsw i64 0, %100
  %102 = getelementptr inbounds i8, i8* %33, i64 %101
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = add nsw i32 %96, %104
  %106 = getelementptr inbounds i8, i8* %98, i64 1
  %107 = load i8, i8* %98, align 1
  %108 = zext i8 %107 to i64
  %109 = sub nsw i64 0, %108
  %110 = getelementptr inbounds i8, i8* %33, i64 %109
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = add nsw i32 %105, %112
  %114 = getelementptr inbounds i8, i8* %106, i64 1
  %115 = load i8, i8* %106, align 1
  %116 = zext i8 %115 to i64
  %117 = sub nsw i64 0, %116
  %118 = getelementptr inbounds i8, i8* %33, i64 %117
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = add nsw i32 %113, %120
  %122 = getelementptr inbounds i8, i8* %114, i64 1
  %123 = load i8, i8* %114, align 1
  %124 = zext i8 %123 to i64
  %125 = sub nsw i64 0, %124
  %126 = getelementptr inbounds i8, i8* %33, i64 %125
  %127 = load i8, i8* %126, align 1
  %128 = zext i8 %127 to i32
  %129 = add nsw i32 %121, %128
  %130 = getelementptr inbounds i8, i8* %122, i64 1
  %131 = load i8, i8* %122, align 1
  %132 = zext i8 %131 to i64
  %133 = sub nsw i64 0, %132
  %134 = getelementptr inbounds i8, i8* %33, i64 %133
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = add nsw i32 %129, %136
  %138 = getelementptr inbounds i8, i8* %130, i64 1
  %139 = load i8, i8* %130, align 1
  %140 = zext i8 %139 to i64
  %141 = sub nsw i64 0, %140
  %142 = getelementptr inbounds i8, i8* %33, i64 %141
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = add nsw i32 %137, %144
  %146 = load i8, i8* %138, align 1
  %147 = zext i8 %146 to i64
  %148 = sub nsw i64 0, %147
  %149 = getelementptr inbounds i8, i8* %33, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = add nsw i32 %145, %151
  %153 = getelementptr inbounds i8, i8* %138, i64 %19
  %154 = getelementptr inbounds i8, i8* %153, i64 1
  %155 = load i8, i8* %153, align 1
  %156 = zext i8 %155 to i64
  %157 = sub nsw i64 0, %156
  %158 = getelementptr inbounds i8, i8* %33, i64 %157
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = add nsw i32 %152, %160
  %162 = getelementptr inbounds i8, i8* %154, i64 1
  %163 = load i8, i8* %154, align 1
  %164 = zext i8 %163 to i64
  %165 = sub nsw i64 0, %164
  %166 = getelementptr inbounds i8, i8* %33, i64 %165
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = add nsw i32 %161, %168
  %170 = load i8, i8* %162, align 1
  %171 = zext i8 %170 to i64
  %172 = sub nsw i64 0, %171
  %173 = getelementptr inbounds i8, i8* %33, i64 %172
  %174 = load i8, i8* %173, align 1
  %175 = zext i8 %174 to i32
  %176 = add nsw i32 %169, %175
  %177 = getelementptr inbounds i8, i8* %162, i64 2
  %178 = getelementptr inbounds i8, i8* %177, i64 1
  %179 = load i8, i8* %177, align 1
  %180 = zext i8 %179 to i64
  %181 = sub nsw i64 0, %180
  %182 = getelementptr inbounds i8, i8* %33, i64 %181
  %183 = load i8, i8* %182, align 1
  %184 = zext i8 %183 to i32
  %185 = add nsw i32 %176, %184
  %186 = getelementptr inbounds i8, i8* %178, i64 1
  %187 = load i8, i8* %178, align 1
  %188 = zext i8 %187 to i64
  %189 = sub nsw i64 0, %188
  %190 = getelementptr inbounds i8, i8* %33, i64 %189
  %191 = load i8, i8* %190, align 1
  %192 = zext i8 %191 to i32
  %193 = add nsw i32 %185, %192
  %194 = load i8, i8* %186, align 1
  %195 = zext i8 %194 to i64
  %196 = sub nsw i64 0, %195
  %197 = getelementptr inbounds i8, i8* %33, i64 %196
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = add nsw i32 %193, %199
  %201 = getelementptr inbounds i8, i8* %186, i64 %19
  %202 = getelementptr inbounds i8, i8* %201, i64 1
  %203 = load i8, i8* %201, align 1
  %204 = zext i8 %203 to i64
  %205 = sub nsw i64 0, %204
  %206 = getelementptr inbounds i8, i8* %33, i64 %205
  %207 = load i8, i8* %206, align 1
  %208 = zext i8 %207 to i32
  %209 = add nsw i32 %200, %208
  %210 = getelementptr inbounds i8, i8* %202, i64 1
  %211 = load i8, i8* %202, align 1
  %212 = zext i8 %211 to i64
  %213 = sub nsw i64 0, %212
  %214 = getelementptr inbounds i8, i8* %33, i64 %213
  %215 = load i8, i8* %214, align 1
  %216 = zext i8 %215 to i32
  %217 = add nsw i32 %209, %216
  %218 = getelementptr inbounds i8, i8* %210, i64 1
  %219 = load i8, i8* %210, align 1
  %220 = zext i8 %219 to i64
  %221 = sub nsw i64 0, %220
  %222 = getelementptr inbounds i8, i8* %33, i64 %221
  %223 = load i8, i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = add nsw i32 %217, %224
  %226 = getelementptr inbounds i8, i8* %218, i64 1
  %227 = load i8, i8* %218, align 1
  %228 = zext i8 %227 to i64
  %229 = sub nsw i64 0, %228
  %230 = getelementptr inbounds i8, i8* %33, i64 %229
  %231 = load i8, i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = add nsw i32 %225, %232
  %234 = getelementptr inbounds i8, i8* %226, i64 1
  %235 = load i8, i8* %226, align 1
  %236 = zext i8 %235 to i64
  %237 = sub nsw i64 0, %236
  %238 = getelementptr inbounds i8, i8* %33, i64 %237
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = add nsw i32 %233, %240
  %242 = getelementptr inbounds i8, i8* %234, i64 1
  %243 = load i8, i8* %234, align 1
  %244 = zext i8 %243 to i64
  %245 = sub nsw i64 0, %244
  %246 = getelementptr inbounds i8, i8* %33, i64 %245
  %247 = load i8, i8* %246, align 1
  %248 = zext i8 %247 to i32
  %249 = add nsw i32 %241, %248
  %250 = load i8, i8* %242, align 1
  %251 = zext i8 %250 to i64
  %252 = sub nsw i64 0, %251
  %253 = getelementptr inbounds i8, i8* %33, i64 %252
  %254 = load i8, i8* %253, align 1
  %255 = zext i8 %254 to i32
  %256 = add nsw i32 %249, %255
  %257 = getelementptr inbounds i8, i8* %242, i64 %17
  %258 = getelementptr inbounds i8, i8* %257, i64 1
  %259 = load i8, i8* %257, align 1
  %260 = zext i8 %259 to i64
  %261 = sub nsw i64 0, %260
  %262 = getelementptr inbounds i8, i8* %33, i64 %261
  %263 = load i8, i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = add nsw i32 %256, %264
  %266 = getelementptr inbounds i8, i8* %258, i64 1
  %267 = load i8, i8* %258, align 1
  %268 = zext i8 %267 to i64
  %269 = sub nsw i64 0, %268
  %270 = getelementptr inbounds i8, i8* %33, i64 %269
  %271 = load i8, i8* %270, align 1
  %272 = zext i8 %271 to i32
  %273 = add nsw i32 %265, %272
  %274 = getelementptr inbounds i8, i8* %266, i64 1
  %275 = load i8, i8* %266, align 1
  %276 = zext i8 %275 to i64
  %277 = sub nsw i64 0, %276
  %278 = getelementptr inbounds i8, i8* %33, i64 %277
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = add nsw i32 %273, %280
  %282 = getelementptr inbounds i8, i8* %274, i64 1
  %283 = load i8, i8* %274, align 1
  %284 = zext i8 %283 to i64
  %285 = sub nsw i64 0, %284
  %286 = getelementptr inbounds i8, i8* %33, i64 %285
  %287 = load i8, i8* %286, align 1
  %288 = zext i8 %287 to i32
  %289 = add nsw i32 %281, %288
  %290 = load i8, i8* %282, align 1
  %291 = zext i8 %290 to i64
  %292 = sub nsw i64 0, %291
  %293 = getelementptr inbounds i8, i8* %33, i64 %292
  %294 = load i8, i8* %293, align 1
  %295 = zext i8 %294 to i32
  %296 = add nsw i32 %289, %295
  %297 = getelementptr inbounds i8, i8* %282, i64 %15
  %298 = getelementptr inbounds i8, i8* %297, i64 1
  %299 = load i8, i8* %297, align 1
  %300 = zext i8 %299 to i64
  %301 = sub nsw i64 0, %300
  %302 = getelementptr inbounds i8, i8* %33, i64 %301
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i32
  %305 = add nsw i32 %296, %304
  %306 = getelementptr inbounds i8, i8* %298, i64 1
  %307 = load i8, i8* %298, align 1
  %308 = zext i8 %307 to i64
  %309 = sub nsw i64 0, %308
  %310 = getelementptr inbounds i8, i8* %33, i64 %309
  %311 = load i8, i8* %310, align 1
  %312 = zext i8 %311 to i32
  %313 = add nsw i32 %305, %312
  %314 = load i8, i8* %306, align 1
  %315 = zext i8 %314 to i64
  %316 = sub nsw i64 0, %315
  %317 = getelementptr inbounds i8, i8* %33, i64 %316
  %318 = load i8, i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = add nsw i32 %313, %319
  %321 = icmp sgt i32 %320, %3
  br i1 %321, label %325, label %322

; <label>:322:                                    ; preds = %26
  %323 = getelementptr inbounds i32, i32* %1, i64 %29
  %324 = sub nsw i32 %3, %320
  store i32 %324, i32* %323, align 4
  br label %325

; <label>:325:                                    ; preds = %322, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %26

._crit_edge.loopexit:                             ; preds = %325
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %6
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

; Function Attrs: noinline nounwind uwtable
define void @susan_principle_small(i8* nocapture readonly, i32* nocapture, i8* nocapture readonly, i32, i32, i32) local_unnamed_addr #3 {
  %7 = bitcast i32* %1 to i8*
  %8 = mul nsw i32 %5, %4
  %9 = sext i32 %8 to i64
  %10 = shl nsw i64 %9, 2
  tail call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %10, i32 4, i1 false)
  %11 = add nsw i32 %5, -1
  %12 = icmp sgt i32 %11, 1
  br i1 %12, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %6
  %13 = add nsw i32 %4, -1
  %14 = icmp sgt i32 %13, 1
  %15 = add nsw i32 %4, -2
  %16 = sext i32 %15 to i64
  br i1 %14, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %17 = sext i32 %4 to i64
  %18 = sext i32 %4 to i64
  %wide.trip.count = zext i32 %13 to i64
  %wide.trip.count8 = zext i32 %11 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 1, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %19 = add nsw i64 %indvars.iv6, -1
  %20 = mul nsw i64 %19, %17
  %21 = getelementptr inbounds i8, i8* %0, i64 %20
  %22 = mul nsw i64 %indvars.iv6, %18
  br label %23

; <label>:23:                                     ; preds = %98, %.preheader.us
  %indvars.iv = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next, %98 ]
  %24 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv
  %25 = getelementptr inbounds i8, i8* %24, i64 -1
  %26 = add nsw i64 %indvars.iv, %22
  %27 = getelementptr inbounds i8, i8* %0, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds i8, i8* %2, i64 %29
  %31 = getelementptr inbounds i8, i8* %25, i64 1
  %32 = load i8, i8* %25, align 1
  %33 = zext i8 %32 to i64
  %34 = sub nsw i64 0, %33
  %35 = getelementptr inbounds i8, i8* %30, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = add nuw nsw i32 %37, 100
  %39 = getelementptr inbounds i8, i8* %31, i64 1
  %40 = load i8, i8* %31, align 1
  %41 = zext i8 %40 to i64
  %42 = sub nsw i64 0, %41
  %43 = getelementptr inbounds i8, i8* %30, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = add nuw nsw i32 %38, %45
  %47 = load i8, i8* %39, align 1
  %48 = zext i8 %47 to i64
  %49 = sub nsw i64 0, %48
  %50 = getelementptr inbounds i8, i8* %30, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = add nuw nsw i32 %46, %52
  %54 = getelementptr inbounds i8, i8* %39, i64 %16
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i64
  %57 = sub nsw i64 0, %56
  %58 = getelementptr inbounds i8, i8* %30, i64 %57
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = add nuw nsw i32 %53, %60
  %62 = getelementptr inbounds i8, i8* %54, i64 2
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i64
  %65 = sub nsw i64 0, %64
  %66 = getelementptr inbounds i8, i8* %30, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = add nuw nsw i32 %61, %68
  %70 = getelementptr inbounds i8, i8* %62, i64 %16
  %71 = getelementptr inbounds i8, i8* %70, i64 1
  %72 = load i8, i8* %70, align 1
  %73 = zext i8 %72 to i64
  %74 = sub nsw i64 0, %73
  %75 = getelementptr inbounds i8, i8* %30, i64 %74
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = add nuw nsw i32 %69, %77
  %79 = getelementptr inbounds i8, i8* %71, i64 1
  %80 = load i8, i8* %71, align 1
  %81 = zext i8 %80 to i64
  %82 = sub nsw i64 0, %81
  %83 = getelementptr inbounds i8, i8* %30, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = add nsw i32 %78, %85
  %87 = load i8, i8* %79, align 1
  %88 = zext i8 %87 to i64
  %89 = sub nsw i64 0, %88
  %90 = getelementptr inbounds i8, i8* %30, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = add nsw i32 %86, %92
  %94 = icmp slt i32 %93, 731
  br i1 %94, label %95, label %98

; <label>:95:                                     ; preds = %23
  %96 = getelementptr inbounds i32, i32* %1, i64 %26
  %97 = sub nsw i32 730, %93
  store i32 %97, i32* %96, align 4
  br label %98

; <label>:98:                                     ; preds = %95, %23
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %23

._crit_edge.us:                                   ; preds = %98
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.preheader.lr.ph, %6
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define zeroext i8 @median(i8* nocapture readonly, i32, i32, i32) local_unnamed_addr #6 {
  %5 = alloca [8 x i32], align 16
  %6 = add nsw i32 %1, -1
  %7 = mul nsw i32 %6, %3
  %8 = add nsw i32 %7, %2
  %9 = add nsw i32 %8, -1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, i8* %0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 0
  store i32 %13, i32* %14, align 16
  %15 = sext i32 %8 to i64
  %16 = getelementptr inbounds i8, i8* %0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 1
  store i32 %18, i32* %19, align 4
  %20 = add nsw i32 %8, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 2
  store i32 %24, i32* %25, align 8
  %26 = mul nsw i32 %3, %1
  %27 = add nsw i32 %26, %2
  %28 = add nsw i32 %27, -1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %0, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 3
  store i32 %32, i32* %33, align 4
  %34 = add nsw i32 %27, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %0, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 4
  store i32 %38, i32* %39, align 16
  %40 = add nsw i32 %1, 1
  %41 = mul nsw i32 %40, %3
  %42 = add nsw i32 %41, %2
  %43 = add nsw i32 %42, -1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %0, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 5
  store i32 %47, i32* %48, align 4
  %49 = sext i32 %42 to i64
  %50 = getelementptr inbounds i8, i8* %0, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 6
  store i32 %52, i32* %53, align 8
  %54 = add nsw i32 %42, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %0, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 7
  store i32 %58, i32* %59, align 4
  %60 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 0
  %61 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 1
  %62 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 1
  %63 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 2
  %64 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 2
  %65 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 3
  %66 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 3
  %67 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 4
  %68 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 4
  %69 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 5
  %70 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 5
  %71 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 6
  %72 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 6
  %73 = getelementptr inbounds [8 x i32], [8 x i32]* %5, i64 0, i64 7
  br label %.lr.ph

.lr.ph:                                           ; preds = %4
  %74 = load i32, i32* %60, align 16
  %75 = load i32, i32* %61, align 4
  %76 = icmp sgt i32 %74, %75
  br i1 %76, label %77, label %.backedge

.backedge:                                        ; preds = %77, %.lr.ph
  br i1 false, label %._crit_edge, label %.lr.ph.1

; <label>:77:                                     ; preds = %.lr.ph
  store i32 %75, i32* %60, align 16
  store i32 %74, i32* %61, align 4
  br label %.backedge

._crit_edge:                                      ; preds = %104, %.lr.ph.6, %.backedge.5, %.backedge.4, %.backedge.3, %.backedge.2, %.backedge.1, %.backedge
  %78 = load i32, i32* %60, align 16
  %79 = load i32, i32* %61, align 4
  %80 = icmp sgt i32 %78, %79
  br i1 %80, label %105, label %.backedge.19

.lr.ph.1:                                         ; preds = %.backedge
  %81 = load i32, i32* %62, align 4
  %82 = load i32, i32* %63, align 8
  %83 = icmp sgt i32 %81, %82
  br i1 %83, label %84, label %.backedge.1

; <label>:84:                                     ; preds = %.lr.ph.1
  store i32 %82, i32* %62, align 4
  store i32 %81, i32* %63, align 8
  br label %.backedge.1

.backedge.1:                                      ; preds = %84, %.lr.ph.1
  br i1 false, label %._crit_edge, label %.lr.ph.2

.lr.ph.2:                                         ; preds = %.backedge.1
  %85 = load i32, i32* %64, align 8
  %86 = load i32, i32* %65, align 4
  %87 = icmp sgt i32 %85, %86
  br i1 %87, label %88, label %.backedge.2

; <label>:88:                                     ; preds = %.lr.ph.2
  store i32 %86, i32* %64, align 8
  store i32 %85, i32* %65, align 4
  br label %.backedge.2

.backedge.2:                                      ; preds = %88, %.lr.ph.2
  br i1 false, label %._crit_edge, label %.lr.ph.3

.lr.ph.3:                                         ; preds = %.backedge.2
  %89 = load i32, i32* %66, align 4
  %90 = load i32, i32* %67, align 16
  %91 = icmp sgt i32 %89, %90
  br i1 %91, label %92, label %.backedge.3

; <label>:92:                                     ; preds = %.lr.ph.3
  store i32 %90, i32* %66, align 4
  store i32 %89, i32* %67, align 16
  br label %.backedge.3

.backedge.3:                                      ; preds = %92, %.lr.ph.3
  br i1 false, label %._crit_edge, label %.lr.ph.4

.lr.ph.4:                                         ; preds = %.backedge.3
  %93 = load i32, i32* %68, align 16
  %94 = load i32, i32* %69, align 4
  %95 = icmp sgt i32 %93, %94
  br i1 %95, label %96, label %.backedge.4

; <label>:96:                                     ; preds = %.lr.ph.4
  store i32 %94, i32* %68, align 16
  store i32 %93, i32* %69, align 4
  br label %.backedge.4

.backedge.4:                                      ; preds = %96, %.lr.ph.4
  br i1 false, label %._crit_edge, label %.lr.ph.5

.lr.ph.5:                                         ; preds = %.backedge.4
  %97 = load i32, i32* %70, align 4
  %98 = load i32, i32* %71, align 8
  %99 = icmp sgt i32 %97, %98
  br i1 %99, label %100, label %.backedge.5

; <label>:100:                                    ; preds = %.lr.ph.5
  store i32 %98, i32* %70, align 4
  store i32 %97, i32* %71, align 8
  br label %.backedge.5

.backedge.5:                                      ; preds = %100, %.lr.ph.5
  br i1 false, label %._crit_edge, label %.lr.ph.6

.lr.ph.6:                                         ; preds = %.backedge.5
  %101 = load i32, i32* %72, align 8
  %102 = load i32, i32* %73, align 4
  %103 = icmp sgt i32 %101, %102
  br i1 %103, label %104, label %._crit_edge

; <label>:104:                                    ; preds = %.lr.ph.6
  store i32 %102, i32* %72, align 8
  store i32 %101, i32* %73, align 4
  br label %._crit_edge

; <label>:105:                                    ; preds = %._crit_edge
  store i32 %79, i32* %60, align 16
  store i32 %78, i32* %61, align 4
  br label %.backedge.19

.backedge.19:                                     ; preds = %105, %._crit_edge
  br i1 false, label %._crit_edge.1, label %.lr.ph.1.1

.lr.ph.1.1:                                       ; preds = %.backedge.19
  %106 = load i32, i32* %62, align 4
  %107 = load i32, i32* %63, align 8
  %108 = icmp sgt i32 %106, %107
  br i1 %108, label %109, label %.backedge.1.1

; <label>:109:                                    ; preds = %.lr.ph.1.1
  store i32 %107, i32* %62, align 4
  store i32 %106, i32* %63, align 8
  br label %.backedge.1.1

.backedge.1.1:                                    ; preds = %109, %.lr.ph.1.1
  br i1 false, label %._crit_edge.1, label %.lr.ph.2.1

.lr.ph.2.1:                                       ; preds = %.backedge.1.1
  %110 = load i32, i32* %64, align 8
  %111 = load i32, i32* %65, align 4
  %112 = icmp sgt i32 %110, %111
  br i1 %112, label %113, label %.backedge.2.1

; <label>:113:                                    ; preds = %.lr.ph.2.1
  store i32 %111, i32* %64, align 8
  store i32 %110, i32* %65, align 4
  br label %.backedge.2.1

.backedge.2.1:                                    ; preds = %113, %.lr.ph.2.1
  br i1 false, label %._crit_edge.1, label %.lr.ph.3.1

.lr.ph.3.1:                                       ; preds = %.backedge.2.1
  %114 = load i32, i32* %66, align 4
  %115 = load i32, i32* %67, align 16
  %116 = icmp sgt i32 %114, %115
  br i1 %116, label %117, label %.backedge.3.1

; <label>:117:                                    ; preds = %.lr.ph.3.1
  store i32 %115, i32* %66, align 4
  store i32 %114, i32* %67, align 16
  br label %.backedge.3.1

.backedge.3.1:                                    ; preds = %117, %.lr.ph.3.1
  br i1 false, label %._crit_edge.1, label %.lr.ph.4.1

.lr.ph.4.1:                                       ; preds = %.backedge.3.1
  %118 = load i32, i32* %68, align 16
  %119 = load i32, i32* %69, align 4
  %120 = icmp sgt i32 %118, %119
  br i1 %120, label %121, label %.backedge.4.1

; <label>:121:                                    ; preds = %.lr.ph.4.1
  store i32 %119, i32* %68, align 16
  store i32 %118, i32* %69, align 4
  br label %.backedge.4.1

.backedge.4.1:                                    ; preds = %121, %.lr.ph.4.1
  br i1 false, label %._crit_edge.1, label %.lr.ph.5.1

.lr.ph.5.1:                                       ; preds = %.backedge.4.1
  %122 = load i32, i32* %70, align 4
  %123 = load i32, i32* %71, align 8
  %124 = icmp sgt i32 %122, %123
  br i1 %124, label %125, label %.backedge.5.1

; <label>:125:                                    ; preds = %.lr.ph.5.1
  store i32 %123, i32* %70, align 4
  store i32 %122, i32* %71, align 8
  br label %.backedge.5.1

.backedge.5.1:                                    ; preds = %125, %.lr.ph.5.1
  br i1 true, label %._crit_edge.1, label %.lr.ph.6.1

.lr.ph.6.1:                                       ; preds = %.backedge.5.1
  br i1 undef, label %126, label %._crit_edge.1

; <label>:126:                                    ; preds = %.lr.ph.6.1
  br label %._crit_edge.1

._crit_edge.1:                                    ; preds = %126, %.lr.ph.6.1, %.backedge.5.1, %.backedge.4.1, %.backedge.3.1, %.backedge.2.1, %.backedge.1.1, %.backedge.19
  %127 = load i32, i32* %60, align 16
  %128 = load i32, i32* %61, align 4
  %129 = icmp sgt i32 %127, %128
  br i1 %129, label %130, label %.backedge.212

; <label>:130:                                    ; preds = %._crit_edge.1
  store i32 %128, i32* %60, align 16
  store i32 %127, i32* %61, align 4
  br label %.backedge.212

.backedge.212:                                    ; preds = %130, %._crit_edge.1
  br i1 false, label %._crit_edge.2, label %.lr.ph.1.2

.lr.ph.1.2:                                       ; preds = %.backedge.212
  %131 = load i32, i32* %62, align 4
  %132 = load i32, i32* %63, align 8
  %133 = icmp sgt i32 %131, %132
  br i1 %133, label %134, label %.backedge.1.2

; <label>:134:                                    ; preds = %.lr.ph.1.2
  store i32 %132, i32* %62, align 4
  store i32 %131, i32* %63, align 8
  br label %.backedge.1.2

.backedge.1.2:                                    ; preds = %134, %.lr.ph.1.2
  br i1 false, label %._crit_edge.2, label %.lr.ph.2.2

.lr.ph.2.2:                                       ; preds = %.backedge.1.2
  %135 = load i32, i32* %64, align 8
  %136 = load i32, i32* %65, align 4
  %137 = icmp sgt i32 %135, %136
  br i1 %137, label %138, label %.backedge.2.2

; <label>:138:                                    ; preds = %.lr.ph.2.2
  store i32 %136, i32* %64, align 8
  store i32 %135, i32* %65, align 4
  br label %.backedge.2.2

.backedge.2.2:                                    ; preds = %138, %.lr.ph.2.2
  br i1 false, label %._crit_edge.2, label %.lr.ph.3.2

.lr.ph.3.2:                                       ; preds = %.backedge.2.2
  %139 = load i32, i32* %66, align 4
  %140 = load i32, i32* %67, align 16
  %141 = icmp sgt i32 %139, %140
  br i1 %141, label %142, label %.backedge.3.2

; <label>:142:                                    ; preds = %.lr.ph.3.2
  store i32 %140, i32* %66, align 4
  store i32 %139, i32* %67, align 16
  br label %.backedge.3.2

.backedge.3.2:                                    ; preds = %142, %.lr.ph.3.2
  br i1 false, label %._crit_edge.2, label %.lr.ph.4.2

.lr.ph.4.2:                                       ; preds = %.backedge.3.2
  %143 = load i32, i32* %68, align 16
  %144 = load i32, i32* %69, align 4
  %145 = icmp sgt i32 %143, %144
  br i1 %145, label %146, label %.backedge.4.2

; <label>:146:                                    ; preds = %.lr.ph.4.2
  store i32 %144, i32* %68, align 16
  store i32 %143, i32* %69, align 4
  br label %.backedge.4.2

.backedge.4.2:                                    ; preds = %146, %.lr.ph.4.2
  br i1 true, label %._crit_edge.2, label %.lr.ph.5.2

.lr.ph.5.2:                                       ; preds = %.backedge.4.2
  br i1 undef, label %147, label %.backedge.5.2

; <label>:147:                                    ; preds = %.lr.ph.5.2
  br label %.backedge.5.2

.backedge.5.2:                                    ; preds = %147, %.lr.ph.5.2
  br i1 false, label %._crit_edge.2, label %.lr.ph.6.2

.lr.ph.6.2:                                       ; preds = %.backedge.5.2
  br i1 undef, label %148, label %._crit_edge.2

; <label>:148:                                    ; preds = %.lr.ph.6.2
  br label %._crit_edge.2

._crit_edge.2:                                    ; preds = %148, %.lr.ph.6.2, %.backedge.5.2, %.backedge.4.2, %.backedge.3.2, %.backedge.2.2, %.backedge.1.2, %.backedge.212
  %149 = load i32, i32* %60, align 16
  %150 = load i32, i32* %61, align 4
  %151 = icmp sgt i32 %149, %150
  br i1 %151, label %152, label %.backedge.315

; <label>:152:                                    ; preds = %._crit_edge.2
  store i32 %150, i32* %60, align 16
  store i32 %149, i32* %61, align 4
  br label %.backedge.315

.backedge.315:                                    ; preds = %152, %._crit_edge.2
  br i1 false, label %._crit_edge.3, label %.lr.ph.1.3

.lr.ph.1.3:                                       ; preds = %.backedge.315
  %153 = load i32, i32* %62, align 4
  %154 = load i32, i32* %63, align 8
  %155 = icmp sgt i32 %153, %154
  br i1 %155, label %156, label %.backedge.1.3

; <label>:156:                                    ; preds = %.lr.ph.1.3
  store i32 %154, i32* %62, align 4
  store i32 %153, i32* %63, align 8
  br label %.backedge.1.3

.backedge.1.3:                                    ; preds = %156, %.lr.ph.1.3
  br i1 false, label %._crit_edge.3, label %.lr.ph.2.3

.lr.ph.2.3:                                       ; preds = %.backedge.1.3
  %157 = load i32, i32* %64, align 8
  %158 = load i32, i32* %65, align 4
  %159 = icmp sgt i32 %157, %158
  br i1 %159, label %160, label %.backedge.2.3

; <label>:160:                                    ; preds = %.lr.ph.2.3
  store i32 %158, i32* %64, align 8
  store i32 %157, i32* %65, align 4
  br label %.backedge.2.3

.backedge.2.3:                                    ; preds = %160, %.lr.ph.2.3
  br i1 false, label %._crit_edge.3, label %.lr.ph.3.3

.lr.ph.3.3:                                       ; preds = %.backedge.2.3
  %161 = load i32, i32* %66, align 4
  %162 = load i32, i32* %67, align 16
  %163 = icmp sgt i32 %161, %162
  br i1 %163, label %164, label %.backedge.3.3

; <label>:164:                                    ; preds = %.lr.ph.3.3
  store i32 %162, i32* %66, align 4
  store i32 %161, i32* %67, align 16
  br label %.backedge.3.3

.backedge.3.3:                                    ; preds = %164, %.lr.ph.3.3
  br i1 true, label %._crit_edge.3, label %.lr.ph.4.3

.lr.ph.4.3:                                       ; preds = %.backedge.3.3
  br i1 undef, label %165, label %.backedge.4.3

; <label>:165:                                    ; preds = %.lr.ph.4.3
  br label %.backedge.4.3

.backedge.4.3:                                    ; preds = %165, %.lr.ph.4.3
  br i1 false, label %._crit_edge.3, label %.lr.ph.5.3

.lr.ph.5.3:                                       ; preds = %.backedge.4.3
  br i1 undef, label %166, label %.backedge.5.3

; <label>:166:                                    ; preds = %.lr.ph.5.3
  br label %.backedge.5.3

.backedge.5.3:                                    ; preds = %166, %.lr.ph.5.3
  br i1 false, label %._crit_edge.3, label %.lr.ph.6.3

.lr.ph.6.3:                                       ; preds = %.backedge.5.3
  br i1 undef, label %167, label %._crit_edge.3

; <label>:167:                                    ; preds = %.lr.ph.6.3
  br label %._crit_edge.3

._crit_edge.3:                                    ; preds = %167, %.lr.ph.6.3, %.backedge.5.3, %.backedge.4.3, %.backedge.3.3, %.backedge.2.3, %.backedge.1.3, %.backedge.315
  %168 = load i32, i32* %60, align 16
  %169 = load i32, i32* %61, align 4
  %170 = icmp sgt i32 %168, %169
  br i1 %170, label %171, label %.backedge.418

; <label>:171:                                    ; preds = %._crit_edge.3
  store i32 %169, i32* %60, align 16
  store i32 %168, i32* %61, align 4
  br label %.backedge.418

.backedge.418:                                    ; preds = %171, %._crit_edge.3
  br i1 false, label %._crit_edge.4, label %.lr.ph.1.4

.lr.ph.1.4:                                       ; preds = %.backedge.418
  %172 = load i32, i32* %62, align 4
  %173 = load i32, i32* %63, align 8
  %174 = icmp sgt i32 %172, %173
  br i1 %174, label %175, label %.backedge.1.4

; <label>:175:                                    ; preds = %.lr.ph.1.4
  store i32 %173, i32* %62, align 4
  store i32 %172, i32* %63, align 8
  br label %.backedge.1.4

.backedge.1.4:                                    ; preds = %175, %.lr.ph.1.4
  br i1 false, label %._crit_edge.4, label %.lr.ph.2.4

.lr.ph.2.4:                                       ; preds = %.backedge.1.4
  %176 = load i32, i32* %64, align 8
  %177 = load i32, i32* %65, align 4
  %178 = icmp sgt i32 %176, %177
  br i1 %178, label %179, label %.backedge.2.4

; <label>:179:                                    ; preds = %.lr.ph.2.4
  store i32 %177, i32* %64, align 8
  store i32 %176, i32* %65, align 4
  br label %.backedge.2.4

.backedge.2.4:                                    ; preds = %179, %.lr.ph.2.4
  br i1 true, label %._crit_edge.4, label %.lr.ph.3.4

.lr.ph.3.4:                                       ; preds = %.backedge.2.4
  br i1 undef, label %180, label %.backedge.3.4

; <label>:180:                                    ; preds = %.lr.ph.3.4
  br label %.backedge.3.4

.backedge.3.4:                                    ; preds = %180, %.lr.ph.3.4
  br i1 false, label %._crit_edge.4, label %.lr.ph.4.4

.lr.ph.4.4:                                       ; preds = %.backedge.3.4
  br i1 undef, label %181, label %.backedge.4.4

; <label>:181:                                    ; preds = %.lr.ph.4.4
  br label %.backedge.4.4

.backedge.4.4:                                    ; preds = %181, %.lr.ph.4.4
  br i1 false, label %._crit_edge.4, label %.lr.ph.5.4

.lr.ph.5.4:                                       ; preds = %.backedge.4.4
  br i1 undef, label %182, label %.backedge.5.4

; <label>:182:                                    ; preds = %.lr.ph.5.4
  br label %.backedge.5.4

.backedge.5.4:                                    ; preds = %182, %.lr.ph.5.4
  br i1 false, label %._crit_edge.4, label %.lr.ph.6.4

.lr.ph.6.4:                                       ; preds = %.backedge.5.4
  br i1 undef, label %183, label %._crit_edge.4

; <label>:183:                                    ; preds = %.lr.ph.6.4
  br label %._crit_edge.4

._crit_edge.4:                                    ; preds = %183, %.lr.ph.6.4, %.backedge.5.4, %.backedge.4.4, %.backedge.3.4, %.backedge.2.4, %.backedge.1.4, %.backedge.418
  %184 = load i32, i32* %60, align 16
  %185 = load i32, i32* %61, align 4
  %186 = icmp sgt i32 %184, %185
  br i1 %186, label %187, label %.backedge.521

; <label>:187:                                    ; preds = %._crit_edge.4
  store i32 %185, i32* %60, align 16
  store i32 %184, i32* %61, align 4
  br label %.backedge.521

.backedge.521:                                    ; preds = %187, %._crit_edge.4
  br i1 false, label %._crit_edge.5, label %.lr.ph.1.5

.lr.ph.1.5:                                       ; preds = %.backedge.521
  %188 = load i32, i32* %62, align 4
  %189 = load i32, i32* %63, align 8
  %190 = icmp sgt i32 %188, %189
  br i1 %190, label %191, label %.backedge.1.5

; <label>:191:                                    ; preds = %.lr.ph.1.5
  store i32 %189, i32* %62, align 4
  store i32 %188, i32* %63, align 8
  br label %.backedge.1.5

.backedge.1.5:                                    ; preds = %191, %.lr.ph.1.5
  br i1 true, label %._crit_edge.5, label %.lr.ph.2.5

.lr.ph.2.5:                                       ; preds = %.backedge.1.5
  br i1 undef, label %192, label %.backedge.2.5

; <label>:192:                                    ; preds = %.lr.ph.2.5
  br label %.backedge.2.5

.backedge.2.5:                                    ; preds = %192, %.lr.ph.2.5
  br i1 false, label %._crit_edge.5, label %.lr.ph.3.5

.lr.ph.3.5:                                       ; preds = %.backedge.2.5
  br i1 undef, label %193, label %.backedge.3.5

; <label>:193:                                    ; preds = %.lr.ph.3.5
  br label %.backedge.3.5

.backedge.3.5:                                    ; preds = %193, %.lr.ph.3.5
  br i1 false, label %._crit_edge.5, label %.lr.ph.4.5

.lr.ph.4.5:                                       ; preds = %.backedge.3.5
  br i1 undef, label %194, label %.backedge.4.5

; <label>:194:                                    ; preds = %.lr.ph.4.5
  br label %.backedge.4.5

.backedge.4.5:                                    ; preds = %194, %.lr.ph.4.5
  br i1 false, label %._crit_edge.5, label %.lr.ph.5.5

.lr.ph.5.5:                                       ; preds = %.backedge.4.5
  br i1 undef, label %195, label %.backedge.5.5

; <label>:195:                                    ; preds = %.lr.ph.5.5
  br label %.backedge.5.5

.backedge.5.5:                                    ; preds = %195, %.lr.ph.5.5
  br i1 false, label %._crit_edge.5, label %.lr.ph.6.5

.lr.ph.6.5:                                       ; preds = %.backedge.5.5
  br i1 undef, label %196, label %._crit_edge.5

; <label>:196:                                    ; preds = %.lr.ph.6.5
  br label %._crit_edge.5

._crit_edge.5:                                    ; preds = %196, %.lr.ph.6.5, %.backedge.5.5, %.backedge.4.5, %.backedge.3.5, %.backedge.2.5, %.backedge.1.5, %.backedge.521
  %197 = load i32, i32* %60, align 16
  %198 = load i32, i32* %61, align 4
  %199 = icmp sgt i32 %197, %198
  br i1 %199, label %200, label %.backedge.6

; <label>:200:                                    ; preds = %._crit_edge.5
  store i32 %198, i32* %60, align 16
  store i32 %197, i32* %61, align 4
  br label %.backedge.6

.backedge.6:                                      ; preds = %200, %._crit_edge.5
  br i1 true, label %._crit_edge.6, label %.lr.ph.1.6

.lr.ph.1.6:                                       ; preds = %.backedge.6
  br i1 undef, label %201, label %.backedge.1.6

; <label>:201:                                    ; preds = %.lr.ph.1.6
  br label %.backedge.1.6

.backedge.1.6:                                    ; preds = %201, %.lr.ph.1.6
  br i1 false, label %._crit_edge.6, label %.lr.ph.2.6

.lr.ph.2.6:                                       ; preds = %.backedge.1.6
  br i1 undef, label %202, label %.backedge.2.6

; <label>:202:                                    ; preds = %.lr.ph.2.6
  br label %.backedge.2.6

.backedge.2.6:                                    ; preds = %202, %.lr.ph.2.6
  br i1 false, label %._crit_edge.6, label %.lr.ph.3.6

.lr.ph.3.6:                                       ; preds = %.backedge.2.6
  br i1 undef, label %203, label %.backedge.3.6

; <label>:203:                                    ; preds = %.lr.ph.3.6
  br label %.backedge.3.6

.backedge.3.6:                                    ; preds = %203, %.lr.ph.3.6
  br i1 false, label %._crit_edge.6, label %.lr.ph.4.6

.lr.ph.4.6:                                       ; preds = %.backedge.3.6
  br i1 undef, label %204, label %.backedge.4.6

; <label>:204:                                    ; preds = %.lr.ph.4.6
  br label %.backedge.4.6

.backedge.4.6:                                    ; preds = %204, %.lr.ph.4.6
  br i1 false, label %._crit_edge.6, label %.lr.ph.5.6

.lr.ph.5.6:                                       ; preds = %.backedge.4.6
  br i1 undef, label %205, label %.backedge.5.6

; <label>:205:                                    ; preds = %.lr.ph.5.6
  br label %.backedge.5.6

.backedge.5.6:                                    ; preds = %205, %.lr.ph.5.6
  br i1 false, label %._crit_edge.6, label %.lr.ph.6.6

.lr.ph.6.6:                                       ; preds = %.backedge.5.6
  br i1 undef, label %206, label %._crit_edge.6

; <label>:206:                                    ; preds = %.lr.ph.6.6
  br label %._crit_edge.6

._crit_edge.6:                                    ; preds = %206, %.lr.ph.6.6, %.backedge.5.6, %.backedge.4.6, %.backedge.3.6, %.backedge.2.6, %.backedge.1.6, %.backedge.6
  %207 = load i32, i32* %33, align 4
  %208 = load i32, i32* %39, align 16
  %209 = add nsw i32 %208, %207
  %210 = sdiv i32 %209, 2
  %211 = trunc i32 %210 to i8
  ret i8 %211
}

; Function Attrs: noinline nounwind uwtable
define void @enlarge(i8** nocapture, i8*, i32* nocapture, i32* nocapture, i32) local_unnamed_addr #3 {
  %6 = load i32, i32* %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph14, label %.preheader3

.lr.ph14:                                         ; preds = %5
  %8 = shl i32 %4, 1
  %9 = sext i32 %4 to i64
  br label %14

.preheader3.loopexit:                             ; preds = %14
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %5
  %10 = icmp sgt i32 %4, 0
  br i1 %10, label %.lr.ph11, label %._crit_edge8

.lr.ph11:                                         ; preds = %.preheader3
  %11 = add nsw i32 %4, -1
  %12 = shl nsw i32 %4, 1
  %13 = sext i32 %4 to i64
  br label %32

; <label>:14:                                     ; preds = %14, %.lr.ph14
  %.0112 = phi i32 [ 0, %.lr.ph14 ], [ %27, %14 ]
  %15 = add nsw i32 %.0112, %4
  %16 = load i32, i32* %2, align 4
  %17 = add nsw i32 %16, %8
  %18 = mul nsw i32 %17, %15
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %1, i64 %19
  %21 = getelementptr inbounds i8, i8* %20, i64 %9
  %22 = load i8*, i8** %0, align 8
  %23 = mul nsw i32 %16, %.0112
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8* %22, i64 %24
  %26 = sext i32 %16 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %25, i64 %26, i32 1, i1 false)
  %27 = add nuw nsw i32 %.0112, 1
  %28 = load i32, i32* %3, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %14, label %.preheader3.loopexit

.preheader2:                                      ; preds = %32
  %30 = icmp sgt i32 %4, 0
  br i1 %30, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %.preheader2
  %31 = shl nsw i32 %4, 1
  br label %.preheader

; <label>:32:                                     ; preds = %32, %.lr.ph11
  %.1.neg10 = phi i32 [ 0, %.lr.ph11 ], [ %.1.neg, %32 ]
  %.19 = phi i32 [ 0, %.lr.ph11 ], [ %61, %32 ]
  %33 = add i32 %11, %.1.neg10
  %34 = load i32, i32* %2, align 4
  %35 = add nsw i32 %34, %12
  %36 = mul nsw i32 %35, %33
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %1, i64 %37
  %39 = getelementptr inbounds i8, i8* %38, i64 %13
  %40 = load i8*, i8** %0, align 8
  %41 = mul nsw i32 %34, %.19
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %40, i64 %42
  %44 = sext i32 %34 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* %43, i64 %44, i32 1, i1 false)
  %45 = load i32, i32* %3, align 4
  %46 = add i32 %.19, %4
  %47 = add i32 %46, %45
  %48 = load i32, i32* %2, align 4
  %49 = add nsw i32 %48, %12
  %50 = mul nsw i32 %47, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %1, i64 %51
  %53 = getelementptr inbounds i8, i8* %52, i64 %13
  %54 = load i8*, i8** %0, align 8
  %55 = add nsw i32 %.1.neg10, -1
  %56 = add i32 %55, %45
  %57 = mul nsw i32 %56, %48
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %54, i64 %58
  %60 = sext i32 %48 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %59, i64 %60, i32 1, i1 false)
  %61 = add nuw nsw i32 %.19, 1
  %.1.neg = xor i32 %.19, -1
  %exitcond15 = icmp eq i32 %61, %4
  br i1 %exitcond15, label %.preheader2, label %32

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %.2.neg7 = phi i32 [ 0, %.preheader.lr.ph ], [ %.2.neg, %._crit_edge ]
  %.25 = phi i32 [ 0, %.preheader.lr.ph ], [ %95, %._crit_edge ]
  %62 = load i32, i32* %3, align 4
  %63 = add nsw i32 %62, %31
  %64 = icmp sgt i32 %63, 0
  br i1 %64, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %65 = add nsw i32 %.2.neg7, -1
  %66 = add nsw i32 %.2.neg7, -1
  br label %67

; <label>:67:                                     ; preds = %67, %.lr.ph
  %.04 = phi i32 [ 0, %.lr.ph ], [ %91, %67 ]
  %68 = load i32, i32* %2, align 4
  %69 = add nsw i32 %68, %31
  %70 = mul nsw i32 %69, %.04
  %71 = add nsw i32 %70, %4
  %72 = add nsw i32 %71, %.25
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8* %1, i64 %73
  %75 = load i8, i8* %74, align 1
  %76 = add i32 %65, %71
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8* %1, i64 %77
  store i8 %75, i8* %78, align 1
  %79 = load i32, i32* %2, align 4
  %80 = add nsw i32 %79, %31
  %81 = mul nsw i32 %80, %.04
  %82 = add i32 %79, %4
  %83 = add i32 %82, %81
  %84 = add i32 %66, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %1, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = add nsw i32 %83, %.25
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8* %1, i64 %89
  store i8 %87, i8* %90, align 1
  %91 = add nuw nsw i32 %.04, 1
  %92 = load i32, i32* %3, align 4
  %93 = add nsw i32 %92, %31
  %94 = icmp slt i32 %91, %93
  br i1 %94, label %67, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %67
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %95 = add nuw nsw i32 %.25, 1
  %.2.neg = xor i32 %.25, -1
  %exitcond = icmp eq i32 %95, %4
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader2, %.preheader3
  %96 = shl nsw i32 %4, 1
  %97 = load i32, i32* %2, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, i32* %2, align 4
  %99 = load i32, i32* %3, align 4
  %100 = add nsw i32 %99, %96
  store i32 %100, i32* %3, align 4
  store i8* %1, i8** %0, align 8
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: noinline nounwind uwtable
define void @susan_smoothing(i32, i8*, float, i32, i32, i8* nocapture readonly) local_unnamed_addr #3 {
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %1, i8** %7, align 8
  store i32 %3, i32* %8, align 4
  store i32 %4, i32* %9, align 4
  %10 = icmp eq i32 %0, 0
  %11 = fpext float %2 to double
  %12 = fmul double %11, 1.500000e+00
  %13 = fptosi double %12 to i32
  %14 = add nsw i32 %13, 1
  %. = select i1 %10, i32 %14, i32 1
  %15 = fcmp ogt float %2, 1.500000e+01
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %6
  %17 = fpext float %2 to double
  %18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.25, i64 0, i64 0), double %17)
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @str.13, i64 0, i64 0))
  %puts21 = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @str.14, i64 0, i64 0))
  tail call void @exit(i32 0) #9
  unreachable

; <label>:19:                                     ; preds = %6
  %20 = shl nsw i32 %., 1
  %21 = or i32 %20, 1
  %22 = load i32, i32* %8, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %27, label %24

; <label>:24:                                     ; preds = %19
  %25 = load i32, i32* %9, align 4
  %26 = icmp sgt i32 %21, %25
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %24, %19
  %28 = load i32, i32* %8, align 4
  %29 = load i32, i32* %9, align 4
  %30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.28, i64 0, i64 0), i32 %., i32 %28, i32 %29)
  tail call void @exit(i32 0) #9
  unreachable

; <label>:31:                                     ; preds = %24
  %32 = add nsw i32 %22, %20
  %33 = add nsw i32 %25, %20
  %34 = mul nsw i32 %33, %32
  %35 = sext i32 %34 to i64
  %36 = tail call noalias i8* @malloc(i64 %35) #8
  call void @enlarge(i8** nonnull %7, i8* %36, i32* nonnull %8, i32* nonnull %9, i32 %.)
  br i1 %10, label %40, label %.preheader26

.preheader26:                                     ; preds = %31
  %37 = load i32, i32* %9, align 4
  %38 = add nsw i32 %37, -1
  %39 = icmp sgt i32 %38, 1
  br i1 %39, label %.preheader25.preheader, label %.loopexit

.preheader25.preheader:                           ; preds = %.preheader26
  br label %.preheader25

; <label>:40:                                     ; preds = %31
  %41 = load i32, i32* %8, align 4
  %42 = sub nsw i32 %41, %21
  %43 = mul nsw i32 %21, %21
  %44 = zext i32 %43 to i64
  %45 = tail call noalias i8* @malloc(i64 %44) #8
  %46 = fmul float %2, %2
  %47 = fsub float -0.000000e+00, %46
  %48 = sub nsw i32 0, %.
  %49 = icmp slt i32 %., %48
  br i1 %49, label %.preheader23, label %.preheader24.preheader

.preheader24.preheader:                           ; preds = %40
  br label %.preheader24

.preheader24:                                     ; preds = %._crit_edge81, %.preheader24.preheader
  %.0384 = phi i8* [ %70, %._crit_edge81 ], [ %45, %.preheader24.preheader ]
  %.01083 = phi i32 [ %73, %._crit_edge81 ], [ %48, %.preheader24.preheader ]
  %50 = mul nsw i32 %.01083, %.01083
  br label %60

.preheader23.loopexit:                            ; preds = %._crit_edge81
  br label %.preheader23

.preheader23:                                     ; preds = %.preheader23.loopexit, %40
  %51 = load i32, i32* %9, align 4
  %52 = sub nsw i32 %51, %.
  %53 = icmp slt i32 %., %52
  br i1 %53, label %.preheader22.lr.ph, label %._crit_edge77

.preheader22.lr.ph:                               ; preds = %.preheader23
  %54 = sext i32 %. to i64
  %55 = sub nsw i64 0, %54
  %56 = icmp slt i32 %., %48
  %57 = icmp slt i32 %., %48
  %58 = sext i32 %42 to i64
  %59 = sext i32 %. to i64
  br label %.preheader22

; <label>:60:                                     ; preds = %60, %.preheader24
  %.1479 = phi i8* [ %.0384, %.preheader24 ], [ %70, %60 ]
  %.01378 = phi i32 [ %48, %.preheader24 ], [ %71, %60 ]
  %61 = mul nsw i32 %.01378, %.01378
  %62 = add nuw nsw i32 %61, %50
  %63 = sitofp i32 %62 to float
  %64 = fdiv float %63, %47
  %65 = fpext float %64 to double
  %66 = tail call double @exp(double %65) #8
  %67 = fmul double %66, 1.000000e+02
  %68 = fptosi double %67 to i32
  %69 = trunc i32 %68 to i8
  store i8 %69, i8* %.1479, align 1
  %70 = getelementptr inbounds i8, i8* %.1479, i64 1
  %71 = add nsw i32 %.01378, 1
  %72 = icmp slt i32 %.01378, %.
  br i1 %72, label %60, label %._crit_edge81

._crit_edge81:                                    ; preds = %60
  %73 = add nsw i32 %.01083, 1
  %74 = icmp slt i32 %.01083, %.
  br i1 %74, label %.preheader24, label %.preheader23.loopexit

.preheader22:                                     ; preds = %._crit_edge46, %.preheader22.lr.ph
  %.0176 = phi i8* [ %1, %.preheader22.lr.ph ], [ %.12.lcssa, %._crit_edge46 ]
  %.11173 = phi i32 [ %., %.preheader22.lr.ph ], [ %144, %._crit_edge46 ]
  %75 = load i32, i32* %8, align 4
  %76 = sub nsw i32 %75, %.
  %77 = icmp slt i32 %., %76
  br i1 %77, label %.lr.ph45, label %._crit_edge46

.lr.ph45:                                         ; preds = %.preheader22
  %78 = sub nsw i32 %.11173, %.
  br i1 %56, label %.preheader103.preheader, label %.lr.ph45.split.preheader

.lr.ph45.split.preheader:                         ; preds = %.lr.ph45
  br label %.lr.ph45.split

.preheader103.preheader:                          ; preds = %.lr.ph45
  br label %.preheader103

.preheader103:                                    ; preds = %.preheader103, %.preheader103.preheader
  %79 = phi i32 [ %87, %.preheader103 ], [ %75, %.preheader103.preheader ]
  %.1244.us = phi i8* [ %.2.us, %.preheader103 ], [ %.0176, %.preheader103.preheader ]
  %.11443.us = phi i32 [ %86, %.preheader103 ], [ %., %.preheader103.preheader ]
  %80 = load i8*, i8** %7, align 8
  %81 = mul nsw i32 %79, %.11173
  %82 = add nsw i32 %81, %.11443.us
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %80, i64 %83
  %85 = load i8, i8* %84, align 1
  store i8 %85, i8* %.1244.us, align 1
  %.2.us = getelementptr inbounds i8, i8* %.1244.us, i64 1
  %86 = add nsw i32 %.11443.us, 1
  %87 = load i32, i32* %8, align 4
  %88 = sub nsw i32 %87, %.
  %89 = icmp slt i32 %86, %88
  br i1 %89, label %.preheader103, label %._crit_edge46.loopexit

.lr.ph45.split:                                   ; preds = %139, %.lr.ph45.split.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %139 ], [ %59, %.lr.ph45.split.preheader ]
  %90 = phi i32 [ %140, %139 ], [ %75, %.lr.ph45.split.preheader ]
  %.1244 = phi i8* [ %.2, %139 ], [ %.0176, %.lr.ph45.split.preheader ]
  %91 = load i8*, i8** %7, align 8
  %92 = mul nsw i32 %90, %.11173
  %93 = trunc i64 %indvars.iv to i32
  %94 = add nsw i32 %92, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %91, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = zext i8 %97 to i64
  %100 = getelementptr inbounds i8, i8* %5, i64 %99
  br i1 %57, label %._crit_edge40.thread, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.lr.ph45.split
  %101 = mul nsw i32 %90, %78
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8* %91, i64 %102
  %104 = getelementptr inbounds i8, i8* %103, i64 %indvars.iv
  %105 = getelementptr inbounds i8, i8* %104, i64 %55
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %.039 = phi i32 [ %118, %._crit_edge ], [ 0, %.preheader.preheader ]
  %.2538 = phi i8* [ %120, %._crit_edge ], [ %45, %.preheader.preheader ]
  %.0737 = phi i8* [ %124, %._crit_edge ], [ %105, %.preheader.preheader ]
  %.01736 = phi i32 [ %125, %._crit_edge ], [ %48, %.preheader.preheader ]
  %.01835 = phi i32 [ %119, %._crit_edge ], [ 0, %.preheader.preheader ]
  br label %106

; <label>:106:                                    ; preds = %106, %.preheader
  %.131 = phi i32 [ %.039, %.preheader ], [ %118, %106 ]
  %.3630 = phi i8* [ %.2538, %.preheader ], [ %120, %106 ]
  %.1829 = phi i8* [ %.0737, %.preheader ], [ %121, %106 ]
  %.01628 = phi i32 [ %48, %.preheader ], [ %122, %106 ]
  %.11927 = phi i32 [ %.01835, %.preheader ], [ %119, %106 ]
  %107 = load i8, i8* %.1829, align 1
  %108 = load i8, i8* %.3630, align 1
  %109 = zext i8 %108 to i32
  %110 = zext i8 %107 to i64
  %111 = sub nsw i64 0, %110
  %112 = getelementptr inbounds i8, i8* %100, i64 %111
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = mul nuw nsw i32 %114, %109
  %116 = zext i8 %107 to i32
  %117 = mul nuw nsw i32 %115, %116
  %118 = add nsw i32 %117, %.131
  %119 = add nsw i32 %115, %.11927
  %120 = getelementptr inbounds i8, i8* %.3630, i64 1
  %121 = getelementptr inbounds i8, i8* %.1829, i64 1
  %122 = add nsw i32 %.01628, 1
  %123 = icmp slt i32 %.01628, %.
  br i1 %123, label %106, label %._crit_edge

._crit_edge:                                      ; preds = %106
  %124 = getelementptr inbounds i8, i8* %121, i64 %58
  %125 = add nsw i32 %.01736, 1
  %126 = icmp slt i32 %.01736, %.
  br i1 %126, label %.preheader, label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge
  %127 = add nsw i32 %119, -10000
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %._crit_edge40.thread

; <label>:129:                                    ; preds = %._crit_edge40
  %130 = load i8*, i8** %7, align 8
  %131 = load i32, i32* %8, align 4
  %132 = trunc i64 %indvars.iv to i32
  %133 = tail call zeroext i8 @median(i8* %130, i32 %.11173, i32 %132, i32 %131)
  br label %139

._crit_edge40.thread:                             ; preds = %._crit_edge40, %.lr.ph45.split
  %134 = phi i32 [ %127, %._crit_edge40 ], [ -10000, %.lr.ph45.split ]
  %split42102 = phi i32 [ %118, %._crit_edge40 ], [ 0, %.lr.ph45.split ]
  %135 = mul nsw i32 %98, -10000
  %136 = add i32 %split42102, %135
  %137 = sdiv i32 %136, %134
  %138 = trunc i32 %137 to i8
  br label %139

; <label>:139:                                    ; preds = %._crit_edge40.thread, %129
  %storemerge20 = phi i8 [ %138, %._crit_edge40.thread ], [ %133, %129 ]
  store i8 %storemerge20, i8* %.1244, align 1
  %.2 = getelementptr inbounds i8, i8* %.1244, i64 1
  %indvars.iv.next = add i64 %indvars.iv, 1
  %140 = load i32, i32* %8, align 4
  %141 = sub nsw i32 %140, %.
  %142 = sext i32 %141 to i64
  %143 = icmp slt i64 %indvars.iv.next, %142
  br i1 %143, label %.lr.ph45.split, label %._crit_edge46.loopexit114

._crit_edge46.loopexit:                           ; preds = %.preheader103
  br label %._crit_edge46

._crit_edge46.loopexit114:                        ; preds = %139
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit114, %._crit_edge46.loopexit, %.preheader22
  %.12.lcssa = phi i8* [ %.0176, %.preheader22 ], [ %.2.us, %._crit_edge46.loopexit ], [ %.2, %._crit_edge46.loopexit114 ]
  %144 = add nsw i32 %.11173, 1
  %145 = load i32, i32* %9, align 4
  %146 = sub nsw i32 %145, %.
  %147 = icmp slt i32 %144, %146
  br i1 %147, label %.preheader22, label %._crit_edge77.loopexit

._crit_edge77.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.preheader23
  tail call void @free(i8* %45) #8
  br label %.loopexit

.preheader25:                                     ; preds = %._crit_edge88, %.preheader25.preheader
  %.392 = phi i8* [ %.4.lcssa, %._crit_edge88 ], [ %1, %.preheader25.preheader ]
  %.21290 = phi i32 [ %282, %._crit_edge88 ], [ 1, %.preheader25.preheader ]
  %148 = load i32, i32* %8, align 4
  %149 = add nsw i32 %148, -1
  %150 = icmp sgt i32 %149, 1
  br i1 %150, label %.lr.ph87, label %._crit_edge88

.lr.ph87:                                         ; preds = %.preheader25
  %151 = add nsw i32 %.21290, -1
  br label %152

; <label>:152:                                    ; preds = %277, %.lr.ph87
  %indvars.iv100 = phi i64 [ 1, %.lr.ph87 ], [ %indvars.iv.next101, %277 ]
  %153 = phi i32 [ %148, %.lr.ph87 ], [ %278, %277 ]
  %.486 = phi i8* [ %.392, %.lr.ph87 ], [ %.5, %277 ]
  %154 = load i8*, i8** %7, align 8
  %155 = mul nsw i32 %153, %151
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8* %154, i64 %156
  %158 = getelementptr inbounds i8, i8* %157, i64 %indvars.iv100
  %159 = getelementptr inbounds i8, i8* %158, i64 -1
  %160 = mul nsw i32 %153, %.21290
  %161 = trunc i64 %indvars.iv100 to i32
  %162 = add nsw i32 %160, %161
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8* %154, i64 %163
  %165 = load i8, i8* %164, align 1
  %166 = zext i8 %165 to i64
  %167 = getelementptr inbounds i8, i8* %5, i64 %166
  %168 = getelementptr inbounds i8, i8* %159, i64 1
  %169 = load i8, i8* %159, align 1
  %170 = zext i8 %169 to i64
  %171 = sub nsw i64 0, %170
  %172 = getelementptr inbounds i8, i8* %167, i64 %171
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = getelementptr inbounds i8, i8* %168, i64 1
  %176 = load i8, i8* %168, align 1
  %177 = zext i8 %176 to i64
  %178 = sub nsw i64 0, %177
  %179 = getelementptr inbounds i8, i8* %167, i64 %178
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i32
  %182 = load i8, i8* %175, align 1
  %183 = zext i8 %182 to i64
  %184 = sub nsw i64 0, %183
  %185 = getelementptr inbounds i8, i8* %167, i64 %184
  %186 = load i8, i8* %185, align 1
  %187 = zext i8 %186 to i32
  %188 = add nsw i32 %153, -2
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8, i8* %175, i64 %189
  %191 = getelementptr inbounds i8, i8* %190, i64 1
  %192 = load i8, i8* %190, align 1
  %193 = zext i8 %192 to i64
  %194 = sub nsw i64 0, %193
  %195 = getelementptr inbounds i8, i8* %167, i64 %194
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = getelementptr inbounds i8, i8* %191, i64 1
  %199 = load i8, i8* %191, align 1
  %200 = zext i8 %199 to i64
  %201 = sub nsw i64 0, %200
  %202 = getelementptr inbounds i8, i8* %167, i64 %201
  %203 = load i8, i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = load i8, i8* %198, align 1
  %206 = zext i8 %205 to i64
  %207 = sub nsw i64 0, %206
  %208 = getelementptr inbounds i8, i8* %167, i64 %207
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = getelementptr inbounds i8, i8* %198, i64 %189
  %212 = getelementptr inbounds i8, i8* %211, i64 1
  %213 = load i8, i8* %211, align 1
  %214 = zext i8 %213 to i64
  %215 = sub nsw i64 0, %214
  %216 = getelementptr inbounds i8, i8* %167, i64 %215
  %217 = load i8, i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = getelementptr inbounds i8, i8* %212, i64 1
  %220 = load i8, i8* %212, align 1
  %221 = zext i8 %220 to i64
  %222 = sub nsw i64 0, %221
  %223 = getelementptr inbounds i8, i8* %167, i64 %222
  %224 = load i8, i8* %223, align 1
  %225 = zext i8 %224 to i32
  %226 = load i8, i8* %219, align 1
  %227 = zext i8 %226 to i64
  %228 = sub nsw i64 0, %227
  %229 = getelementptr inbounds i8, i8* %167, i64 %228
  %230 = load i8, i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = add nsw i32 %174, -100
  %233 = add nsw i32 %232, %181
  %234 = add nsw i32 %233, %187
  %235 = add nsw i32 %234, %197
  %236 = add nsw i32 %235, %204
  %237 = add nsw i32 %236, %210
  %238 = add i32 %237, %218
  %239 = add i32 %238, %225
  %240 = add i32 %239, %231
  %241 = icmp eq i32 %240, 0
  br i1 %241, label %242, label %245

; <label>:242:                                    ; preds = %152
  %243 = trunc i64 %indvars.iv100 to i32
  %244 = tail call zeroext i8 @median(i8* %154, i32 %.21290, i32 %243, i32 %153)
  br label %277

; <label>:245:                                    ; preds = %152
  %246 = zext i8 %169 to i32
  %247 = mul nuw nsw i32 %174, %246
  %248 = zext i8 %176 to i32
  %249 = mul nuw nsw i32 %181, %248
  %250 = zext i8 %182 to i32
  %251 = mul nuw nsw i32 %187, %250
  %252 = zext i8 %192 to i32
  %253 = mul nuw nsw i32 %197, %252
  %254 = zext i8 %199 to i32
  %255 = mul nuw nsw i32 %204, %254
  %256 = zext i8 %205 to i32
  %257 = mul nuw nsw i32 %210, %256
  %258 = zext i8 %213 to i32
  %259 = mul nuw nsw i32 %218, %258
  %260 = zext i8 %220 to i32
  %261 = mul nuw nsw i32 %225, %260
  %262 = zext i8 %226 to i32
  %263 = mul nuw nsw i32 %231, %262
  %264 = zext i8 %165 to i32
  %265 = mul nsw i32 %264, -100
  %266 = add i32 %247, %265
  %267 = add i32 %266, %249
  %268 = add i32 %267, %251
  %269 = add i32 %268, %253
  %270 = add i32 %269, %255
  %271 = add i32 %270, %257
  %272 = add i32 %271, %259
  %273 = add i32 %272, %261
  %274 = add i32 %273, %263
  %275 = sdiv i32 %274, %240
  %276 = trunc i32 %275 to i8
  br label %277

; <label>:277:                                    ; preds = %245, %242
  %storemerge = phi i8 [ %276, %245 ], [ %244, %242 ]
  store i8 %storemerge, i8* %.486, align 1
  %.5 = getelementptr inbounds i8, i8* %.486, i64 1
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %278 = load i32, i32* %8, align 4
  %279 = add nsw i32 %278, -1
  %280 = sext i32 %279 to i64
  %281 = icmp slt i64 %indvars.iv.next101, %280
  br i1 %281, label %152, label %._crit_edge88.loopexit

._crit_edge88.loopexit:                           ; preds = %277
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %.preheader25
  %.4.lcssa = phi i8* [ %.392, %.preheader25 ], [ %.5, %._crit_edge88.loopexit ]
  %282 = add nuw nsw i32 %.21290, 1
  %283 = load i32, i32* %9, align 4
  %284 = add nsw i32 %283, -1
  %285 = icmp slt i32 %282, %284
  br i1 %285, label %.preheader25, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge88
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge77, %.preheader26
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @edge_draw(i8* nocapture, i8*, i32, i32, i32) local_unnamed_addr #4 {
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %.preheader3, label %.preheader

.preheader3:                                      ; preds = %5
  %7 = mul nsw i32 %3, %2
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph8, label %.preheader

.lr.ph8:                                          ; preds = %.preheader3
  %9 = ptrtoint i8* %1 to i64
  %10 = sext i32 %2 to i64
  %11 = sub nsw i64 0, %10
  %12 = add nsw i32 %2, -2
  %13 = sext i32 %12 to i64
  br label %45

.preheader.loopexit:                              ; preds = %62
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader3, %5
  %14 = mul nsw i32 %3, %2
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %16 = ptrtoint i8* %1 to i64
  %xtraiter = and i32 %14, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %17 = load i8, i8* %1, align 1
  %18 = icmp ult i8 %17, 8
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %.prol.preheader
  store i8 0, i8* %0, align 1
  br label %20

; <label>:20:                                     ; preds = %19, %.prol.preheader
  %21 = getelementptr inbounds i8, i8* %1, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %20, %.lr.ph
  %.15.unr = phi i8* [ %1, %.lr.ph ], [ %21, %20 ]
  %.124.unr = phi i32 [ 0, %.lr.ph ], [ 1, %20 ]
  %22 = icmp eq i32 %14, 1
  br i1 %22, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %23 = add i32 %14, -2
  %24 = sub i32 %23, %.124.unr
  %25 = lshr i32 %24, 1
  %26 = and i32 %25, 1
  %lcmp.mod10 = icmp eq i32 %26, 0
  br i1 %lcmp.mod10, label %.lr.ph.new.prol.preheader, label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.preheader:                        ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.prol

.lr.ph.new.prol:                                  ; preds = %.lr.ph.new.prol.preheader
  %27 = load i8, i8* %.15.unr, align 1
  %28 = icmp ult i8 %27, 8
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %.lr.ph.new.prol
  %30 = ptrtoint i8* %.15.unr to i64
  %31 = sub i64 %30, %16
  %32 = getelementptr inbounds i8, i8* %0, i64 %31
  store i8 0, i8* %32, align 1
  br label %33

; <label>:33:                                     ; preds = %29, %.lr.ph.new.prol
  %34 = getelementptr inbounds i8, i8* %.15.unr, i64 1
  %35 = load i8, i8* %34, align 1
  %36 = icmp ult i8 %35, 8
  br i1 %36, label %37, label %41

; <label>:37:                                     ; preds = %33
  %38 = ptrtoint i8* %34 to i64
  %39 = sub i64 %38, %16
  %40 = getelementptr inbounds i8, i8* %0, i64 %39
  store i8 0, i8* %40, align 1
  br label %41

; <label>:41:                                     ; preds = %37, %33
  %42 = getelementptr inbounds i8, i8* %.15.unr, i64 2
  %43 = or i32 %.124.unr, 2
  br label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.loopexit:                         ; preds = %41, %.lr.ph.new.preheader
  %.15.unr11 = phi i8* [ %.15.unr, %.lr.ph.new.preheader ], [ %42, %41 ]
  %.124.unr12 = phi i32 [ %.124.unr, %.lr.ph.new.preheader ], [ %43, %41 ]
  %44 = icmp eq i32 %25, 0
  br i1 %44, label %._crit_edge.loopexit, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit
  br label %.lr.ph.new

; <label>:45:                                     ; preds = %62, %.lr.ph8
  %.07 = phi i8* [ %1, %.lr.ph8 ], [ %63, %62 ]
  %.016 = phi i32 [ 0, %.lr.ph8 ], [ %64, %62 ]
  %46 = load i8, i8* %.07, align 1
  %47 = icmp ult i8 %46, 8
  br i1 %47, label %48, label %62

; <label>:48:                                     ; preds = %45
  %49 = ptrtoint i8* %.07 to i64
  %50 = sub i64 %49, %9
  %51 = getelementptr inbounds i8, i8* %0, i64 %50
  %52 = getelementptr inbounds i8, i8* %51, i64 %11
  %53 = getelementptr inbounds i8, i8* %52, i64 -1
  %54 = getelementptr inbounds i8, i8* %53, i64 1
  store i8 -1, i8* %53, align 1
  %55 = getelementptr inbounds i8, i8* %54, i64 1
  store i8 -1, i8* %54, align 1
  store i8 -1, i8* %55, align 1
  %56 = getelementptr inbounds i8, i8* %55, i64 %13
  %57 = getelementptr inbounds i8, i8* %56, i64 1
  store i8 -1, i8* %56, align 1
  %58 = getelementptr inbounds i8, i8* %57, i64 1
  store i8 -1, i8* %58, align 1
  %59 = getelementptr inbounds i8, i8* %58, i64 %13
  %60 = getelementptr inbounds i8, i8* %59, i64 1
  store i8 -1, i8* %59, align 1
  %61 = getelementptr inbounds i8, i8* %60, i64 1
  store i8 -1, i8* %60, align 1
  store i8 -1, i8* %61, align 1
  br label %62

; <label>:62:                                     ; preds = %48, %45
  %63 = getelementptr inbounds i8, i8* %.07, i64 1
  %64 = add nuw nsw i32 %.016, 1
  %exitcond = icmp eq i32 %64, %7
  br i1 %exitcond, label %.preheader.loopexit, label %45

.lr.ph.new:                                       ; preds = %94, %.lr.ph.new.preheader.new
  %.15 = phi i8* [ %.15.unr11, %.lr.ph.new.preheader.new ], [ %95, %94 ]
  %.124 = phi i32 [ %.124.unr12, %.lr.ph.new.preheader.new ], [ %96, %94 ]
  %65 = load i8, i8* %.15, align 1
  %66 = icmp ult i8 %65, 8
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %.lr.ph.new
  %68 = ptrtoint i8* %.15 to i64
  %69 = sub i64 %68, %16
  %70 = getelementptr inbounds i8, i8* %0, i64 %69
  store i8 0, i8* %70, align 1
  br label %71

; <label>:71:                                     ; preds = %67, %.lr.ph.new
  %72 = getelementptr inbounds i8, i8* %.15, i64 1
  %73 = load i8, i8* %72, align 1
  %74 = icmp ult i8 %73, 8
  br i1 %74, label %75, label %.lr.ph.new.113

._crit_edge.loopexit.unr-lcssa:                   ; preds = %94
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.new.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  ret void

; <label>:75:                                     ; preds = %71
  %76 = ptrtoint i8* %72 to i64
  %77 = sub i64 %76, %16
  %78 = getelementptr inbounds i8, i8* %0, i64 %77
  store i8 0, i8* %78, align 1
  br label %.lr.ph.new.113

.lr.ph.new.113:                                   ; preds = %75, %71
  %79 = getelementptr inbounds i8, i8* %.15, i64 2
  %80 = load i8, i8* %79, align 1
  %81 = icmp ult i8 %80, 8
  br i1 %81, label %82, label %86

; <label>:82:                                     ; preds = %.lr.ph.new.113
  %83 = ptrtoint i8* %79 to i64
  %84 = sub i64 %83, %16
  %85 = getelementptr inbounds i8, i8* %0, i64 %84
  store i8 0, i8* %85, align 1
  br label %86

; <label>:86:                                     ; preds = %82, %.lr.ph.new.113
  %87 = getelementptr inbounds i8, i8* %.15, i64 3
  %88 = load i8, i8* %87, align 1
  %89 = icmp ult i8 %88, 8
  br i1 %89, label %90, label %94

; <label>:90:                                     ; preds = %86
  %91 = ptrtoint i8* %87 to i64
  %92 = sub i64 %91, %16
  %93 = getelementptr inbounds i8, i8* %0, i64 %92
  store i8 0, i8* %93, align 1
  br label %94

; <label>:94:                                     ; preds = %90, %86
  %95 = getelementptr inbounds i8, i8* %.15, i64 4
  %96 = add nsw i32 %.124, 4
  %exitcond.1.1 = icmp eq i32 %96, %14
  br i1 %exitcond.1.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph.new
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @susan_thin(i32* nocapture readonly, i8*, i32, i32) local_unnamed_addr #4 {
  %5 = alloca [9 x i32], align 16
  %6 = add nsw i32 %3, -4
  %7 = icmp sgt i32 %6, 4
  br i1 %7, label %.preheader70.lr.ph, label %._crit_edge88

.preheader70.lr.ph:                               ; preds = %4
  %8 = add nsw i32 %2, -4
  %9 = icmp sgt i32 %8, 4
  %10 = sext i32 %2 to i64
  %11 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 0
  %12 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 1
  %13 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 2
  %14 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 3
  %15 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 4
  %16 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 5
  %17 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 6
  %18 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 7
  %19 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 8
  %.promoted113 = load i32, i32* %11, align 16
  %.promoted = load i32, i32* %12, align 4
  %.promoted118 = load i32, i32* %13, align 8
  %.promoted121 = load i32, i32* %14, align 4
  %.promoted124 = load i32, i32* %15, align 16
  %.promoted127 = load i32, i32* %16, align 4
  %.promoted130 = load i32, i32* %17, align 8
  %.promoted133 = load i32, i32* %18, align 4
  %.promoted136 = load i32, i32* %19, align 16
  br label %.preheader70

.preheader70:                                     ; preds = %._crit_edge, %.preheader70.lr.ph
  %.lcssa112138 = phi i32 [ %.promoted136, %.preheader70.lr.ph ], [ %.lcssa112137, %._crit_edge ]
  %.lcssa110135 = phi i32 [ %.promoted133, %.preheader70.lr.ph ], [ %.lcssa110134, %._crit_edge ]
  %.lcssa108132 = phi i32 [ %.promoted130, %.preheader70.lr.ph ], [ %.lcssa108131, %._crit_edge ]
  %.lcssa106129 = phi i32 [ %.promoted127, %.preheader70.lr.ph ], [ %.lcssa106128, %._crit_edge ]
  %.lcssa104126 = phi i32 [ %.promoted124, %.preheader70.lr.ph ], [ %.lcssa104125, %._crit_edge ]
  %.lcssa102123 = phi i32 [ %.promoted121, %.preheader70.lr.ph ], [ %.lcssa102122, %._crit_edge ]
  %.lcssa100120 = phi i32 [ %.promoted118, %.preheader70.lr.ph ], [ %.lcssa100119, %._crit_edge ]
  %.lcssa98117 = phi i32 [ %.promoted, %.preheader70.lr.ph ], [ %.lcssa98116, %._crit_edge ]
  %.lcssa115 = phi i32 [ %.promoted113, %.preheader70.lr.ph ], [ %.lcssa114, %._crit_edge ]
  %.0187 = phi i32 [ 4, %.preheader70.lr.ph ], [ %524, %._crit_edge ]
  %.02686 = phi i32 [ 0, %.preheader70.lr.ph ], [ %.127.lcssa, %._crit_edge ]
  %.03385 = phi i32 [ 0, %.preheader70.lr.ph ], [ %.134.lcssa, %._crit_edge ]
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader70
  br label %.lr.ph

.lr.ph:                                           ; preds = %.thread60, %.lr.ph.preheader
  %20 = phi i32 [ %513, %.thread60 ], [ %.lcssa112138, %.lr.ph.preheader ]
  %21 = phi i32 [ %514, %.thread60 ], [ %.lcssa110135, %.lr.ph.preheader ]
  %22 = phi i32 [ %515, %.thread60 ], [ %.lcssa108132, %.lr.ph.preheader ]
  %23 = phi i32 [ %516, %.thread60 ], [ %.lcssa106129, %.lr.ph.preheader ]
  %24 = phi i32 [ %517, %.thread60 ], [ %.lcssa104126, %.lr.ph.preheader ]
  %25 = phi i32 [ %518, %.thread60 ], [ %.lcssa102123, %.lr.ph.preheader ]
  %26 = phi i32 [ %519, %.thread60 ], [ %.lcssa100120, %.lr.ph.preheader ]
  %27 = phi i32 [ %520, %.thread60 ], [ %.lcssa98117, %.lr.ph.preheader ]
  %28 = phi i32 [ %521, %.thread60 ], [ %.lcssa115, %.lr.ph.preheader ]
  %.082 = phi i32 [ %522, %.thread60 ], [ 4, %.lr.ph.preheader ]
  %.1481 = phi i32 [ %.1417, %.thread60 ], [ %.0187, %.lr.ph.preheader ]
  %.12780 = phi i32 [ %.632, %.thread60 ], [ %.02686, %.lr.ph.preheader ]
  %.13479 = phi i32 [ %.639, %.thread60 ], [ %.03385, %.lr.ph.preheader ]
  %29 = mul nsw i32 %.1481, %2
  %30 = add nsw i32 %29, %.082
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8* %1, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = icmp ult i8 %33, 8
  br i1 %34, label %35, label %.thread60

; <label>:35:                                     ; preds = %.lr.ph
  %36 = getelementptr inbounds i32, i32* %0, i64 %31
  %37 = load i32, i32* %36, align 4
  %38 = add nsw i32 %.1481, -1
  %39 = mul nsw i32 %38, %2
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %1, i64 %40
  %42 = sext i32 %.082 to i64
  %43 = getelementptr inbounds i8, i8* %41, i64 %42
  %44 = getelementptr inbounds i8, i8* %43, i64 -1
  %45 = load i8, i8* %44, align 1
  %46 = icmp ult i8 %45, 8
  %47 = zext i1 %46 to i32
  %48 = getelementptr inbounds i8, i8* %44, i64 1
  %49 = load i8, i8* %48, align 1
  %50 = icmp ult i8 %49, 8
  %51 = zext i1 %50 to i32
  %52 = add nuw nsw i32 %51, %47
  %53 = getelementptr inbounds i8, i8* %44, i64 2
  %54 = load i8, i8* %53, align 1
  %55 = icmp ult i8 %54, 8
  %56 = zext i1 %55 to i32
  %57 = add nuw nsw i32 %52, %56
  %58 = getelementptr inbounds i8, i8* %44, i64 %10
  %59 = load i8, i8* %58, align 1
  %60 = icmp ult i8 %59, 8
  %61 = zext i1 %60 to i32
  %62 = add nuw nsw i32 %57, %61
  %63 = getelementptr inbounds i8, i8* %58, i64 2
  %64 = load i8, i8* %63, align 1
  %65 = icmp ult i8 %64, 8
  %66 = zext i1 %65 to i32
  %67 = add nuw nsw i32 %62, %66
  %68 = getelementptr inbounds i8, i8* %58, i64 %10
  %69 = load i8, i8* %68, align 1
  %70 = icmp ult i8 %69, 8
  %71 = zext i1 %70 to i32
  %72 = add nuw nsw i32 %67, %71
  %73 = getelementptr inbounds i8, i8* %68, i64 1
  %74 = load i8, i8* %73, align 1
  %75 = icmp ult i8 %74, 8
  %76 = zext i1 %75 to i32
  %77 = add nuw nsw i32 %72, %76
  %78 = getelementptr inbounds i8, i8* %68, i64 2
  %79 = load i8, i8* %78, align 1
  %80 = icmp ult i8 %79, 8
  %81 = zext i1 %80 to i32
  %82 = add nsw i32 %77, %81
  switch i32 %82, label %220 [
    i32 0, label %83
    i32 1, label %84
  ]

; <label>:83:                                     ; preds = %35
  store i8 100, i8* %32, align 1
  br label %.thread60

; <label>:84:                                     ; preds = %35
  %85 = icmp ult i8 %33, 6
  br i1 %85, label %86, label %.thread60

; <label>:86:                                     ; preds = %84
  %87 = add nsw i32 %39, %.082
  %88 = add nsw i32 %87, -1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32* %0, i64 %89
  %91 = load i32, i32* %90, align 4
  %92 = sext i32 %87 to i64
  %93 = getelementptr inbounds i32, i32* %0, i64 %92
  %94 = load i32, i32* %93, align 4
  %95 = add nsw i32 %87, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32* %0, i64 %96
  %98 = load i32, i32* %97, align 4
  %99 = add nsw i32 %30, -1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %0, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = add nsw i32 %30, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32* %0, i64 %104
  %106 = load i32, i32* %105, align 4
  %107 = add nsw i32 %.1481, 1
  %108 = mul nsw i32 %107, %2
  %109 = add nsw i32 %108, %.082
  %110 = add nsw i32 %109, -1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32* %0, i64 %111
  %113 = load i32, i32* %112, align 4
  %114 = sext i32 %109 to i64
  %115 = getelementptr inbounds i32, i32* %0, i64 %114
  %116 = load i32, i32* %115, align 4
  %117 = add nsw i32 %109, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32* %0, i64 %118
  %120 = load i32, i32* %119, align 4
  %121 = getelementptr inbounds i8, i8* %1, i64 %89
  %122 = load i8, i8* %121, align 1
  %123 = icmp ult i8 %122, 8
  br i1 %123, label %124, label %130

; <label>:124:                                    ; preds = %86
  %125 = shl nsw i32 %98, 1
  %126 = shl nsw i32 %113, 1
  %127 = mul nsw i32 %106, 3
  %128 = mul nsw i32 %116, 3
  %129 = shl nsw i32 %120, 2
  br label %526

; <label>:130:                                    ; preds = %86
  %131 = getelementptr inbounds i8, i8* %1, i64 %92
  %132 = load i8, i8* %131, align 1
  %133 = icmp ult i8 %132, 8
  br i1 %133, label %134, label %140

; <label>:134:                                    ; preds = %130
  %135 = shl nsw i32 %102, 1
  %136 = shl nsw i32 %106, 1
  %137 = mul nsw i32 %113, 3
  %138 = mul nsw i32 %120, 3
  %139 = shl nsw i32 %116, 2
  br label %526

; <label>:140:                                    ; preds = %130
  %141 = getelementptr inbounds i8, i8* %1, i64 %96
  %142 = load i8, i8* %141, align 1
  %143 = icmp ult i8 %142, 8
  br i1 %143, label %144, label %150

; <label>:144:                                    ; preds = %140
  %145 = shl nsw i32 %91, 1
  %146 = shl nsw i32 %120, 1
  %147 = mul nsw i32 %102, 3
  %148 = mul nsw i32 %116, 3
  %149 = shl nsw i32 %113, 2
  br label %526

; <label>:150:                                    ; preds = %140
  %151 = getelementptr inbounds i8, i8* %1, i64 %100
  %152 = load i8, i8* %151, align 1
  %153 = icmp ult i8 %152, 8
  br i1 %153, label %154, label %160

; <label>:154:                                    ; preds = %150
  %155 = shl nsw i32 %94, 1
  %156 = shl nsw i32 %116, 1
  %157 = mul nsw i32 %98, 3
  %158 = mul nsw i32 %120, 3
  %159 = shl nsw i32 %106, 2
  br label %526

; <label>:160:                                    ; preds = %150
  %161 = getelementptr inbounds i8, i8* %1, i64 %104
  %162 = load i8, i8* %161, align 1
  %163 = icmp ult i8 %162, 8
  br i1 %163, label %164, label %170

; <label>:164:                                    ; preds = %160
  %165 = shl nsw i32 %94, 1
  %166 = shl nsw i32 %116, 1
  %167 = mul nsw i32 %91, 3
  %168 = mul nsw i32 %113, 3
  %169 = shl nsw i32 %102, 2
  br label %526

; <label>:170:                                    ; preds = %160
  %171 = getelementptr inbounds i8, i8* %1, i64 %111
  %172 = load i8, i8* %171, align 1
  %173 = icmp ult i8 %172, 8
  br i1 %173, label %174, label %180

; <label>:174:                                    ; preds = %170
  %175 = shl nsw i32 %91, 1
  %176 = shl nsw i32 %120, 1
  %177 = mul nsw i32 %94, 3
  %178 = mul nsw i32 %106, 3
  %179 = shl nsw i32 %98, 2
  br label %526

; <label>:180:                                    ; preds = %170
  %181 = getelementptr inbounds i8, i8* %1, i64 %114
  %182 = load i8, i8* %181, align 1
  %183 = icmp ult i8 %182, 8
  br i1 %183, label %184, label %190

; <label>:184:                                    ; preds = %180
  %185 = shl nsw i32 %102, 1
  %186 = shl nsw i32 %106, 1
  %187 = mul nsw i32 %91, 3
  %188 = mul nsw i32 %98, 3
  %189 = shl nsw i32 %94, 2
  br label %526

; <label>:190:                                    ; preds = %180
  %191 = getelementptr inbounds i8, i8* %1, i64 %118
  %192 = load i8, i8* %191, align 1
  %193 = icmp ult i8 %192, 8
  br i1 %193, label %194, label %526

; <label>:194:                                    ; preds = %190
  %195 = shl nsw i32 %113, 1
  %196 = shl nsw i32 %98, 1
  %197 = mul nsw i32 %94, 3
  %198 = mul nsw i32 %102, 3
  %199 = shl nsw i32 %91, 2
  br label %526

; <label>:200:                                    ; preds = %526
  %201 = load i8, i8* %32, align 1
  %202 = icmp ult i8 %201, 4
  %203 = add i8 %201, 1
  %.61 = select i1 %202, i8 4, i8 %203
  %204 = add i32 %.1481, -1
  %205 = add i32 %204, %.018..336.2.2
  %206 = mul nsw i32 %205, %2
  %207 = add i32 %.082, -1
  %208 = add i32 %207, %.022..329.2.2
  %209 = add i32 %208, %206
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8* %1, i64 %210
  store i8 %.61, i8* %211, align 1
  %212 = shl i32 %.018..336.2.2, 1
  %213 = add nsw i32 %212, %.022..329.2.2
  %214 = icmp slt i32 %213, 3
  br i1 %214, label %215, label %220

; <label>:215:                                    ; preds = %200
  %216 = add i32 %.082, -2
  %217 = add i32 %216, %.022..329.2.2
  %218 = icmp sgt i32 %205, 4
  %. = select i1 %218, i32 %205, i32 4
  %219 = icmp sgt i32 %217, 4
  %.1 = select i1 %219, i32 %217, i32 4
  br label %220

; <label>:220:                                    ; preds = %526, %215, %200, %35
  %221 = phi i32 [ %20, %35 ], [ %527, %200 ], [ %527, %215 ], [ %527, %526 ]
  %222 = phi i32 [ %21, %35 ], [ %528, %200 ], [ %528, %215 ], [ %528, %526 ]
  %223 = phi i32 [ %22, %35 ], [ %529, %200 ], [ %529, %215 ], [ %529, %526 ]
  %224 = phi i32 [ %23, %35 ], [ %530, %200 ], [ %530, %215 ], [ %530, %526 ]
  %225 = phi i32 [ %24, %35 ], [ 0, %200 ], [ 0, %215 ], [ 0, %526 ]
  %226 = phi i32 [ %25, %35 ], [ %531, %200 ], [ %531, %215 ], [ %531, %526 ]
  %227 = phi i32 [ %26, %35 ], [ %532, %200 ], [ %532, %215 ], [ %532, %526 ]
  %228 = phi i32 [ %27, %35 ], [ %533, %200 ], [ %533, %215 ], [ %533, %526 ]
  %229 = phi i32 [ %28, %35 ], [ %534, %200 ], [ %534, %215 ], [ %534, %526 ]
  %.538 = phi i32 [ %.13479, %35 ], [ %.018..336.2.2, %200 ], [ %.018..336.2.2, %215 ], [ %.018..336.2.2, %526 ]
  %.531 = phi i32 [ %.12780, %35 ], [ %.022..329.2.2, %200 ], [ %.022..329.2.2, %215 ], [ %.022..329.2.2, %526 ]
  %.58 = phi i32 [ %.1481, %35 ], [ %.1481, %200 ], [ %., %215 ], [ %.1481, %526 ]
  %.4 = phi i32 [ %.082, %35 ], [ %.082, %200 ], [ %.1, %215 ], [ %.082, %526 ]
  %230 = icmp eq i32 %82, 2
  br i1 %230, label %231, label %432

; <label>:231:                                    ; preds = %220
  %232 = add nsw i32 %.58, -1
  %233 = mul nsw i32 %232, %2
  %234 = add nsw i32 %233, %.4
  %235 = add nsw i32 %234, -1
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i8, i8* %1, i64 %236
  %238 = load i8, i8* %237, align 1
  %239 = icmp ult i8 %238, 8
  %240 = zext i1 %239 to i32
  %241 = add nsw i32 %234, 1
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds i8, i8* %1, i64 %242
  %244 = load i8, i8* %243, align 1
  %245 = icmp ult i8 %244, 8
  %246 = zext i1 %245 to i32
  %247 = add nsw i32 %.58, 1
  %248 = mul nsw i32 %247, %2
  %249 = add nsw i32 %248, %.4
  %250 = add nsw i32 %249, -1
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i8, i8* %1, i64 %251
  %253 = load i8, i8* %252, align 1
  %254 = icmp ult i8 %253, 8
  %255 = zext i1 %254 to i32
  %256 = add nsw i32 %249, 1
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i8, i8* %1, i64 %257
  %259 = load i8, i8* %258, align 1
  %260 = icmp ult i8 %259, 8
  %261 = zext i1 %260 to i32
  %262 = add nuw nsw i32 %246, %240
  %263 = add nuw nsw i32 %262, %255
  %264 = add nuw nsw i32 %263, %261
  %265 = icmp eq i32 %264, 2
  br i1 %265, label %266, label %335

; <label>:266:                                    ; preds = %231
  %267 = or i1 %239, %260
  %268 = or i1 %245, %254
  %269 = and i1 %268, %267
  br i1 %269, label %270, label %335

; <label>:270:                                    ; preds = %266
  %not. = xor i1 %245, true
  %.51 = sext i1 %not. to i32
  %.52 = sext i1 %245 to i32
  %.53 = zext i1 %245 to i32
  %not.62 = xor i1 %245, true
  %.54 = zext i1 %not.62 to i32
  %.325 = select i1 %239, i32 %.51, i32 %.53
  %.321 = select i1 %239, i32 %.52, i32 %.54
  %271 = add nsw i32 %.321, %.58
  %272 = mul nsw i32 %271, %2
  %273 = add i32 %.325, %.4
  %274 = add i32 %273, %272
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i32, i32* %0, i64 %275
  %277 = load i32, i32* %276, align 4
  %278 = sitofp i32 %277 to float
  %279 = sitofp i32 %37 to float
  %280 = fdiv float %278, %279
  %281 = fpext float %280 to double
  %282 = fcmp ogt double %281, 7.000000e-01
  br i1 %282, label %283, label %.thread60

; <label>:283:                                    ; preds = %270
  %284 = icmp eq i32 %.325, 0
  br i1 %284, label %285, label %306

; <label>:285:                                    ; preds = %283
  %286 = shl nsw i32 %.321, 1
  %287 = add nsw i32 %286, %.58
  %288 = mul nsw i32 %287, %2
  %289 = add nsw i32 %288, %.4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %1, i64 %290
  %292 = load i8, i8* %291, align 1
  %293 = icmp ugt i8 %292, 7
  br i1 %293, label %294, label %306

; <label>:294:                                    ; preds = %285
  %295 = add nsw i32 %289, -1
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds i8, i8* %1, i64 %296
  %298 = load i8, i8* %297, align 1
  %299 = icmp ugt i8 %298, 7
  br i1 %299, label %300, label %306

; <label>:300:                                    ; preds = %294
  %301 = add nsw i32 %289, 1
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds i8, i8* %1, i64 %302
  %304 = load i8, i8* %303, align 1
  %305 = icmp ugt i8 %304, 7
  br i1 %305, label %329, label %306

; <label>:306:                                    ; preds = %300, %294, %285, %283
  %307 = icmp eq i32 %.321, 0
  br i1 %307, label %308, label %.thread60

; <label>:308:                                    ; preds = %306
  %309 = mul nsw i32 %.58, %2
  %310 = add nsw i32 %309, %.4
  %311 = shl nsw i32 %.325, 1
  %312 = add nsw i32 %310, %311
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds i8, i8* %1, i64 %313
  %315 = load i8, i8* %314, align 1
  %316 = icmp ugt i8 %315, 7
  br i1 %316, label %317, label %.thread60

; <label>:317:                                    ; preds = %308
  %318 = add nsw i32 %311, %249
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i8, i8* %1, i64 %319
  %321 = load i8, i8* %320, align 1
  %322 = icmp ugt i8 %321, 7
  br i1 %322, label %323, label %.thread60

; <label>:323:                                    ; preds = %317
  %324 = add nsw i32 %311, %234
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds i8, i8* %1, i64 %325
  %327 = load i8, i8* %326, align 1
  %328 = icmp ugt i8 %327, 7
  br i1 %328, label %329, label %.thread60

; <label>:329:                                    ; preds = %323, %300
  %330 = mul nsw i32 %.58, %2
  %331 = add nsw i32 %330, %.4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i8, i8* %1, i64 %332
  store i8 100, i8* %333, align 1
  %334 = getelementptr inbounds i8, i8* %1, i64 %275
  store i8 3, i8* %334, align 1
  br label %.thread60

; <label>:335:                                    ; preds = %266, %231
  %336 = sext i32 %234 to i64
  %337 = getelementptr inbounds i8, i8* %1, i64 %336
  %338 = load i8, i8* %337, align 1
  %339 = icmp ult i8 %338, 8
  %340 = zext i1 %339 to i32
  %341 = mul nsw i32 %.58, %2
  %342 = add nsw i32 %341, %.4
  %343 = add nsw i32 %342, 1
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds i8, i8* %1, i64 %344
  %346 = load i8, i8* %345, align 1
  %347 = icmp ult i8 %346, 8
  %348 = zext i1 %347 to i32
  %349 = sext i32 %249 to i64
  %350 = getelementptr inbounds i8, i8* %1, i64 %349
  %351 = load i8, i8* %350, align 1
  %352 = icmp ult i8 %351, 8
  %353 = zext i1 %352 to i32
  %354 = add nsw i32 %342, -1
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds i8, i8* %1, i64 %355
  %357 = load i8, i8* %356, align 1
  %358 = icmp ult i8 %357, 8
  %359 = zext i1 %358 to i32
  %360 = add nuw nsw i32 %348, %340
  %361 = add nuw nsw i32 %360, %353
  %362 = add nuw nsw i32 %361, %359
  %363 = icmp eq i32 %362, 2
  br i1 %363, label %364, label %.thread60

; <label>:364:                                    ; preds = %335
  %365 = or i1 %347, %358
  %366 = or i1 %339, %352
  %367 = and i1 %366, %365
  br i1 %367, label %368, label %.thread60

; <label>:368:                                    ; preds = %364
  %369 = add nsw i32 %.58, -2
  %370 = mul nsw i32 %369, %2
  %371 = add nsw i32 %370, %.4
  %372 = add nsw i32 %371, -1
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds i8, i8* %1, i64 %373
  %375 = load i8, i8* %374, align 1
  %376 = icmp ult i8 %375, 8
  %377 = add nsw i32 %371, 1
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds i8, i8* %1, i64 %378
  %380 = load i8, i8* %379, align 1
  %381 = icmp ult i8 %380, 8
  %382 = or i1 %376, %381
  %383 = and i1 %339, %382
  %384 = add nsw i32 %234, -2
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds i8, i8* %1, i64 %385
  %387 = load i8, i8* %386, align 1
  %388 = icmp ult i8 %387, 8
  %389 = add nsw i32 %249, -2
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8, i8* %1, i64 %390
  %392 = load i8, i8* %391, align 1
  %393 = icmp ult i8 %392, 8
  %394 = or i1 %388, %393
  %395 = and i1 %358, %394
  %396 = or i1 %383, %395
  %397 = add nsw i32 %234, 2
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds i8, i8* %1, i64 %398
  %400 = load i8, i8* %399, align 1
  %401 = icmp ult i8 %400, 8
  %402 = add nsw i32 %249, 2
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i8, i8* %1, i64 %403
  %405 = load i8, i8* %404, align 1
  %406 = icmp ult i8 %405, 8
  %407 = or i1 %401, %406
  %408 = and i1 %347, %407
  %409 = or i1 %396, %408
  %410 = add nsw i32 %.58, 2
  %411 = mul nsw i32 %410, %2
  %412 = add nsw i32 %411, %.4
  %413 = add nsw i32 %412, -1
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i8, i8* %1, i64 %414
  %416 = load i8, i8* %415, align 1
  %417 = icmp ult i8 %416, 8
  %418 = add nsw i32 %412, 1
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i8, i8* %1, i64 %419
  %421 = load i8, i8* %420, align 1
  %422 = icmp ult i8 %421, 8
  %423 = or i1 %417, %422
  %424 = and i1 %352, %423
  %425 = or i1 %409, %424
  %426 = add nsw i32 %.4, -2
  br i1 %425, label %427, label %.thread60

; <label>:427:                                    ; preds = %368
  %428 = icmp sgt i32 %426, 4
  %.5 = select i1 %428, i32 %426, i32 4
  %429 = icmp slt i32 %.58, 5
  %.55 = select i1 %429, i32 4, i32 %232
  %430 = sext i32 %342 to i64
  %431 = getelementptr inbounds i8, i8* %1, i64 %430
  store i8 100, i8* %431, align 1
  br label %.thread60

; <label>:432:                                    ; preds = %220
  %433 = icmp sgt i32 %82, 2
  br i1 %433, label %434, label %.thread60

; <label>:434:                                    ; preds = %432
  %435 = add nsw i32 %.58, -1
  %436 = mul nsw i32 %435, %2
  %437 = add nsw i32 %436, %.4
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds i8, i8* %1, i64 %438
  %440 = load i8, i8* %439, align 1
  %441 = icmp ult i8 %440, 8
  %442 = zext i1 %441 to i32
  %443 = mul nsw i32 %.58, %2
  %444 = add nsw i32 %443, %.4
  %445 = add nsw i32 %444, 1
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds i8, i8* %1, i64 %446
  %448 = load i8, i8* %447, align 1
  %449 = icmp ult i8 %448, 8
  %450 = zext i1 %449 to i32
  %451 = add nsw i32 %.58, 1
  %452 = mul nsw i32 %451, %2
  %453 = add nsw i32 %452, %.4
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds i8, i8* %1, i64 %454
  %456 = load i8, i8* %455, align 1
  %457 = icmp ult i8 %456, 8
  %458 = zext i1 %457 to i32
  %459 = add nsw i32 %444, -1
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds i8, i8* %1, i64 %460
  %462 = load i8, i8* %461, align 1
  %463 = icmp ult i8 %462, 8
  %464 = zext i1 %463 to i32
  %465 = add nuw nsw i32 %450, %442
  %466 = add nuw nsw i32 %465, %458
  %467 = add nuw nsw i32 %466, %464
  %468 = icmp ugt i32 %467, 1
  br i1 %468, label %469, label %.thread60

; <label>:469:                                    ; preds = %434
  %470 = add nsw i32 %437, -1
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i8, i8* %1, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = icmp ult i8 %473, 8
  %475 = add nsw i32 %437, 1
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds i8, i8* %1, i64 %476
  %478 = load i8, i8* %477, align 1
  %479 = icmp ult i8 %478, 8
  %480 = add nsw i32 %453, -1
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds i8, i8* %1, i64 %481
  %483 = load i8, i8* %482, align 1
  %484 = icmp ult i8 %483, 8
  %485 = add nsw i32 %453, 1
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds i8, i8* %1, i64 %486
  %488 = load i8, i8* %487, align 1
  %489 = icmp ult i8 %488, 8
  %490 = or i1 %441, %474
  %491 = zext i1 %490 to i32
  %492 = or i1 %449, %479
  %493 = zext i1 %492 to i32
  %494 = or i1 %457, %489
  %495 = zext i1 %494 to i32
  %496 = or i1 %463, %484
  %497 = zext i1 %496 to i32
  %498 = and i1 %441, %492
  %499 = and i1 %449, %494
  %500 = and i1 %457, %496
  %501 = and i1 %463, %490
  %.neg = sext i1 %501 to i32
  %.neg63 = sext i1 %500 to i32
  %.neg64 = sext i1 %498 to i32
  %.neg65 = sext i1 %499 to i32
  %.neg66 = add nuw nsw i32 %493, %491
  %.neg67 = add nsw i32 %.neg66, %.neg
  %.neg68 = add nsw i32 %.neg67, %497
  %502 = add nsw i32 %.neg68, %.neg64
  %503 = add nsw i32 %502, %495
  %504 = add nsw i32 %503, %.neg63
  %505 = add i32 %504, %.neg65
  %506 = icmp slt i32 %505, 2
  %507 = add nsw i32 %.4, -2
  br i1 %506, label %508, label %.thread60

; <label>:508:                                    ; preds = %469
  %509 = icmp sgt i32 %507, 4
  %.9 = select i1 %509, i32 %507, i32 4
  %510 = icmp slt i32 %.58, 5
  %.56 = select i1 %510, i32 4, i32 %435
  %511 = sext i32 %444 to i64
  %512 = getelementptr inbounds i8, i8* %1, i64 %511
  store i8 100, i8* %512, align 1
  br label %.thread60

.thread60:                                        ; preds = %508, %469, %434, %432, %427, %368, %364, %335, %329, %323, %317, %308, %306, %270, %84, %83, %.lr.ph
  %513 = phi i32 [ %20, %.lr.ph ], [ %221, %434 ], [ %221, %508 ], [ %221, %469 ], [ %221, %432 ], [ %221, %427 ], [ %221, %335 ], [ %221, %364 ], [ %221, %368 ], [ %221, %270 ], [ %221, %329 ], [ %221, %323 ], [ %221, %317 ], [ %221, %308 ], [ %221, %306 ], [ %20, %83 ], [ %20, %84 ]
  %514 = phi i32 [ %21, %.lr.ph ], [ %222, %434 ], [ %222, %508 ], [ %222, %469 ], [ %222, %432 ], [ %222, %427 ], [ %222, %335 ], [ %222, %364 ], [ %222, %368 ], [ %222, %270 ], [ %222, %329 ], [ %222, %323 ], [ %222, %317 ], [ %222, %308 ], [ %222, %306 ], [ %21, %83 ], [ %21, %84 ]
  %515 = phi i32 [ %22, %.lr.ph ], [ %223, %434 ], [ %223, %508 ], [ %223, %469 ], [ %223, %432 ], [ %223, %427 ], [ %223, %335 ], [ %223, %364 ], [ %223, %368 ], [ %223, %270 ], [ %223, %329 ], [ %223, %323 ], [ %223, %317 ], [ %223, %308 ], [ %223, %306 ], [ %22, %83 ], [ %22, %84 ]
  %516 = phi i32 [ %23, %.lr.ph ], [ %224, %434 ], [ %224, %508 ], [ %224, %469 ], [ %224, %432 ], [ %224, %427 ], [ %224, %335 ], [ %224, %364 ], [ %224, %368 ], [ %224, %270 ], [ %224, %329 ], [ %224, %323 ], [ %224, %317 ], [ %224, %308 ], [ %224, %306 ], [ %23, %83 ], [ %23, %84 ]
  %517 = phi i32 [ %24, %.lr.ph ], [ %225, %434 ], [ %225, %508 ], [ %225, %469 ], [ %225, %432 ], [ %225, %427 ], [ %225, %335 ], [ %225, %364 ], [ %225, %368 ], [ %225, %270 ], [ %225, %329 ], [ %225, %323 ], [ %225, %317 ], [ %225, %308 ], [ %225, %306 ], [ %24, %83 ], [ %24, %84 ]
  %518 = phi i32 [ %25, %.lr.ph ], [ %226, %434 ], [ %226, %508 ], [ %226, %469 ], [ %226, %432 ], [ %226, %427 ], [ %226, %335 ], [ %226, %364 ], [ %226, %368 ], [ %226, %270 ], [ %226, %329 ], [ %226, %323 ], [ %226, %317 ], [ %226, %308 ], [ %226, %306 ], [ %25, %83 ], [ %25, %84 ]
  %519 = phi i32 [ %26, %.lr.ph ], [ %227, %434 ], [ %227, %508 ], [ %227, %469 ], [ %227, %432 ], [ %227, %427 ], [ %227, %335 ], [ %227, %364 ], [ %227, %368 ], [ %227, %270 ], [ %227, %329 ], [ %227, %323 ], [ %227, %317 ], [ %227, %308 ], [ %227, %306 ], [ %26, %83 ], [ %26, %84 ]
  %520 = phi i32 [ %27, %.lr.ph ], [ %228, %434 ], [ %228, %508 ], [ %228, %469 ], [ %228, %432 ], [ %228, %427 ], [ %228, %335 ], [ %228, %364 ], [ %228, %368 ], [ %228, %270 ], [ %228, %329 ], [ %228, %323 ], [ %228, %317 ], [ %228, %308 ], [ %228, %306 ], [ %27, %83 ], [ %27, %84 ]
  %521 = phi i32 [ %28, %.lr.ph ], [ %229, %434 ], [ %229, %508 ], [ %229, %469 ], [ %229, %432 ], [ %229, %427 ], [ %229, %335 ], [ %229, %364 ], [ %229, %368 ], [ %229, %270 ], [ %229, %329 ], [ %229, %323 ], [ %229, %317 ], [ %229, %308 ], [ %229, %306 ], [ %28, %83 ], [ %28, %84 ]
  %.639 = phi i32 [ %.13479, %.lr.ph ], [ %.538, %434 ], [ %.538, %508 ], [ %.538, %469 ], [ %.538, %432 ], [ %.538, %427 ], [ %.538, %335 ], [ %.538, %364 ], [ %.538, %368 ], [ %.538, %270 ], [ %.538, %329 ], [ %.538, %323 ], [ %.538, %317 ], [ %.538, %308 ], [ %.538, %306 ], [ %.13479, %83 ], [ %.13479, %84 ]
  %.632 = phi i32 [ %.12780, %.lr.ph ], [ %.531, %434 ], [ %.531, %508 ], [ %.531, %469 ], [ %.531, %432 ], [ %.531, %427 ], [ %.531, %335 ], [ %.531, %364 ], [ %.531, %368 ], [ %.531, %270 ], [ %.531, %329 ], [ %.531, %323 ], [ %.531, %317 ], [ %.531, %308 ], [ %.531, %306 ], [ %.12780, %83 ], [ %.12780, %84 ]
  %.1417 = phi i32 [ %.1481, %.lr.ph ], [ %.58, %434 ], [ %.56, %508 ], [ %.58, %469 ], [ %.58, %432 ], [ %.55, %427 ], [ %.58, %335 ], [ %.58, %364 ], [ %.58, %368 ], [ %.58, %270 ], [ %.58, %329 ], [ %.58, %323 ], [ %.58, %317 ], [ %.58, %308 ], [ %.58, %306 ], [ %.1481, %83 ], [ %.1481, %84 ]
  %.13 = phi i32 [ %.082, %.lr.ph ], [ %.4, %434 ], [ %.9, %508 ], [ %.4, %469 ], [ %.4, %432 ], [ %.5, %427 ], [ %.4, %335 ], [ %.4, %364 ], [ %.4, %368 ], [ %.4, %270 ], [ %.4, %329 ], [ %.4, %323 ], [ %.4, %317 ], [ %.4, %308 ], [ %.4, %306 ], [ %.082, %83 ], [ %.082, %84 ]
  %522 = add nsw i32 %.13, 1
  %523 = icmp slt i32 %522, %8
  br i1 %523, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.thread60
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader70
  %.lcssa112137 = phi i32 [ %.lcssa112138, %.preheader70 ], [ %513, %._crit_edge.loopexit ]
  %.lcssa110134 = phi i32 [ %.lcssa110135, %.preheader70 ], [ %514, %._crit_edge.loopexit ]
  %.lcssa108131 = phi i32 [ %.lcssa108132, %.preheader70 ], [ %515, %._crit_edge.loopexit ]
  %.lcssa106128 = phi i32 [ %.lcssa106129, %.preheader70 ], [ %516, %._crit_edge.loopexit ]
  %.lcssa104125 = phi i32 [ %.lcssa104126, %.preheader70 ], [ %517, %._crit_edge.loopexit ]
  %.lcssa102122 = phi i32 [ %.lcssa102123, %.preheader70 ], [ %518, %._crit_edge.loopexit ]
  %.lcssa100119 = phi i32 [ %.lcssa100120, %.preheader70 ], [ %519, %._crit_edge.loopexit ]
  %.lcssa98116 = phi i32 [ %.lcssa98117, %.preheader70 ], [ %520, %._crit_edge.loopexit ]
  %.lcssa114 = phi i32 [ %.lcssa115, %.preheader70 ], [ %521, %._crit_edge.loopexit ]
  %.134.lcssa = phi i32 [ %.03385, %.preheader70 ], [ %.639, %._crit_edge.loopexit ]
  %.127.lcssa = phi i32 [ %.02686, %.preheader70 ], [ %.632, %._crit_edge.loopexit ]
  %.14.lcssa = phi i32 [ %.0187, %.preheader70 ], [ %.1417, %._crit_edge.loopexit ]
  %524 = add nsw i32 %.14.lcssa, 1
  %525 = icmp slt i32 %524, %6
  br i1 %525, label %.preheader70, label %._crit_edge88.loopexit

._crit_edge88.loopexit:                           ; preds = %._crit_edge
  store i32 %.lcssa114, i32* %11, align 16
  store i32 %.lcssa98116, i32* %12, align 4
  store i32 %.lcssa100119, i32* %13, align 8
  store i32 %.lcssa102122, i32* %14, align 4
  store i32 %.lcssa104125, i32* %15, align 16
  store i32 %.lcssa106128, i32* %16, align 4
  store i32 %.lcssa108131, i32* %17, align 8
  store i32 %.lcssa110134, i32* %18, align 4
  store i32 %.lcssa112137, i32* %19, align 16
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %4
  ret void

; <label>:526:                                    ; preds = %194, %190, %184, %174, %164, %154, %144, %134, %124
  %527 = phi i32 [ %138, %134 ], [ %158, %154 ], [ %176, %174 ], [ %120, %190 ], [ 0, %194 ], [ 0, %184 ], [ 0, %164 ], [ %146, %144 ], [ %129, %124 ]
  %528 = phi i32 [ %139, %134 ], [ %156, %154 ], [ 0, %174 ], [ %116, %190 ], [ 0, %194 ], [ 0, %184 ], [ %166, %164 ], [ %148, %144 ], [ %128, %124 ]
  %529 = phi i32 [ %137, %134 ], [ 0, %154 ], [ 0, %174 ], [ %113, %190 ], [ %195, %194 ], [ 0, %184 ], [ %168, %164 ], [ %149, %144 ], [ %126, %124 ]
  %530 = phi i32 [ %136, %134 ], [ %159, %154 ], [ %178, %174 ], [ %106, %190 ], [ 0, %194 ], [ %186, %184 ], [ 0, %164 ], [ 0, %144 ], [ %127, %124 ]
  %531 = phi i32 [ %135, %134 ], [ 0, %154 ], [ 0, %174 ], [ %102, %190 ], [ %198, %194 ], [ %185, %184 ], [ %169, %164 ], [ %147, %144 ], [ 0, %124 ]
  %532 = phi i32 [ 0, %134 ], [ %157, %154 ], [ %179, %174 ], [ %98, %190 ], [ %196, %194 ], [ %188, %184 ], [ 0, %164 ], [ 0, %144 ], [ %125, %124 ]
  %533 = phi i32 [ 0, %134 ], [ %155, %154 ], [ %177, %174 ], [ %94, %190 ], [ %197, %194 ], [ %189, %184 ], [ %165, %164 ], [ 0, %144 ], [ 0, %124 ]
  %534 = phi i32 [ 0, %134 ], [ 0, %154 ], [ %175, %174 ], [ %91, %190 ], [ %199, %194 ], [ %187, %184 ], [ %167, %164 ], [ %145, %144 ], [ 0, %124 ]
  %535 = icmp sgt i32 %534, 0
  %..141 = select i1 %535, i32 %534, i32 0
  %536 = icmp sgt i32 %533, %..141
  %..141.1 = select i1 %536, i32 %533, i32 %..141
  %537 = icmp sgt i32 %532, %..141.1
  %..141.2 = select i1 %537, i32 %532, i32 %..141.1
  %538 = icmp sgt i32 %531, %..141.2
  %..141.189 = select i1 %538, i32 %531, i32 %..141.2
  %539 = icmp sgt i32 %530, %..141.189
  %..141.2.1 = select i1 %539, i32 %530, i32 %..141.189
  %540 = or i1 %536, %535
  %541 = or i1 %537, %540
  %.018..336.2 = select i1 %541, i32 0, i32 %.13479
  %.022..329 = select i1 %535, i32 0, i32 %.12780
  %.022..329.1 = select i1 %536, i32 1, i32 %.022..329
  %.022..329.2 = select i1 %537, i32 2, i32 %.022..329.1
  %.022..329.191 = select i1 %538, i32 0, i32 %.022..329.2
  %.022..329.2.1 = select i1 %539, i32 2, i32 %.022..329.191
  %542 = or i1 %539, %538
  %.018..336.2.1 = select i1 %542, i32 1, i32 %.018..336.2
  %543 = icmp sgt i32 %529, %..141.2.1
  %..141.292 = select i1 %543, i32 %529, i32 %..141.2.1
  %.022..329.294 = select i1 %543, i32 0, i32 %.022..329.2.1
  %544 = icmp sgt i32 %528, %..141.292
  %..141.1.2 = select i1 %544, i32 %528, i32 %..141.292
  %545 = or i1 %544, %543
  %.022..329.1.2 = select i1 %544, i32 1, i32 %.022..329.294
  %546 = icmp sgt i32 %527, %..141.1.2
  %..141.2.2 = select i1 %546, i32 %527, i32 %..141.1.2
  %547 = or i1 %546, %545
  %.018..336.2.2 = select i1 %547, i32 2, i32 %.018..336.2.1
  %.022..329.2.2 = select i1 %546, i32 2, i32 %.022..329.1.2
  %548 = icmp sgt i32 %..141.2.2, 0
  br i1 %548, label %200, label %220
}

; Function Attrs: noinline nounwind uwtable
define void @susan_edges(i8* nocapture readonly, i32* nocapture, i8* nocapture, i8* readonly, i32, i32, i32) local_unnamed_addr #3 {
  %8 = bitcast i32* %1 to i8*
  %9 = mul nsw i32 %6, %5
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  tail call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %11, i32 4, i1 false)
  %12 = add nsw i32 %6, -3
  %13 = icmp sgt i32 %12, 3
  br i1 %13, label %.preheader113.lr.ph, label %.preheader112

.preheader113.lr.ph:                              ; preds = %7
  %14 = add nsw i32 %5, -3
  %15 = icmp sgt i32 %14, 3
  %16 = sext i32 %14 to i64
  %17 = add nsw i32 %5, -5
  %18 = sext i32 %17 to i64
  %19 = add nsw i32 %5, -6
  %20 = sext i32 %19 to i64
  %21 = sext i32 %5 to i64
  %22 = sext i32 %5 to i64
  %wide.trip.count139 = zext i32 %14 to i64
  %wide.trip.count143 = zext i32 %12 to i64
  br label %.preheader113

.preheader113:                                    ; preds = %._crit_edge121, %.preheader113.lr.ph
  %indvars.iv141 = phi i64 [ 3, %.preheader113.lr.ph ], [ %indvars.iv.next142, %._crit_edge121 ]
  br i1 %15, label %.lr.ph120, label %._crit_edge121

.lr.ph120:                                        ; preds = %.preheader113
  %23 = add nsw i64 %indvars.iv141, -3
  %24 = mul nsw i64 %23, %22
  %25 = getelementptr inbounds i8, i8* %0, i64 %24
  %26 = mul nsw i64 %indvars.iv141, %21
  br label %46

.preheader112.loopexit:                           ; preds = %._crit_edge121
  br label %.preheader112

.preheader112:                                    ; preds = %.preheader112.loopexit, %7
  %27 = add nsw i32 %6, -4
  %28 = icmp sgt i32 %27, 4
  br i1 %28, label %.preheader.lr.ph, label %._crit_edge118

.preheader.lr.ph:                                 ; preds = %.preheader112
  %29 = add nsw i32 %5, -4
  %30 = icmp sgt i32 %29, 4
  %31 = add nsw i32 %5, -3
  %32 = sext i32 %31 to i64
  %33 = add nsw i32 %5, -5
  %34 = sext i32 %33 to i64
  %35 = add nsw i32 %5, -6
  %36 = sext i32 %35 to i64
  %37 = add nsw i32 %5, -3
  %38 = sext i32 %37 to i64
  %39 = add nsw i32 %5, -5
  %40 = sext i32 %39 to i64
  %41 = add nsw i32 %5, -6
  %42 = sext i32 %41 to i64
  %43 = sext i32 %5 to i64
  %44 = sext i32 %5 to i64
  %45 = sext i32 %5 to i64
  %wide.trip.count = zext i32 %29 to i64
  %wide.trip.count135 = zext i32 %27 to i64
  br label %.preheader

; <label>:46:                                     ; preds = %345, %.lr.ph120
  %indvars.iv137 = phi i64 [ 3, %.lr.ph120 ], [ %indvars.iv.next138, %345 ]
  %47 = getelementptr inbounds i8, i8* %25, i64 %indvars.iv137
  %48 = getelementptr inbounds i8, i8* %47, i64 -1
  %49 = add nsw i64 %indvars.iv137, %26
  %50 = getelementptr inbounds i8, i8* %0, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i64
  %53 = getelementptr inbounds i8, i8* %3, i64 %52
  %54 = getelementptr inbounds i8, i8* %48, i64 1
  %55 = load i8, i8* %48, align 1
  %56 = zext i8 %55 to i64
  %57 = sub nsw i64 0, %56
  %58 = getelementptr inbounds i8, i8* %53, i64 %57
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = add nuw nsw i32 %60, 100
  %62 = getelementptr inbounds i8, i8* %54, i64 1
  %63 = load i8, i8* %54, align 1
  %64 = zext i8 %63 to i64
  %65 = sub nsw i64 0, %64
  %66 = getelementptr inbounds i8, i8* %53, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = add nuw nsw i32 %61, %68
  %70 = load i8, i8* %62, align 1
  %71 = zext i8 %70 to i64
  %72 = sub nsw i64 0, %71
  %73 = getelementptr inbounds i8, i8* %53, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = add nuw nsw i32 %69, %75
  %77 = getelementptr inbounds i8, i8* %62, i64 %16
  %78 = getelementptr inbounds i8, i8* %77, i64 1
  %79 = load i8, i8* %77, align 1
  %80 = zext i8 %79 to i64
  %81 = sub nsw i64 0, %80
  %82 = getelementptr inbounds i8, i8* %53, i64 %81
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = add nuw nsw i32 %76, %84
  %86 = getelementptr inbounds i8, i8* %78, i64 1
  %87 = load i8, i8* %78, align 1
  %88 = zext i8 %87 to i64
  %89 = sub nsw i64 0, %88
  %90 = getelementptr inbounds i8, i8* %53, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = add nuw nsw i32 %85, %92
  %94 = getelementptr inbounds i8, i8* %86, i64 1
  %95 = load i8, i8* %86, align 1
  %96 = zext i8 %95 to i64
  %97 = sub nsw i64 0, %96
  %98 = getelementptr inbounds i8, i8* %53, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = add nuw nsw i32 %93, %100
  %102 = getelementptr inbounds i8, i8* %94, i64 1
  %103 = load i8, i8* %94, align 1
  %104 = zext i8 %103 to i64
  %105 = sub nsw i64 0, %104
  %106 = getelementptr inbounds i8, i8* %53, i64 %105
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = add nsw i32 %101, %108
  %110 = load i8, i8* %102, align 1
  %111 = zext i8 %110 to i64
  %112 = sub nsw i64 0, %111
  %113 = getelementptr inbounds i8, i8* %53, i64 %112
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = add nsw i32 %109, %115
  %117 = getelementptr inbounds i8, i8* %102, i64 %18
  %118 = getelementptr inbounds i8, i8* %117, i64 1
  %119 = load i8, i8* %117, align 1
  %120 = zext i8 %119 to i64
  %121 = sub nsw i64 0, %120
  %122 = getelementptr inbounds i8, i8* %53, i64 %121
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i32
  %125 = add nsw i32 %116, %124
  %126 = getelementptr inbounds i8, i8* %118, i64 1
  %127 = load i8, i8* %118, align 1
  %128 = zext i8 %127 to i64
  %129 = sub nsw i64 0, %128
  %130 = getelementptr inbounds i8, i8* %53, i64 %129
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = add nsw i32 %125, %132
  %134 = getelementptr inbounds i8, i8* %126, i64 1
  %135 = load i8, i8* %126, align 1
  %136 = zext i8 %135 to i64
  %137 = sub nsw i64 0, %136
  %138 = getelementptr inbounds i8, i8* %53, i64 %137
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = add nsw i32 %133, %140
  %142 = getelementptr inbounds i8, i8* %134, i64 1
  %143 = load i8, i8* %134, align 1
  %144 = zext i8 %143 to i64
  %145 = sub nsw i64 0, %144
  %146 = getelementptr inbounds i8, i8* %53, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = add nsw i32 %141, %148
  %150 = getelementptr inbounds i8, i8* %142, i64 1
  %151 = load i8, i8* %142, align 1
  %152 = zext i8 %151 to i64
  %153 = sub nsw i64 0, %152
  %154 = getelementptr inbounds i8, i8* %53, i64 %153
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = add nsw i32 %149, %156
  %158 = getelementptr inbounds i8, i8* %150, i64 1
  %159 = load i8, i8* %150, align 1
  %160 = zext i8 %159 to i64
  %161 = sub nsw i64 0, %160
  %162 = getelementptr inbounds i8, i8* %53, i64 %161
  %163 = load i8, i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = add nsw i32 %157, %164
  %166 = load i8, i8* %158, align 1
  %167 = zext i8 %166 to i64
  %168 = sub nsw i64 0, %167
  %169 = getelementptr inbounds i8, i8* %53, i64 %168
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = add nsw i32 %165, %171
  %173 = getelementptr inbounds i8, i8* %158, i64 %20
  %174 = getelementptr inbounds i8, i8* %173, i64 1
  %175 = load i8, i8* %173, align 1
  %176 = zext i8 %175 to i64
  %177 = sub nsw i64 0, %176
  %178 = getelementptr inbounds i8, i8* %53, i64 %177
  %179 = load i8, i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = add nsw i32 %172, %180
  %182 = getelementptr inbounds i8, i8* %174, i64 1
  %183 = load i8, i8* %174, align 1
  %184 = zext i8 %183 to i64
  %185 = sub nsw i64 0, %184
  %186 = getelementptr inbounds i8, i8* %53, i64 %185
  %187 = load i8, i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = add nsw i32 %181, %188
  %190 = load i8, i8* %182, align 1
  %191 = zext i8 %190 to i64
  %192 = sub nsw i64 0, %191
  %193 = getelementptr inbounds i8, i8* %53, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = add nsw i32 %189, %195
  %197 = getelementptr inbounds i8, i8* %182, i64 2
  %198 = getelementptr inbounds i8, i8* %197, i64 1
  %199 = load i8, i8* %197, align 1
  %200 = zext i8 %199 to i64
  %201 = sub nsw i64 0, %200
  %202 = getelementptr inbounds i8, i8* %53, i64 %201
  %203 = load i8, i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = add nsw i32 %196, %204
  %206 = getelementptr inbounds i8, i8* %198, i64 1
  %207 = load i8, i8* %198, align 1
  %208 = zext i8 %207 to i64
  %209 = sub nsw i64 0, %208
  %210 = getelementptr inbounds i8, i8* %53, i64 %209
  %211 = load i8, i8* %210, align 1
  %212 = zext i8 %211 to i32
  %213 = add nsw i32 %205, %212
  %214 = load i8, i8* %206, align 1
  %215 = zext i8 %214 to i64
  %216 = sub nsw i64 0, %215
  %217 = getelementptr inbounds i8, i8* %53, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = add nsw i32 %213, %219
  %221 = getelementptr inbounds i8, i8* %206, i64 %20
  %222 = getelementptr inbounds i8, i8* %221, i64 1
  %223 = load i8, i8* %221, align 1
  %224 = zext i8 %223 to i64
  %225 = sub nsw i64 0, %224
  %226 = getelementptr inbounds i8, i8* %53, i64 %225
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = add nsw i32 %220, %228
  %230 = getelementptr inbounds i8, i8* %222, i64 1
  %231 = load i8, i8* %222, align 1
  %232 = zext i8 %231 to i64
  %233 = sub nsw i64 0, %232
  %234 = getelementptr inbounds i8, i8* %53, i64 %233
  %235 = load i8, i8* %234, align 1
  %236 = zext i8 %235 to i32
  %237 = add nsw i32 %229, %236
  %238 = getelementptr inbounds i8, i8* %230, i64 1
  %239 = load i8, i8* %230, align 1
  %240 = zext i8 %239 to i64
  %241 = sub nsw i64 0, %240
  %242 = getelementptr inbounds i8, i8* %53, i64 %241
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = add nsw i32 %237, %244
  %246 = getelementptr inbounds i8, i8* %238, i64 1
  %247 = load i8, i8* %238, align 1
  %248 = zext i8 %247 to i64
  %249 = sub nsw i64 0, %248
  %250 = getelementptr inbounds i8, i8* %53, i64 %249
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = add nsw i32 %245, %252
  %254 = getelementptr inbounds i8, i8* %246, i64 1
  %255 = load i8, i8* %246, align 1
  %256 = zext i8 %255 to i64
  %257 = sub nsw i64 0, %256
  %258 = getelementptr inbounds i8, i8* %53, i64 %257
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = add nsw i32 %253, %260
  %262 = getelementptr inbounds i8, i8* %254, i64 1
  %263 = load i8, i8* %254, align 1
  %264 = zext i8 %263 to i64
  %265 = sub nsw i64 0, %264
  %266 = getelementptr inbounds i8, i8* %53, i64 %265
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i32
  %269 = add nsw i32 %261, %268
  %270 = load i8, i8* %262, align 1
  %271 = zext i8 %270 to i64
  %272 = sub nsw i64 0, %271
  %273 = getelementptr inbounds i8, i8* %53, i64 %272
  %274 = load i8, i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = add nsw i32 %269, %275
  %277 = getelementptr inbounds i8, i8* %262, i64 %18
  %278 = getelementptr inbounds i8, i8* %277, i64 1
  %279 = load i8, i8* %277, align 1
  %280 = zext i8 %279 to i64
  %281 = sub nsw i64 0, %280
  %282 = getelementptr inbounds i8, i8* %53, i64 %281
  %283 = load i8, i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = add nsw i32 %276, %284
  %286 = getelementptr inbounds i8, i8* %278, i64 1
  %287 = load i8, i8* %278, align 1
  %288 = zext i8 %287 to i64
  %289 = sub nsw i64 0, %288
  %290 = getelementptr inbounds i8, i8* %53, i64 %289
  %291 = load i8, i8* %290, align 1
  %292 = zext i8 %291 to i32
  %293 = add nsw i32 %285, %292
  %294 = getelementptr inbounds i8, i8* %286, i64 1
  %295 = load i8, i8* %286, align 1
  %296 = zext i8 %295 to i64
  %297 = sub nsw i64 0, %296
  %298 = getelementptr inbounds i8, i8* %53, i64 %297
  %299 = load i8, i8* %298, align 1
  %300 = zext i8 %299 to i32
  %301 = add nsw i32 %293, %300
  %302 = getelementptr inbounds i8, i8* %294, i64 1
  %303 = load i8, i8* %294, align 1
  %304 = zext i8 %303 to i64
  %305 = sub nsw i64 0, %304
  %306 = getelementptr inbounds i8, i8* %53, i64 %305
  %307 = load i8, i8* %306, align 1
  %308 = zext i8 %307 to i32
  %309 = add nsw i32 %301, %308
  %310 = load i8, i8* %302, align 1
  %311 = zext i8 %310 to i64
  %312 = sub nsw i64 0, %311
  %313 = getelementptr inbounds i8, i8* %53, i64 %312
  %314 = load i8, i8* %313, align 1
  %315 = zext i8 %314 to i32
  %316 = add nsw i32 %309, %315
  %317 = getelementptr inbounds i8, i8* %302, i64 %16
  %318 = getelementptr inbounds i8, i8* %317, i64 1
  %319 = load i8, i8* %317, align 1
  %320 = zext i8 %319 to i64
  %321 = sub nsw i64 0, %320
  %322 = getelementptr inbounds i8, i8* %53, i64 %321
  %323 = load i8, i8* %322, align 1
  %324 = zext i8 %323 to i32
  %325 = add nsw i32 %316, %324
  %326 = getelementptr inbounds i8, i8* %318, i64 1
  %327 = load i8, i8* %318, align 1
  %328 = zext i8 %327 to i64
  %329 = sub nsw i64 0, %328
  %330 = getelementptr inbounds i8, i8* %53, i64 %329
  %331 = load i8, i8* %330, align 1
  %332 = zext i8 %331 to i32
  %333 = add nsw i32 %325, %332
  %334 = load i8, i8* %326, align 1
  %335 = zext i8 %334 to i64
  %336 = sub nsw i64 0, %335
  %337 = getelementptr inbounds i8, i8* %53, i64 %336
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = add nsw i32 %333, %339
  %341 = icmp sgt i32 %340, %4
  br i1 %341, label %345, label %342

; <label>:342:                                    ; preds = %46
  %343 = getelementptr inbounds i32, i32* %1, i64 %49
  %344 = sub nsw i32 %4, %340
  store i32 %344, i32* %343, align 4
  br label %345

; <label>:345:                                    ; preds = %342, %46
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %._crit_edge121.loopexit, label %46

._crit_edge121.loopexit:                          ; preds = %345
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader113
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next142, %wide.trip.count143
  br i1 %exitcond144, label %.preheader112.loopexit, label %.preheader113

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv133 = phi i64 [ 4, %.preheader.lr.ph ], [ %indvars.iv.next134, %._crit_edge ]
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %346 = mul nsw i64 %indvars.iv133, %43
  %347 = add nsw i64 %indvars.iv133, -3
  %348 = mul nsw i64 %347, %44
  %349 = getelementptr inbounds i8, i8* %0, i64 %348
  %350 = add nsw i64 %indvars.iv133, -3
  %351 = mul nsw i64 %350, %45
  %352 = getelementptr inbounds i8, i8* %0, i64 %351
  %353 = trunc i64 %indvars.iv133 to i32
  %354 = trunc i64 %indvars.iv133 to i32
  %355 = trunc i64 %indvars.iv133 to i32
  %356 = trunc i64 %indvars.iv133 to i32
  %357 = trunc i64 %indvars.iv133 to i32
  %358 = trunc i64 %indvars.iv133 to i32
  %359 = trunc i64 %indvars.iv133 to i32
  %360 = trunc i64 %indvars.iv133 to i32
  br label %361

; <label>:361:                                    ; preds = %.thread, %.lr.ph
  %indvars.iv = phi i64 [ 4, %.lr.ph ], [ %indvars.iv.next, %.thread ]
  %362 = add nsw i64 %indvars.iv, %346
  %363 = getelementptr inbounds i32, i32* %1, i64 %362
  %364 = load i32, i32* %363, align 4
  %365 = icmp sgt i32 %364, 0
  br i1 %365, label %366, label %.thread

; <label>:366:                                    ; preds = %361
  %367 = sub nsw i32 %4, %364
  %368 = getelementptr inbounds i8, i8* %0, i64 %362
  %369 = load i8, i8* %368, align 1
  %370 = zext i8 %369 to i64
  %371 = getelementptr inbounds i8, i8* %3, i64 %370
  %372 = icmp sgt i32 %367, 600
  br i1 %372, label %373, label %733

; <label>:373:                                    ; preds = %366
  %374 = getelementptr inbounds i8, i8* %349, i64 %indvars.iv
  %375 = getelementptr inbounds i8, i8* %374, i64 -1
  %376 = getelementptr inbounds i8, i8* %375, i64 1
  %377 = load i8, i8* %375, align 1
  %378 = zext i8 %377 to i64
  %379 = sub nsw i64 0, %378
  %380 = getelementptr inbounds i8, i8* %371, i64 %379
  %381 = load i8, i8* %380, align 1
  %382 = zext i8 %381 to i32
  %383 = getelementptr inbounds i8, i8* %376, i64 1
  %384 = load i8, i8* %376, align 1
  %385 = zext i8 %384 to i64
  %386 = sub nsw i64 0, %385
  %387 = getelementptr inbounds i8, i8* %371, i64 %386
  %388 = load i8, i8* %387, align 1
  %389 = zext i8 %388 to i32
  %390 = add nuw nsw i32 %389, %382
  %391 = load i8, i8* %383, align 1
  %392 = zext i8 %391 to i64
  %393 = sub nsw i64 0, %392
  %394 = getelementptr inbounds i8, i8* %371, i64 %393
  %395 = load i8, i8* %394, align 1
  %396 = zext i8 %395 to i32
  %397 = add nuw nsw i32 %390, %396
  %398 = getelementptr inbounds i8, i8* %383, i64 %32
  %399 = getelementptr inbounds i8, i8* %398, i64 1
  %400 = load i8, i8* %398, align 1
  %401 = zext i8 %400 to i64
  %402 = sub nsw i64 0, %401
  %403 = getelementptr inbounds i8, i8* %371, i64 %402
  %404 = load i8, i8* %403, align 1
  %405 = zext i8 %404 to i32
  %406 = shl nuw nsw i32 %405, 1
  %407 = getelementptr inbounds i8, i8* %399, i64 1
  %408 = load i8, i8* %399, align 1
  %409 = zext i8 %408 to i64
  %410 = sub nsw i64 0, %409
  %411 = getelementptr inbounds i8, i8* %371, i64 %410
  %412 = load i8, i8* %411, align 1
  %413 = zext i8 %412 to i32
  %414 = shl nuw nsw i32 %413, 1
  %415 = getelementptr inbounds i8, i8* %407, i64 1
  %416 = load i8, i8* %407, align 1
  %417 = zext i8 %416 to i64
  %418 = sub nsw i64 0, %417
  %419 = getelementptr inbounds i8, i8* %371, i64 %418
  %420 = load i8, i8* %419, align 1
  %421 = zext i8 %420 to i32
  %422 = shl nuw nsw i32 %421, 1
  %423 = getelementptr inbounds i8, i8* %415, i64 1
  %424 = load i8, i8* %415, align 1
  %425 = zext i8 %424 to i64
  %426 = sub nsw i64 0, %425
  %427 = getelementptr inbounds i8, i8* %371, i64 %426
  %428 = load i8, i8* %427, align 1
  %429 = zext i8 %428 to i32
  %430 = shl nuw nsw i32 %429, 1
  %431 = load i8, i8* %423, align 1
  %432 = zext i8 %431 to i64
  %433 = sub nsw i64 0, %432
  %434 = getelementptr inbounds i8, i8* %371, i64 %433
  %435 = load i8, i8* %434, align 1
  %436 = zext i8 %435 to i32
  %437 = shl nuw nsw i32 %436, 1
  %438 = getelementptr inbounds i8, i8* %423, i64 %34
  %439 = getelementptr inbounds i8, i8* %438, i64 1
  %440 = load i8, i8* %438, align 1
  %441 = zext i8 %440 to i64
  %442 = sub nsw i64 0, %441
  %443 = getelementptr inbounds i8, i8* %371, i64 %442
  %444 = load i8, i8* %443, align 1
  %445 = zext i8 %444 to i32
  %446 = getelementptr inbounds i8, i8* %439, i64 1
  %447 = load i8, i8* %439, align 1
  %448 = zext i8 %447 to i64
  %449 = sub nsw i64 0, %448
  %450 = getelementptr inbounds i8, i8* %371, i64 %449
  %451 = load i8, i8* %450, align 1
  %452 = zext i8 %451 to i32
  %453 = shl nuw nsw i32 %452, 1
  %454 = getelementptr inbounds i8, i8* %446, i64 1
  %455 = load i8, i8* %446, align 1
  %456 = zext i8 %455 to i64
  %457 = sub nsw i64 0, %456
  %458 = getelementptr inbounds i8, i8* %371, i64 %457
  %459 = load i8, i8* %458, align 1
  %460 = zext i8 %459 to i32
  %461 = getelementptr inbounds i8, i8* %454, i64 1
  %462 = load i8, i8* %454, align 1
  %463 = zext i8 %462 to i64
  %464 = sub nsw i64 0, %463
  %465 = getelementptr inbounds i8, i8* %371, i64 %464
  %466 = load i8, i8* %465, align 1
  %467 = zext i8 %466 to i32
  %468 = getelementptr inbounds i8, i8* %461, i64 1
  %469 = load i8, i8* %461, align 1
  %470 = zext i8 %469 to i64
  %471 = sub nsw i64 0, %470
  %472 = getelementptr inbounds i8, i8* %371, i64 %471
  %473 = load i8, i8* %472, align 1
  %474 = zext i8 %473 to i32
  %475 = getelementptr inbounds i8, i8* %468, i64 1
  %476 = load i8, i8* %468, align 1
  %477 = zext i8 %476 to i64
  %478 = sub nsw i64 0, %477
  %479 = getelementptr inbounds i8, i8* %371, i64 %478
  %480 = load i8, i8* %479, align 1
  %481 = zext i8 %480 to i32
  %482 = load i8, i8* %475, align 1
  %483 = zext i8 %482 to i64
  %484 = sub nsw i64 0, %483
  %485 = getelementptr inbounds i8, i8* %371, i64 %484
  %486 = load i8, i8* %485, align 1
  %487 = zext i8 %486 to i32
  %488 = getelementptr inbounds i8, i8* %475, i64 %36
  %489 = getelementptr inbounds i8, i8* %488, i64 1
  %490 = load i8, i8* %488, align 1
  %491 = zext i8 %490 to i64
  %492 = sub nsw i64 0, %491
  %493 = getelementptr inbounds i8, i8* %371, i64 %492
  %494 = load i8, i8* %493, align 1
  %495 = zext i8 %494 to i32
  %496 = getelementptr inbounds i8, i8* %489, i64 1
  %497 = load i8, i8* %489, align 1
  %498 = zext i8 %497 to i64
  %499 = sub nsw i64 0, %498
  %500 = getelementptr inbounds i8, i8* %371, i64 %499
  %501 = load i8, i8* %500, align 1
  %502 = zext i8 %501 to i32
  %503 = shl nuw nsw i32 %502, 1
  %504 = load i8, i8* %496, align 1
  %505 = zext i8 %504 to i64
  %506 = sub nsw i64 0, %505
  %507 = getelementptr inbounds i8, i8* %371, i64 %506
  %508 = load i8, i8* %507, align 1
  %509 = zext i8 %508 to i32
  %510 = getelementptr inbounds i8, i8* %496, i64 2
  %511 = getelementptr inbounds i8, i8* %510, i64 1
  %512 = load i8, i8* %510, align 1
  %513 = zext i8 %512 to i64
  %514 = sub nsw i64 0, %513
  %515 = getelementptr inbounds i8, i8* %371, i64 %514
  %516 = load i8, i8* %515, align 1
  %517 = zext i8 %516 to i32
  %518 = getelementptr inbounds i8, i8* %511, i64 1
  %519 = load i8, i8* %511, align 1
  %520 = zext i8 %519 to i64
  %521 = sub nsw i64 0, %520
  %522 = getelementptr inbounds i8, i8* %371, i64 %521
  %523 = load i8, i8* %522, align 1
  %524 = zext i8 %523 to i32
  %525 = load i8, i8* %518, align 1
  %526 = zext i8 %525 to i64
  %527 = sub nsw i64 0, %526
  %528 = getelementptr inbounds i8, i8* %371, i64 %527
  %529 = load i8, i8* %528, align 1
  %530 = zext i8 %529 to i32
  %531 = getelementptr inbounds i8, i8* %518, i64 %36
  %532 = getelementptr inbounds i8, i8* %531, i64 1
  %533 = load i8, i8* %531, align 1
  %534 = zext i8 %533 to i64
  %535 = sub nsw i64 0, %534
  %536 = getelementptr inbounds i8, i8* %371, i64 %535
  %537 = load i8, i8* %536, align 1
  %538 = zext i8 %537 to i32
  %539 = getelementptr inbounds i8, i8* %532, i64 1
  %540 = load i8, i8* %532, align 1
  %541 = zext i8 %540 to i64
  %542 = sub nsw i64 0, %541
  %543 = getelementptr inbounds i8, i8* %371, i64 %542
  %544 = load i8, i8* %543, align 1
  %545 = zext i8 %544 to i32
  %546 = shl nuw nsw i32 %545, 1
  %547 = getelementptr inbounds i8, i8* %539, i64 1
  %548 = load i8, i8* %539, align 1
  %549 = zext i8 %548 to i64
  %550 = sub nsw i64 0, %549
  %551 = getelementptr inbounds i8, i8* %371, i64 %550
  %552 = load i8, i8* %551, align 1
  %553 = zext i8 %552 to i32
  %554 = getelementptr inbounds i8, i8* %547, i64 1
  %555 = load i8, i8* %547, align 1
  %556 = zext i8 %555 to i64
  %557 = sub nsw i64 0, %556
  %558 = getelementptr inbounds i8, i8* %371, i64 %557
  %559 = load i8, i8* %558, align 1
  %560 = zext i8 %559 to i32
  %561 = getelementptr inbounds i8, i8* %554, i64 1
  %562 = load i8, i8* %554, align 1
  %563 = zext i8 %562 to i64
  %564 = sub nsw i64 0, %563
  %565 = getelementptr inbounds i8, i8* %371, i64 %564
  %566 = load i8, i8* %565, align 1
  %567 = zext i8 %566 to i32
  %568 = getelementptr inbounds i8, i8* %561, i64 1
  %569 = load i8, i8* %561, align 1
  %570 = zext i8 %569 to i64
  %571 = sub nsw i64 0, %570
  %572 = getelementptr inbounds i8, i8* %371, i64 %571
  %573 = load i8, i8* %572, align 1
  %574 = zext i8 %573 to i32
  %575 = load i8, i8* %568, align 1
  %576 = zext i8 %575 to i64
  %577 = sub nsw i64 0, %576
  %578 = getelementptr inbounds i8, i8* %371, i64 %577
  %579 = load i8, i8* %578, align 1
  %580 = zext i8 %579 to i32
  %581 = getelementptr inbounds i8, i8* %568, i64 %34
  %582 = getelementptr inbounds i8, i8* %581, i64 1
  %583 = load i8, i8* %581, align 1
  %584 = zext i8 %583 to i64
  %585 = sub nsw i64 0, %584
  %586 = getelementptr inbounds i8, i8* %371, i64 %585
  %587 = load i8, i8* %586, align 1
  %588 = zext i8 %587 to i32
  %589 = shl nuw nsw i32 %588, 1
  %590 = getelementptr inbounds i8, i8* %582, i64 1
  %591 = load i8, i8* %582, align 1
  %592 = zext i8 %591 to i64
  %593 = sub nsw i64 0, %592
  %594 = getelementptr inbounds i8, i8* %371, i64 %593
  %595 = load i8, i8* %594, align 1
  %596 = zext i8 %595 to i32
  %597 = getelementptr inbounds i8, i8* %590, i64 1
  %598 = load i8, i8* %590, align 1
  %599 = zext i8 %598 to i64
  %600 = sub nsw i64 0, %599
  %601 = getelementptr inbounds i8, i8* %371, i64 %600
  %602 = load i8, i8* %601, align 1
  %603 = zext i8 %602 to i32
  %604 = getelementptr inbounds i8, i8* %597, i64 1
  %605 = load i8, i8* %597, align 1
  %606 = zext i8 %605 to i64
  %607 = sub nsw i64 0, %606
  %608 = getelementptr inbounds i8, i8* %371, i64 %607
  %609 = load i8, i8* %608, align 1
  %610 = zext i8 %609 to i32
  %611 = load i8, i8* %604, align 1
  %612 = zext i8 %611 to i64
  %613 = sub nsw i64 0, %612
  %614 = getelementptr inbounds i8, i8* %371, i64 %613
  %615 = load i8, i8* %614, align 1
  %616 = zext i8 %615 to i32
  %617 = shl nuw nsw i32 %616, 1
  %618 = getelementptr inbounds i8, i8* %604, i64 %32
  %619 = getelementptr inbounds i8, i8* %618, i64 1
  %620 = load i8, i8* %618, align 1
  %621 = zext i8 %620 to i64
  %622 = sub nsw i64 0, %621
  %623 = getelementptr inbounds i8, i8* %371, i64 %622
  %624 = load i8, i8* %623, align 1
  %625 = zext i8 %624 to i32
  %626 = getelementptr inbounds i8, i8* %619, i64 1
  %627 = load i8, i8* %619, align 1
  %628 = zext i8 %627 to i64
  %629 = sub nsw i64 0, %628
  %630 = getelementptr inbounds i8, i8* %371, i64 %629
  %631 = load i8, i8* %630, align 1
  %632 = zext i8 %631 to i32
  %633 = load i8, i8* %626, align 1
  %634 = zext i8 %633 to i64
  %635 = sub nsw i64 0, %634
  %636 = getelementptr inbounds i8, i8* %371, i64 %635
  %637 = load i8, i8* %636, align 1
  %638 = zext i8 %637 to i32
  %tmp = sub nsw i32 %487, %445
  %tmp50 = sub nsw i32 %tmp, %495
  %tmp51 = add nsw i32 %tmp50, %530
  %tmp52 = sub nsw i32 %tmp51, %538
  %tmp53 = add nsw i32 %tmp52, %580
  %tmp54 = mul nsw i32 %tmp53, 3
  %tmp55 = add nuw nsw i32 %524, %481
  %tmp56 = add nuw nsw i32 %tmp55, %574
  %tmp57 = shl nuw nsw i32 %tmp56, 1
  %639 = sub nsw i32 %396, %382
  %640 = sub nsw i32 %639, %406
  %641 = sub nsw i32 %640, %413
  %642 = add nsw i32 %641, %429
  %643 = add nsw i32 %642, %437
  %644 = sub nsw i32 %643, %453
  %645 = sub i32 %644, %460
  %646 = add i32 %645, %474
  %647 = sub i32 %646, %503
  %648 = sub i32 %647, %509
  %649 = add i32 %648, %517
  %650 = sub i32 %649, %546
  %651 = sub i32 %650, %553
  %652 = add i32 %651, %567
  %653 = add i32 %652, %tmp57
  %654 = sub i32 %653, %589
  %655 = sub i32 %654, %596
  %656 = add i32 %655, %tmp54
  %657 = add i32 %656, %610
  %658 = add i32 %657, %617
  %659 = sub i32 %658, %625
  %660 = add i32 %659, %638
  %tmp59 = sub nsw i32 %625, %397
  %tmp60 = add nsw i32 %tmp59, %632
  %tmp61 = add nsw i32 %tmp60, %638
  %tmp62 = mul nsw i32 %tmp61, 3
  %tmp63 = add nuw nsw i32 %603, %596
  %tmp64 = add nuw nsw i32 %tmp63, %610
  %tmp65 = shl nuw nsw i32 %tmp64, 1
  %sum = add nuw nsw i32 %414, %406
  %sum123 = add nuw nsw i32 %sum, %422
  %sum124 = add nuw nsw i32 %sum123, %430
  %sum125 = add nuw nsw i32 %sum124, %437
  %sum126 = add nuw nsw i32 %sum125, %445
  %sum127 = add i32 %sum126, %452
  %sum128 = add i32 %sum127, %460
  %sum129 = add i32 %sum128, %467
  %sum130 = add i32 %sum129, %474
  %sum131 = add i32 %sum130, %481
  %sum132 = add i32 %sum131, %487
  %661 = sub i32 %538, %sum132
  %662 = add i32 %661, %545
  %663 = add i32 %662, %553
  %664 = add i32 %663, %560
  %665 = add i32 %664, %567
  %666 = add i32 %665, %574
  %667 = add i32 %666, %580
  %668 = add i32 %667, %589
  %669 = add i32 %668, %617
  %670 = add i32 %669, %tmp65
  %671 = add i32 %670, %tmp62
  %672 = mul nsw i32 %660, %660
  %673 = mul nsw i32 %671, %671
  %674 = add nuw nsw i32 %673, %672
  %675 = sitofp i32 %674 to float
  %sqrtf = tail call float @sqrtf(float %675) #1
  %676 = fpext float %sqrtf to double
  %677 = sitofp i32 %367 to float
  %678 = fpext float %677 to double
  %679 = fmul double %678, 9.000000e-01
  %680 = fcmp ogt double %676, %679
  br i1 %680, label %681, label %733

; <label>:681:                                    ; preds = %373
  %682 = icmp eq i32 %660, 0
  %683 = sitofp i32 %671 to float
  %684 = sitofp i32 %660 to float
  %685 = fdiv float %683, %684
  %.24 = select i1 %682, float 1.000000e+06, float %685
  %686 = fcmp olt float %.24, 0.000000e+00
  %687 = fsub float -0.000000e+00, %.24
  %.13 = select i1 %686, float %687, float %.24
  %688 = fcmp olt float %.13, 5.000000e-01
  %689 = fcmp ogt float %.13, 2.000000e+00
  %. = select i1 %686, i32 -1, i32 1
  %.112 = select i1 %689, i32 1, i32 %.
  %not.26 = xor i1 %689, true
  %.213 = select i1 %688, i32 0, i32 %.112
  %narrow = or i1 %688, %not.26
  %.2 = zext i1 %narrow to i32
  %690 = add nsw i32 %.213, %353
  %691 = mul nsw i32 %690, %5
  %692 = trunc i64 %indvars.iv to i32
  %693 = add i32 %.2, %692
  %694 = add i32 %693, %691
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds i32, i32* %1, i64 %695
  %697 = load i32, i32* %696, align 4
  %698 = icmp sgt i32 %364, %697
  br i1 %698, label %699, label %.thread

; <label>:699:                                    ; preds = %681
  %700 = sub nsw i32 %354, %.213
  %701 = mul nsw i32 %700, %5
  %.2.neg = sext i1 %narrow to i32
  %702 = trunc i64 %indvars.iv to i32
  %703 = add i32 %.2.neg, %702
  %704 = add i32 %703, %701
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds i32, i32* %1, i64 %705
  %707 = load i32, i32* %706, align 4
  %708 = icmp slt i32 %364, %707
  br i1 %708, label %.thread, label %709

; <label>:709:                                    ; preds = %699
  %710 = shl nsw i32 %.213, 1
  %711 = add nsw i32 %710, %355
  %712 = mul nsw i32 %711, %5
  %713 = shl nuw nsw i32 %.2, 1
  %714 = trunc i64 %indvars.iv to i32
  %715 = add i32 %713, %714
  %716 = add i32 %715, %712
  %717 = sext i32 %716 to i64
  %718 = getelementptr inbounds i32, i32* %1, i64 %717
  %719 = load i32, i32* %718, align 4
  %720 = icmp sgt i32 %364, %719
  br i1 %720, label %721, label %.thread

; <label>:721:                                    ; preds = %709
  %722 = sub nsw i32 %356, %710
  %723 = mul nsw i32 %722, %5
  %724 = trunc i64 %indvars.iv to i32
  %725 = sub i32 %724, %713
  %726 = add i32 %725, %723
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds i32, i32* %1, i64 %727
  %729 = load i32, i32* %728, align 4
  %730 = icmp slt i32 %364, %729
  br i1 %730, label %.thread, label %731

; <label>:731:                                    ; preds = %721
  %732 = getelementptr inbounds i8, i8* %2, i64 %362
  store i8 1, i8* %732, align 1
  br label %.thread

; <label>:733:                                    ; preds = %373, %366
  %734 = getelementptr inbounds i8, i8* %352, i64 %indvars.iv
  %735 = getelementptr inbounds i8, i8* %734, i64 -1
  %736 = getelementptr inbounds i8, i8* %735, i64 1
  %737 = load i8, i8* %735, align 1
  %738 = zext i8 %737 to i64
  %739 = sub nsw i64 0, %738
  %740 = getelementptr inbounds i8, i8* %371, i64 %739
  %741 = load i8, i8* %740, align 1
  %742 = zext i8 %741 to i32
  %743 = getelementptr inbounds i8, i8* %736, i64 1
  %744 = load i8, i8* %736, align 1
  %745 = zext i8 %744 to i64
  %746 = sub nsw i64 0, %745
  %747 = getelementptr inbounds i8, i8* %371, i64 %746
  %748 = load i8, i8* %747, align 1
  %749 = zext i8 %748 to i32
  %750 = load i8, i8* %743, align 1
  %751 = zext i8 %750 to i64
  %752 = sub nsw i64 0, %751
  %753 = getelementptr inbounds i8, i8* %371, i64 %752
  %754 = load i8, i8* %753, align 1
  %755 = zext i8 %754 to i32
  %756 = getelementptr inbounds i8, i8* %743, i64 %38
  %757 = getelementptr inbounds i8, i8* %756, i64 1
  %758 = load i8, i8* %756, align 1
  %759 = zext i8 %758 to i64
  %760 = sub nsw i64 0, %759
  %761 = getelementptr inbounds i8, i8* %371, i64 %760
  %762 = load i8, i8* %761, align 1
  %763 = zext i8 %762 to i32
  %764 = shl nuw nsw i32 %763, 2
  %765 = getelementptr inbounds i8, i8* %757, i64 1
  %766 = load i8, i8* %757, align 1
  %767 = zext i8 %766 to i64
  %768 = sub nsw i64 0, %767
  %769 = getelementptr inbounds i8, i8* %371, i64 %768
  %770 = load i8, i8* %769, align 1
  %771 = zext i8 %770 to i32
  %772 = getelementptr inbounds i8, i8* %765, i64 1
  %773 = load i8, i8* %765, align 1
  %774 = zext i8 %773 to i64
  %775 = sub nsw i64 0, %774
  %776 = getelementptr inbounds i8, i8* %371, i64 %775
  %777 = load i8, i8* %776, align 1
  %778 = zext i8 %777 to i32
  %779 = getelementptr inbounds i8, i8* %772, i64 1
  %780 = load i8, i8* %772, align 1
  %781 = zext i8 %780 to i64
  %782 = sub nsw i64 0, %781
  %783 = getelementptr inbounds i8, i8* %371, i64 %782
  %784 = load i8, i8* %783, align 1
  %785 = zext i8 %784 to i32
  %786 = load i8, i8* %779, align 1
  %787 = zext i8 %786 to i64
  %788 = sub nsw i64 0, %787
  %789 = getelementptr inbounds i8, i8* %371, i64 %788
  %790 = load i8, i8* %789, align 1
  %791 = zext i8 %790 to i32
  %792 = shl nuw nsw i32 %791, 2
  %793 = getelementptr inbounds i8, i8* %779, i64 %40
  %794 = getelementptr inbounds i8, i8* %793, i64 1
  %795 = load i8, i8* %793, align 1
  %796 = zext i8 %795 to i64
  %797 = sub nsw i64 0, %796
  %798 = getelementptr inbounds i8, i8* %371, i64 %797
  %799 = load i8, i8* %798, align 1
  %800 = zext i8 %799 to i32
  %801 = getelementptr inbounds i8, i8* %794, i64 1
  %802 = load i8, i8* %794, align 1
  %803 = zext i8 %802 to i64
  %804 = sub nsw i64 0, %803
  %805 = getelementptr inbounds i8, i8* %371, i64 %804
  %806 = load i8, i8* %805, align 1
  %807 = zext i8 %806 to i32
  %808 = getelementptr inbounds i8, i8* %801, i64 1
  %809 = load i8, i8* %801, align 1
  %810 = zext i8 %809 to i64
  %811 = sub nsw i64 0, %810
  %812 = getelementptr inbounds i8, i8* %371, i64 %811
  %813 = load i8, i8* %812, align 1
  %814 = zext i8 %813 to i32
  %815 = getelementptr inbounds i8, i8* %808, i64 1
  %816 = load i8, i8* %808, align 1
  %817 = zext i8 %816 to i64
  %818 = sub nsw i64 0, %817
  %819 = getelementptr inbounds i8, i8* %371, i64 %818
  %820 = load i8, i8* %819, align 1
  %821 = zext i8 %820 to i32
  %822 = getelementptr inbounds i8, i8* %815, i64 1
  %823 = load i8, i8* %815, align 1
  %824 = zext i8 %823 to i64
  %825 = sub nsw i64 0, %824
  %826 = getelementptr inbounds i8, i8* %371, i64 %825
  %827 = load i8, i8* %826, align 1
  %828 = zext i8 %827 to i32
  %829 = getelementptr inbounds i8, i8* %822, i64 1
  %830 = load i8, i8* %822, align 1
  %831 = zext i8 %830 to i64
  %832 = sub nsw i64 0, %831
  %833 = getelementptr inbounds i8, i8* %371, i64 %832
  %834 = load i8, i8* %833, align 1
  %835 = zext i8 %834 to i32
  %836 = load i8, i8* %829, align 1
  %837 = zext i8 %836 to i64
  %838 = sub nsw i64 0, %837
  %839 = getelementptr inbounds i8, i8* %371, i64 %838
  %840 = load i8, i8* %839, align 1
  %841 = zext i8 %840 to i32
  %842 = getelementptr inbounds i8, i8* %829, i64 %42
  %843 = getelementptr inbounds i8, i8* %842, i64 1
  %844 = getelementptr inbounds i8, i8* %843, i64 1
  %845 = getelementptr inbounds i8, i8* %844, i64 2
  %846 = getelementptr inbounds i8, i8* %845, i64 1
  %847 = getelementptr inbounds i8, i8* %846, i64 1
  %848 = getelementptr inbounds i8, i8* %847, i64 %42
  %849 = getelementptr inbounds i8, i8* %848, i64 1
  %850 = load i8, i8* %848, align 1
  %851 = zext i8 %850 to i64
  %852 = sub nsw i64 0, %851
  %853 = getelementptr inbounds i8, i8* %371, i64 %852
  %854 = load i8, i8* %853, align 1
  %855 = zext i8 %854 to i32
  %856 = getelementptr inbounds i8, i8* %849, i64 1
  %857 = load i8, i8* %849, align 1
  %858 = zext i8 %857 to i64
  %859 = sub nsw i64 0, %858
  %860 = getelementptr inbounds i8, i8* %371, i64 %859
  %861 = load i8, i8* %860, align 1
  %862 = zext i8 %861 to i32
  %863 = getelementptr inbounds i8, i8* %856, i64 1
  %864 = load i8, i8* %856, align 1
  %865 = zext i8 %864 to i64
  %866 = sub nsw i64 0, %865
  %867 = getelementptr inbounds i8, i8* %371, i64 %866
  %868 = load i8, i8* %867, align 1
  %869 = zext i8 %868 to i32
  %870 = getelementptr inbounds i8, i8* %863, i64 1
  %871 = load i8, i8* %863, align 1
  %872 = zext i8 %871 to i64
  %873 = sub nsw i64 0, %872
  %874 = getelementptr inbounds i8, i8* %371, i64 %873
  %875 = load i8, i8* %874, align 1
  %876 = zext i8 %875 to i32
  %877 = getelementptr inbounds i8, i8* %870, i64 1
  %878 = load i8, i8* %870, align 1
  %879 = zext i8 %878 to i64
  %880 = sub nsw i64 0, %879
  %881 = getelementptr inbounds i8, i8* %371, i64 %880
  %882 = load i8, i8* %881, align 1
  %883 = zext i8 %882 to i32
  %884 = getelementptr inbounds i8, i8* %877, i64 1
  %885 = load i8, i8* %877, align 1
  %886 = zext i8 %885 to i64
  %887 = sub nsw i64 0, %886
  %888 = getelementptr inbounds i8, i8* %371, i64 %887
  %889 = load i8, i8* %888, align 1
  %890 = zext i8 %889 to i32
  %891 = load i8, i8* %884, align 1
  %892 = zext i8 %891 to i64
  %893 = sub nsw i64 0, %892
  %894 = getelementptr inbounds i8, i8* %371, i64 %893
  %895 = load i8, i8* %894, align 1
  %896 = zext i8 %895 to i32
  %897 = getelementptr inbounds i8, i8* %884, i64 %40
  %898 = getelementptr inbounds i8, i8* %897, i64 1
  %899 = load i8, i8* %897, align 1
  %900 = zext i8 %899 to i64
  %901 = sub nsw i64 0, %900
  %902 = getelementptr inbounds i8, i8* %371, i64 %901
  %903 = load i8, i8* %902, align 1
  %904 = zext i8 %903 to i32
  %905 = shl nuw nsw i32 %904, 2
  %906 = getelementptr inbounds i8, i8* %898, i64 1
  %907 = load i8, i8* %898, align 1
  %908 = zext i8 %907 to i64
  %909 = sub nsw i64 0, %908
  %910 = getelementptr inbounds i8, i8* %371, i64 %909
  %911 = load i8, i8* %910, align 1
  %912 = zext i8 %911 to i32
  %913 = getelementptr inbounds i8, i8* %906, i64 1
  %914 = load i8, i8* %906, align 1
  %915 = zext i8 %914 to i64
  %916 = sub nsw i64 0, %915
  %917 = getelementptr inbounds i8, i8* %371, i64 %916
  %918 = load i8, i8* %917, align 1
  %919 = zext i8 %918 to i32
  %920 = getelementptr inbounds i8, i8* %913, i64 1
  %921 = load i8, i8* %913, align 1
  %922 = zext i8 %921 to i64
  %923 = sub nsw i64 0, %922
  %924 = getelementptr inbounds i8, i8* %371, i64 %923
  %925 = load i8, i8* %924, align 1
  %926 = zext i8 %925 to i32
  %927 = load i8, i8* %920, align 1
  %928 = zext i8 %927 to i64
  %929 = sub nsw i64 0, %928
  %930 = getelementptr inbounds i8, i8* %371, i64 %929
  %931 = load i8, i8* %930, align 1
  %932 = zext i8 %931 to i32
  %933 = shl nuw nsw i32 %932, 2
  %934 = getelementptr inbounds i8, i8* %920, i64 %38
  %935 = getelementptr inbounds i8, i8* %934, i64 1
  %936 = load i8, i8* %934, align 1
  %937 = zext i8 %936 to i64
  %938 = sub nsw i64 0, %937
  %939 = getelementptr inbounds i8, i8* %371, i64 %938
  %940 = load i8, i8* %939, align 1
  %941 = zext i8 %940 to i32
  %942 = getelementptr inbounds i8, i8* %935, i64 1
  %943 = load i8, i8* %935, align 1
  %944 = zext i8 %943 to i64
  %945 = sub nsw i64 0, %944
  %946 = getelementptr inbounds i8, i8* %371, i64 %945
  %947 = load i8, i8* %946, align 1
  %948 = zext i8 %947 to i32
  %949 = load i8, i8* %942, align 1
  %950 = zext i8 %949 to i64
  %951 = sub nsw i64 0, %950
  %952 = getelementptr inbounds i8, i8* %371, i64 %951
  %953 = load i8, i8* %952, align 1
  %954 = zext i8 %953 to i32
  %tmp66 = add nuw nsw i32 %778, %771
  %tmp67 = add nuw nsw i32 %tmp66, %785
  %tmp68 = add nuw nsw i32 %tmp67, %912
  %tmp69 = add nuw nsw i32 %tmp68, %919
  %tmp70 = add nuw nsw i32 %tmp69, %926
  %tmp71 = shl nuw nsw i32 %tmp70, 2
  %tmp72 = add nuw nsw i32 %749, %742
  %tmp73 = add nuw nsw i32 %tmp72, %755
  %955 = add nuw nsw i32 %tmp73, %941
  %956 = add nuw nsw i32 %955, %948
  %tmp74 = add nuw nsw i32 %956, %954
  %tmp75 = mul nuw nsw i32 %tmp74, 9
  %957 = add nuw nsw i32 %792, %764
  %958 = add nuw nsw i32 %957, %800
  %959 = add nuw nsw i32 %958, %807
  %960 = add nuw nsw i32 %959, %814
  %961 = add nuw nsw i32 %960, %821
  %962 = add i32 %961, %828
  %963 = add i32 %962, %835
  %964 = add i32 %963, %841
  %965 = add i32 %964, %855
  %966 = add i32 %965, %862
  %967 = add i32 %966, %869
  %968 = add i32 %967, %876
  %969 = add i32 %968, %883
  %970 = add i32 %969, %890
  %971 = add i32 %970, %896
  %972 = add i32 %971, %905
  %973 = add i32 %972, %933
  %974 = add i32 %973, %tmp71
  %975 = add i32 %974, %tmp75
  %976 = icmp eq i32 %975, 0
  br i1 %976, label %.thread18, label %977

; <label>:977:                                    ; preds = %733
  %978 = sub nsw i32 %742, %755
  %979 = shl nuw nsw i32 %785, 1
  %980 = shl nuw nsw i32 %835, 1
  %981 = shl nuw nsw i32 %862, 1
  %982 = shl nuw nsw i32 %912, 1
  %tmp87 = add nsw i32 %800, %978
  %tmp88 = sub nsw i32 %tmp87, %841
  %tmp89 = sub nsw i32 %tmp88, %855
  %tmp90 = add nsw i32 %tmp89, %896
  %tmp91 = sub nsw i32 %tmp90, %941
  %tmp92 = add i32 %tmp91, %954
  %tmp93 = mul i32 %tmp92, 3
  %tmp94 = add nuw nsw i32 %807, %771
  %tmp95 = add nuw nsw i32 %tmp94, %890
  %tmp96 = add nuw nsw i32 %tmp95, %926
  %tmp97 = shl nuw nsw i32 %tmp96, 1
  %983 = sub nsw i32 %764, %979
  %984 = sub nsw i32 %983, %792
  %985 = add nsw i32 %984, %814
  %986 = sub nsw i32 %985, %828
  %987 = sub nsw i32 %986, %980
  %988 = sub i32 %987, %981
  %989 = sub i32 %988, %869
  %990 = add i32 %989, %883
  %991 = sub i32 %990, %905
  %992 = sub i32 %991, %982
  %993 = add i32 %992, %933
  %994 = add i32 %993, %tmp97
  %995 = add i32 %994, %tmp93
  %996 = load i8, i8* %842, align 1
  %997 = zext i8 %996 to i64
  %998 = sub nsw i64 0, %997
  %999 = getelementptr inbounds i8, i8* %371, i64 %998
  %1000 = load i8, i8* %999, align 1
  %1001 = zext i8 %1000 to i32
  %1002 = load i8, i8* %843, align 1
  %1003 = zext i8 %1002 to i64
  %1004 = sub nsw i64 0, %1003
  %1005 = getelementptr inbounds i8, i8* %371, i64 %1004
  %1006 = load i8, i8* %1005, align 1
  %1007 = zext i8 %1006 to i32
  %1008 = load i8, i8* %844, align 1
  %1009 = zext i8 %1008 to i64
  %1010 = sub nsw i64 0, %1009
  %1011 = getelementptr inbounds i8, i8* %371, i64 %1010
  %1012 = load i8, i8* %1011, align 1
  %1013 = zext i8 %1012 to i32
  %1014 = load i8, i8* %845, align 1
  %1015 = zext i8 %1014 to i64
  %1016 = sub nsw i64 0, %1015
  %1017 = getelementptr inbounds i8, i8* %371, i64 %1016
  %1018 = load i8, i8* %1017, align 1
  %1019 = zext i8 %1018 to i32
  %1020 = load i8, i8* %846, align 1
  %1021 = zext i8 %1020 to i64
  %1022 = sub nsw i64 0, %1021
  %1023 = getelementptr inbounds i8, i8* %371, i64 %1022
  %1024 = load i8, i8* %1023, align 1
  %1025 = zext i8 %1024 to i32
  %1026 = load i8, i8* %847, align 1
  %1027 = zext i8 %1026 to i64
  %1028 = sub nsw i64 0, %1027
  %1029 = getelementptr inbounds i8, i8* %371, i64 %1028
  %1030 = load i8, i8* %1029, align 1
  %1031 = zext i8 %1030 to i32
  %tmp98 = add nuw nsw i32 %835, %807
  %tmp99 = add nuw nsw i32 %tmp98, %862
  %tmp100 = add nuw nsw i32 %tmp99, %890
  %tmp101 = add nuw nsw i32 %tmp100, %1007
  %tmp102 = add nuw nsw i32 %tmp101, %1025
  %tmp103 = shl nuw nsw i32 %tmp102, 2
  %tmp104 = add nuw nsw i32 %841, %800
  %tmp105 = add nuw nsw i32 %tmp104, %855
  %tmp106 = add nuw nsw i32 %tmp105, %896
  %tmp107 = add nuw nsw i32 %tmp106, %1001
  %tmp108 = add nuw nsw i32 %tmp107, %1031
  %tmp109 = mul nuw nsw i32 %tmp108, 9
  %1032 = add nuw nsw i32 %755, %742
  %1033 = add nuw nsw i32 %1032, %764
  %1034 = add nuw nsw i32 %1033, %771
  %1035 = add nuw nsw i32 %1034, %785
  %1036 = add nuw nsw i32 %1035, %792
  %1037 = add nuw nsw i32 %1036, %814
  %1038 = add i32 %1037, %828
  %1039 = add i32 %1038, %869
  %1040 = add i32 %1039, %883
  %1041 = add i32 %1040, %905
  %1042 = add i32 %1041, %912
  %1043 = add i32 %1042, %926
  %1044 = add i32 %1043, %933
  %1045 = add i32 %1044, %941
  %1046 = add i32 %1045, %954
  %1047 = add i32 %1046, %1013
  %1048 = add i32 %1047, %1019
  %1049 = add i32 %1048, %tmp103
  %1050 = add i32 %1049, %tmp109
  %1051 = sitofp i32 %1050 to float
  %1052 = sitofp i32 %975 to float
  %1053 = fdiv float %1051, %1052
  %1054 = fcmp olt float %1053, 5.000000e-01
  %1055 = fcmp ogt float %1053, 2.000000e+00
  %1056 = icmp sgt i32 %995, 0
  %.17 = select i1 %1056, i32 -1, i32 1
  %.415 = select i1 %1055, i32 1, i32 %.17
  %not. = xor i1 %1055, true
  %.4 = zext i1 %not. to i32
  br i1 %1054, label %1057, label %.thread18

.thread18:                                        ; preds = %977, %733
  %.423 = phi i32 [ %.4, %977 ], [ 0, %733 ]
  %.41522 = phi i32 [ %.415, %977 ], [ 1, %733 ]
  br label %1057

; <label>:1057:                                   ; preds = %.thread18, %977
  %.516 = phi i32 [ 0, %977 ], [ %.41522, %.thread18 ]
  %.5 = phi i32 [ 1, %977 ], [ %.423, %.thread18 ]
  %1058 = add nsw i32 %.516, %357
  %1059 = mul nsw i32 %1058, %5
  %1060 = trunc i64 %indvars.iv to i32
  %1061 = add i32 %.5, %1060
  %1062 = add i32 %1061, %1059
  %1063 = sext i32 %1062 to i64
  %1064 = getelementptr inbounds i32, i32* %1, i64 %1063
  %1065 = load i32, i32* %1064, align 4
  %1066 = icmp sgt i32 %364, %1065
  br i1 %1066, label %1067, label %.thread

; <label>:1067:                                   ; preds = %1057
  %1068 = sub nsw i32 %358, %.516
  %1069 = mul nsw i32 %1068, %5
  %1070 = trunc i64 %indvars.iv to i32
  %1071 = sub i32 %1070, %.5
  %1072 = add i32 %1071, %1069
  %1073 = sext i32 %1072 to i64
  %1074 = getelementptr inbounds i32, i32* %1, i64 %1073
  %1075 = load i32, i32* %1074, align 4
  %1076 = icmp slt i32 %364, %1075
  br i1 %1076, label %.thread, label %1077

; <label>:1077:                                   ; preds = %1067
  %1078 = shl nsw i32 %.516, 1
  %1079 = add nsw i32 %1078, %359
  %1080 = mul nsw i32 %1079, %5
  %1081 = shl nsw i32 %.5, 1
  %1082 = trunc i64 %indvars.iv to i32
  %1083 = add i32 %1081, %1082
  %1084 = add i32 %1083, %1080
  %1085 = sext i32 %1084 to i64
  %1086 = getelementptr inbounds i32, i32* %1, i64 %1085
  %1087 = load i32, i32* %1086, align 4
  %1088 = icmp sgt i32 %364, %1087
  br i1 %1088, label %1089, label %.thread

; <label>:1089:                                   ; preds = %1077
  %1090 = sub nsw i32 %360, %1078
  %1091 = mul nsw i32 %1090, %5
  %1092 = trunc i64 %indvars.iv to i32
  %1093 = sub i32 %1092, %1081
  %1094 = add i32 %1093, %1091
  %1095 = sext i32 %1094 to i64
  %1096 = getelementptr inbounds i32, i32* %1, i64 %1095
  %1097 = load i32, i32* %1096, align 4
  %1098 = icmp slt i32 %364, %1097
  br i1 %1098, label %.thread, label %1099

; <label>:1099:                                   ; preds = %1089
  %1100 = getelementptr inbounds i8, i8* %2, i64 %362
  store i8 2, i8* %1100, align 1
  br label %.thread

.thread:                                          ; preds = %1099, %1089, %1077, %1067, %1057, %731, %721, %709, %699, %681, %361
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %361

._crit_edge.loopexit:                             ; preds = %.thread
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  br i1 %exitcond136, label %._crit_edge118.loopexit, label %.preheader

._crit_edge118.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge118

._crit_edge118:                                   ; preds = %._crit_edge118.loopexit, %.preheader112
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @susan_edges_small(i8* nocapture readonly, i32* nocapture, i8* nocapture, i8* nocapture readonly, i32, i32, i32) local_unnamed_addr #3 {
  %8 = bitcast i32* %1 to i8*
  %9 = mul nsw i32 %6, %5
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  tail call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %11, i32 4, i1 false)
  %12 = add nsw i32 %6, -1
  %13 = icmp sgt i32 %12, 1
  br i1 %13, label %.preheader34.lr.ph, label %.preheader33

.preheader34.lr.ph:                               ; preds = %7
  %14 = add nsw i32 %5, -1
  %15 = icmp sgt i32 %14, 1
  %16 = add nsw i32 %5, -2
  %17 = sext i32 %16 to i64
  br i1 %15, label %.preheader34.us.preheader, label %.preheader33

.preheader34.us.preheader:                        ; preds = %.preheader34.lr.ph
  %18 = sext i32 %5 to i64
  %19 = sext i32 %5 to i64
  %wide.trip.count52 = zext i32 %14 to i64
  %wide.trip.count56 = zext i32 %12 to i64
  br label %.preheader34.us

.preheader34.us:                                  ; preds = %._crit_edge42.us, %.preheader34.us.preheader
  %indvars.iv54 = phi i64 [ 1, %.preheader34.us.preheader ], [ %indvars.iv.next55, %._crit_edge42.us ]
  %20 = add nsw i64 %indvars.iv54, -1
  %21 = mul nsw i64 %20, %18
  %22 = getelementptr inbounds i8, i8* %0, i64 %21
  %23 = mul nsw i64 %indvars.iv54, %19
  br label %24

; <label>:24:                                     ; preds = %99, %.preheader34.us
  %indvars.iv50 = phi i64 [ 1, %.preheader34.us ], [ %indvars.iv.next51, %99 ]
  %25 = getelementptr inbounds i8, i8* %22, i64 %indvars.iv50
  %26 = getelementptr inbounds i8, i8* %25, i64 -1
  %27 = add nsw i64 %indvars.iv50, %23
  %28 = getelementptr inbounds i8, i8* %0, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i64
  %31 = getelementptr inbounds i8, i8* %3, i64 %30
  %32 = getelementptr inbounds i8, i8* %26, i64 1
  %33 = load i8, i8* %26, align 1
  %34 = zext i8 %33 to i64
  %35 = sub nsw i64 0, %34
  %36 = getelementptr inbounds i8, i8* %31, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = add nuw nsw i32 %38, 100
  %40 = getelementptr inbounds i8, i8* %32, i64 1
  %41 = load i8, i8* %32, align 1
  %42 = zext i8 %41 to i64
  %43 = sub nsw i64 0, %42
  %44 = getelementptr inbounds i8, i8* %31, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %39, %46
  %48 = load i8, i8* %40, align 1
  %49 = zext i8 %48 to i64
  %50 = sub nsw i64 0, %49
  %51 = getelementptr inbounds i8, i8* %31, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = add nuw nsw i32 %47, %53
  %55 = getelementptr inbounds i8, i8* %40, i64 %17
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i64
  %58 = sub nsw i64 0, %57
  %59 = getelementptr inbounds i8, i8* %31, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = add nuw nsw i32 %54, %61
  %63 = getelementptr inbounds i8, i8* %55, i64 2
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i64
  %66 = sub nsw i64 0, %65
  %67 = getelementptr inbounds i8, i8* %31, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = add nuw nsw i32 %62, %69
  %71 = getelementptr inbounds i8, i8* %63, i64 %17
  %72 = getelementptr inbounds i8, i8* %71, i64 1
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i64
  %75 = sub nsw i64 0, %74
  %76 = getelementptr inbounds i8, i8* %31, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = add nuw nsw i32 %70, %78
  %80 = getelementptr inbounds i8, i8* %72, i64 1
  %81 = load i8, i8* %72, align 1
  %82 = zext i8 %81 to i64
  %83 = sub nsw i64 0, %82
  %84 = getelementptr inbounds i8, i8* %31, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = add nsw i32 %79, %86
  %88 = load i8, i8* %80, align 1
  %89 = zext i8 %88 to i64
  %90 = sub nsw i64 0, %89
  %91 = getelementptr inbounds i8, i8* %31, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = add nsw i32 %87, %93
  %95 = icmp slt i32 %94, 731
  br i1 %95, label %96, label %99

; <label>:96:                                     ; preds = %24
  %97 = getelementptr inbounds i32, i32* %1, i64 %27
  %98 = sub nsw i32 730, %94
  store i32 %98, i32* %97, align 4
  br label %99

; <label>:99:                                     ; preds = %96, %24
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge42.us, label %24

._crit_edge42.us:                                 ; preds = %99
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %.preheader33.loopexit, label %.preheader34.us

.preheader33.loopexit:                            ; preds = %._crit_edge42.us
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.loopexit, %.preheader34.lr.ph, %7
  %100 = add nsw i32 %6, -2
  %101 = icmp sgt i32 %100, 2
  br i1 %101, label %.preheader.lr.ph, label %._crit_edge39

.preheader.lr.ph:                                 ; preds = %.preheader33
  %102 = add nsw i32 %5, -2
  %103 = icmp sgt i32 %102, 2
  %104 = sext i32 %102 to i64
  %105 = sext i32 %102 to i64
  %106 = sext i32 %5 to i64
  %107 = sext i32 %5 to i64
  %108 = sext i32 %5 to i64
  %wide.trip.count = zext i32 %102 to i64
  %wide.trip.count48 = zext i32 %100 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv46 = phi i64 [ 2, %.preheader.lr.ph ], [ %indvars.iv.next47, %._crit_edge ]
  br i1 %103, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %109 = mul nsw i64 %indvars.iv46, %106
  %110 = add nsw i64 %indvars.iv46, -1
  %111 = mul nsw i64 %110, %107
  %112 = getelementptr inbounds i8, i8* %0, i64 %111
  %113 = add nsw i64 %indvars.iv46, -1
  %114 = mul nsw i64 %113, %108
  %115 = getelementptr inbounds i8, i8* %0, i64 %114
  %116 = trunc i64 %indvars.iv46 to i32
  %117 = trunc i64 %indvars.iv46 to i32
  %118 = trunc i64 %indvars.iv46 to i32
  %119 = trunc i64 %indvars.iv46 to i32
  br label %120

; <label>:120:                                    ; preds = %.thread, %.lr.ph
  %indvars.iv = phi i64 [ 2, %.lr.ph ], [ %indvars.iv.next, %.thread ]
  %121 = add nsw i64 %indvars.iv, %109
  %122 = getelementptr inbounds i32, i32* %1, i64 %121
  %123 = load i32, i32* %122, align 4
  %124 = icmp sgt i32 %123, 0
  br i1 %124, label %125, label %.thread

; <label>:125:                                    ; preds = %120
  %126 = sub nsw i32 730, %123
  %127 = getelementptr inbounds i8, i8* %0, i64 %121
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i64
  %130 = getelementptr inbounds i8, i8* %3, i64 %129
  %131 = icmp sgt i32 %126, 250
  br i1 %131, label %132, label %237

; <label>:132:                                    ; preds = %125
  %133 = getelementptr inbounds i8, i8* %112, i64 %indvars.iv
  %134 = getelementptr inbounds i8, i8* %133, i64 -1
  %135 = getelementptr inbounds i8, i8* %134, i64 1
  %136 = load i8, i8* %134, align 1
  %137 = zext i8 %136 to i64
  %138 = sub nsw i64 0, %137
  %139 = getelementptr inbounds i8, i8* %130, i64 %138
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = getelementptr inbounds i8, i8* %135, i64 1
  %143 = load i8, i8* %135, align 1
  %144 = zext i8 %143 to i64
  %145 = sub nsw i64 0, %144
  %146 = getelementptr inbounds i8, i8* %130, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %sum = add nuw nsw i32 %148, %141
  %149 = load i8, i8* %142, align 1
  %150 = zext i8 %149 to i64
  %151 = sub nsw i64 0, %150
  %152 = getelementptr inbounds i8, i8* %130, i64 %151
  %153 = load i8, i8* %152, align 1
  %154 = zext i8 %153 to i32
  %155 = sub nsw i32 %154, %141
  %sum44 = add nuw nsw i32 %sum, %154
  %156 = getelementptr inbounds i8, i8* %142, i64 %104
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i64
  %159 = sub nsw i64 0, %158
  %160 = getelementptr inbounds i8, i8* %130, i64 %159
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = sub nsw i32 %155, %162
  %164 = getelementptr inbounds i8, i8* %156, i64 2
  %165 = load i8, i8* %164, align 1
  %166 = zext i8 %165 to i64
  %167 = sub nsw i64 0, %166
  %168 = getelementptr inbounds i8, i8* %130, i64 %167
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = add nsw i32 %163, %170
  %172 = getelementptr inbounds i8, i8* %164, i64 %104
  %173 = getelementptr inbounds i8, i8* %172, i64 1
  %174 = load i8, i8* %172, align 1
  %175 = zext i8 %174 to i64
  %176 = sub nsw i64 0, %175
  %177 = getelementptr inbounds i8, i8* %130, i64 %176
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = sub nsw i32 %171, %179
  %181 = sub nsw i32 %179, %sum44
  %182 = getelementptr inbounds i8, i8* %173, i64 1
  %183 = load i8, i8* %173, align 1
  %184 = zext i8 %183 to i64
  %185 = sub nsw i64 0, %184
  %186 = getelementptr inbounds i8, i8* %130, i64 %185
  %187 = load i8, i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = add nsw i32 %181, %188
  %190 = load i8, i8* %182, align 1
  %191 = zext i8 %190 to i64
  %192 = sub nsw i64 0, %191
  %193 = getelementptr inbounds i8, i8* %130, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = add nsw i32 %180, %195
  %197 = add nsw i32 %189, %195
  %198 = mul nsw i32 %196, %196
  %199 = mul nsw i32 %197, %197
  %200 = add nuw nsw i32 %198, %199
  %201 = sitofp i32 %200 to float
  %sqrtf = tail call float @sqrtf(float %201) #1
  %202 = fpext float %sqrtf to double
  %203 = sitofp i32 %126 to float
  %204 = fpext float %203 to double
  %205 = fmul double %204, 4.000000e-01
  %206 = fcmp ogt double %202, %205
  br i1 %206, label %207, label %237

; <label>:207:                                    ; preds = %132
  %208 = icmp eq i32 %196, 0
  %209 = sitofp i32 %197 to float
  %210 = sitofp i32 %196 to float
  %211 = fdiv float %209, %210
  %.25 = select i1 %208, float 1.000000e+06, float %211
  %212 = fcmp olt float %.25, 0.000000e+00
  %213 = fsub float -0.000000e+00, %.25
  %.1 = select i1 %212, float %213, float %.25
  %214 = fcmp olt float %.1, 5.000000e-01
  %215 = fcmp ogt float %.1, 2.000000e+00
  %. = select i1 %212, i32 -1, i32 1
  %.112 = select i1 %215, i32 1, i32 %.
  %not.27 = xor i1 %215, true
  %.213 = select i1 %214, i32 0, i32 %.112
  %narrow = or i1 %214, %not.27
  %.210 = zext i1 %narrow to i32
  %216 = add nsw i32 %.213, %116
  %217 = mul nsw i32 %216, %5
  %218 = trunc i64 %indvars.iv to i32
  %219 = add i32 %.210, %218
  %220 = add i32 %219, %217
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32* %1, i64 %221
  %223 = load i32, i32* %222, align 4
  %224 = icmp sgt i32 %123, %223
  br i1 %224, label %225, label %.thread

; <label>:225:                                    ; preds = %207
  %226 = sub nsw i32 %117, %.213
  %227 = mul nsw i32 %226, %5
  %.210.neg = sext i1 %narrow to i32
  %228 = trunc i64 %indvars.iv to i32
  %229 = add i32 %.210.neg, %228
  %230 = add i32 %229, %227
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i32, i32* %1, i64 %231
  %233 = load i32, i32* %232, align 4
  %234 = icmp slt i32 %123, %233
  br i1 %234, label %.thread, label %235

; <label>:235:                                    ; preds = %225
  %236 = getelementptr inbounds i8, i8* %2, i64 %121
  store i8 1, i8* %236, align 1
  br label %.thread

; <label>:237:                                    ; preds = %132, %125
  %238 = getelementptr inbounds i8, i8* %115, i64 %indvars.iv
  %239 = getelementptr inbounds i8, i8* %238, i64 -1
  %240 = getelementptr inbounds i8, i8* %239, i64 1
  %241 = load i8, i8* %239, align 1
  %242 = zext i8 %241 to i64
  %243 = sub nsw i64 0, %242
  %244 = getelementptr inbounds i8, i8* %130, i64 %243
  %245 = load i8, i8* %244, align 1
  %246 = zext i8 %245 to i32
  %247 = getelementptr inbounds i8, i8* %240, i64 1
  %248 = load i8, i8* %240, align 1
  %249 = zext i8 %248 to i64
  %250 = sub nsw i64 0, %249
  %251 = getelementptr inbounds i8, i8* %130, i64 %250
  %252 = load i8, i8* %251, align 1
  %253 = zext i8 %252 to i32
  %254 = add nuw nsw i32 %253, %246
  %255 = load i8, i8* %247, align 1
  %256 = zext i8 %255 to i64
  %257 = sub nsw i64 0, %256
  %258 = getelementptr inbounds i8, i8* %130, i64 %257
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = add nuw nsw i32 %254, %260
  %262 = getelementptr inbounds i8, i8* %247, i64 %105
  %263 = getelementptr inbounds i8, i8* %262, i64 2
  %264 = getelementptr inbounds i8, i8* %263, i64 %105
  %265 = getelementptr inbounds i8, i8* %264, i64 1
  %266 = load i8, i8* %264, align 1
  %267 = zext i8 %266 to i64
  %268 = sub nsw i64 0, %267
  %269 = getelementptr inbounds i8, i8* %130, i64 %268
  %270 = load i8, i8* %269, align 1
  %271 = zext i8 %270 to i32
  %272 = add nuw nsw i32 %261, %271
  %273 = getelementptr inbounds i8, i8* %265, i64 1
  %274 = load i8, i8* %265, align 1
  %275 = zext i8 %274 to i64
  %276 = sub nsw i64 0, %275
  %277 = getelementptr inbounds i8, i8* %130, i64 %276
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = add nuw nsw i32 %272, %279
  %281 = load i8, i8* %273, align 1
  %282 = zext i8 %281 to i64
  %283 = sub nsw i64 0, %282
  %284 = getelementptr inbounds i8, i8* %130, i64 %283
  %285 = load i8, i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = add nuw nsw i32 %280, %286
  %288 = icmp eq i32 %287, 0
  br i1 %288, label %.thread19, label %289

; <label>:289:                                    ; preds = %237
  %290 = sub nsw i32 %246, %260
  %291 = sub nsw i32 %290, %271
  %292 = add nsw i32 %291, %286
  %293 = add nuw nsw i32 %260, %246
  %294 = load i8, i8* %262, align 1
  %295 = zext i8 %294 to i64
  %296 = sub nsw i64 0, %295
  %297 = getelementptr inbounds i8, i8* %130, i64 %296
  %298 = load i8, i8* %297, align 1
  %299 = zext i8 %298 to i32
  %300 = load i8, i8* %263, align 1
  %301 = zext i8 %300 to i64
  %302 = sub nsw i64 0, %301
  %303 = getelementptr inbounds i8, i8* %130, i64 %302
  %304 = load i8, i8* %303, align 1
  %305 = zext i8 %304 to i32
  %306 = add nuw nsw i32 %293, %271
  %307 = add nuw nsw i32 %306, %286
  %308 = add nuw nsw i32 %307, %299
  %309 = add nuw nsw i32 %308, %305
  %310 = sitofp i32 %309 to float
  %311 = sitofp i32 %287 to float
  %312 = fdiv float %310, %311
  %313 = fcmp olt float %312, 5.000000e-01
  %314 = fcmp ogt float %312, 2.000000e+00
  %315 = icmp sgt i32 %292, 0
  %.18 = select i1 %315, i32 -1, i32 1
  %.415 = select i1 %314, i32 1, i32 %.18
  %not. = xor i1 %314, true
  %.4 = zext i1 %not. to i32
  br i1 %313, label %316, label %.thread19

.thread19:                                        ; preds = %289, %237
  %.424 = phi i32 [ %.4, %289 ], [ 0, %237 ]
  %.41523 = phi i32 [ %.415, %289 ], [ 1, %237 ]
  br label %316

; <label>:316:                                    ; preds = %.thread19, %289
  %.516 = phi i32 [ 0, %289 ], [ %.41523, %.thread19 ]
  %.5 = phi i32 [ 1, %289 ], [ %.424, %.thread19 ]
  %317 = add nsw i32 %.516, %118
  %318 = mul nsw i32 %317, %5
  %319 = trunc i64 %indvars.iv to i32
  %320 = add i32 %.5, %319
  %321 = add i32 %320, %318
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds i32, i32* %1, i64 %322
  %324 = load i32, i32* %323, align 4
  %325 = icmp sgt i32 %123, %324
  br i1 %325, label %326, label %.thread

; <label>:326:                                    ; preds = %316
  %327 = sub nsw i32 %119, %.516
  %328 = mul nsw i32 %327, %5
  %329 = trunc i64 %indvars.iv to i32
  %330 = sub i32 %329, %.5
  %331 = add i32 %330, %328
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i32, i32* %1, i64 %332
  %334 = load i32, i32* %333, align 4
  %335 = icmp slt i32 %123, %334
  br i1 %335, label %.thread, label %336

; <label>:336:                                    ; preds = %326
  %337 = getelementptr inbounds i8, i8* %2, i64 %121
  store i8 2, i8* %337, align 1
  br label %.thread

.thread:                                          ; preds = %336, %326, %316, %235, %225, %207, %120
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %120

._crit_edge.loopexit:                             ; preds = %.thread
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge39.loopexit, label %.preheader

._crit_edge39.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @corner_draw(i8* nocapture, %struct.anon* nocapture readonly, i32, i32) local_unnamed_addr #4 {
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 7
  br i1 %7, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %4
  %8 = icmp eq i32 %3, 0
  %9 = add nsw i32 %2, -2
  %10 = sext i32 %9 to i64
  br i1 %8, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us, %.lr.ph.split.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph.split.us ], [ 0, %.lr.ph.split.us.preheader ]
  %11 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 %indvars.iv, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %12, -1
  %14 = mul nsw i32 %13, %2
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %0, i64 %15
  %17 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 %indvars.iv, i32 0
  %18 = load i32, i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %16, i64 %19
  %21 = getelementptr inbounds i8, i8* %20, i64 -1
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  store i8 -1, i8* %21, align 1
  %23 = getelementptr inbounds i8, i8* %22, i64 1
  store i8 -1, i8* %22, align 1
  store i8 -1, i8* %23, align 1
  %24 = getelementptr inbounds i8, i8* %23, i64 %10
  %25 = getelementptr inbounds i8, i8* %24, i64 1
  store i8 -1, i8* %24, align 1
  %26 = getelementptr inbounds i8, i8* %25, i64 1
  store i8 0, i8* %25, align 1
  store i8 -1, i8* %26, align 1
  %27 = getelementptr inbounds i8, i8* %26, i64 %10
  %28 = getelementptr inbounds i8, i8* %27, i64 1
  store i8 -1, i8* %27, align 1
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  store i8 -1, i8* %28, align 1
  store i8 -1, i8* %29, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 %indvars.iv.next, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = icmp eq i32 %31, 7
  br i1 %32, label %._crit_edge.loopexit, label %.lr.ph.split.us

.lr.ph.split:                                     ; preds = %.lr.ph.split, %.lr.ph.split.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.lr.ph.split ], [ 0, %.lr.ph.split.preheader ]
  %33 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 %indvars.iv3, i32 1
  %34 = load i32, i32* %33, align 4
  %35 = mul nsw i32 %34, %2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %0, i64 %36
  %38 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 %indvars.iv3, i32 0
  %39 = load i32, i32* %38, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %37, i64 %40
  store i8 0, i8* %41, align 1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %42 = getelementptr inbounds %struct.anon, %struct.anon* %1, i64 %indvars.iv.next4, i32 2
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %43, 7
  br i1 %44, label %._crit_edge.loopexit7, label %.lr.ph.split

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us
  br label %._crit_edge

._crit_edge.loopexit7:                            ; preds = %.lr.ph.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit7, %._crit_edge.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @susan_corners(i8* nocapture readonly, i32*, i8* readonly, i32, %struct.anon* nocapture, i32, i32) local_unnamed_addr #3 {
  %8 = bitcast i32* %1 to i8*
  %9 = mul nsw i32 %6, %5
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  tail call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %11, i32 4, i1 false)
  %12 = tail call noalias i8* @malloc(i64 %11) #8
  %13 = bitcast i8* %12 to i32*
  %14 = tail call noalias i8* @malloc(i64 %11) #8
  %15 = bitcast i8* %14 to i32*
  %16 = add nsw i32 %6, -5
  %17 = icmp sgt i32 %16, 5
  br i1 %17, label %.preheader73.lr.ph, label %._crit_edge80

.preheader73.lr.ph:                               ; preds = %7
  %18 = add nsw i32 %5, -5
  %19 = icmp sgt i32 %18, 5
  %20 = add nsw i32 %5, -3
  %21 = sext i32 %20 to i64
  %22 = sext i32 %18 to i64
  %23 = add nsw i32 %5, -6
  %24 = sext i32 %23 to i64
  %25 = sext i32 %5 to i64
  %26 = sext i32 %5 to i64
  %wide.trip.count = zext i32 %18 to i64
  %wide.trip.count104 = zext i32 %16 to i64
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge84, %.preheader73.lr.ph
  %indvars.iv102 = phi i64 [ 5, %.preheader73.lr.ph ], [ %indvars.iv.next103, %._crit_edge84 ]
  br i1 %19, label %.lr.ph83, label %._crit_edge84

.lr.ph83:                                         ; preds = %.preheader73
  %27 = add nsw i64 %indvars.iv102, -3
  %28 = mul nsw i64 %27, %26
  %29 = getelementptr inbounds i8, i8* %0, i64 %28
  %30 = mul nsw i64 %indvars.iv102, %25
  %31 = trunc i64 %indvars.iv102 to i32
  %32 = trunc i64 %indvars.iv102 to i32
  %33 = trunc i64 %indvars.iv102 to i32
  %34 = trunc i64 %indvars.iv102 to i32
  %35 = trunc i64 %indvars.iv102 to i32
  %36 = trunc i64 %indvars.iv102 to i32
  br label %49

.preheader72:                                     ; preds = %._crit_edge84
  %37 = icmp sgt i32 %16, 5
  br i1 %37, label %.preheader.lr.ph, label %._crit_edge80

.preheader.lr.ph:                                 ; preds = %.preheader72
  %38 = add nsw i32 %5, -5
  %39 = icmp sgt i32 %38, 5
  %40 = sext i32 %38 to i64
  %41 = sext i32 %5 to i64
  %42 = sext i32 %5 to i64
  %43 = sext i32 %5 to i64
  %44 = sext i32 %5 to i64
  %45 = sext i32 %16 to i64
  %46 = sext i32 %5 to i64
  %47 = sext i32 %5 to i64
  %48 = sext i32 %5 to i64
  br label %.preheader

; <label>:49:                                     ; preds = %563, %.lr.ph83
  %indvars.iv100 = phi i64 [ 5, %.lr.ph83 ], [ %indvars.iv.next101, %563 ]
  %50 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv100
  %51 = getelementptr inbounds i8, i8* %50, i64 -1
  %52 = add nsw i64 %indvars.iv100, %30
  %53 = getelementptr inbounds i8, i8* %0, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i64
  %56 = getelementptr inbounds i8, i8* %2, i64 %55
  %57 = getelementptr inbounds i8, i8* %51, i64 1
  %58 = load i8, i8* %51, align 1
  %59 = zext i8 %58 to i64
  %60 = sub nsw i64 0, %59
  %61 = getelementptr inbounds i8, i8* %56, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = add nuw nsw i32 %63, 100
  %65 = getelementptr inbounds i8, i8* %57, i64 1
  %66 = load i8, i8* %57, align 1
  %67 = zext i8 %66 to i64
  %68 = sub nsw i64 0, %67
  %69 = getelementptr inbounds i8, i8* %56, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = add nuw nsw i32 %64, %71
  %73 = load i8, i8* %65, align 1
  %74 = zext i8 %73 to i64
  %75 = sub nsw i64 0, %74
  %76 = getelementptr inbounds i8, i8* %56, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = add nuw nsw i32 %72, %78
  %80 = getelementptr inbounds i8, i8* %65, i64 %21
  %81 = getelementptr inbounds i8, i8* %80, i64 1
  %82 = load i8, i8* %80, align 1
  %83 = zext i8 %82 to i64
  %84 = sub nsw i64 0, %83
  %85 = getelementptr inbounds i8, i8* %56, i64 %84
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = add nuw nsw i32 %79, %87
  %89 = getelementptr inbounds i8, i8* %81, i64 1
  %90 = load i8, i8* %81, align 1
  %91 = zext i8 %90 to i64
  %92 = sub nsw i64 0, %91
  %93 = getelementptr inbounds i8, i8* %56, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = add nuw nsw i32 %88, %95
  %97 = getelementptr inbounds i8, i8* %89, i64 1
  %98 = load i8, i8* %89, align 1
  %99 = zext i8 %98 to i64
  %100 = sub nsw i64 0, %99
  %101 = getelementptr inbounds i8, i8* %56, i64 %100
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = add nuw nsw i32 %96, %103
  %105 = getelementptr inbounds i8, i8* %97, i64 1
  %106 = load i8, i8* %97, align 1
  %107 = zext i8 %106 to i64
  %108 = sub nsw i64 0, %107
  %109 = getelementptr inbounds i8, i8* %56, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = add nsw i32 %104, %111
  %113 = load i8, i8* %105, align 1
  %114 = zext i8 %113 to i64
  %115 = sub nsw i64 0, %114
  %116 = getelementptr inbounds i8, i8* %56, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = add nsw i32 %112, %118
  %120 = getelementptr inbounds i8, i8* %105, i64 %22
  %121 = getelementptr inbounds i8, i8* %120, i64 1
  %122 = load i8, i8* %120, align 1
  %123 = zext i8 %122 to i64
  %124 = sub nsw i64 0, %123
  %125 = getelementptr inbounds i8, i8* %56, i64 %124
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  %128 = add nsw i32 %119, %127
  %129 = getelementptr inbounds i8, i8* %121, i64 1
  %130 = load i8, i8* %121, align 1
  %131 = zext i8 %130 to i64
  %132 = sub nsw i64 0, %131
  %133 = getelementptr inbounds i8, i8* %56, i64 %132
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = add nsw i32 %128, %135
  %137 = getelementptr inbounds i8, i8* %129, i64 1
  %138 = load i8, i8* %129, align 1
  %139 = zext i8 %138 to i64
  %140 = sub nsw i64 0, %139
  %141 = getelementptr inbounds i8, i8* %56, i64 %140
  %142 = load i8, i8* %141, align 1
  %143 = zext i8 %142 to i32
  %144 = add nsw i32 %136, %143
  %145 = getelementptr inbounds i8, i8* %137, i64 1
  %146 = load i8, i8* %137, align 1
  %147 = zext i8 %146 to i64
  %148 = sub nsw i64 0, %147
  %149 = getelementptr inbounds i8, i8* %56, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = add nsw i32 %144, %151
  %153 = getelementptr inbounds i8, i8* %145, i64 1
  %154 = load i8, i8* %145, align 1
  %155 = zext i8 %154 to i64
  %156 = sub nsw i64 0, %155
  %157 = getelementptr inbounds i8, i8* %56, i64 %156
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = add nsw i32 %152, %159
  %161 = getelementptr inbounds i8, i8* %153, i64 1
  %162 = load i8, i8* %153, align 1
  %163 = zext i8 %162 to i64
  %164 = sub nsw i64 0, %163
  %165 = getelementptr inbounds i8, i8* %56, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = add nsw i32 %160, %167
  %169 = load i8, i8* %161, align 1
  %170 = zext i8 %169 to i64
  %171 = sub nsw i64 0, %170
  %172 = getelementptr inbounds i8, i8* %56, i64 %171
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = add nsw i32 %168, %174
  %176 = getelementptr inbounds i8, i8* %161, i64 %24
  %177 = getelementptr inbounds i8, i8* %176, i64 1
  %178 = load i8, i8* %176, align 1
  %179 = zext i8 %178 to i64
  %180 = sub nsw i64 0, %179
  %181 = getelementptr inbounds i8, i8* %56, i64 %180
  %182 = load i8, i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = add nsw i32 %175, %183
  %185 = getelementptr inbounds i8, i8* %177, i64 1
  %186 = load i8, i8* %177, align 1
  %187 = zext i8 %186 to i64
  %188 = sub nsw i64 0, %187
  %189 = getelementptr inbounds i8, i8* %56, i64 %188
  %190 = load i8, i8* %189, align 1
  %191 = zext i8 %190 to i32
  %192 = add nsw i32 %184, %191
  %193 = load i8, i8* %185, align 1
  %194 = zext i8 %193 to i64
  %195 = sub nsw i64 0, %194
  %196 = getelementptr inbounds i8, i8* %56, i64 %195
  %197 = load i8, i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = add nsw i32 %192, %198
  %200 = icmp slt i32 %199, %3
  br i1 %200, label %201, label %563

; <label>:201:                                    ; preds = %49
  %202 = getelementptr inbounds i8, i8* %185, i64 2
  %203 = getelementptr inbounds i8, i8* %202, i64 1
  %204 = load i8, i8* %202, align 1
  %205 = zext i8 %204 to i64
  %206 = sub nsw i64 0, %205
  %207 = getelementptr inbounds i8, i8* %56, i64 %206
  %208 = load i8, i8* %207, align 1
  %209 = zext i8 %208 to i32
  %210 = add nsw i32 %209, %199
  %211 = icmp slt i32 %210, %3
  br i1 %211, label %212, label %563

; <label>:212:                                    ; preds = %201
  %213 = getelementptr inbounds i8, i8* %203, i64 1
  %214 = load i8, i8* %203, align 1
  %215 = zext i8 %214 to i64
  %216 = sub nsw i64 0, %215
  %217 = getelementptr inbounds i8, i8* %56, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = add nsw i32 %219, %210
  %221 = icmp slt i32 %220, %3
  br i1 %221, label %222, label %563

; <label>:222:                                    ; preds = %212
  %223 = load i8, i8* %213, align 1
  %224 = zext i8 %223 to i64
  %225 = sub nsw i64 0, %224
  %226 = getelementptr inbounds i8, i8* %56, i64 %225
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = add nsw i32 %228, %220
  %230 = icmp slt i32 %229, %3
  br i1 %230, label %231, label %563

; <label>:231:                                    ; preds = %222
  %232 = getelementptr inbounds i8, i8* %213, i64 %24
  %233 = getelementptr inbounds i8, i8* %232, i64 1
  %234 = load i8, i8* %232, align 1
  %235 = zext i8 %234 to i64
  %236 = sub nsw i64 0, %235
  %237 = getelementptr inbounds i8, i8* %56, i64 %236
  %238 = load i8, i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = add nsw i32 %239, %229
  %241 = icmp slt i32 %240, %3
  br i1 %241, label %242, label %563

; <label>:242:                                    ; preds = %231
  %243 = getelementptr inbounds i8, i8* %233, i64 1
  %244 = load i8, i8* %233, align 1
  %245 = zext i8 %244 to i64
  %246 = sub nsw i64 0, %245
  %247 = getelementptr inbounds i8, i8* %56, i64 %246
  %248 = load i8, i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = add nsw i32 %249, %240
  %251 = icmp slt i32 %250, %3
  br i1 %251, label %252, label %563

; <label>:252:                                    ; preds = %242
  %253 = getelementptr inbounds i8, i8* %243, i64 1
  %254 = load i8, i8* %243, align 1
  %255 = zext i8 %254 to i64
  %256 = sub nsw i64 0, %255
  %257 = getelementptr inbounds i8, i8* %56, i64 %256
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = add nsw i32 %259, %250
  %261 = icmp slt i32 %260, %3
  br i1 %261, label %262, label %563

; <label>:262:                                    ; preds = %252
  %263 = getelementptr inbounds i8, i8* %253, i64 1
  %264 = load i8, i8* %253, align 1
  %265 = zext i8 %264 to i64
  %266 = sub nsw i64 0, %265
  %267 = getelementptr inbounds i8, i8* %56, i64 %266
  %268 = load i8, i8* %267, align 1
  %269 = zext i8 %268 to i32
  %270 = add nsw i32 %269, %260
  %271 = icmp slt i32 %270, %3
  br i1 %271, label %272, label %563

; <label>:272:                                    ; preds = %262
  %273 = getelementptr inbounds i8, i8* %263, i64 1
  %274 = load i8, i8* %263, align 1
  %275 = zext i8 %274 to i64
  %276 = sub nsw i64 0, %275
  %277 = getelementptr inbounds i8, i8* %56, i64 %276
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = add nsw i32 %279, %270
  %281 = icmp slt i32 %280, %3
  br i1 %281, label %282, label %563

; <label>:282:                                    ; preds = %272
  %283 = getelementptr inbounds i8, i8* %273, i64 1
  %284 = load i8, i8* %273, align 1
  %285 = zext i8 %284 to i64
  %286 = sub nsw i64 0, %285
  %287 = getelementptr inbounds i8, i8* %56, i64 %286
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = add nsw i32 %289, %280
  %291 = icmp slt i32 %290, %3
  br i1 %291, label %292, label %563

; <label>:292:                                    ; preds = %282
  %293 = load i8, i8* %283, align 1
  %294 = zext i8 %293 to i64
  %295 = sub nsw i64 0, %294
  %296 = getelementptr inbounds i8, i8* %56, i64 %295
  %297 = load i8, i8* %296, align 1
  %298 = zext i8 %297 to i32
  %299 = add nsw i32 %298, %290
  %300 = icmp slt i32 %299, %3
  br i1 %300, label %301, label %563

; <label>:301:                                    ; preds = %292
  %302 = getelementptr inbounds i8, i8* %283, i64 %22
  %303 = getelementptr inbounds i8, i8* %302, i64 1
  %304 = load i8, i8* %302, align 1
  %305 = zext i8 %304 to i64
  %306 = sub nsw i64 0, %305
  %307 = getelementptr inbounds i8, i8* %56, i64 %306
  %308 = load i8, i8* %307, align 1
  %309 = zext i8 %308 to i32
  %310 = add nsw i32 %309, %299
  %311 = icmp slt i32 %310, %3
  br i1 %311, label %312, label %563

; <label>:312:                                    ; preds = %301
  %313 = getelementptr inbounds i8, i8* %303, i64 1
  %314 = load i8, i8* %303, align 1
  %315 = zext i8 %314 to i64
  %316 = sub nsw i64 0, %315
  %317 = getelementptr inbounds i8, i8* %56, i64 %316
  %318 = load i8, i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = add nsw i32 %319, %310
  %321 = icmp slt i32 %320, %3
  br i1 %321, label %322, label %563

; <label>:322:                                    ; preds = %312
  %323 = getelementptr inbounds i8, i8* %313, i64 1
  %324 = load i8, i8* %313, align 1
  %325 = zext i8 %324 to i64
  %326 = sub nsw i64 0, %325
  %327 = getelementptr inbounds i8, i8* %56, i64 %326
  %328 = load i8, i8* %327, align 1
  %329 = zext i8 %328 to i32
  %330 = add nsw i32 %329, %320
  %331 = icmp slt i32 %330, %3
  br i1 %331, label %332, label %563

; <label>:332:                                    ; preds = %322
  %333 = getelementptr inbounds i8, i8* %323, i64 1
  %334 = load i8, i8* %323, align 1
  %335 = zext i8 %334 to i64
  %336 = sub nsw i64 0, %335
  %337 = getelementptr inbounds i8, i8* %56, i64 %336
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = add nsw i32 %339, %330
  %341 = icmp slt i32 %340, %3
  br i1 %341, label %342, label %563

; <label>:342:                                    ; preds = %332
  %343 = load i8, i8* %333, align 1
  %344 = zext i8 %343 to i64
  %345 = sub nsw i64 0, %344
  %346 = getelementptr inbounds i8, i8* %56, i64 %345
  %347 = load i8, i8* %346, align 1
  %348 = zext i8 %347 to i32
  %349 = add nsw i32 %348, %340
  %350 = icmp slt i32 %349, %3
  br i1 %350, label %351, label %563

; <label>:351:                                    ; preds = %342
  %352 = getelementptr inbounds i8, i8* %333, i64 %21
  %353 = getelementptr inbounds i8, i8* %352, i64 1
  %354 = load i8, i8* %352, align 1
  %355 = zext i8 %354 to i64
  %356 = sub nsw i64 0, %355
  %357 = getelementptr inbounds i8, i8* %56, i64 %356
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = add nsw i32 %359, %349
  %361 = icmp slt i32 %360, %3
  br i1 %361, label %362, label %563

; <label>:362:                                    ; preds = %351
  %363 = load i8, i8* %353, align 1
  %364 = zext i8 %363 to i64
  %365 = sub nsw i64 0, %364
  %366 = getelementptr inbounds i8, i8* %56, i64 %365
  %367 = load i8, i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = add nsw i32 %368, %360
  %370 = icmp slt i32 %369, %3
  br i1 %370, label %371, label %563

; <label>:371:                                    ; preds = %362
  %372 = getelementptr inbounds i8, i8* %353, i64 1
  %373 = load i8, i8* %372, align 1
  %374 = zext i8 %373 to i64
  %375 = sub nsw i64 0, %374
  %376 = getelementptr inbounds i8, i8* %56, i64 %375
  %377 = load i8, i8* %376, align 1
  %378 = zext i8 %377 to i32
  %379 = add nsw i32 %378, %369
  %380 = icmp slt i32 %379, %3
  br i1 %380, label %381, label %563

; <label>:381:                                    ; preds = %371
  %382 = add nuw nsw i32 %71, %63
  %383 = add nuw nsw i32 %382, %78
  %384 = shl nuw nsw i32 %87, 1
  %385 = shl nuw nsw i32 %95, 1
  %386 = shl nuw nsw i32 %103, 1
  %387 = shl nuw nsw i32 %111, 1
  %388 = shl nuw nsw i32 %118, 1
  %389 = shl nuw nsw i32 %135, 1
  %390 = shl nuw nsw i32 %191, 1
  %391 = shl nuw nsw i32 %249, 1
  %392 = shl nuw nsw i32 %309, 1
  %393 = shl nuw nsw i32 %348, 1
  %tmp = sub nsw i32 %174, %127
  %tmp56 = sub nsw i32 %tmp, %183
  %tmp57 = add nsw i32 %tmp56, %228
  %tmp58 = sub nsw i32 %tmp57, %239
  %tmp59 = add nsw i32 %tmp58, %298
  %tmp60 = mul nsw i32 %tmp59, 3
  %tmp61 = add nuw nsw i32 %219, %167
  %tmp62 = add nuw nsw i32 %tmp61, %289
  %tmp63 = shl nuw nsw i32 %tmp62, 1
  %394 = sub nsw i32 %78, %63
  %395 = sub nsw i32 %394, %384
  %396 = sub nsw i32 %395, %95
  %397 = add nsw i32 %396, %111
  %398 = add nsw i32 %397, %388
  %399 = sub nsw i32 %398, %389
  %400 = sub i32 %399, %143
  %401 = add i32 %400, %159
  %402 = sub i32 %401, %390
  %403 = sub i32 %402, %198
  %404 = add i32 %403, %209
  %405 = sub i32 %404, %391
  %406 = sub i32 %405, %259
  %407 = add i32 %406, %279
  %408 = add i32 %407, %tmp63
  %409 = add i32 %408, %tmp60
  %410 = sub i32 %409, %392
  %411 = sub i32 %410, %319
  %412 = add i32 %411, %339
  %413 = add i32 %412, %393
  %414 = sub i32 %413, %359
  %415 = add i32 %414, %378
  %tmp65 = sub nsw i32 %359, %383
  %tmp66 = add nsw i32 %tmp65, %368
  %tmp67 = add nsw i32 %tmp66, %378
  %tmp68 = mul nsw i32 %tmp67, 3
  %tmp69 = add nuw nsw i32 %329, %319
  %tmp70 = add nuw nsw i32 %tmp69, %339
  %tmp71 = shl nuw nsw i32 %tmp70, 1
  %sum = add nuw nsw i32 %385, %384
  %sum88 = add nuw nsw i32 %sum, %386
  %sum89 = add nuw nsw i32 %sum88, %387
  %sum90 = add nuw nsw i32 %sum89, %388
  %sum91 = add nuw nsw i32 %sum90, %127
  %sum92 = add i32 %sum91, %135
  %sum93 = add i32 %sum92, %143
  %sum94 = add i32 %sum93, %151
  %sum95 = add i32 %sum94, %159
  %sum96 = add i32 %sum95, %167
  %sum97 = add i32 %sum96, %174
  %416 = sub i32 %239, %sum97
  %417 = add i32 %416, %249
  %418 = add i32 %417, %259
  %419 = add i32 %418, %269
  %420 = add i32 %419, %279
  %421 = add i32 %420, %289
  %422 = add i32 %421, %298
  %423 = add i32 %422, %392
  %424 = add i32 %423, %tmp71
  %425 = add i32 %424, %393
  %426 = add i32 %425, %tmp68
  %427 = mul nsw i32 %415, %415
  %428 = mul nsw i32 %426, %426
  %429 = add nuw nsw i32 %428, %427
  %430 = mul nsw i32 %379, %379
  %431 = lshr i32 %430, 1
  %432 = icmp ugt i32 %429, %431
  br i1 %432, label %433, label %563

; <label>:433:                                    ; preds = %381
  %434 = icmp ult i32 %428, %427
  br i1 %434, label %435, label %489

; <label>:435:                                    ; preds = %433
  %436 = sitofp i32 %426 to float
  %ispos10 = icmp sgt i32 %415, -1
  %neg11 = sub i32 0, %415
  %437 = select i1 %ispos10, i32 %415, i32 %neg11
  %438 = sitofp i32 %437 to float
  %439 = fdiv float %436, %438
  %440 = sdiv i32 %437, %415
  %441 = fcmp olt float %439, 0.000000e+00
  %442 = fpext float %439 to double
  %.sink = select i1 %441, double -5.000000e-01, double 5.000000e-01
  %443 = fadd double %442, %.sink
  %444 = fptosi double %443 to i32
  %445 = add nsw i32 %444, %31
  %446 = mul nsw i32 %445, %5
  %447 = trunc i64 %indvars.iv100 to i32
  %448 = add nsw i32 %446, %447
  %449 = add nsw i32 %448, %440
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds i8, i8* %0, i64 %450
  %452 = load i8, i8* %451, align 1
  %453 = zext i8 %452 to i64
  %454 = sub nsw i64 0, %453
  %455 = getelementptr inbounds i8, i8* %56, i64 %454
  %456 = load i8, i8* %455, align 1
  %457 = zext i8 %456 to i32
  %458 = fmul float %439, 2.000000e+00
  %459 = fcmp olt float %458, 0.000000e+00
  %460 = fpext float %458 to double
  %.sink17 = select i1 %459, double -5.000000e-01, double 5.000000e-01
  %461 = fadd double %460, %.sink17
  %462 = fptosi double %461 to i32
  %463 = add nsw i32 %462, %32
  %464 = mul nsw i32 %463, %5
  %465 = trunc i64 %indvars.iv100 to i32
  %466 = add nsw i32 %464, %465
  %467 = shl i32 %440, 1
  %468 = add nsw i32 %466, %467
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds i8, i8* %0, i64 %469
  %471 = load i8, i8* %470, align 1
  %472 = zext i8 %471 to i64
  %473 = sub nsw i64 0, %472
  %474 = getelementptr inbounds i8, i8* %56, i64 %473
  %475 = load i8, i8* %474, align 1
  %476 = zext i8 %475 to i32
  %477 = add nuw nsw i32 %476, %457
  %478 = fmul float %439, 3.000000e+00
  %479 = fcmp olt float %478, 0.000000e+00
  %480 = fpext float %478 to double
  %.sink18 = select i1 %479, double -5.000000e-01, double 5.000000e-01
  %481 = fadd double %480, %.sink18
  %482 = fptosi double %481 to i32
  %483 = add nsw i32 %482, %33
  %484 = mul nsw i32 %483, %5
  %485 = trunc i64 %indvars.iv100 to i32
  %486 = add nsw i32 %484, %485
  %487 = mul nsw i32 %440, 3
  %488 = add nsw i32 %486, %487
  br label %543

; <label>:489:                                    ; preds = %433
  %490 = sitofp i32 %415 to float
  %ispos = icmp sgt i32 %426, -1
  %neg = sub i32 0, %426
  %491 = select i1 %ispos, i32 %426, i32 %neg
  %492 = sitofp i32 %491 to float
  %493 = fdiv float %490, %492
  %494 = sdiv i32 %491, %426
  %495 = add nsw i32 %494, %34
  %496 = mul nsw i32 %495, %5
  %497 = fcmp olt float %493, 0.000000e+00
  %498 = fpext float %493 to double
  %.sink29 = select i1 %497, double -5.000000e-01, double 5.000000e-01
  %499 = fadd double %498, %.sink29
  %500 = fptosi double %499 to i32
  %501 = trunc i64 %indvars.iv100 to i32
  %502 = add i32 %500, %501
  %503 = add i32 %502, %496
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds i8, i8* %0, i64 %504
  %506 = load i8, i8* %505, align 1
  %507 = zext i8 %506 to i64
  %508 = sub nsw i64 0, %507
  %509 = getelementptr inbounds i8, i8* %56, i64 %508
  %510 = load i8, i8* %509, align 1
  %511 = zext i8 %510 to i32
  %512 = shl i32 %494, 1
  %513 = add nsw i32 %512, %35
  %514 = mul nsw i32 %513, %5
  %515 = fmul float %493, 2.000000e+00
  %516 = fcmp olt float %515, 0.000000e+00
  %517 = fpext float %515 to double
  %.sink30 = select i1 %516, double -5.000000e-01, double 5.000000e-01
  %518 = fadd double %517, %.sink30
  %519 = fptosi double %518 to i32
  %520 = trunc i64 %indvars.iv100 to i32
  %521 = add i32 %519, %520
  %522 = add i32 %521, %514
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds i8, i8* %0, i64 %523
  %525 = load i8, i8* %524, align 1
  %526 = zext i8 %525 to i64
  %527 = sub nsw i64 0, %526
  %528 = getelementptr inbounds i8, i8* %56, i64 %527
  %529 = load i8, i8* %528, align 1
  %530 = zext i8 %529 to i32
  %531 = add nuw nsw i32 %530, %511
  %532 = mul nsw i32 %494, 3
  %533 = add nsw i32 %532, %36
  %534 = mul nsw i32 %533, %5
  %535 = fmul float %493, 3.000000e+00
  %536 = fcmp olt float %535, 0.000000e+00
  %537 = fpext float %535 to double
  %.sink31 = select i1 %536, double -5.000000e-01, double 5.000000e-01
  %538 = fadd double %537, %.sink31
  %539 = fptosi double %538 to i32
  %540 = trunc i64 %indvars.iv100 to i32
  %541 = add i32 %539, %540
  %542 = add i32 %541, %534
  br label %543

; <label>:543:                                    ; preds = %489, %435
  %.sink28 = phi i32 [ %542, %489 ], [ %488, %435 ]
  %.sink19 = phi i32 [ %531, %489 ], [ %477, %435 ]
  %544 = sext i32 %.sink28 to i64
  %545 = getelementptr inbounds i8, i8* %0, i64 %544
  %546 = load i8, i8* %545, align 1
  %547 = zext i8 %546 to i64
  %548 = sub nsw i64 0, %547
  %549 = getelementptr inbounds i8, i8* %56, i64 %548
  %550 = load i8, i8* %549, align 1
  %551 = zext i8 %550 to i32
  %552 = add nuw nsw i32 %551, %.sink19
  %553 = icmp sgt i32 %552, 290
  br i1 %553, label %554, label %563

; <label>:554:                                    ; preds = %543
  %555 = sub nsw i32 %3, %379
  %556 = getelementptr inbounds i32, i32* %1, i64 %52
  store i32 %555, i32* %556, align 4
  %557 = mul nsw i32 %415, 51
  %558 = sdiv i32 %557, %379
  %559 = getelementptr inbounds i32, i32* %13, i64 %52
  store i32 %558, i32* %559, align 4
  %560 = mul nsw i32 %426, 51
  %561 = sdiv i32 %560, %379
  %562 = getelementptr inbounds i32, i32* %15, i64 %52
  store i32 %561, i32* %562, align 4
  br label %563

; <label>:563:                                    ; preds = %554, %543, %381, %371, %362, %351, %342, %332, %322, %312, %301, %292, %282, %272, %262, %252, %242, %231, %222, %212, %201, %49
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond = icmp eq i64 %indvars.iv.next101, %wide.trip.count
  br i1 %exitcond, label %._crit_edge84.loopexit, label %49

._crit_edge84.loopexit:                           ; preds = %563
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84.loopexit, %.preheader73
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, %wide.trip.count104
  br i1 %exitcond105, label %.preheader72, label %.preheader73

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv98 = phi i64 [ 5, %.preheader.lr.ph ], [ %indvars.iv.next99, %._crit_edge ]
  %.0478 = phi i32 [ 0, %.preheader.lr.ph ], [ %.15.lcssa, %._crit_edge ]
  br i1 %39, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %564 = mul nsw i64 %indvars.iv98, %41
  %565 = add nsw i64 %indvars.iv98, -3
  %566 = mul nsw i64 %565, %44
  %567 = add nsw i64 %indvars.iv98, -2
  %568 = mul nsw i64 %567, %43
  %569 = add nsw i64 %indvars.iv98, -1
  %570 = mul nsw i64 %569, %42
  %571 = add nuw nsw i64 %indvars.iv98, 1
  %572 = mul nsw i64 %571, %48
  %573 = add nuw nsw i64 %indvars.iv98, 2
  %574 = mul nsw i64 %573, %47
  %575 = add nuw nsw i64 %indvars.iv98, 3
  %576 = mul nsw i64 %575, %46
  %577 = trunc i64 %indvars.iv98 to i32
  br label %578

; <label>:578:                                    ; preds = %844, %.lr.ph
  %indvars.iv = phi i64 [ 5, %.lr.ph ], [ %indvars.iv.next, %844 ]
  %.1576 = phi i32 [ %.0478, %.lr.ph ], [ %.3, %844 ]
  %579 = add nsw i64 %indvars.iv, %564
  %580 = getelementptr inbounds i32, i32* %1, i64 %579
  %581 = load i32, i32* %580, align 4
  %582 = icmp sgt i32 %581, 0
  br i1 %582, label %583, label %844

; <label>:583:                                    ; preds = %578
  %584 = add nsw i64 %indvars.iv, %566
  %585 = add nsw i64 %584, -3
  %586 = getelementptr inbounds i32, i32* %1, i64 %585
  %587 = load i32, i32* %586, align 4
  %588 = icmp sgt i32 %581, %587
  br i1 %588, label %589, label %844

; <label>:589:                                    ; preds = %583
  %590 = add nsw i64 %584, -2
  %591 = getelementptr inbounds i32, i32* %1, i64 %590
  %592 = load i32, i32* %591, align 4
  %593 = icmp sgt i32 %581, %592
  br i1 %593, label %594, label %844

; <label>:594:                                    ; preds = %589
  %595 = add nsw i64 %584, -1
  %596 = getelementptr inbounds i32, i32* %1, i64 %595
  %597 = load i32, i32* %596, align 4
  %598 = icmp sgt i32 %581, %597
  br i1 %598, label %599, label %844

; <label>:599:                                    ; preds = %594
  %600 = getelementptr inbounds i32, i32* %1, i64 %584
  %601 = load i32, i32* %600, align 4
  %602 = icmp sgt i32 %581, %601
  br i1 %602, label %603, label %844

; <label>:603:                                    ; preds = %599
  %604 = add nsw i64 %584, 1
  %605 = getelementptr inbounds i32, i32* %1, i64 %604
  %606 = load i32, i32* %605, align 4
  %607 = icmp sgt i32 %581, %606
  br i1 %607, label %608, label %844

; <label>:608:                                    ; preds = %603
  %609 = add nsw i64 %584, 2
  %610 = getelementptr inbounds i32, i32* %1, i64 %609
  %611 = load i32, i32* %610, align 4
  %612 = icmp sgt i32 %581, %611
  br i1 %612, label %613, label %844

; <label>:613:                                    ; preds = %608
  %614 = add nsw i64 %584, 3
  %615 = getelementptr inbounds i32, i32* %1, i64 %614
  %616 = load i32, i32* %615, align 4
  %617 = icmp sgt i32 %581, %616
  br i1 %617, label %618, label %844

; <label>:618:                                    ; preds = %613
  %619 = add nsw i64 %indvars.iv, %568
  %620 = add nsw i64 %619, -3
  %621 = getelementptr inbounds i32, i32* %1, i64 %620
  %622 = load i32, i32* %621, align 4
  %623 = icmp sgt i32 %581, %622
  br i1 %623, label %624, label %844

; <label>:624:                                    ; preds = %618
  %625 = add nsw i64 %619, -2
  %626 = getelementptr inbounds i32, i32* %1, i64 %625
  %627 = load i32, i32* %626, align 4
  %628 = icmp sgt i32 %581, %627
  br i1 %628, label %629, label %844

; <label>:629:                                    ; preds = %624
  %630 = add nsw i64 %619, -1
  %631 = getelementptr inbounds i32, i32* %1, i64 %630
  %632 = load i32, i32* %631, align 4
  %633 = icmp sgt i32 %581, %632
  br i1 %633, label %634, label %844

; <label>:634:                                    ; preds = %629
  %635 = getelementptr inbounds i32, i32* %1, i64 %619
  %636 = load i32, i32* %635, align 4
  %637 = icmp sgt i32 %581, %636
  br i1 %637, label %638, label %844

; <label>:638:                                    ; preds = %634
  %639 = add nsw i64 %619, 1
  %640 = getelementptr inbounds i32, i32* %1, i64 %639
  %641 = load i32, i32* %640, align 4
  %642 = icmp sgt i32 %581, %641
  br i1 %642, label %643, label %844

; <label>:643:                                    ; preds = %638
  %644 = add nsw i64 %619, 2
  %645 = getelementptr inbounds i32, i32* %1, i64 %644
  %646 = load i32, i32* %645, align 4
  %647 = icmp sgt i32 %581, %646
  br i1 %647, label %648, label %844

; <label>:648:                                    ; preds = %643
  %649 = add nsw i64 %619, 3
  %650 = getelementptr inbounds i32, i32* %1, i64 %649
  %651 = load i32, i32* %650, align 4
  %652 = icmp sgt i32 %581, %651
  br i1 %652, label %653, label %844

; <label>:653:                                    ; preds = %648
  %654 = add nsw i64 %indvars.iv, %570
  %655 = add nsw i64 %654, -3
  %656 = getelementptr inbounds i32, i32* %1, i64 %655
  %657 = load i32, i32* %656, align 4
  %658 = icmp sgt i32 %581, %657
  br i1 %658, label %659, label %844

; <label>:659:                                    ; preds = %653
  %660 = add nsw i64 %654, -2
  %661 = getelementptr inbounds i32, i32* %1, i64 %660
  %662 = load i32, i32* %661, align 4
  %663 = icmp sgt i32 %581, %662
  br i1 %663, label %664, label %844

; <label>:664:                                    ; preds = %659
  %665 = add nsw i64 %654, -1
  %666 = getelementptr inbounds i32, i32* %1, i64 %665
  %667 = load i32, i32* %666, align 4
  %668 = icmp sgt i32 %581, %667
  br i1 %668, label %669, label %844

; <label>:669:                                    ; preds = %664
  %670 = getelementptr inbounds i32, i32* %1, i64 %654
  %671 = load i32, i32* %670, align 4
  %672 = icmp sgt i32 %581, %671
  br i1 %672, label %673, label %844

; <label>:673:                                    ; preds = %669
  %674 = add nsw i64 %654, 1
  %675 = getelementptr inbounds i32, i32* %1, i64 %674
  %676 = load i32, i32* %675, align 4
  %677 = icmp sgt i32 %581, %676
  br i1 %677, label %678, label %844

; <label>:678:                                    ; preds = %673
  %679 = add nsw i64 %654, 2
  %680 = getelementptr inbounds i32, i32* %1, i64 %679
  %681 = load i32, i32* %680, align 4
  %682 = icmp sgt i32 %581, %681
  br i1 %682, label %683, label %844

; <label>:683:                                    ; preds = %678
  %684 = add nsw i64 %654, 3
  %685 = getelementptr inbounds i32, i32* %1, i64 %684
  %686 = load i32, i32* %685, align 4
  %687 = icmp sgt i32 %581, %686
  br i1 %687, label %688, label %844

; <label>:688:                                    ; preds = %683
  %689 = add nsw i64 %579, -3
  %690 = getelementptr inbounds i32, i32* %1, i64 %689
  %691 = load i32, i32* %690, align 4
  %692 = icmp sgt i32 %581, %691
  br i1 %692, label %693, label %844

; <label>:693:                                    ; preds = %688
  %694 = add nsw i64 %579, -2
  %695 = getelementptr inbounds i32, i32* %1, i64 %694
  %696 = load i32, i32* %695, align 4
  %697 = icmp sgt i32 %581, %696
  br i1 %697, label %698, label %844

; <label>:698:                                    ; preds = %693
  %699 = add nsw i64 %579, -1
  %700 = getelementptr inbounds i32, i32* %1, i64 %699
  %701 = load i32, i32* %700, align 4
  %702 = icmp sgt i32 %581, %701
  br i1 %702, label %703, label %844

; <label>:703:                                    ; preds = %698
  %704 = add nsw i64 %579, 1
  %705 = getelementptr inbounds i32, i32* %1, i64 %704
  %706 = load i32, i32* %705, align 4
  %707 = icmp slt i32 %581, %706
  br i1 %707, label %844, label %708

; <label>:708:                                    ; preds = %703
  %709 = add nsw i64 %579, 2
  %710 = getelementptr inbounds i32, i32* %1, i64 %709
  %711 = load i32, i32* %710, align 4
  %712 = icmp slt i32 %581, %711
  br i1 %712, label %844, label %713

; <label>:713:                                    ; preds = %708
  %714 = add nsw i64 %579, 3
  %715 = getelementptr inbounds i32, i32* %1, i64 %714
  %716 = load i32, i32* %715, align 4
  %717 = icmp slt i32 %581, %716
  br i1 %717, label %844, label %718

; <label>:718:                                    ; preds = %713
  %719 = add nsw i64 %indvars.iv, %572
  %720 = add nsw i64 %719, -3
  %721 = getelementptr inbounds i32, i32* %1, i64 %720
  %722 = load i32, i32* %721, align 4
  %723 = icmp slt i32 %581, %722
  br i1 %723, label %844, label %724

; <label>:724:                                    ; preds = %718
  %725 = add nsw i64 %719, -2
  %726 = getelementptr inbounds i32, i32* %1, i64 %725
  %727 = load i32, i32* %726, align 4
  %728 = icmp slt i32 %581, %727
  br i1 %728, label %844, label %729

; <label>:729:                                    ; preds = %724
  %730 = add nsw i64 %719, -1
  %731 = getelementptr inbounds i32, i32* %1, i64 %730
  %732 = load i32, i32* %731, align 4
  %733 = icmp slt i32 %581, %732
  br i1 %733, label %844, label %734

; <label>:734:                                    ; preds = %729
  %735 = getelementptr inbounds i32, i32* %1, i64 %719
  %736 = load i32, i32* %735, align 4
  %737 = icmp slt i32 %581, %736
  br i1 %737, label %844, label %738

; <label>:738:                                    ; preds = %734
  %739 = add nsw i64 %719, 1
  %740 = getelementptr inbounds i32, i32* %1, i64 %739
  %741 = load i32, i32* %740, align 4
  %742 = icmp slt i32 %581, %741
  br i1 %742, label %844, label %743

; <label>:743:                                    ; preds = %738
  %744 = add nsw i64 %719, 2
  %745 = getelementptr inbounds i32, i32* %1, i64 %744
  %746 = load i32, i32* %745, align 4
  %747 = icmp slt i32 %581, %746
  br i1 %747, label %844, label %748

; <label>:748:                                    ; preds = %743
  %749 = add nsw i64 %719, 3
  %750 = getelementptr inbounds i32, i32* %1, i64 %749
  %751 = load i32, i32* %750, align 4
  %752 = icmp slt i32 %581, %751
  br i1 %752, label %844, label %753

; <label>:753:                                    ; preds = %748
  %754 = add nsw i64 %indvars.iv, %574
  %755 = add nsw i64 %754, -3
  %756 = getelementptr inbounds i32, i32* %1, i64 %755
  %757 = load i32, i32* %756, align 4
  %758 = icmp slt i32 %581, %757
  br i1 %758, label %844, label %759

; <label>:759:                                    ; preds = %753
  %760 = add nsw i64 %754, -2
  %761 = getelementptr inbounds i32, i32* %1, i64 %760
  %762 = load i32, i32* %761, align 4
  %763 = icmp slt i32 %581, %762
  br i1 %763, label %844, label %764

; <label>:764:                                    ; preds = %759
  %765 = add nsw i64 %754, -1
  %766 = getelementptr inbounds i32, i32* %1, i64 %765
  %767 = load i32, i32* %766, align 4
  %768 = icmp slt i32 %581, %767
  br i1 %768, label %844, label %769

; <label>:769:                                    ; preds = %764
  %770 = getelementptr inbounds i32, i32* %1, i64 %754
  %771 = load i32, i32* %770, align 4
  %772 = icmp slt i32 %581, %771
  br i1 %772, label %844, label %773

; <label>:773:                                    ; preds = %769
  %774 = add nsw i64 %754, 1
  %775 = getelementptr inbounds i32, i32* %1, i64 %774
  %776 = load i32, i32* %775, align 4
  %777 = icmp slt i32 %581, %776
  br i1 %777, label %844, label %778

; <label>:778:                                    ; preds = %773
  %779 = add nsw i64 %754, 2
  %780 = getelementptr inbounds i32, i32* %1, i64 %779
  %781 = load i32, i32* %780, align 4
  %782 = icmp slt i32 %581, %781
  br i1 %782, label %844, label %783

; <label>:783:                                    ; preds = %778
  %784 = add nsw i64 %754, 3
  %785 = getelementptr inbounds i32, i32* %1, i64 %784
  %786 = load i32, i32* %785, align 4
  %787 = icmp slt i32 %581, %786
  br i1 %787, label %844, label %788

; <label>:788:                                    ; preds = %783
  %789 = add nsw i64 %indvars.iv, %576
  %790 = add nsw i64 %789, -3
  %791 = getelementptr inbounds i32, i32* %1, i64 %790
  %792 = load i32, i32* %791, align 4
  %793 = icmp slt i32 %581, %792
  br i1 %793, label %844, label %794

; <label>:794:                                    ; preds = %788
  %795 = add nsw i64 %789, -2
  %796 = getelementptr inbounds i32, i32* %1, i64 %795
  %797 = load i32, i32* %796, align 4
  %798 = icmp slt i32 %581, %797
  br i1 %798, label %844, label %799

; <label>:799:                                    ; preds = %794
  %800 = add nsw i64 %789, -1
  %801 = getelementptr inbounds i32, i32* %1, i64 %800
  %802 = load i32, i32* %801, align 4
  %803 = icmp slt i32 %581, %802
  br i1 %803, label %844, label %804

; <label>:804:                                    ; preds = %799
  %805 = getelementptr inbounds i32, i32* %1, i64 %789
  %806 = load i32, i32* %805, align 4
  %807 = icmp slt i32 %581, %806
  br i1 %807, label %844, label %808

; <label>:808:                                    ; preds = %804
  %809 = add nsw i64 %789, 1
  %810 = getelementptr inbounds i32, i32* %1, i64 %809
  %811 = load i32, i32* %810, align 4
  %812 = icmp slt i32 %581, %811
  br i1 %812, label %844, label %813

; <label>:813:                                    ; preds = %808
  %814 = add nsw i64 %789, 2
  %815 = getelementptr inbounds i32, i32* %1, i64 %814
  %816 = load i32, i32* %815, align 4
  %817 = icmp slt i32 %581, %816
  br i1 %817, label %844, label %818

; <label>:818:                                    ; preds = %813
  %819 = add nsw i64 %789, 3
  %820 = getelementptr inbounds i32, i32* %1, i64 %819
  %821 = load i32, i32* %820, align 4
  %822 = icmp slt i32 %581, %821
  br i1 %822, label %844, label %823

; <label>:823:                                    ; preds = %818
  %824 = sext i32 %.1576 to i64
  %825 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %824, i32 2
  store i32 0, i32* %825, align 4
  %826 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %824, i32 0
  %827 = trunc i64 %indvars.iv to i32
  store i32 %827, i32* %826, align 4
  %828 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %824, i32 1
  store i32 %577, i32* %828, align 4
  %829 = getelementptr inbounds i32, i32* %13, i64 %579
  %830 = load i32, i32* %829, align 4
  %831 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %824, i32 3
  store i32 %830, i32* %831, align 4
  %832 = getelementptr inbounds i32, i32* %15, i64 %579
  %833 = load i32, i32* %832, align 4
  %834 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %824, i32 4
  store i32 %833, i32* %834, align 4
  %835 = getelementptr inbounds i8, i8* %0, i64 %579
  %836 = load i8, i8* %835, align 1
  %837 = zext i8 %836 to i32
  %838 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %824, i32 5
  store i32 %837, i32* %838, align 4
  %839 = add nsw i32 %.1576, 1
  %840 = icmp eq i32 %839, 15000
  br i1 %840, label %841, label %844

; <label>:841:                                    ; preds = %823
  %842 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %843 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %842) #10
  tail call void @exit(i32 1) #9
  unreachable

; <label>:844:                                    ; preds = %823, %818, %813, %808, %804, %799, %794, %788, %783, %778, %773, %769, %764, %759, %753, %748, %743, %738, %734, %729, %724, %718, %713, %708, %703, %698, %693, %688, %683, %678, %673, %669, %664, %659, %653, %648, %643, %638, %634, %629, %624, %618, %613, %608, %603, %599, %594, %589, %583, %578
  %.3 = phi i32 [ %.1576, %578 ], [ %.1576, %818 ], [ %.1576, %813 ], [ %.1576, %808 ], [ %.1576, %804 ], [ %.1576, %799 ], [ %.1576, %794 ], [ %.1576, %788 ], [ %.1576, %783 ], [ %.1576, %778 ], [ %.1576, %773 ], [ %.1576, %769 ], [ %.1576, %764 ], [ %.1576, %759 ], [ %.1576, %753 ], [ %.1576, %748 ], [ %.1576, %743 ], [ %.1576, %738 ], [ %.1576, %734 ], [ %.1576, %729 ], [ %.1576, %724 ], [ %.1576, %718 ], [ %.1576, %713 ], [ %.1576, %708 ], [ %.1576, %703 ], [ %.1576, %698 ], [ %.1576, %693 ], [ %.1576, %688 ], [ %.1576, %683 ], [ %.1576, %678 ], [ %.1576, %673 ], [ %.1576, %669 ], [ %.1576, %664 ], [ %.1576, %659 ], [ %.1576, %653 ], [ %.1576, %648 ], [ %.1576, %643 ], [ %.1576, %638 ], [ %.1576, %634 ], [ %.1576, %629 ], [ %.1576, %624 ], [ %.1576, %618 ], [ %.1576, %613 ], [ %.1576, %608 ], [ %.1576, %603 ], [ %.1576, %599 ], [ %.1576, %594 ], [ %.1576, %589 ], [ %.1576, %583 ], [ %839, %823 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %845 = icmp slt i64 %indvars.iv.next, %40
  br i1 %845, label %578, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %844
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.15.lcssa = phi i32 [ %.0478, %.preheader ], [ %.3, %._crit_edge.loopexit ]
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %846 = icmp slt i64 %indvars.iv.next99, %45
  br i1 %846, label %.preheader, label %._crit_edge80.loopexit

._crit_edge80.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %.preheader72, %7
  %.04.lcssa = phi i32 [ 0, %.preheader72 ], [ 0, %7 ], [ %.15.lcssa, %._crit_edge80.loopexit ]
  %847 = sext i32 %.04.lcssa to i64
  %848 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %847, i32 2
  store i32 7, i32* %848, align 4
  tail call void @free(i8* %12) #8
  tail call void @free(i8* %14) #8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @susan_corners_quick(i8* readonly, i32*, i8* readonly, i32, %struct.anon* nocapture, i32, i32) local_unnamed_addr #3 {
  %8 = bitcast i32* %1 to i8*
  %9 = mul nsw i32 %6, %5
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  tail call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %11, i32 4, i1 false)
  %12 = add nsw i32 %6, -7
  %13 = icmp sgt i32 %12, 7
  br i1 %13, label %.preheader38.lr.ph, label %._crit_edge45

.preheader38.lr.ph:                               ; preds = %7
  %14 = add nsw i32 %5, -7
  %15 = icmp sgt i32 %14, 7
  %16 = add nsw i32 %5, -3
  %17 = sext i32 %16 to i64
  %18 = add nsw i32 %5, -5
  %19 = sext i32 %18 to i64
  %20 = add nsw i32 %5, -6
  %21 = sext i32 %20 to i64
  %22 = sext i32 %5 to i64
  %23 = sext i32 %5 to i64
  %wide.trip.count = zext i32 %14 to i64
  %wide.trip.count58 = zext i32 %12 to i64
  br label %.preheader38

.preheader38:                                     ; preds = %._crit_edge49, %.preheader38.lr.ph
  %indvars.iv56 = phi i64 [ 7, %.preheader38.lr.ph ], [ %indvars.iv.next57, %._crit_edge49 ]
  br i1 %15, label %.lr.ph48, label %._crit_edge49

.lr.ph48:                                         ; preds = %.preheader38
  %24 = add nsw i64 %indvars.iv56, -3
  %25 = mul nsw i64 %24, %23
  %26 = getelementptr inbounds i8, i8* %0, i64 %25
  %27 = mul nsw i64 %indvars.iv56, %22
  br label %40

.preheader37:                                     ; preds = %._crit_edge49
  %28 = icmp sgt i32 %12, 7
  br i1 %28, label %.preheader.lr.ph, label %._crit_edge45

.preheader.lr.ph:                                 ; preds = %.preheader37
  %29 = add nsw i32 %5, -7
  %30 = icmp sgt i32 %29, 7
  %31 = sext i32 %29 to i64
  %32 = sext i32 %5 to i64
  %33 = sext i32 %5 to i64
  %34 = sext i32 %5 to i64
  %35 = sext i32 %5 to i64
  %36 = sext i32 %12 to i64
  %37 = sext i32 %5 to i64
  %38 = sext i32 %5 to i64
  %39 = sext i32 %5 to i64
  br label %.preheader

; <label>:40:                                     ; preds = %375, %.lr.ph48
  %indvars.iv54 = phi i64 [ 7, %.lr.ph48 ], [ %indvars.iv.next55, %375 ]
  %41 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv54
  %42 = getelementptr inbounds i8, i8* %41, i64 -1
  %43 = add nsw i64 %indvars.iv54, %27
  %44 = getelementptr inbounds i8, i8* %0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8* %2, i64 %46
  %48 = getelementptr inbounds i8, i8* %42, i64 1
  %49 = load i8, i8* %42, align 1
  %50 = zext i8 %49 to i64
  %51 = sub nsw i64 0, %50
  %52 = getelementptr inbounds i8, i8* %47, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = add nuw nsw i32 %54, 100
  %56 = getelementptr inbounds i8, i8* %48, i64 1
  %57 = load i8, i8* %48, align 1
  %58 = zext i8 %57 to i64
  %59 = sub nsw i64 0, %58
  %60 = getelementptr inbounds i8, i8* %47, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = add nuw nsw i32 %55, %62
  %64 = load i8, i8* %56, align 1
  %65 = zext i8 %64 to i64
  %66 = sub nsw i64 0, %65
  %67 = getelementptr inbounds i8, i8* %47, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = add nuw nsw i32 %63, %69
  %71 = getelementptr inbounds i8, i8* %56, i64 %17
  %72 = getelementptr inbounds i8, i8* %71, i64 1
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i64
  %75 = sub nsw i64 0, %74
  %76 = getelementptr inbounds i8, i8* %47, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = add nuw nsw i32 %70, %78
  %80 = getelementptr inbounds i8, i8* %72, i64 1
  %81 = load i8, i8* %72, align 1
  %82 = zext i8 %81 to i64
  %83 = sub nsw i64 0, %82
  %84 = getelementptr inbounds i8, i8* %47, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = add nuw nsw i32 %79, %86
  %88 = getelementptr inbounds i8, i8* %80, i64 1
  %89 = load i8, i8* %80, align 1
  %90 = zext i8 %89 to i64
  %91 = sub nsw i64 0, %90
  %92 = getelementptr inbounds i8, i8* %47, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = add nuw nsw i32 %87, %94
  %96 = getelementptr inbounds i8, i8* %88, i64 1
  %97 = load i8, i8* %88, align 1
  %98 = zext i8 %97 to i64
  %99 = sub nsw i64 0, %98
  %100 = getelementptr inbounds i8, i8* %47, i64 %99
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = add nsw i32 %95, %102
  %104 = load i8, i8* %96, align 1
  %105 = zext i8 %104 to i64
  %106 = sub nsw i64 0, %105
  %107 = getelementptr inbounds i8, i8* %47, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = add nsw i32 %103, %109
  %111 = getelementptr inbounds i8, i8* %96, i64 %19
  %112 = getelementptr inbounds i8, i8* %111, i64 1
  %113 = load i8, i8* %111, align 1
  %114 = zext i8 %113 to i64
  %115 = sub nsw i64 0, %114
  %116 = getelementptr inbounds i8, i8* %47, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = add nsw i32 %110, %118
  %120 = getelementptr inbounds i8, i8* %112, i64 1
  %121 = load i8, i8* %112, align 1
  %122 = zext i8 %121 to i64
  %123 = sub nsw i64 0, %122
  %124 = getelementptr inbounds i8, i8* %47, i64 %123
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = add nsw i32 %119, %126
  %128 = getelementptr inbounds i8, i8* %120, i64 1
  %129 = load i8, i8* %120, align 1
  %130 = zext i8 %129 to i64
  %131 = sub nsw i64 0, %130
  %132 = getelementptr inbounds i8, i8* %47, i64 %131
  %133 = load i8, i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = add nsw i32 %127, %134
  %136 = getelementptr inbounds i8, i8* %128, i64 1
  %137 = load i8, i8* %128, align 1
  %138 = zext i8 %137 to i64
  %139 = sub nsw i64 0, %138
  %140 = getelementptr inbounds i8, i8* %47, i64 %139
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = add nsw i32 %135, %142
  %144 = getelementptr inbounds i8, i8* %136, i64 1
  %145 = load i8, i8* %136, align 1
  %146 = zext i8 %145 to i64
  %147 = sub nsw i64 0, %146
  %148 = getelementptr inbounds i8, i8* %47, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = add nsw i32 %143, %150
  %152 = getelementptr inbounds i8, i8* %144, i64 1
  %153 = load i8, i8* %144, align 1
  %154 = zext i8 %153 to i64
  %155 = sub nsw i64 0, %154
  %156 = getelementptr inbounds i8, i8* %47, i64 %155
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  %159 = add nsw i32 %151, %158
  %160 = load i8, i8* %152, align 1
  %161 = zext i8 %160 to i64
  %162 = sub nsw i64 0, %161
  %163 = getelementptr inbounds i8, i8* %47, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = add nsw i32 %159, %165
  %167 = getelementptr inbounds i8, i8* %152, i64 %21
  %168 = getelementptr inbounds i8, i8* %167, i64 1
  %169 = load i8, i8* %167, align 1
  %170 = zext i8 %169 to i64
  %171 = sub nsw i64 0, %170
  %172 = getelementptr inbounds i8, i8* %47, i64 %171
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = add nsw i32 %166, %174
  %176 = getelementptr inbounds i8, i8* %168, i64 1
  %177 = load i8, i8* %168, align 1
  %178 = zext i8 %177 to i64
  %179 = sub nsw i64 0, %178
  %180 = getelementptr inbounds i8, i8* %47, i64 %179
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = add nsw i32 %175, %182
  %184 = load i8, i8* %176, align 1
  %185 = zext i8 %184 to i64
  %186 = sub nsw i64 0, %185
  %187 = getelementptr inbounds i8, i8* %47, i64 %186
  %188 = load i8, i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = add nsw i32 %183, %189
  %191 = icmp slt i32 %190, %3
  br i1 %191, label %192, label %375

; <label>:192:                                    ; preds = %40
  %193 = getelementptr inbounds i8, i8* %176, i64 2
  %194 = getelementptr inbounds i8, i8* %193, i64 1
  %195 = load i8, i8* %193, align 1
  %196 = zext i8 %195 to i64
  %197 = sub nsw i64 0, %196
  %198 = getelementptr inbounds i8, i8* %47, i64 %197
  %199 = load i8, i8* %198, align 1
  %200 = zext i8 %199 to i32
  %201 = add nsw i32 %200, %190
  %202 = icmp slt i32 %201, %3
  br i1 %202, label %203, label %375

; <label>:203:                                    ; preds = %192
  %204 = getelementptr inbounds i8, i8* %194, i64 1
  %205 = load i8, i8* %194, align 1
  %206 = zext i8 %205 to i64
  %207 = sub nsw i64 0, %206
  %208 = getelementptr inbounds i8, i8* %47, i64 %207
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = add nsw i32 %210, %201
  %212 = icmp slt i32 %211, %3
  br i1 %212, label %213, label %375

; <label>:213:                                    ; preds = %203
  %214 = load i8, i8* %204, align 1
  %215 = zext i8 %214 to i64
  %216 = sub nsw i64 0, %215
  %217 = getelementptr inbounds i8, i8* %47, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = add nsw i32 %219, %211
  %221 = icmp slt i32 %220, %3
  br i1 %221, label %222, label %375

; <label>:222:                                    ; preds = %213
  %223 = getelementptr inbounds i8, i8* %204, i64 %21
  %224 = getelementptr inbounds i8, i8* %223, i64 1
  %225 = load i8, i8* %223, align 1
  %226 = zext i8 %225 to i64
  %227 = sub nsw i64 0, %226
  %228 = getelementptr inbounds i8, i8* %47, i64 %227
  %229 = load i8, i8* %228, align 1
  %230 = zext i8 %229 to i32
  %231 = add nsw i32 %230, %220
  %232 = icmp slt i32 %231, %3
  br i1 %232, label %233, label %375

; <label>:233:                                    ; preds = %222
  %234 = getelementptr inbounds i8, i8* %224, i64 1
  %235 = load i8, i8* %224, align 1
  %236 = zext i8 %235 to i64
  %237 = sub nsw i64 0, %236
  %238 = getelementptr inbounds i8, i8* %47, i64 %237
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = add nsw i32 %240, %231
  %242 = icmp slt i32 %241, %3
  br i1 %242, label %243, label %375

; <label>:243:                                    ; preds = %233
  %244 = getelementptr inbounds i8, i8* %234, i64 1
  %245 = load i8, i8* %234, align 1
  %246 = zext i8 %245 to i64
  %247 = sub nsw i64 0, %246
  %248 = getelementptr inbounds i8, i8* %47, i64 %247
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = add nsw i32 %250, %241
  %252 = icmp slt i32 %251, %3
  br i1 %252, label %253, label %375

; <label>:253:                                    ; preds = %243
  %254 = getelementptr inbounds i8, i8* %244, i64 1
  %255 = load i8, i8* %244, align 1
  %256 = zext i8 %255 to i64
  %257 = sub nsw i64 0, %256
  %258 = getelementptr inbounds i8, i8* %47, i64 %257
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = add nsw i32 %260, %251
  %262 = icmp slt i32 %261, %3
  br i1 %262, label %263, label %375

; <label>:263:                                    ; preds = %253
  %264 = getelementptr inbounds i8, i8* %254, i64 1
  %265 = load i8, i8* %254, align 1
  %266 = zext i8 %265 to i64
  %267 = sub nsw i64 0, %266
  %268 = getelementptr inbounds i8, i8* %47, i64 %267
  %269 = load i8, i8* %268, align 1
  %270 = zext i8 %269 to i32
  %271 = add nsw i32 %270, %261
  %272 = icmp slt i32 %271, %3
  br i1 %272, label %273, label %375

; <label>:273:                                    ; preds = %263
  %274 = getelementptr inbounds i8, i8* %264, i64 1
  %275 = load i8, i8* %264, align 1
  %276 = zext i8 %275 to i64
  %277 = sub nsw i64 0, %276
  %278 = getelementptr inbounds i8, i8* %47, i64 %277
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = add nsw i32 %280, %271
  %282 = icmp slt i32 %281, %3
  br i1 %282, label %283, label %375

; <label>:283:                                    ; preds = %273
  %284 = load i8, i8* %274, align 1
  %285 = zext i8 %284 to i64
  %286 = sub nsw i64 0, %285
  %287 = getelementptr inbounds i8, i8* %47, i64 %286
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = add nsw i32 %289, %281
  %291 = icmp slt i32 %290, %3
  br i1 %291, label %292, label %375

; <label>:292:                                    ; preds = %283
  %293 = getelementptr inbounds i8, i8* %274, i64 %19
  %294 = getelementptr inbounds i8, i8* %293, i64 1
  %295 = load i8, i8* %293, align 1
  %296 = zext i8 %295 to i64
  %297 = sub nsw i64 0, %296
  %298 = getelementptr inbounds i8, i8* %47, i64 %297
  %299 = load i8, i8* %298, align 1
  %300 = zext i8 %299 to i32
  %301 = add nsw i32 %300, %290
  %302 = icmp slt i32 %301, %3
  br i1 %302, label %303, label %375

; <label>:303:                                    ; preds = %292
  %304 = getelementptr inbounds i8, i8* %294, i64 1
  %305 = load i8, i8* %294, align 1
  %306 = zext i8 %305 to i64
  %307 = sub nsw i64 0, %306
  %308 = getelementptr inbounds i8, i8* %47, i64 %307
  %309 = load i8, i8* %308, align 1
  %310 = zext i8 %309 to i32
  %311 = add nsw i32 %310, %301
  %312 = icmp slt i32 %311, %3
  br i1 %312, label %313, label %375

; <label>:313:                                    ; preds = %303
  %314 = getelementptr inbounds i8, i8* %304, i64 1
  %315 = load i8, i8* %304, align 1
  %316 = zext i8 %315 to i64
  %317 = sub nsw i64 0, %316
  %318 = getelementptr inbounds i8, i8* %47, i64 %317
  %319 = load i8, i8* %318, align 1
  %320 = zext i8 %319 to i32
  %321 = add nsw i32 %320, %311
  %322 = icmp slt i32 %321, %3
  br i1 %322, label %323, label %375

; <label>:323:                                    ; preds = %313
  %324 = getelementptr inbounds i8, i8* %314, i64 1
  %325 = load i8, i8* %314, align 1
  %326 = zext i8 %325 to i64
  %327 = sub nsw i64 0, %326
  %328 = getelementptr inbounds i8, i8* %47, i64 %327
  %329 = load i8, i8* %328, align 1
  %330 = zext i8 %329 to i32
  %331 = add nsw i32 %330, %321
  %332 = icmp slt i32 %331, %3
  br i1 %332, label %333, label %375

; <label>:333:                                    ; preds = %323
  %334 = load i8, i8* %324, align 1
  %335 = zext i8 %334 to i64
  %336 = sub nsw i64 0, %335
  %337 = getelementptr inbounds i8, i8* %47, i64 %336
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = add nsw i32 %339, %331
  %341 = icmp slt i32 %340, %3
  br i1 %341, label %342, label %375

; <label>:342:                                    ; preds = %333
  %343 = getelementptr inbounds i8, i8* %324, i64 %17
  %344 = getelementptr inbounds i8, i8* %343, i64 1
  %345 = load i8, i8* %343, align 1
  %346 = zext i8 %345 to i64
  %347 = sub nsw i64 0, %346
  %348 = getelementptr inbounds i8, i8* %47, i64 %347
  %349 = load i8, i8* %348, align 1
  %350 = zext i8 %349 to i32
  %351 = add nsw i32 %350, %340
  %352 = icmp slt i32 %351, %3
  br i1 %352, label %353, label %375

; <label>:353:                                    ; preds = %342
  %354 = load i8, i8* %344, align 1
  %355 = zext i8 %354 to i64
  %356 = sub nsw i64 0, %355
  %357 = getelementptr inbounds i8, i8* %47, i64 %356
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = add nsw i32 %359, %351
  %361 = icmp slt i32 %360, %3
  br i1 %361, label %362, label %375

; <label>:362:                                    ; preds = %353
  %363 = getelementptr inbounds i8, i8* %344, i64 1
  %364 = load i8, i8* %363, align 1
  %365 = zext i8 %364 to i64
  %366 = sub nsw i64 0, %365
  %367 = getelementptr inbounds i8, i8* %47, i64 %366
  %368 = load i8, i8* %367, align 1
  %369 = zext i8 %368 to i32
  %370 = add nsw i32 %369, %360
  %371 = icmp slt i32 %370, %3
  br i1 %371, label %372, label %375

; <label>:372:                                    ; preds = %362
  %373 = getelementptr inbounds i32, i32* %1, i64 %43
  %374 = sub nsw i32 %3, %370
  store i32 %374, i32* %373, align 4
  br label %375

; <label>:375:                                    ; preds = %372, %362, %353, %342, %333, %323, %313, %303, %292, %283, %273, %263, %253, %243, %233, %222, %213, %203, %192, %40
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, %wide.trip.count
  br i1 %exitcond, label %._crit_edge49.loopexit, label %40

._crit_edge49.loopexit:                           ; preds = %375
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.preheader38
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %.preheader37, label %.preheader38

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv52 = phi i64 [ 7, %.preheader.lr.ph ], [ %indvars.iv.next53, %._crit_edge ]
  %.0343 = phi i32 [ 0, %.preheader.lr.ph ], [ %.14.lcssa, %._crit_edge ]
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %376 = mul nsw i64 %indvars.iv52, %32
  %377 = add nsw i64 %indvars.iv52, -3
  %378 = mul nsw i64 %377, %35
  %379 = add nsw i64 %indvars.iv52, -2
  %380 = mul nsw i64 %379, %34
  %381 = add nsw i64 %indvars.iv52, -1
  %382 = mul nsw i64 %381, %33
  %383 = add nuw nsw i64 %indvars.iv52, 1
  %384 = mul nsw i64 %383, %39
  %385 = add nuw nsw i64 %indvars.iv52, 2
  %386 = mul nsw i64 %385, %38
  %387 = add nuw nsw i64 %indvars.iv52, 3
  %388 = mul nsw i64 %387, %37
  %389 = trunc i64 %indvars.iv52 to i32
  br label %390

; <label>:390:                                    ; preds = %823, %.lr.ph
  %indvars.iv = phi i64 [ 7, %.lr.ph ], [ %indvars.iv.next, %823 ]
  %.1441 = phi i32 [ %.0343, %.lr.ph ], [ %.3, %823 ]
  %391 = add nsw i64 %indvars.iv, %376
  %392 = getelementptr inbounds i32, i32* %1, i64 %391
  %393 = load i32, i32* %392, align 4
  %394 = icmp sgt i32 %393, 0
  br i1 %394, label %395, label %823

; <label>:395:                                    ; preds = %390
  %396 = add nsw i64 %indvars.iv, %378
  %397 = add nsw i64 %396, -3
  %398 = getelementptr inbounds i32, i32* %1, i64 %397
  %399 = load i32, i32* %398, align 4
  %400 = icmp sgt i32 %393, %399
  br i1 %400, label %401, label %823

; <label>:401:                                    ; preds = %395
  %402 = add nsw i64 %396, -2
  %403 = getelementptr inbounds i32, i32* %1, i64 %402
  %404 = load i32, i32* %403, align 4
  %405 = icmp sgt i32 %393, %404
  br i1 %405, label %406, label %823

; <label>:406:                                    ; preds = %401
  %407 = add nsw i64 %396, -1
  %408 = getelementptr inbounds i32, i32* %1, i64 %407
  %409 = load i32, i32* %408, align 4
  %410 = icmp sgt i32 %393, %409
  br i1 %410, label %411, label %823

; <label>:411:                                    ; preds = %406
  %412 = getelementptr inbounds i32, i32* %1, i64 %396
  %413 = load i32, i32* %412, align 4
  %414 = icmp sgt i32 %393, %413
  br i1 %414, label %415, label %823

; <label>:415:                                    ; preds = %411
  %416 = add nsw i64 %396, 1
  %417 = getelementptr inbounds i32, i32* %1, i64 %416
  %418 = load i32, i32* %417, align 4
  %419 = icmp sgt i32 %393, %418
  br i1 %419, label %420, label %823

; <label>:420:                                    ; preds = %415
  %421 = add nsw i64 %396, 2
  %422 = getelementptr inbounds i32, i32* %1, i64 %421
  %423 = load i32, i32* %422, align 4
  %424 = icmp sgt i32 %393, %423
  br i1 %424, label %425, label %823

; <label>:425:                                    ; preds = %420
  %426 = add nsw i64 %396, 3
  %427 = getelementptr inbounds i32, i32* %1, i64 %426
  %428 = load i32, i32* %427, align 4
  %429 = icmp sgt i32 %393, %428
  br i1 %429, label %430, label %823

; <label>:430:                                    ; preds = %425
  %431 = add nsw i64 %indvars.iv, %380
  %432 = add nsw i64 %431, -3
  %433 = getelementptr inbounds i32, i32* %1, i64 %432
  %434 = load i32, i32* %433, align 4
  %435 = icmp sgt i32 %393, %434
  br i1 %435, label %436, label %823

; <label>:436:                                    ; preds = %430
  %437 = add nsw i64 %431, -2
  %438 = getelementptr inbounds i32, i32* %1, i64 %437
  %439 = load i32, i32* %438, align 4
  %440 = icmp sgt i32 %393, %439
  br i1 %440, label %441, label %823

; <label>:441:                                    ; preds = %436
  %442 = add nsw i64 %431, -1
  %443 = getelementptr inbounds i32, i32* %1, i64 %442
  %444 = load i32, i32* %443, align 4
  %445 = icmp sgt i32 %393, %444
  br i1 %445, label %446, label %823

; <label>:446:                                    ; preds = %441
  %447 = getelementptr inbounds i32, i32* %1, i64 %431
  %448 = load i32, i32* %447, align 4
  %449 = icmp sgt i32 %393, %448
  br i1 %449, label %450, label %823

; <label>:450:                                    ; preds = %446
  %451 = add nsw i64 %431, 1
  %452 = getelementptr inbounds i32, i32* %1, i64 %451
  %453 = load i32, i32* %452, align 4
  %454 = icmp sgt i32 %393, %453
  br i1 %454, label %455, label %823

; <label>:455:                                    ; preds = %450
  %456 = add nsw i64 %431, 2
  %457 = getelementptr inbounds i32, i32* %1, i64 %456
  %458 = load i32, i32* %457, align 4
  %459 = icmp sgt i32 %393, %458
  br i1 %459, label %460, label %823

; <label>:460:                                    ; preds = %455
  %461 = add nsw i64 %431, 3
  %462 = getelementptr inbounds i32, i32* %1, i64 %461
  %463 = load i32, i32* %462, align 4
  %464 = icmp sgt i32 %393, %463
  br i1 %464, label %465, label %823

; <label>:465:                                    ; preds = %460
  %466 = add nsw i64 %indvars.iv, %382
  %467 = add nsw i64 %466, -3
  %468 = getelementptr inbounds i32, i32* %1, i64 %467
  %469 = load i32, i32* %468, align 4
  %470 = icmp sgt i32 %393, %469
  br i1 %470, label %471, label %823

; <label>:471:                                    ; preds = %465
  %472 = add nsw i64 %466, -2
  %473 = getelementptr inbounds i32, i32* %1, i64 %472
  %474 = load i32, i32* %473, align 4
  %475 = icmp sgt i32 %393, %474
  br i1 %475, label %476, label %823

; <label>:476:                                    ; preds = %471
  %477 = add nsw i64 %466, -1
  %478 = getelementptr inbounds i32, i32* %1, i64 %477
  %479 = load i32, i32* %478, align 4
  %480 = icmp sgt i32 %393, %479
  br i1 %480, label %481, label %823

; <label>:481:                                    ; preds = %476
  %482 = getelementptr inbounds i32, i32* %1, i64 %466
  %483 = load i32, i32* %482, align 4
  %484 = icmp sgt i32 %393, %483
  br i1 %484, label %485, label %823

; <label>:485:                                    ; preds = %481
  %486 = add nsw i64 %466, 1
  %487 = getelementptr inbounds i32, i32* %1, i64 %486
  %488 = load i32, i32* %487, align 4
  %489 = icmp sgt i32 %393, %488
  br i1 %489, label %490, label %823

; <label>:490:                                    ; preds = %485
  %491 = add nsw i64 %466, 2
  %492 = getelementptr inbounds i32, i32* %1, i64 %491
  %493 = load i32, i32* %492, align 4
  %494 = icmp sgt i32 %393, %493
  br i1 %494, label %495, label %823

; <label>:495:                                    ; preds = %490
  %496 = add nsw i64 %466, 3
  %497 = getelementptr inbounds i32, i32* %1, i64 %496
  %498 = load i32, i32* %497, align 4
  %499 = icmp sgt i32 %393, %498
  br i1 %499, label %500, label %823

; <label>:500:                                    ; preds = %495
  %501 = add nsw i64 %391, -3
  %502 = getelementptr inbounds i32, i32* %1, i64 %501
  %503 = load i32, i32* %502, align 4
  %504 = icmp sgt i32 %393, %503
  br i1 %504, label %505, label %823

; <label>:505:                                    ; preds = %500
  %506 = add nsw i64 %391, -2
  %507 = getelementptr inbounds i32, i32* %1, i64 %506
  %508 = load i32, i32* %507, align 4
  %509 = icmp sgt i32 %393, %508
  br i1 %509, label %510, label %823

; <label>:510:                                    ; preds = %505
  %511 = add nsw i64 %391, -1
  %512 = getelementptr inbounds i32, i32* %1, i64 %511
  %513 = load i32, i32* %512, align 4
  %514 = icmp sgt i32 %393, %513
  br i1 %514, label %515, label %823

; <label>:515:                                    ; preds = %510
  %516 = add nsw i64 %391, 1
  %517 = getelementptr inbounds i32, i32* %1, i64 %516
  %518 = load i32, i32* %517, align 4
  %519 = icmp slt i32 %393, %518
  br i1 %519, label %823, label %520

; <label>:520:                                    ; preds = %515
  %521 = add nsw i64 %391, 2
  %522 = getelementptr inbounds i32, i32* %1, i64 %521
  %523 = load i32, i32* %522, align 4
  %524 = icmp slt i32 %393, %523
  br i1 %524, label %823, label %525

; <label>:525:                                    ; preds = %520
  %526 = add nsw i64 %391, 3
  %527 = getelementptr inbounds i32, i32* %1, i64 %526
  %528 = load i32, i32* %527, align 4
  %529 = icmp slt i32 %393, %528
  br i1 %529, label %823, label %530

; <label>:530:                                    ; preds = %525
  %531 = add nsw i64 %indvars.iv, %384
  %532 = add nsw i64 %531, -3
  %533 = getelementptr inbounds i32, i32* %1, i64 %532
  %534 = load i32, i32* %533, align 4
  %535 = icmp slt i32 %393, %534
  br i1 %535, label %823, label %536

; <label>:536:                                    ; preds = %530
  %537 = add nsw i64 %531, -2
  %538 = getelementptr inbounds i32, i32* %1, i64 %537
  %539 = load i32, i32* %538, align 4
  %540 = icmp slt i32 %393, %539
  br i1 %540, label %823, label %541

; <label>:541:                                    ; preds = %536
  %542 = add nsw i64 %531, -1
  %543 = getelementptr inbounds i32, i32* %1, i64 %542
  %544 = load i32, i32* %543, align 4
  %545 = icmp slt i32 %393, %544
  br i1 %545, label %823, label %546

; <label>:546:                                    ; preds = %541
  %547 = getelementptr inbounds i32, i32* %1, i64 %531
  %548 = load i32, i32* %547, align 4
  %549 = icmp slt i32 %393, %548
  br i1 %549, label %823, label %550

; <label>:550:                                    ; preds = %546
  %551 = add nsw i64 %531, 1
  %552 = getelementptr inbounds i32, i32* %1, i64 %551
  %553 = load i32, i32* %552, align 4
  %554 = icmp slt i32 %393, %553
  br i1 %554, label %823, label %555

; <label>:555:                                    ; preds = %550
  %556 = add nsw i64 %531, 2
  %557 = getelementptr inbounds i32, i32* %1, i64 %556
  %558 = load i32, i32* %557, align 4
  %559 = icmp slt i32 %393, %558
  br i1 %559, label %823, label %560

; <label>:560:                                    ; preds = %555
  %561 = add nsw i64 %531, 3
  %562 = getelementptr inbounds i32, i32* %1, i64 %561
  %563 = load i32, i32* %562, align 4
  %564 = icmp slt i32 %393, %563
  br i1 %564, label %823, label %565

; <label>:565:                                    ; preds = %560
  %566 = add nsw i64 %indvars.iv, %386
  %567 = add nsw i64 %566, -3
  %568 = getelementptr inbounds i32, i32* %1, i64 %567
  %569 = load i32, i32* %568, align 4
  %570 = icmp slt i32 %393, %569
  br i1 %570, label %823, label %571

; <label>:571:                                    ; preds = %565
  %572 = add nsw i64 %566, -2
  %573 = getelementptr inbounds i32, i32* %1, i64 %572
  %574 = load i32, i32* %573, align 4
  %575 = icmp slt i32 %393, %574
  br i1 %575, label %823, label %576

; <label>:576:                                    ; preds = %571
  %577 = add nsw i64 %566, -1
  %578 = getelementptr inbounds i32, i32* %1, i64 %577
  %579 = load i32, i32* %578, align 4
  %580 = icmp slt i32 %393, %579
  br i1 %580, label %823, label %581

; <label>:581:                                    ; preds = %576
  %582 = getelementptr inbounds i32, i32* %1, i64 %566
  %583 = load i32, i32* %582, align 4
  %584 = icmp slt i32 %393, %583
  br i1 %584, label %823, label %585

; <label>:585:                                    ; preds = %581
  %586 = add nsw i64 %566, 1
  %587 = getelementptr inbounds i32, i32* %1, i64 %586
  %588 = load i32, i32* %587, align 4
  %589 = icmp slt i32 %393, %588
  br i1 %589, label %823, label %590

; <label>:590:                                    ; preds = %585
  %591 = add nsw i64 %566, 2
  %592 = getelementptr inbounds i32, i32* %1, i64 %591
  %593 = load i32, i32* %592, align 4
  %594 = icmp slt i32 %393, %593
  br i1 %594, label %823, label %595

; <label>:595:                                    ; preds = %590
  %596 = add nsw i64 %566, 3
  %597 = getelementptr inbounds i32, i32* %1, i64 %596
  %598 = load i32, i32* %597, align 4
  %599 = icmp slt i32 %393, %598
  br i1 %599, label %823, label %600

; <label>:600:                                    ; preds = %595
  %601 = add nsw i64 %indvars.iv, %388
  %602 = add nsw i64 %601, -3
  %603 = getelementptr inbounds i32, i32* %1, i64 %602
  %604 = load i32, i32* %603, align 4
  %605 = icmp slt i32 %393, %604
  br i1 %605, label %823, label %606

; <label>:606:                                    ; preds = %600
  %607 = add nsw i64 %601, -2
  %608 = getelementptr inbounds i32, i32* %1, i64 %607
  %609 = load i32, i32* %608, align 4
  %610 = icmp slt i32 %393, %609
  br i1 %610, label %823, label %611

; <label>:611:                                    ; preds = %606
  %612 = add nsw i64 %601, -1
  %613 = getelementptr inbounds i32, i32* %1, i64 %612
  %614 = load i32, i32* %613, align 4
  %615 = icmp slt i32 %393, %614
  br i1 %615, label %823, label %616

; <label>:616:                                    ; preds = %611
  %617 = getelementptr inbounds i32, i32* %1, i64 %601
  %618 = load i32, i32* %617, align 4
  %619 = icmp slt i32 %393, %618
  br i1 %619, label %823, label %620

; <label>:620:                                    ; preds = %616
  %621 = add nsw i64 %601, 1
  %622 = getelementptr inbounds i32, i32* %1, i64 %621
  %623 = load i32, i32* %622, align 4
  %624 = icmp slt i32 %393, %623
  br i1 %624, label %823, label %625

; <label>:625:                                    ; preds = %620
  %626 = add nsw i64 %601, 2
  %627 = getelementptr inbounds i32, i32* %1, i64 %626
  %628 = load i32, i32* %627, align 4
  %629 = icmp slt i32 %393, %628
  br i1 %629, label %823, label %630

; <label>:630:                                    ; preds = %625
  %631 = add nsw i64 %601, 3
  %632 = getelementptr inbounds i32, i32* %1, i64 %631
  %633 = load i32, i32* %632, align 4
  %634 = icmp slt i32 %393, %633
  br i1 %634, label %823, label %635

; <label>:635:                                    ; preds = %630
  %636 = sext i32 %.1441 to i64
  %637 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %636, i32 2
  store i32 0, i32* %637, align 4
  %638 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %636, i32 0
  %639 = trunc i64 %indvars.iv to i32
  store i32 %639, i32* %638, align 4
  %640 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %636, i32 1
  store i32 %389, i32* %640, align 4
  %641 = getelementptr inbounds i8, i8* %0, i64 %437
  %642 = load i8, i8* %641, align 1
  %643 = zext i8 %642 to i32
  %644 = getelementptr inbounds i8, i8* %0, i64 %442
  %645 = load i8, i8* %644, align 1
  %646 = zext i8 %645 to i32
  %647 = add nuw nsw i32 %646, %643
  %648 = getelementptr inbounds i8, i8* %0, i64 %431
  %649 = load i8, i8* %648, align 1
  %650 = zext i8 %649 to i32
  %651 = add nuw nsw i32 %647, %650
  %652 = getelementptr inbounds i8, i8* %0, i64 %451
  %653 = load i8, i8* %652, align 1
  %654 = zext i8 %653 to i32
  %655 = add nuw nsw i32 %651, %654
  %656 = getelementptr inbounds i8, i8* %0, i64 %456
  %657 = load i8, i8* %656, align 1
  %658 = zext i8 %657 to i32
  %659 = add nuw nsw i32 %655, %658
  %660 = getelementptr inbounds i8, i8* %0, i64 %472
  %661 = load i8, i8* %660, align 1
  %662 = zext i8 %661 to i32
  %663 = add nuw nsw i32 %659, %662
  %664 = getelementptr inbounds i8, i8* %0, i64 %477
  %665 = load i8, i8* %664, align 1
  %666 = zext i8 %665 to i32
  %667 = add nuw nsw i32 %663, %666
  %668 = getelementptr inbounds i8, i8* %0, i64 %466
  %669 = load i8, i8* %668, align 1
  %670 = zext i8 %669 to i32
  %671 = add nsw i32 %667, %670
  %672 = getelementptr inbounds i8, i8* %0, i64 %486
  %673 = load i8, i8* %672, align 1
  %674 = zext i8 %673 to i32
  %675 = add nsw i32 %671, %674
  %676 = getelementptr inbounds i8, i8* %0, i64 %491
  %677 = load i8, i8* %676, align 1
  %678 = zext i8 %677 to i32
  %679 = add nsw i32 %675, %678
  %680 = getelementptr inbounds i8, i8* %0, i64 %506
  %681 = load i8, i8* %680, align 1
  %682 = zext i8 %681 to i32
  %683 = add nsw i32 %679, %682
  %684 = getelementptr inbounds i8, i8* %0, i64 %511
  %685 = load i8, i8* %684, align 1
  %686 = zext i8 %685 to i32
  %687 = add nsw i32 %683, %686
  %688 = getelementptr inbounds i8, i8* %0, i64 %391
  %689 = load i8, i8* %688, align 1
  %690 = zext i8 %689 to i32
  %691 = add nsw i32 %687, %690
  %692 = getelementptr inbounds i8, i8* %0, i64 %516
  %693 = load i8, i8* %692, align 1
  %694 = zext i8 %693 to i32
  %695 = add nsw i32 %691, %694
  %696 = getelementptr inbounds i8, i8* %0, i64 %521
  %697 = load i8, i8* %696, align 1
  %698 = zext i8 %697 to i32
  %699 = add nsw i32 %695, %698
  %700 = getelementptr inbounds i8, i8* %0, i64 %537
  %701 = load i8, i8* %700, align 1
  %702 = zext i8 %701 to i32
  %703 = add nsw i32 %699, %702
  %704 = getelementptr inbounds i8, i8* %0, i64 %542
  %705 = load i8, i8* %704, align 1
  %706 = zext i8 %705 to i32
  %707 = add nsw i32 %703, %706
  %708 = getelementptr inbounds i8, i8* %0, i64 %531
  %709 = load i8, i8* %708, align 1
  %710 = zext i8 %709 to i32
  %711 = add nsw i32 %707, %710
  %712 = getelementptr inbounds i8, i8* %0, i64 %551
  %713 = load i8, i8* %712, align 1
  %714 = zext i8 %713 to i32
  %715 = add nsw i32 %711, %714
  %716 = getelementptr inbounds i8, i8* %0, i64 %556
  %717 = load i8, i8* %716, align 1
  %718 = zext i8 %717 to i32
  %719 = add nsw i32 %715, %718
  %720 = getelementptr inbounds i8, i8* %0, i64 %572
  %721 = load i8, i8* %720, align 1
  %722 = zext i8 %721 to i32
  %723 = add nsw i32 %719, %722
  %724 = getelementptr inbounds i8, i8* %0, i64 %577
  %725 = load i8, i8* %724, align 1
  %726 = zext i8 %725 to i32
  %727 = add nsw i32 %723, %726
  %728 = getelementptr inbounds i8, i8* %0, i64 %566
  %729 = load i8, i8* %728, align 1
  %730 = zext i8 %729 to i32
  %731 = add nsw i32 %727, %730
  %732 = getelementptr inbounds i8, i8* %0, i64 %586
  %733 = load i8, i8* %732, align 1
  %734 = zext i8 %733 to i32
  %735 = add nsw i32 %731, %734
  %736 = getelementptr inbounds i8, i8* %0, i64 %591
  %737 = load i8, i8* %736, align 1
  %738 = zext i8 %737 to i32
  %739 = add nsw i32 %735, %738
  %740 = sdiv i32 %739, 25
  %741 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %636, i32 5
  store i32 %740, i32* %741, align 4
  %742 = load i8, i8* %656, align 1
  %743 = zext i8 %742 to i32
  %744 = load i8, i8* %676, align 1
  %745 = zext i8 %744 to i32
  %746 = load i8, i8* %696, align 1
  %747 = zext i8 %746 to i32
  %748 = load i8, i8* %716, align 1
  %749 = zext i8 %748 to i32
  %750 = load i8, i8* %736, align 1
  %751 = zext i8 %750 to i32
  %752 = load i8, i8* %641, align 1
  %753 = zext i8 %752 to i32
  %754 = load i8, i8* %660, align 1
  %755 = zext i8 %754 to i32
  %756 = load i8, i8* %680, align 1
  %757 = zext i8 %756 to i32
  %758 = load i8, i8* %700, align 1
  %759 = zext i8 %758 to i32
  %760 = load i8, i8* %720, align 1
  %761 = zext i8 %760 to i32
  %.neg6 = add nuw nsw i32 %745, %743
  %.neg8 = add nuw nsw i32 %.neg6, %747
  %.neg10 = add nuw nsw i32 %.neg8, %749
  %.neg12 = add nuw nsw i32 %.neg10, %751
  %762 = sub nsw i32 %.neg12, %753
  %763 = sub nsw i32 %762, %755
  %764 = sub i32 %763, %757
  %765 = sub i32 %764, %759
  %766 = sub i32 %765, %761
  %767 = load i8, i8* %652, align 1
  %768 = zext i8 %767 to i32
  %769 = load i8, i8* %672, align 1
  %770 = zext i8 %769 to i32
  %771 = load i8, i8* %692, align 1
  %772 = zext i8 %771 to i32
  %773 = load i8, i8* %712, align 1
  %774 = zext i8 %773 to i32
  %775 = load i8, i8* %732, align 1
  %776 = zext i8 %775 to i32
  %777 = load i8, i8* %644, align 1
  %778 = zext i8 %777 to i32
  %779 = load i8, i8* %664, align 1
  %780 = zext i8 %779 to i32
  %781 = load i8, i8* %684, align 1
  %782 = zext i8 %781 to i32
  %783 = load i8, i8* %704, align 1
  %784 = zext i8 %783 to i32
  %785 = load i8, i8* %724, align 1
  %786 = zext i8 %785 to i32
  %factor = shl i32 %766, 1
  %.neg17 = add nuw nsw i32 %770, %768
  %.neg19 = add i32 %.neg17, %factor
  %.neg21 = add i32 %.neg19, %772
  %787 = add i32 %.neg21, %774
  %788 = add i32 %787, %776
  %789 = sub i32 %788, %778
  %790 = sub i32 %789, %780
  %791 = sub i32 %790, %782
  %792 = sub i32 %791, %784
  %793 = sub i32 %792, %786
  %794 = load i8, i8* %728, align 1
  %795 = zext i8 %794 to i32
  %796 = load i8, i8* %648, align 1
  %797 = zext i8 %796 to i32
  %.neg24 = sub nsw i32 %751, %743
  %.neg26 = sub nsw i32 %.neg24, %753
  %.neg27 = add nsw i32 %.neg26, %761
  %.neg28 = sub nsw i32 %.neg27, %768
  %798 = add nsw i32 %.neg28, %776
  %799 = sub nsw i32 %798, %778
  %800 = add i32 %799, %786
  %801 = add i32 %800, %795
  %802 = sub i32 %801, %797
  %803 = load i8, i8* %708, align 1
  %804 = zext i8 %803 to i32
  %805 = load i8, i8* %668, align 1
  %806 = zext i8 %805 to i32
  %factor36 = shl i32 %802, 1
  %.neg33 = sub nsw i32 %749, %745
  %.neg34 = sub nsw i32 %.neg33, %755
  %.neg35 = add nsw i32 %.neg34, %759
  %807 = sub nsw i32 %.neg35, %770
  %808 = add nsw i32 %807, %774
  %809 = sub nsw i32 %808, %780
  %810 = add i32 %809, %784
  %811 = add i32 %810, %804
  %812 = sub i32 %811, %806
  %813 = add i32 %812, %factor36
  %814 = sdiv i32 %793, 15
  %815 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %636, i32 3
  store i32 %814, i32* %815, align 4
  %816 = sdiv i32 %813, 15
  %817 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %636, i32 4
  store i32 %816, i32* %817, align 4
  %818 = add nsw i32 %.1441, 1
  %819 = icmp eq i32 %818, 15000
  br i1 %819, label %820, label %823

; <label>:820:                                    ; preds = %635
  %821 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %822 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.29, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %821) #10
  tail call void @exit(i32 1) #9
  unreachable

; <label>:823:                                    ; preds = %635, %630, %625, %620, %616, %611, %606, %600, %595, %590, %585, %581, %576, %571, %565, %560, %555, %550, %546, %541, %536, %530, %525, %520, %515, %510, %505, %500, %495, %490, %485, %481, %476, %471, %465, %460, %455, %450, %446, %441, %436, %430, %425, %420, %415, %411, %406, %401, %395, %390
  %.3 = phi i32 [ %.1441, %390 ], [ %.1441, %630 ], [ %.1441, %625 ], [ %.1441, %620 ], [ %.1441, %616 ], [ %.1441, %611 ], [ %.1441, %606 ], [ %.1441, %600 ], [ %.1441, %595 ], [ %.1441, %590 ], [ %.1441, %585 ], [ %.1441, %581 ], [ %.1441, %576 ], [ %.1441, %571 ], [ %.1441, %565 ], [ %.1441, %560 ], [ %.1441, %555 ], [ %.1441, %550 ], [ %.1441, %546 ], [ %.1441, %541 ], [ %.1441, %536 ], [ %.1441, %530 ], [ %.1441, %525 ], [ %.1441, %520 ], [ %.1441, %515 ], [ %.1441, %510 ], [ %.1441, %505 ], [ %.1441, %500 ], [ %.1441, %495 ], [ %.1441, %490 ], [ %.1441, %485 ], [ %.1441, %481 ], [ %.1441, %476 ], [ %.1441, %471 ], [ %.1441, %465 ], [ %.1441, %460 ], [ %.1441, %455 ], [ %.1441, %450 ], [ %.1441, %446 ], [ %.1441, %441 ], [ %.1441, %436 ], [ %.1441, %430 ], [ %.1441, %425 ], [ %.1441, %420 ], [ %.1441, %415 ], [ %.1441, %411 ], [ %.1441, %406 ], [ %.1441, %401 ], [ %.1441, %395 ], [ %818, %635 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %824 = icmp slt i64 %indvars.iv.next, %31
  br i1 %824, label %390, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %823
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.14.lcssa = phi i32 [ %.0343, %.preheader ], [ %.3, %._crit_edge.loopexit ]
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %825 = icmp slt i64 %indvars.iv.next53, %36
  br i1 %825, label %.preheader, label %._crit_edge45.loopexit

._crit_edge45.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %.preheader37, %7
  %.03.lcssa = phi i32 [ 0, %.preheader37 ], [ 0, %7 ], [ %.14.lcssa, %._crit_edge45.loopexit ]
  %826 = sext i32 %.03.lcssa to i64
  %827 = getelementptr inbounds %struct.anon, %struct.anon* %4, i64 %826, i32 2
  store i32 7, i32* %827, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @main1(i32, i8** nocapture readonly) local_unnamed_addr #3 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [15000 x %struct.anon], align 16
  %8 = icmp slt i32 %0, 3
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %2
  tail call void @usage()
  unreachable

; <label>:10:                                     ; preds = %2
  %11 = getelementptr inbounds i8*, i8** %1, i64 1
  %12 = load i8*, i8** %11, align 8
  call void @get_image(i8* %12, i8** nonnull %3, i32* nonnull %5, i32* nonnull %6)
  %13 = icmp eq i32 %0, 3
  br i1 %13, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %10
  br label %.lr.ph

.lr.ph:                                           ; preds = %52, %.lr.ph.preheader
  %.059 = phi i32 [ %.2, %52 ], [ 0, %.lr.ph.preheader ]
  %.0158 = phi i32 [ %.23, %52 ], [ 0, %.lr.ph.preheader ]
  %.0457 = phi i32 [ %.26, %52 ], [ 0, %.lr.ph.preheader ]
  %.0756 = phi float [ %.29, %52 ], [ 4.000000e+00, %.lr.ph.preheader ]
  %.01055 = phi i32 [ %53, %52 ], [ 3, %.lr.ph.preheader ]
  %.01354 = phi i32 [ %.215, %52 ], [ 20, %.lr.ph.preheader ]
  %.01653 = phi i32 [ %.218, %52 ], [ 0, %.lr.ph.preheader ]
  %.01952 = phi i32 [ %.221, %52 ], [ 1, %.lr.ph.preheader ]
  %.02251 = phi i32 [ %.325, %52 ], [ 0, %.lr.ph.preheader ]
  %14 = sext i32 %.01055 to i64
  %15 = getelementptr inbounds i8*, i8** %1, i64 %14
  %16 = load i8*, i8** %15, align 8
  %17 = load i8, i8* %16, align 1
  %18 = icmp eq i8 %17, 45
  br i1 %18, label %19, label %51

; <label>:19:                                     ; preds = %.lr.ph
  %20 = getelementptr inbounds i8, i8* %16, i64 1
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  switch i32 %22, label %52 [
    i32 115, label %23
    i32 101, label %24
    i32 99, label %25
    i32 112, label %26
    i32 110, label %27
    i32 98, label %28
    i32 51, label %29
    i32 113, label %30
    i32 100, label %31
    i32 116, label %42
  ]

; <label>:23:                                     ; preds = %19
  br label %52

; <label>:24:                                     ; preds = %19
  br label %52

; <label>:25:                                     ; preds = %19
  br label %52

; <label>:26:                                     ; preds = %19
  br label %52

; <label>:27:                                     ; preds = %19
  br label %52

; <label>:28:                                     ; preds = %19
  br label %52

; <label>:29:                                     ; preds = %19
  br label %52

; <label>:30:                                     ; preds = %19
  br label %52

; <label>:31:                                     ; preds = %19
  %32 = add nsw i32 %.01055, 1
  %33 = icmp slt i32 %32, %0
  br i1 %33, label %35, label %34

; <label>:34:                                     ; preds = %31
  %puts26 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.16, i64 0, i64 0))
  tail call void @exit(i32 0) #9
  unreachable

; <label>:35:                                     ; preds = %31
  %36 = sext i32 %32 to i64
  %37 = getelementptr inbounds i8*, i8** %1, i64 %36
  %38 = load i8*, i8** %37, align 8
  %39 = tail call double @atof(i8* %38) #11
  %40 = fptrunc double %39 to float
  %41 = fcmp olt float %40, 0.000000e+00
  %.123 = select i1 %41, i32 1, i32 %.02251
  br label %52

; <label>:42:                                     ; preds = %19
  %43 = add nsw i32 %.01055, 1
  %44 = icmp slt i32 %43, %0
  br i1 %44, label %46, label %45

; <label>:45:                                     ; preds = %42
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.15, i64 0, i64 0))
  tail call void @exit(i32 0) #9
  unreachable

; <label>:46:                                     ; preds = %42
  %47 = sext i32 %43 to i64
  %48 = getelementptr inbounds i8*, i8** %1, i64 %47
  %49 = load i8*, i8** %48, align 8
  %50 = tail call i32 @atoi(i8* %49) #11
  br label %52

; <label>:51:                                     ; preds = %.lr.ph
  tail call void @usage()
  unreachable

; <label>:52:                                     ; preds = %46, %35, %30, %29, %28, %27, %26, %25, %24, %23, %19
  %.325 = phi i32 [ %.02251, %19 ], [ %.02251, %46 ], [ %.02251, %30 ], [ 1, %29 ], [ %.02251, %28 ], [ %.02251, %27 ], [ %.02251, %26 ], [ %.02251, %25 ], [ %.02251, %24 ], [ %.02251, %23 ], [ %.123, %35 ]
  %.221 = phi i32 [ %.01952, %19 ], [ %.01952, %46 ], [ %.01952, %30 ], [ %.01952, %29 ], [ %.01952, %28 ], [ 0, %27 ], [ %.01952, %26 ], [ %.01952, %25 ], [ %.01952, %24 ], [ %.01952, %23 ], [ %.01952, %35 ]
  %.218 = phi i32 [ %.01653, %19 ], [ %.01653, %46 ], [ %.01653, %30 ], [ %.01653, %29 ], [ %.01653, %28 ], [ %.01653, %27 ], [ 1, %26 ], [ %.01653, %25 ], [ %.01653, %24 ], [ %.01653, %23 ], [ %.01653, %35 ]
  %.215 = phi i32 [ %.01354, %19 ], [ %50, %46 ], [ %.01354, %30 ], [ %.01354, %29 ], [ %.01354, %28 ], [ %.01354, %27 ], [ %.01354, %26 ], [ %.01354, %25 ], [ %.01354, %24 ], [ %.01354, %23 ], [ %.01354, %35 ]
  %.212 = phi i32 [ %.01055, %19 ], [ %43, %46 ], [ %.01055, %30 ], [ %.01055, %29 ], [ %.01055, %28 ], [ %.01055, %27 ], [ %.01055, %26 ], [ %.01055, %25 ], [ %.01055, %24 ], [ %.01055, %23 ], [ %32, %35 ]
  %.29 = phi float [ %.0756, %19 ], [ %.0756, %46 ], [ %.0756, %30 ], [ %.0756, %29 ], [ %.0756, %28 ], [ %.0756, %27 ], [ %.0756, %26 ], [ %.0756, %25 ], [ %.0756, %24 ], [ %.0756, %23 ], [ %40, %35 ]
  %.26 = phi i32 [ %.0457, %19 ], [ %.0457, %46 ], [ %.0457, %30 ], [ %.0457, %29 ], [ 1, %28 ], [ %.0457, %27 ], [ %.0457, %26 ], [ %.0457, %25 ], [ %.0457, %24 ], [ %.0457, %23 ], [ %.0457, %35 ]
  %.23 = phi i32 [ %.0158, %19 ], [ %.0158, %46 ], [ 1, %30 ], [ %.0158, %29 ], [ %.0158, %28 ], [ %.0158, %27 ], [ %.0158, %26 ], [ %.0158, %25 ], [ %.0158, %24 ], [ %.0158, %23 ], [ %.0158, %35 ]
  %.2 = phi i32 [ %.059, %19 ], [ %.059, %46 ], [ %.059, %30 ], [ %.059, %29 ], [ %.059, %28 ], [ %.059, %27 ], [ %.059, %26 ], [ 2, %25 ], [ 1, %24 ], [ 0, %23 ], [ %.059, %35 ]
  %53 = add nsw i32 %.212, 1
  %54 = icmp slt i32 %53, %0
  br i1 %54, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %52
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %10
  %.022.lcssa = phi i32 [ 0, %10 ], [ %.325, %._crit_edge.loopexit ]
  %.019.lcssa = phi i32 [ 1, %10 ], [ %.221, %._crit_edge.loopexit ]
  %.016.lcssa = phi i32 [ 0, %10 ], [ %.218, %._crit_edge.loopexit ]
  %.013.lcssa = phi i32 [ 20, %10 ], [ %.215, %._crit_edge.loopexit ]
  %.07.lcssa = phi float [ 4.000000e+00, %10 ], [ %.29, %._crit_edge.loopexit ]
  %.04.lcssa = phi i32 [ 0, %10 ], [ %.26, %._crit_edge.loopexit ]
  %.01.lcssa = phi i32 [ 0, %10 ], [ %.23, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ 0, %10 ], [ %.2, %._crit_edge.loopexit ]
  %55 = icmp eq i32 %.016.lcssa, 1
  %56 = icmp eq i32 %.0.lcssa, 0
  %or.cond = and i1 %55, %56
  %.3 = select i1 %or.cond, i32 1, i32 %.0.lcssa
  switch i32 %.3, label %137 [
    i32 0, label %57
    i32 1, label %62
    i32 2, label %108
  ]

; <label>:57:                                     ; preds = %._crit_edge
  call void @setup_brightness_lut(i8** nonnull %4, i32 %.013.lcssa, i32 2)
  %58 = load i8*, i8** %3, align 8
  %59 = load i32, i32* %5, align 4
  %60 = load i32, i32* %6, align 4
  %61 = load i8*, i8** %4, align 8
  tail call void @susan_smoothing(i32 %.022.lcssa, i8* %58, float %.07.lcssa, i32 %59, i32 %60, i8* %61)
  tail call void @free_brightness_lut(i8* %61)
  br label %137

; <label>:62:                                     ; preds = %._crit_edge
  %63 = load i32, i32* %5, align 4
  %64 = load i32, i32* %6, align 4
  %65 = mul nsw i32 %64, %63
  %66 = sext i32 %65 to i64
  %67 = shl nsw i64 %66, 2
  %68 = tail call noalias i8* @malloc(i64 %67) #8
  %69 = bitcast i8* %68 to i32*
  call void @setup_brightness_lut(i8** nonnull %4, i32 %.013.lcssa, i32 6)
  %70 = icmp eq i32 %.016.lcssa, 0
  br i1 %70, label %84, label %71

; <label>:71:                                     ; preds = %62
  %72 = icmp eq i32 %.022.lcssa, 0
  %73 = load i8*, i8** %3, align 8
  %74 = load i8*, i8** %4, align 8
  %75 = load i32, i32* %5, align 4
  %76 = load i32, i32* %6, align 4
  br i1 %72, label %78, label %77

; <label>:77:                                     ; preds = %71
  tail call void @susan_principle_small(i8* %73, i32* %69, i8* %74, i32 undef, i32 %75, i32 %76)
  br label %79

; <label>:78:                                     ; preds = %71
  tail call void @susan_principle(i8* %73, i32* %69, i8* %74, i32 2650, i32 %75, i32 %76)
  br label %79

; <label>:79:                                     ; preds = %78, %77
  %80 = load i8*, i8** %3, align 8
  %81 = load i32, i32* %5, align 4
  %82 = load i32, i32* %6, align 4
  %83 = mul nsw i32 %82, %81
  tail call void @int_to_uchar(i32* %69, i8* %80, i32 %83)
  br label %106

; <label>:84:                                     ; preds = %62
  %85 = load i32, i32* %5, align 4
  %86 = load i32, i32* %6, align 4
  %87 = mul nsw i32 %86, %85
  %88 = sext i32 %87 to i64
  %89 = tail call noalias i8* @malloc(i64 %88) #8
  tail call void @llvm.memset.p0i8.i64(i8* %89, i8 100, i64 %88, i32 1, i1 false)
  %90 = icmp eq i32 %.022.lcssa, 0
  %91 = load i8*, i8** %3, align 8
  %92 = load i8*, i8** %4, align 8
  %93 = load i32, i32* %5, align 4
  %94 = load i32, i32* %6, align 4
  br i1 %90, label %96, label %95

; <label>:95:                                     ; preds = %84
  tail call void @susan_edges_small(i8* %91, i32* %69, i8* %89, i8* %92, i32 undef, i32 %93, i32 %94)
  br label %97

; <label>:96:                                     ; preds = %84
  tail call void @susan_edges(i8* %91, i32* %69, i8* %89, i8* %92, i32 2650, i32 %93, i32 %94)
  br label %97

; <label>:97:                                     ; preds = %96, %95
  %98 = icmp eq i32 %.019.lcssa, 0
  br i1 %98, label %102, label %99

; <label>:99:                                     ; preds = %97
  %100 = load i32, i32* %5, align 4
  %101 = load i32, i32* %6, align 4
  tail call void @susan_thin(i32* %69, i8* %89, i32 %100, i32 %101)
  br label %102

; <label>:102:                                    ; preds = %99, %97
  %103 = load i8*, i8** %3, align 8
  %104 = load i32, i32* %5, align 4
  %105 = load i32, i32* %6, align 4
  tail call void @edge_draw(i8* %103, i8* %89, i32 %104, i32 %105, i32 %.04.lcssa)
  tail call void @free(i8* %89) #8
  br label %106

; <label>:106:                                    ; preds = %102, %79
  %107 = load i8*, i8** %4, align 8
  tail call void @free_brightness_lut(i8* %107)
  tail call void @free(i8* %68) #8
  br label %137

; <label>:108:                                    ; preds = %._crit_edge
  %109 = load i32, i32* %5, align 4
  %110 = load i32, i32* %6, align 4
  %111 = mul nsw i32 %110, %109
  %112 = sext i32 %111 to i64
  %113 = shl nsw i64 %112, 2
  %114 = tail call noalias i8* @malloc(i64 %113) #8
  %115 = bitcast i8* %114 to i32*
  call void @setup_brightness_lut(i8** nonnull %4, i32 %.013.lcssa, i32 6)
  %116 = icmp eq i32 %.016.lcssa, 0
  br i1 %116, label %123, label %117

; <label>:117:                                    ; preds = %108
  %118 = load i8*, i8** %3, align 8
  %119 = load i8*, i8** %4, align 8
  %120 = load i32, i32* %5, align 4
  %121 = load i32, i32* %6, align 4
  tail call void @susan_principle(i8* %118, i32* %115, i8* %119, i32 1850, i32 %120, i32 %121)
  %122 = mul nsw i32 %121, %120
  tail call void @int_to_uchar(i32* %115, i8* %118, i32 %122)
  br label %135

; <label>:123:                                    ; preds = %108
  %124 = icmp eq i32 %.01.lcssa, 0
  %125 = load i8*, i8** %3, align 8
  %126 = load i8*, i8** %4, align 8
  %127 = getelementptr inbounds [15000 x %struct.anon], [15000 x %struct.anon]* %7, i64 0, i64 0
  %128 = load i32, i32* %5, align 4
  %129 = load i32, i32* %6, align 4
  br i1 %124, label %131, label %130

; <label>:130:                                    ; preds = %123
  call void @susan_corners_quick(i8* %125, i32* %115, i8* %126, i32 1850, %struct.anon* nonnull %127, i32 %128, i32 %129)
  br label %132

; <label>:131:                                    ; preds = %123
  call void @susan_corners(i8* %125, i32* %115, i8* %126, i32 1850, %struct.anon* nonnull %127, i32 %128, i32 %129)
  br label %132

; <label>:132:                                    ; preds = %131, %130
  %133 = load i8*, i8** %3, align 8
  %134 = load i32, i32* %5, align 4
  call void @corner_draw(i8* %133, %struct.anon* nonnull %127, i32 %134, i32 %.04.lcssa)
  br label %135

; <label>:135:                                    ; preds = %132, %117
  %136 = load i8*, i8** %4, align 8
  tail call void @free_brightness_lut(i8* %136)
  tail call void @free(i8* %114) #8
  br label %137

; <label>:137:                                    ; preds = %135, %106, %57, %._crit_edge
  %138 = getelementptr inbounds i8*, i8** %1, i64 2
  %139 = load i8*, i8** %138, align 8
  %140 = load i8*, i8** %3, align 8
  %141 = load i32, i32* %5, align 4
  %142 = load i32, i32* %6, align 4
  tail call void @put_image(i8* %139, i8* %140, i32 %141, i32 %142)
  tail call void @free(i8* %140) #8
  ret void
}

; Function Attrs: nounwind readonly
declare double @atof(i8* nocapture) local_unnamed_addr #7

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #7

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #8

declare float @sqrtf(float)

attributes #0 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { cold }
attributes #11 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
